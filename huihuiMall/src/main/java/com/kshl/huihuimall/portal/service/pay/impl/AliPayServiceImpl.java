package com.kshl.huihuimall.portal.service.pay.impl;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradePayRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.AliPayConstants;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.Payinfo;
import com.kshl.huihuimall.base.request.AliPayRequest;
import com.kshl.huihuimall.base.request.AliQueryRequest;
import com.kshl.huihuimall.base.request.AliRefundRequest;
import com.kshl.huihuimall.base.request.AliScanCodePayRequest;
import com.kshl.huihuimall.portal.dal.dao.PayDao;
import com.kshl.huihuimall.portal.service.pay.AliPayService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import static com.kshl.huihuimall.portal.PTErrorCode.*;

@Service
public class AliPayServiceImpl implements AliPayService {

    private static Logger logger = LoggerFactory.getLogger(AliPayServiceImpl.class);

    @Autowired
    private PayDao payDao;

    @Override
    public BaseResponse aliPay(AliPayRequest aliPayRequest) {
        BaseResponse response;
        AlipayClient alipayClient = new DefaultAlipayClient(AliPayConstants.SERVER_URL, AliPayConstants.APPID, AliPayConstants.APP_PRIVATE_KEY, AliPayConstants.FORMAT, AliPayConstants.CHARSET, AliPayConstants.ALIPAY_PUBLIC_KEY, AliPayConstants.SIGN_TYPE);
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AliPayConstants.RETURN_URL);
        alipayRequest.setNotifyUrl(AliPayConstants.NOTIFY_URL);

        try {
            //系统内部订单号
            String out_trade_no = aliPayRequest.getOutTradeNo();
            //付款金额，必填
            String total_amount = aliPayRequest.getTotalAmount().toString();
            //订单名称，必填
            String subject = aliPayRequest.getSubject();
            //商品描述，可空
            String body = aliPayRequest.getBody();

            alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                    + "\"total_amount\":\""+ total_amount +"\","
                    + "\"subject\":\""+ subject +"\","
                    + "\"body\":\""+ body +"\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            String result = alipayClient.pageExecute(alipayRequest).getBody();
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(result);//将成功信息返回

            Payinfo payInfo = new Payinfo();
            payInfo.setBody(body);
            payInfo.setOutTradeNo(out_trade_no);
            payInfo.setPaystatus(Constants.PAY_STATUS.NOT_PAY);
            payInfo.setPaytype(Constants.PAY_TYPE.ALIPAY);
            payInfo.setMoney(aliPayRequest.getTotalAmount());
            payInfo.setSubject(subject);
            payDao.addPayInfo(payInfo);

        } catch (Exception e) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }

        return response;
    }

    @Override
    public BaseResponse aliPhoneWebPay(AliPayRequest aliPayRequest) {
        BaseResponse response;
        AlipayClient alipayClient = new DefaultAlipayClient(AliPayConstants.SERVER_URL, AliPayConstants.APPID, AliPayConstants.APP_PRIVATE_KEY, AliPayConstants.FORMAT, AliPayConstants.CHARSET, AliPayConstants.ALIPAY_PUBLIC_KEY, AliPayConstants.SIGN_TYPE);
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AliPayConstants.RETURN_URL);
        alipayRequest.setNotifyUrl(AliPayConstants.NOTIFY_URL);

        try {
            //系统内部订单号
            String out_trade_no = aliPayRequest.getOutTradeNo();
            //付款金额，必填
            String total_amount = aliPayRequest.getTotalAmount().toString();
            //订单名称，必填
            String subject = aliPayRequest.getSubject();
            //商品描述，可空
            String body = aliPayRequest.getBody();
            // 销售产品码 必填
            String product_code = "QUICK_WAP_PAY";

            String timeout_express = "2m";

            AlipayTradeWapPayModel model = new AlipayTradeWapPayModel();
            model.setOutTradeNo(out_trade_no);
            model.setSubject(subject);
            model.setTotalAmount(total_amount);
            model.setBody(body);
            model.setTimeoutExpress(timeout_express);
            model.setProductCode(product_code);
            alipayRequest.setBizModel(model);

            String result = alipayClient.pageExecute(alipayRequest).getBody();
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(result);//将成功信息返回

            Payinfo payInfo = new Payinfo();
            payInfo.setBody(body);
            payInfo.setOutTradeNo(out_trade_no);
            payInfo.setPaystatus(Constants.PAY_STATUS.NOT_PAY);
            payInfo.setPaytype(Constants.PAY_TYPE.ALIPAY);
            payInfo.setMoney(aliPayRequest.getTotalAmount());
            payInfo.setSubject(subject);
            payDao.addPayInfo(payInfo);

        } catch (Exception e) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }

        return response;
    }

    @Override
    public BaseResponse aliScanCodePay(AliScanCodePayRequest aliScanCodePayRequest) {
        BaseResponse response;
        AlipayClient alipayClient = new DefaultAlipayClient(AliPayConstants.SERVER_URL, AliPayConstants.APPID, AliPayConstants.APP_PRIVATE_KEY, AliPayConstants.FORMAT, AliPayConstants.CHARSET, AliPayConstants.ALIPAY_PUBLIC_KEY, AliPayConstants.SIGN_TYPE);
        AlipayTradePayRequest alipayRequest = new AlipayTradePayRequest();
        alipayRequest.setReturnUrl(AliPayConstants.RETURN_URL);
        alipayRequest.setNotifyUrl(AliPayConstants.NOTIFY_URL);

        try {
            String auth_code = aliScanCodePayRequest.getAuthCode();
            //系统内部订单号
            String out_trade_no = aliScanCodePayRequest.getOutTradeNo();
            //付款金额，必填
            String total_amount = aliScanCodePayRequest.getTotalAmount().toString();
            //订单名称，必填
            String subject = aliScanCodePayRequest.getSubject();
            //商品描述，可空
            String body = aliScanCodePayRequest.getBody();

            alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                    + "\"total_amount\":\""+ total_amount +"\","
                    + "\"subject\":\""+ subject +"\","
                    + "\"body\":\""+ body +"\","
                    + "\"scene\":\"bar_code\","
                    + "\"auth_code\":\""+ auth_code +"\"}");
            String result = alipayClient.execute(alipayRequest).getBody();
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(result);//将成功信息返回

            Payinfo payInfo = new Payinfo();
            payInfo.setBody(body);
            payInfo.setOutTradeNo(out_trade_no);
            payInfo.setPaystatus(Constants.PAY_STATUS.NOT_PAY);
            payInfo.setPaytype(Constants.PAY_TYPE.ALIPAY);
            payInfo.setMoney(aliScanCodePayRequest.getTotalAmount());
            payInfo.setSubject(subject);
            payDao.addPayInfo(payInfo);

        } catch (Exception e) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }

        return response;
    }

    @Override
    public BaseResponse aliQuery(AliQueryRequest aliQueryRequest) {
        BaseResponse response;
        AlipayClient alipayClient = new DefaultAlipayClient(AliPayConstants.SERVER_URL, AliPayConstants.APPID, AliPayConstants.APP_PRIVATE_KEY, AliPayConstants.FORMAT, AliPayConstants.CHARSET, AliPayConstants.ALIPAY_PUBLIC_KEY, AliPayConstants.SIGN_TYPE);
        AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();
        try {
            String bizContent;
            if(!KSStringUtils.isEmpty(aliQueryRequest.getTradeNo())){
                String trade_no = new String(aliQueryRequest.getTradeNo().getBytes("ISO-8859-1"),"UTF-8");
                bizContent = "{\"trade_no\":\""+ trade_no +"\"}";
            }else{
                String out_trade_no = new String(aliQueryRequest.getOutTradeNo().getBytes("ISO-8859-1"),"UTF-8");
                bizContent = "{\"out_trade_no\":\""+ out_trade_no +"\"}";
            }

            alipayRequest.setBizContent(bizContent);
            AlipayTradeQueryResponse alipayTradeQueryResponse = alipayClient.execute(alipayRequest);
            if(alipayTradeQueryResponse.isSuccess()){
                String result = alipayTradeQueryResponse.getBody();
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
                response.setData(result);
            } else {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        } catch (Exception e) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
        return response;
    }

    @Override
    public BaseResponse aliRefund(AliRefundRequest aliRefundRequest) {
        BaseResponse baseResponse = null;
        AlipayClient alipayClient = new DefaultAlipayClient(AliPayConstants.SERVER_URL, AliPayConstants.APPID, AliPayConstants.APP_PRIVATE_KEY, AliPayConstants.FORMAT, AliPayConstants.CHARSET, AliPayConstants.ALIPAY_PUBLIC_KEY, AliPayConstants.SIGN_TYPE);
        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
        try {
            //商户订单号，商户网站订单系统中唯一订单号
            String out_trade_no = new String(aliRefundRequest.getOutTradeNo().getBytes("ISO-8859-1"),"UTF-8");
            //支付宝交易号
            String trade_no = new String(aliRefundRequest.getTradeNo().getBytes("ISO-8859-1"),"UTF-8");
            //请二选一设置
            //需要退款的金额，该金额不能大于订单金额，必填
            String refund_amount = new String(aliRefundRequest.getRefundAmount().toString().getBytes("ISO-8859-1"),"UTF-8");
            //退款的原因说明
            String refund_reason = new String(aliRefundRequest.getRefundReason().getBytes("ISO-8859-1"),"UTF-8");
            //标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
//            String out_request_no = new String(request.getParameter("WIDTRout_request_no").getBytes("ISO-8859-1"),"UTF-8");

            alipayRequest.setBizContent("{\"trade_no\":\""+ trade_no +"\","
                    + "\"refund_amount\":\""+ refund_amount +"\","
                    + "\"refund_reason\":\""+ refund_reason +"\"}");

            //请求
            AlipayTradeRefundResponse response  = alipayClient.execute(alipayRequest);
            if (response.isSuccess()) {
                Payinfo payInfo = payDao.getByTradeNo(out_trade_no);
                payInfo.setPaystatus(Constants.PAY_STATUS.REFUND);
                payDao.updatePayInfo(payInfo);
                logger.info("退款成功");
            } else {
                logger.info("退款失败");
            }
            baseResponse = ResponseBuilder.buildBaseResponse(SUCCESS);
        } catch (Exception e) {
            baseResponse = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return baseResponse;
        }
        return baseResponse;
    }

    @Override
    public String aliPayReturn(Map<String, String> map) {
        Payinfo payInfo = payDao.getByTradeNo(map.get("out_trade_no"));
        payInfo.setTradeNo(map.get("trade_no"));
        payInfo.setPaystatus(Constants.PAY_STATUS.PAY);
        try {
            payInfo.setPaytime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("timestamp")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        payDao.updatePayInfo(payInfo);
        return "/liugongisland/alipay";//重定向
    }

    @Override
    public String aliPayNotify(Map<String, String> map) {
        try {
            //异步回调需要验签名
            boolean verify_result = AlipaySignature.rsaCheckV1(map, AliPayConstants.ALIPAY_PUBLIC_KEY, AliPayConstants.CHARSET, AliPayConstants.SIGN_TYPE);
            if (verify_result) {// 验证成功
                // TODO 请在这里加上商户的业务逻辑程序代码
                Payinfo payInfo = payDao.getByTradeNo(map.get("out_trade_no"));
                String trade_status = map.get("trade_status");

                Map<String, Object> updateMap = new HashMap<String, Object>();
                updateMap.put("out_trade_no", payInfo.getOutTradeNo());
                updateMap.put("userid", payInfo.getUserid());
                updateMap.put("payStatus", getTradeStatus(trade_status));
                payDao.updatePayStatus(updateMap);

                logger.info("notify_url 验证成功");
                return "success";
            } else {
                logger.info("notify_url 验证失败");
                return "fail";
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return "fail";
    }

    private Integer getTradeStatus(String notifyStatus){
        if(AliPayConstants.TRADE_STATUS.TRADE_SUCCESS.equals(notifyStatus)){
            return Constants.PAY_STATUS.PAY;
        }else if(AliPayConstants.TRADE_STATUS.WAIT_BUYER_PAY.equals(notifyStatus)){
            return Constants.PAY_STATUS.NOT_PAY;
        }else if(AliPayConstants.TRADE_STATUS.TRADE_CLOSED.equals(notifyStatus)){
            return Constants.PAY_STATUS.NOT_PAY;
        }else if(AliPayConstants.TRADE_STATUS.TRADE_FINISHED.equals(notifyStatus)){
            return Constants.PAY_STATUS.PAY;
        }else{
            return Constants.PAY_STATUS.NOT_PAY;
        }
    }


}
