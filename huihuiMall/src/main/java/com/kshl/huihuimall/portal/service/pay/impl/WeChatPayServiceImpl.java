package com.kshl.huihuimall.portal.service.pay.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.kshl.base.common.utils.KSHLUtils;
import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.constants.WeChatPayConstants;
import com.kshl.huihuimall.base.request.WeChatCloseOrderRequest;
import com.kshl.huihuimall.base.request.WeChatOrderQueryRequest;
import com.kshl.huihuimall.base.request.WeChatPayRequest;
import com.kshl.huihuimall.base.request.WeChatUnifiedOrderRequest;
import com.kshl.huihuimall.base.utils.WeChatPayUtil;
import com.kshl.huihuimall.base.dal.entity.Payinfo;
import com.kshl.huihuimall.portal.dal.dao.PayDao;
import com.kshl.huihuimall.portal.service.pay.WeChatPayService;
import com.kshl.util.FileUtils;
import com.kshl.util.RequestHandler;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xml.sax.InputSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Path;
import java.util.*;

import static com.kshl.huihuimall.portal.PTErrorCode.*;

/**
 * Created by 40513 on 2018/1/16.
 */
@Service
public class WeChatPayServiceImpl implements WeChatPayService {

    private static Logger logger = LoggerFactory.getLogger(WeChatPayServiceImpl.class);

    @Autowired
    private PayDao payDao;

    @Override
    public BaseResponse weChatPay(WeChatPayRequest weChatPayRequest) {
        BaseResponse response;
        Map<String, String> params = new TreeMap<String, String>();
        params.put("appid", weChatPayRequest.getAppID());
        params.put("mch_id", weChatPayRequest.getMchID());
        String nonce_str = WeChatPayUtil.getRandomStringByLength(16);
        params.put("nonce_str", nonce_str);
        params.put("body", weChatPayRequest.getProductName());
        params.put("out_trade_no", weChatPayRequest.getOrderNumber());
        params.put("total_fee", weChatPayRequest.getPrice().toString());
        params.put("spbill_create_ip", weChatPayRequest.getBillCreateIP());
        params.put("auth_code", weChatPayRequest.getAuthCode());
        String mchKey = weChatPayRequest.getMchKey();

        try {
            String sign = WeChatPayUtil.generateSignature(params, mchKey, WeChatPayConstants.SignType.MD5);
            params.put("sign", sign);
            String requestXML = WeChatPayUtil.mapToXml(params);
            String responseXml = postData("https://" + WeChatPayConstants.DOMAIN_API + WeChatPayConstants.MICROPAY_URL_SUFFIX,
                    requestXML, null);
            Map map = WeChatPayUtil.xmlToMap(responseXml);
            String returnCode = (String)map.get("return_code");
            String resultCode = (String)map.get("result_code");
            if("SUCCESS".equals(returnCode) && "SUCCESS".equals(resultCode)) {
                Payinfo payInfo = new Payinfo();
                payInfo.setBody(weChatPayRequest.getProductName());
                payInfo.setOutTradeNo(weChatPayRequest.getOrderNumber());
                payInfo.setPaystatus(Constants.PAY_STATUS.NOT_PAY);
                payInfo.setPaytype(Constants.PAY_TYPE.WECHAT_PAY);
                payInfo.setMoney(weChatPayRequest.getPrice());
                payDao.addPayInfo(payInfo);

                response = ResponseBuilder.buildBaseResponse(SUCCESS);
                response.setData(map);//将成功信息返回
            } else {
                logger.warn("[WeChatPayServiceImpl]WeChatPay failed, out_trade_no is {}, return_code is {}, result_code is {}", weChatPayRequest.getOrderNumber(), returnCode, resultCode);
                if("FAIL".equals(returnCode)) {
                    response = ResponseBuilder.buildBaseResponse(REQUEST_FAILED);
                } else {
                    String errorCode = (String)map.get("err_code");

                    if("NOTENOUGH".equals(errorCode)) {//请收银员提示用户更换当前支付的卡，然后请收银员重新扫码。建议：商户系统返回给收银台的提示为“用户余额不足.提示用户换卡支付”
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_NOTENOUGH);
                    } else if ("ORDERPAID".equals(errorCode)) {//请确认该订单号是否重复支付，如果是新单，请使用新订单号提交
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_ORDERPAID);
                    } else if ("ORDERCLOSED".equals(errorCode)) {//商户订单号异常，请重新下单支付
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_ORDERCLOSED);
                    } else if ("SYSTEMERROR".equals(errorCode)) {//请立即调用被扫订单结果查询API，查询当前订单状态，并根据订单的状态决定下一步的操作
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_SYSTEMERROR);
                    } else if ("AUTHCODEEXPIRE".equals(errorCode)) {//请收银员提示用户，请用户在微信上刷新条码，然后请收银员重新扫码。 直接将错误展示给收银员
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_AUTHCODEEXPIRE);
                    } else if ("NOTSUPORTCARD".equals(errorCode)) {//该卡不支持当前支付，提示用户换卡支付或绑新卡支付
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_NOTSUPORTCARD);
                    } else if ("ORDERREVERSED".equals(errorCode)) {//当前订单状态为“订单已撤销”，请提示用户重新支付
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_ORDERREVERSED);
                    } else if ("BANKERROR".equals(errorCode)) {//请立即调用被扫订单结果查询API，查询当前订单的不同状态，决定下一步的操作。
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_LOGICERROR);
                    } else if ("USERPAYING".equals(errorCode)) {//等待5秒，然后调用被扫订单结果查询API，查询当前订单的不同状态，决定下一步的操作。
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_LOGICERROR);//该笔交易因为业务规则要求，需要用户输入支付密码。
                    } else if ("AUTH_CODE_ERROR".equals(errorCode)) {//每个二维码仅限使用一次，请刷新再试
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_AUTH_CODE_ERROR);
                    } else if ("AUTH_CODE_INVALID".equals(errorCode)) {//请扫描微信支付被扫条码/二维码
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_AUTH_CODE_INVALID);
                    } else {
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_LOGICERROR);
                    }
                }
            }
            return response;
        } catch (Exception e) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
    }

    @Override
    public BaseResponse weChatOrderQuery(WeChatOrderQueryRequest weChatOrderQueryRequest) {
        BaseResponse response;
        Map<String, String> params = new TreeMap<String, String>();
        params.put("appid", weChatOrderQueryRequest.getAppID());
        params.put("mch_id", weChatOrderQueryRequest.getMchID());

        if(!KSStringUtils.isEmpty(weChatOrderQueryRequest.getTransactionID())){
            params.put("transaction_id", weChatOrderQueryRequest.getTransactionID());
        }else if(!KSStringUtils.isEmpty(weChatOrderQueryRequest.getOutTradeNo())){
            params.put("out_trade_no", weChatOrderQueryRequest.getOutTradeNo());
        }

        String nonce_str = WeChatPayUtil.getRandomStringByLength(16);
        params.put("nonce_str", nonce_str);

        String mchKey = weChatOrderQueryRequest.getMchKey();

        try {
            String sign = WeChatPayUtil.generateSignature(params, mchKey, WeChatPayConstants.SignType.MD5);
            params.put("sign", sign);
            String requestXML = WeChatPayUtil.mapToXml(params);
            String responseXml = postData("https://" + WeChatPayConstants.DOMAIN_API + WeChatPayConstants.ORDERQUERY_URL_SUFFIX,
                    requestXML, null);
            Map map = WeChatPayUtil.xmlToMap(responseXml);

            String returnCode = (String)map.get("return_code");
            String resultCode = (String)map.get("result_code");
            if("SUCCESS".equals(returnCode) && "SUCCESS".equals(resultCode)) {
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
                response.setData(map);//将成功信息返回
            } else {
                logger.warn("[WeChatPayServiceImpl]weChatOrderQuery failed, transaction_id is {}, out_trade_no is {}, return_code is {}, result_code is {}", weChatOrderQueryRequest.getTransactionID(), weChatOrderQueryRequest.getOutTradeNo(), returnCode, resultCode);
                if("FAIL".equals(returnCode)) {
                    response = ResponseBuilder.buildBaseResponse(REQUEST_FAILED);
                } else {
                    String errorCode = (String)map.get("err_code");

                    if("ORDERNOTEXIST".equals(errorCode)) {//查询系统中不存在此交易订单号
                        response = ResponseBuilder.buildBaseResponse(WECHAT_ORDERQUERY_FAILED_ORDERNOTEXIST);
                    } else if ("SYSTEMERROR".equals(errorCode)) {//系统异常，请再调用发起查询
                        response = ResponseBuilder.buildBaseResponse(WECHAT_ORDERQUERY_FAILED_SYSTEMERROR);
                    } else {
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_LOGICERROR);
                    }
                }
            }

            return response;
        } catch (Exception e) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
    }

    @Override
    public BaseResponse weChatCloseOrder(WeChatCloseOrderRequest weChatCloseOrderRequest) {
        BaseResponse response;
        Map<String, String> params = new TreeMap<String, String>();
        params.put("appid", weChatCloseOrderRequest.getAppID());
        params.put("mch_id", weChatCloseOrderRequest.getMchID());
        String nonce_str = WeChatPayUtil.getRandomStringByLength(16);
        params.put("nonce_str", nonce_str);
        params.put("out_trade_no", weChatCloseOrderRequest.getOutTradeNo());
        String mchKey = weChatCloseOrderRequest.getMchKey();

        try {
            String sign = WeChatPayUtil.generateSignature(params, mchKey, WeChatPayConstants.SignType.MD5);
            params.put("sign", sign);
            String requestXML = WeChatPayUtil.mapToXml(params);
            String responseXml = postData("https://" + WeChatPayConstants.DOMAIN_API + WeChatPayConstants.CLOSEORDER_URL_SUFFIX,
                    requestXML, null);
            Map map = WeChatPayUtil.xmlToMap(responseXml);
            String returnCode = (String)map.get("return_code");
            String resultCode = (String)map.get("result_code");

            if("SUCCESS".equals(returnCode) && "SUCCESS".equals(resultCode)) {
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
                response.setData(map);//将成功信息返回
            } else {
                logger.warn("[WeChatPayServiceImpl]weChatCloseOrder failed, out_trade_no is {}, return_code is {}, result_code is {}", weChatCloseOrderRequest.getOutTradeNo(), returnCode, resultCode);
                if("FAIL".equals(returnCode)) {
                    response = ResponseBuilder.buildBaseResponse(REQUEST_FAILED);
                } else {
                    String errorCode = (String)map.get("err_code");

                    if("ORDERPAID".equals(errorCode)) {//订单已支付，不能发起关单
                        response = ResponseBuilder.buildBaseResponse(WECHAT_CLOSEORDER_FAILED_ORDERPAID);
                    } else if ("SYSTEMERROR".equals(errorCode)) {//系统错误
                        response = ResponseBuilder.buildBaseResponse(WECHAT_CLOSEORDER_FAILED_SYSTEMERROR);
                    } else if ("ORDERCLOSED".equals(errorCode)) {//订单已关闭，无法重复关闭
                        response = ResponseBuilder.buildBaseResponse(WECHAT_CLOSEORDER_FAILED_ORDERCLOSED);
                    } else {
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_LOGICERROR);
                    }
                }
            }
            return response;
        } catch (Exception e) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
    }

    @Override
    public List<Payinfo> queryPayInfo(Map<String, Object> map) {
        return payDao.queryPayInfo(map);
    }

    @Override
    public String weChatNotifyUrl(HttpServletRequest request, HttpServletResponse response) {
        String out_trade_no = null;
        String return_code = null;
        try {
            InputStream inStream = request.getInputStream();
            ByteArrayOutputStream outSteam = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = inStream.read(buffer)) != -1) {
                outSteam.write(buffer, 0, len);
            }
            outSteam.close();
            inStream.close();
            String resultStr = new String(outSteam.toByteArray(), "utf-8");
            logger.info("支付成功的回调：" + resultStr);
            Map<String, Object> resultMap = parseXmlToList(resultStr);
            String result_code = (String) resultMap.get("result_code");
            String appid = (String)resultMap.get("appid");
            String is_subscribe = (String) resultMap.get("is_subscribe");
            String transaction_id = (String) resultMap.get("transaction_id");
            String sign = (String) resultMap.get("sign");
            String time_end = (String) resultMap.get("time_end");
            String openid = (String)resultMap.get("openid");

            out_trade_no = (String) resultMap.get("out_trade_no");
            return_code = (String) resultMap.get("return_code");


            //通知微信.异步确认成功.必写.不然微信会一直通知后台.八次之后就认为交易失败了.
            response.getWriter().write(RequestHandler.setXML("SUCCESS", ""));

            if (return_code.equals("SUCCESS")) {
                if("SUCCESS".equals(result_code) && WeChatPayConstants.GZHID.equals(appid)) {
                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put("out_trade_no", out_trade_no);
                    map.put("userid", openid);
                    List<Payinfo> list = payDao.queryPayInfo(map);
                    if (KSHLUtils.isNotEmpty(list)) {
                        Payinfo info = list.get(0);
                        if(info.getPaystatus() == WeChatPayConstants.PAY_STATUS.PAYSTATUS_NOTPAY) {
                            map.put("payStatus", WeChatPayConstants.PAY_STATUS.PAYSTATUS_PAY);
                            payDao.updatePayStatus(map);
                        }
                    }else{

                    }
                }
                //支付成功的业务逻辑
            } else {
                //支付失败的业务逻辑
            }
        } catch (Exception e) {
            logger.error("微信回调接口出现错误：", e);
            try {
                response.getWriter().write(RequestHandler.setXML("FAIL", "error"));
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        return null;
    }

    /**
     * description: 解析微信通知xml
     *
     * @param xml
     * @return
     * @author ex_yangxiaoyi
     * @see
     */
    private static Map parseXmlToList(String xml) {
        Map retMap = new HashMap();
        try {
            StringReader read = new StringReader(xml);
            // 创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
            InputSource source = new InputSource(read);
            // 创建一个新的SAXBuilder
            SAXBuilder sb = new SAXBuilder();
            // 通过输入源构造一个Document
            Document doc = (Document) sb.build(source);
            Element root = doc.getRootElement();// 指向根节点
            List<Element> es = root.getChildren();
            if (es != null && es.size() != 0) {
                for (Element element : es) {
                    retMap.put(element.getName(), element.getValue());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return retMap;
    }

    @Override
    public void updatePayStatus(Map<String, Object> map) {
        payDao.updatePayStatus(map);
    }

    @Override
    public BaseResponse weChatUnifiedOrder(WeChatUnifiedOrderRequest weChatUnifiedOrderRequest, HttpSession session){
        BaseResponse response;
        Map<String, String> params = new TreeMap<String, String>();
        params.put("appid", weChatUnifiedOrderRequest.getAppID());
        params.put("mch_id", weChatUnifiedOrderRequest.getMchID());
        String nonce_str = WeChatPayUtil.getRandomStringByLength(16);
        params.put("nonce_str", nonce_str);
        params.put("body", weChatUnifiedOrderRequest.getProductName());
        params.put("out_trade_no", weChatUnifiedOrderRequest.getOutTradeNo());
        params.put("total_fee", weChatUnifiedOrderRequest.getTotalFee().toString());
        params.put("spbill_create_ip", weChatUnifiedOrderRequest.getSpBillCreateIp());
        params.put("notify_url", WeChatPayConstants.NOTIFY_URL);//http://www.keslink.cn/Council/wechatPay
        params.put("trade_type", weChatUnifiedOrderRequest.getTradeType());

        if(WeChatPayConstants.TRADE_TYPE_NATIVE.equals(weChatUnifiedOrderRequest.getTradeType())){
            params.put("product_id", weChatUnifiedOrderRequest.getProductId());
        }else if(WeChatPayConstants.TRADE_TYPE_JSAPI.equals(weChatUnifiedOrderRequest.getTradeType())){
            String openid = (String) session.getAttribute("openid");
            if(KSStringUtils.isEmpty(openid)){
                Map<String, Object> accessMap = accessToken(weChatUnifiedOrderRequest.getUserCode());
                if(accessMap != null && accessMap.get("openid") != null){
                    session.setAttribute("openid", accessMap.get("openid"));
                    params.put("openid", (String) accessMap.get("openid"));
                }
            }else{
                params.put("openid", openid);
            }
        }

        String mchKey = weChatUnifiedOrderRequest.getMchKey();

        try {
            String sign = WeChatPayUtil.generateSignature(params, mchKey, WeChatPayConstants.SignType.MD5);
            params.put("sign", sign);
            String requestXML = WeChatPayUtil.mapToXml(params);
            String responseXml = postData("https://" + WeChatPayConstants.DOMAIN_API + WeChatPayConstants.UNIFIEDORDER_URL_SUFFIX,
                    requestXML, null);
            Map map = WeChatPayUtil.xmlToMap(responseXml);
            String returnCode = (String)map.get("return_code");
            String resultCode = (String)map.get("result_code");

            if("SUCCESS".equals(returnCode) && "SUCCESS".equals(resultCode)) {
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
                if(WeChatPayConstants.TRADE_TYPE_NATIVE.equals(weChatUnifiedOrderRequest.getTradeType())){
                    String codeUrl = (String) map.get("code_url");
                    if(codeUrl != null){//生成二维码
                        String qrcodePath = createQRCode(weChatUnifiedOrderRequest.getOutTradeNo(), codeUrl, session);
                        map.put("qrcode_path", qrcodePath);
                    }
                }
                response.setData(map);//将成功信息返回
            } else {
                logger.warn("[WeChatPayServiceImpl]weChatUnifiedOrder failed, out_trade_no is {}, return_code is {}, result_code is {}", weChatUnifiedOrderRequest.getOutTradeNo(), returnCode, resultCode);
                if("FAIL".equals(returnCode)) {
                    response = ResponseBuilder.buildBaseResponse(REQUEST_FAILED);
                } else {
                    String errorCode = (String)map.get("err_code");

                    if("NOAUTH".equals(errorCode)) {//商户未开通此接口权限
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_NOAUTH);
                    } else if ("NOTENOUGH".equals(errorCode)) {//用户帐号余额不足，请用户充值或更换支付卡后再支付
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_NOTENOUGH);
                    } else if ("ORDERPAID".equals(errorCode)) {//商户订单已支付，无需更多操作
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_ORDERPAID);
                    } else if ("ORDERCLOSED".equals(errorCode)) {//当前订单已关闭，请重新下单
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_ORDERCLOSED);
                    } else if ("SYSTEMERROR".equals(errorCode)) {//请系统异常，请用相同参数重新调用
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_SYSTEMERROR);
                    } else if ("OUT_TRADE_NO_USED".equals(errorCode)) {//请核实商户订单号是否重复提交
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_OUT_TRADE_NO_USED);
                    } else {
                        response = ResponseBuilder.buildBaseResponse(WECHAT_PAY_FAILED_LOGICERROR);
                    }
                }
            }
            return response;
        } catch (Exception e) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
    }

    /**
     * 通过微信用户的code换取网页授权access_token
     *
     * access_token
     * openid
     *
     * @return
     * @throws IOException
     * @throws
     */
    public Map<String, Object> accessToken(String code){
        Map<String, Object> map = new HashMap<String, Object>();
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="
                + WeChatPayConstants.GZHID + "&secret=" + WeChatPayConstants.GZHSecret + "&code=" + code + "&grant_type=authorization_code";

        try {
            HttpClient client = new DefaultHttpClient();
            HttpPost post = new HttpPost(url);
            HttpResponse res = client.execute(post);
            if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                HttpEntity entity = res.getEntity();
                String str = EntityUtils.toString(entity, "utf-8");
                ObjectMapper mapper = new ObjectMapper();
                Map<String, Object> jsonOb = mapper.readValue(str, Map.class);
                map.putAll(jsonOb);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

    private String createQRCode(String saveFileName, String codeUrl, HttpSession session){
        int width = 150;
        int height = 150;
        String format = "png";
        Hashtable hints = new Hashtable();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
        hints.put(EncodeHintType.MARGIN, 2);

        String realPath = session.getServletContext().getRealPath("");
        String fullFileName = FileUtils.getFullSavePath(realPath, WeChatPayConstants.PATH_WECHAT + "/qrcode") + saveFileName;

        try {
            BitMatrix bitMatrix = new MultiFormatWriter().encode(codeUrl, BarcodeFormat.QR_CODE, width, height, hints);
            Path file = new File(fullFileName).toPath();
            MatrixToImageWriter.writeToPath(bitMatrix, format, file);
        } catch (WriterException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fullFileName;
    }

    private String postData(String urlStr, String data, String contentType){
        BufferedReader reader = null;
        try {
            URL url = new URL(urlStr);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            if(contentType != null){
                conn.setRequestProperty("content-type", contentType);
            }
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream(), "utf-8");
            if(data == null){
                data = "";
            }
            writer.write(data);
            writer.flush();
            writer.close();

            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            StringBuilder sb = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
                sb.append("\r\n");
            }
            return sb.toString();
        } catch (IOException e) {
//            logger.error("Error connecting to " + urlStr + ": " + e.getMessage());
        } finally {
            try {
                if (reader != null)
                    reader.close();
            } catch (IOException e) {
            }
        }
        return null;
    }

}
