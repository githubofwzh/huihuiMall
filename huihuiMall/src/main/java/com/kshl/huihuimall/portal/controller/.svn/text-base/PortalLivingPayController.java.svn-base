package com.kshl.huihuimall.portal.controller;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.LivingPay;
import com.kshl.huihuimall.base.dal.entity.LivingPayBill;
import com.kshl.huihuimall.base.request.*;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.controller.product.ProductMgmtController;
import com.kshl.huihuimall.portal.controller.request.LivingPayBillRequest;
import com.kshl.huihuimall.portal.controller.request.LivingPayRequest;
import com.kshl.huihuimall.portal.livingpay.Living;
import com.kshl.huihuimall.portal.livingpay.LivingPayUtils;
import com.kshl.huihuimall.portal.livingpay.PayDetail;
import com.kshl.huihuimall.portal.service.livingpay.LivingPayService;
import com.kshl.huihuimall.portal.service.pay.AliPayService;
import com.kshl.huihuimall.portal.service.pay.WeChatPayService;
import com.kshl.huihuimall.portal.service.sms.SmsService;
import com.qianmi.open.api.ApiException;
import com.qianmi.open.api.DefaultOpenClient;
import com.qianmi.open.api.OpenClient;
import com.qianmi.open.api.domain.common.QmcsMessage;
import com.qianmi.open.api.qmcs.QmcsClient;
import com.qianmi.open.api.qmcs.channel.ChannelException;
import com.qianmi.open.api.qmcs.handler.MessageHandler;
import com.qianmi.open.api.qmcs.message.Message;
import com.qianmi.open.api.qmcs.message.MessageStatus;
import com.qianmi.open.api.request.QmcsMessagesConfirmRequest;
import com.qianmi.open.api.request.QmcsMessagesConsumeRequest;
import com.qianmi.open.api.response.QmcsMessagesConfirmResponse;
import com.qianmi.open.api.response.QmcsMessagesConsumeResponse;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;
@Controller
@EnableAutoConfiguration
@RequestMapping("/PortalLivingPay")
public class PortalLivingPayController {
    private static final Logger logger = LoggerFactory.getLogger(ProductMgmtController.class);
    @Autowired
    private LivingPayService livingPayService;
    @Autowired
    private WeChatPayService weChatPayService;
    @Autowired
    private AliPayService aliPayService;
    @Autowired
    private SmsService smsService;

     /*
         选择水电煤的一种
      */
    @RequestMapping(value = "/getItemId", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getItemId(String ProjectId,String AddressId) {
        logger.debug("getItemId start");
        BaseResponse response = new BaseResponse();

        if(ProjectId == null || ProjectId.trim().length() == 0){
            logger.warn("[mobile] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else{
            KsArea ksArea=livingPayService.getLivingPrince(AddressId);
            String Province=ksArea.getShortname();
            if(ksArea.getShortname()!=null){

            }
            LivingPayUtils livingPayUtils=new LivingPayUtils();
            List<Living> ItemId=livingPayUtils.testGetItemInfo2(ProjectId,Province);
            response.setData(ItemId);
            response.setRetCode(Long.valueOf(0));
        }
        return response;
    }

    //账单信息
    @RequestMapping(value = "/getOrderInfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getOrderInfo(Living live,String account) {
        logger.debug("getOrderInfo start");
        BaseResponse response = new BaseResponse();
            LivingPayUtils livingPayUtils=new LivingPayUtils();
            Living living= livingPayUtils.testGetItemInfo3(live,account);
            System.out.println(living);
            response.setData(living);
            response.setRetCode(Long.valueOf(0));

        return response;
    }

    //支付宝支付结果查找
    public BaseResponse aliScanCodePay(AliQueryRequest aliQueryRequest) {
        BaseResponse response= new BaseResponse();
        if(response.getData()==null){
            try {
                synchronized (this) {
                    for(int i=0;i<1000;i++){
                        response = aliPayService.aliQuery(aliQueryRequest);
                        //System.out.println(response.getData());
                        if(response.getData()!=null){
                            break;
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return response;
    }


    //微信支付结果查找
    public BaseResponse weChatOrderQuery(WeChatOrderQueryRequest weChatOrderQueryRequest) {

        BaseResponse response= new BaseResponse();
        if(response.getData()==null){
            try {
                synchronized (this) {
                    for(int i=0;i<1000;i++){
                        response = weChatPayService.weChatOrderQuery(weChatOrderQueryRequest);
                        //System.out.println(response.getData());
                        if(response.getData()!=null){
                            break;
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return response;
    }

    //缴费
    @RequestMapping(value = "/payinfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse payinfo(String outerTid, AliQueryRequest aliQueryRequest, WeChatOrderQueryRequest weChatOrderQueryRequest,LivingPayRequest livingPayRequest,HttpServletRequest request) {
        logger.debug("payinfo start");
        aliQueryRequest.setOutTradeNo(outerTid);
        BaseResponse response = new BaseResponse();
        HttpSession session = request.getSession();
        Object object = session.getAttribute("userInfo");
        String phone = "";
        String userid = "";
        if (!KSStringUtils.isEmpty(object)) {
            UserInfo userInfo = (UserInfo)object;
            phone = userInfo.getPhoneNumber();
            userid = userInfo.getUserId().toString();
        }
        if(livingPayRequest.getType() == null || livingPayRequest.getType().trim().length() == 0){
            logger.warn("[mobile] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else{
            if(livingPayRequest.getType().equals("1")){
                response=  aliScanCodePay(aliQueryRequest);
                //System.out.println(response.getRetCode()+""+response.getData()+""+response.getRetCode());
                if(response.getData()!=null){
                    LivingPayUtils livingPayUtils=new LivingPayUtils();
                    PayDetail payDetail= livingPayUtils.testGetItemInfo4(livingPayRequest);
                    LivingPay livingPay=new LivingPay();
                    livingPay.setOrderNumber(outerTid);
                    livingPay.setPayStatus(1);
                    livingPay.setPayType(1);
                    livingPayService.updatepay(livingPay);
                    LivingPayBill livingPayBill=new LivingPayBill();
                    System.out.println(payDetail.getSaleAmount()+""+payDetail.getRechargeState());
                    if(payDetail.getRechargeAccount()!=null){
                        livingPayBill.setPhone(phone);
                        livingPayBill.setUserid(userid);
                        livingPayBill.setBillid(payDetail.getBillId());
                        livingPayBill.setOrdertime(new Date());
                        livingPayBill.setPaystate(Integer.valueOf(payDetail.getPayState()));
                        livingPayBill.setOutertid(outerTid);
                        livingPayBill.setSordernumber(payDetail.getOuterTid());
                        livingPayBill.setRechargeaccount(payDetail.getRechargeAccount());
                        BigDecimal amount=new BigDecimal(payDetail.getSaleAmount());
                        livingPayBill.setSaleamount(amount);
                        livingPayBill.setRechargestate(Integer.valueOf(payDetail.getRechargeState()));
                        livingPayBill.setPaytype(Constants.PAY_TYPE.ALIPAY);
                        livingPayService.insertSelective(livingPayBill);
                        response.setData(payDetail);
                        response.setRetCode(Long.valueOf(0));
                    }else {
//                        String content="您缴费充值失败，请核对您的用户号";
//                        String mobile=livingPay.getUserAccount();
//                        smsService.smsContent(content,mobile);
                        AliRefundRequest aliRefundRequest=new AliRefundRequest();
                        aliRefundRequest.setOutTradeNo(outerTid);
                        BigDecimal amount=new BigDecimal(livingPayRequest.getItemNum());
                        aliRefundRequest.setRefundAmount(amount);
                        aliRefundRequest.setRefundReason("充值失败");
                        response = aliPayService.aliRefund(aliRefundRequest);
                        livingPay.setPayStatus(2);
                        livingPayService.updatepay(livingPay);
                        response.setRetCode(Long.valueOf(1));
                        response.setRetMsg("系统异常");
                    }

                }
            }else if(livingPayRequest.getType().equals("2")){
                weChatOrderQueryRequest.setOutTradeNo(outerTid);
                response=  weChatOrderQuery(weChatOrderQueryRequest);
                if(response.getData()!=null){
                    LivingPayUtils livingPayUtils=new LivingPayUtils();
                    PayDetail payDetail= livingPayUtils.testGetItemInfo4(livingPayRequest);
                    LivingPay livingPay=new LivingPay();
                    livingPay.setOrderNumber(outerTid);
                    livingPay.setPayStatus(1);
                    livingPay.setPayType(2);
                    livingPayService.updatepay(livingPay);
                    LivingPayBill livingPayBill=new LivingPayBill();
                    System.out.println(payDetail.getSaleAmount()+""+payDetail.getRechargeState());
                    if(payDetail.getRechargeAccount()!=null){
                        livingPayBill.setPhone(phone);
                        livingPayBill.setUserid(userid);
                        livingPayBill.setBillid(payDetail.getBillId());
                        livingPayBill.setOrdertime(new Date());
                        livingPayBill.setPaystate(Integer.valueOf(payDetail.getPayState()));
                        livingPayBill.setOutertid(payDetail.getOuterTid());
                        livingPayBill.setRechargeaccount(payDetail.getRechargeAccount());
                        livingPayBill.setPaytype(Constants.PAY_TYPE.WECHAT_PAY);
                        BigDecimal amount=new BigDecimal(payDetail.getSaleAmount());
                        livingPayBill.setSaleamount(amount);
                        livingPayBill.setRechargestate(Integer.valueOf(payDetail.getRechargeState()));
                        livingPayService.insertSelective(livingPayBill);
                        response.setData(payDetail);
                        response.setRetCode(Long.valueOf(0));
                    }else {
//                        String content="您缴费充值失败，请核对您的用户号";
//                        String mobile=livingPay.getUserAccount();
//                        smsService.smsContent(content,mobile);
                        //微信退款
                        WeChatRefundRequest weChatRefundRequest=new WeChatRefundRequest();
                        weChatRefundRequest.setOutTradeNo(outerTid);
                        weChatRefundRequest.setRefundFee(livingPayRequest.getItemNum());
                        weChatRefundRequest.setTotalFee(livingPayRequest.getItemNum());
                        response=weChatPayService.weChatRefund(weChatRefundRequest,request);
                        livingPay.setPayStatus(2);
                        livingPayService.updatepay(livingPay);
                        response.setRetCode(Long.valueOf(1));
                        response.setRetMsg("系统异常");
                    }

                }
            }

        }
        return response;
    }


    //入账(insert)
    @RequestMapping(value = "/insertPay", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse insertPay(LivingPay livingPay) {
        logger.debug("insertPay start");
        String orderNumber=DateFormatUtil.getHaoMiao();
        BaseResponse response=new BaseResponse();
        LivingPay pay=new LivingPay();
        pay.setOrderNumber(orderNumber);
        BigDecimal amount=new BigDecimal(String.valueOf(livingPay.getPayAmount()));
        pay.setPayAmount(amount);
        pay.setSerialNumber(livingPay.getSerialNumber());
        pay.setPayStatus(livingPay.getPayStatus());
        pay.setPayTime(new Date());
        pay.setPayType(livingPay.getPayType());
        pay.setProductType(livingPay.getProductType());
        pay.setUserAccount(livingPay.getUserAccount());
        int count=livingPayService.insertSelective(pay);
        if(count>0){
            response.setRetCode(Long.valueOf(0));
            response.setData(orderNumber);
            response.setRetMsg("成功");
        }else {
            response.setRetCode(Long.valueOf(1));
            response.setRetMsg("失败");
        }
        return response;
    }

    //查找入账记录
    @RequestMapping(value = "/getAllPay", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse getAllPay(LivingPayRequest re,String pay_time) {
        logger.debug("payinfo start");
        List<Map<String,Object>> list=livingPayService.getLivingPay(re.getPageNum(),re.getPageSize(),re.getProductType(),re.getStartTime(),re.getEndTime(),pay_time,re.getOuterTid());
        BasePageResponse< List<Map<String,Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(list);
        return pageResponse;
    }
    //查找入账记录详情
    @RequestMapping(value = "/getPayDateil", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse getPayDateil(Integer id) {
        logger.debug("payinfo getPayDateil");
        LivingPay list=livingPayService.selectByPrimaryKey(id);
        BasePageResponse<LivingPay> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(list);
        return pageResponse;
    }

    //对账记录
    @RequestMapping(value = "/getPayBill", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse getPayBill(LivingPayBillRequest re) {
        logger.debug("getPayBill start");
        List<Map<String,Object>> list=livingPayService.getLivingBill(re.getPageNum(),re.getPageSize(),re.getOuterTid(),re.getPayType(),re.getRechargestate(),re.getStartTime(),re.getEndTime());
        BasePageResponse<List<Map<String,Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(list);
        return pageResponse;
    }



    //开启异步回调
    @RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse callback(LivingPayRequest re, HttpServletRequest request) throws ApiException, ChannelException {
        BaseResponse response=new BaseResponse();
        String appkey = "10001771";
        String appSecret = "cVXMBG0JMLWqvnBmZpoL7Ph8nmOqABpv";
        //创建链接客户端,使用默认分组
        QmcsClient client = new QmcsClient(appkey,appSecret,"A2458419_1");
        //消息处理
        client.setMessageHandler(new MessageHandler(){
            @Override
            public void onMessage(Message message, MessageStatus status) throws Exception {
                try {
                    System.out.println(message.getTopic());
                    System.out.println(message.getContent());
                    BaseResponse response=new BaseResponse();
                    if(message.getTopic().equals("qianmi_elife_rechargeStateChange")){
                        JSONObject jsStr = JSONObject.fromObject(message.getContent());
                        Object tid=  jsStr.getString("tid");
                        String SorderNumber=  jsStr.getString("tid").toString();
                        String recharge_state=  jsStr.getString("recharge_state").toString();
                        if(SorderNumber!=null){
                            LivingPayBill livingPayBill=new LivingPayBill();
                            livingPayBill.setRechargestate(Integer.valueOf(recharge_state));
                            livingPayBill.setBillid(SorderNumber);
                            livingPayService.updatePayOrder(livingPayBill);
                            //发送短信
                            LivingPay livingPay=livingPayService.getLivingPayPhone(SorderNumber);
                            if(recharge_state.equals("9")){
                                String Type="";
                                if(livingPay.getProductType().equals(1)){
                                    Type="水费";
                                }else if(livingPay.getProductType().equals(2)){
                                    Type="电费";
                                }else if(livingPay.getProductType().equals(3)){
                                    Type="燃气费";
                                }
                                String content="您充值的"+Type+livingPay.getPayAmount()+"元充值失败";
                                String mobile=livingPay.getUserAccount();
                                smsService.smsContent(content,mobile);
                                if(livingPay.getPayType().equals(1)){
                                    //支付宝退款
                                    AliRefundRequest aliRefundRequest=new AliRefundRequest();
                                    aliRefundRequest.setOutTradeNo(livingPay.getOrderNumber());
                                    BigDecimal amount=new BigDecimal(String.valueOf(livingPay.getPayAmount()));
                                    aliRefundRequest.setRefundAmount(amount);
                                    aliRefundRequest.setRefundReason("充值失败");
                                    response = aliPayService.aliRefund(aliRefundRequest);
                                }else if(livingPay.getPayType().equals(2)){
                                    //微信退款
                                    WeChatRefundRequest weChatRefundRequest=new WeChatRefundRequest();
                                    weChatRefundRequest.setOutTradeNo(livingPay.getOrderNumber());
                                    weChatRefundRequest.setTotalFee(String.valueOf(livingPay.getPayAmount()));
                                    weChatRefundRequest.setRefundFee(String.valueOf(livingPay.getPayAmount()));
                                    response=weChatPayService.weChatRefund(weChatRefundRequest,request);
                                }
                            }else if(recharge_state.equals("1")){
                                String Type="";
                                if(livingPay.getProductType().equals(1)){
                                    Type="水费";
                                }else if(livingPay.getProductType().equals(2)){
                                    Type="电费";
                                }else if(livingPay.getProductType().equals(3)){
                                    Type="燃气费";
                                }
                                String content="您充值的"+Type+"充值金额"+livingPay.getPayAmount()+"充值成功";
                                String mobile=livingPay.getUserAccount();
                                smsService.smsContent(content,mobile);
                            }
                        }
                    }
                    if(message.getTopic().equals("bm_elife_rechargeStateChange")){
                        System.out.println("确认22222");
                    }

                } catch (Exception e){
                    e.printStackTrace();
                    status.fail();//消息处理失败,需要服务端重新推送
                }
            }
        });
        client.connect("ws://mc.bm001.com");//发起连接请求

        return response;
    }







    //开启异步回调
    @RequestMapping(value = "/callback1", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse callback1(LivingPayRequest re) throws ApiException {
        BaseResponse response=new BaseResponse();
        String url = "http://gw.api.qianmi.com/api";
        String appKey = "10001771";
        String appSecret = "cVXMBG0JMLWqvnBmZpoL7Ph8nmOqABpv";
        String accessToken = "bd44b1fd6a014616b8259c081e5f5dc8";
        OpenClient client = new DefaultOpenClient(url, appKey, appSecret);
        do {
            Integer quantity = 100;
            String groupName = "A2458419";
            QmcsMessagesConsumeResponse rsp = null;
            do {
                QmcsMessagesConsumeRequest req1 = new QmcsMessagesConsumeRequest();
                req1.setQuantity(quantity);
                req1.setGroupName(groupName);
                rsp = client.execute(req1);
                if (rsp.isSuccess() && rsp.getQmcsMessages() != null) {
                    for (QmcsMessage msg : rsp.getQmcsMessages()) {
                        JSONObject jsStr = JSONObject.fromObject(msg.getContent());
                        Object outer_tid=  jsStr.get("outer_tid");
                       // System.out.println(outer_tid+"================外部订单号");
                        String SorderNumber=  jsStr.getString("tid").toString();
                        String recharge_state=  jsStr.getString("recharge_state").toString();
                       // System.out.println(SorderNumber+"==="+recharge_state);
                        if(outer_tid!=null){
                            LivingPayBill livingPayBill=new LivingPayBill();
                            livingPayBill.setRechargestate(Integer.valueOf(recharge_state));
                            livingPayBill.setBillid(SorderNumber);
                            livingPayService.updatePayOrder(livingPayBill);
                            //发送短信
                            LivingPay livingPay=livingPayService.getLivingPayPhone(SorderNumber);
                            if(recharge_state.equals("9")){
                                String Type="";
                                if(livingPay.getProductType().equals(1)){
                                    Type="水费";
                                }else if(livingPay.getProductType().equals(2)){
                                    Type="电费";
                                }else if(livingPay.getProductType().equals(3)){
                                    Type="燃气费";
                                }
                                String content="您充值的"+Type+"充值金额"+livingPay.getPayAmount()+"充值失败";
                                String mobile=livingPay.getUserAccount();
                                smsService.smsContent(content,mobile);

                                if(livingPay.getPayType().equals(1)){
                                    //支付宝退款
                                    AliRefundRequest aliRefundRequest=new AliRefundRequest();
                                    aliRefundRequest.setOutTradeNo(String.valueOf(outer_tid));
                                    BigDecimal amount=new BigDecimal(String.valueOf(livingPay.getPayAmount()));
                                    aliRefundRequest.setRefundAmount(amount);
                                    aliRefundRequest.setRefundReason("充值失败");
                                    response = aliPayService.aliRefund(aliRefundRequest);
                                }else if(livingPay.getPayType().equals(2)){
                                    //微信退款
                                    WeChatCloseOrderRequest weChatCloseOrderRequest=new WeChatCloseOrderRequest();

                                    response=weChatPayService.weChatCloseOrder(weChatCloseOrderRequest);
                                }

                            }else if(recharge_state.equals("1")){
                                String Type="";
                                if(livingPay.getProductType().equals(1)){
                                    Type="水费";
                                }else if(livingPay.getProductType().equals(2)){
                                    Type="电费";
                                }else if(livingPay.getProductType().equals(3)){
                                    Type="燃气费";
                                }
                                String content="您充值的"+Type+"充值金额"+livingPay.getPayAmount()+"充值成功";
                                String mobile=livingPay.getUserAccount();
                                smsService.smsContent(content,mobile);
                            }
                        }
                        // 处理消息
                        System.out.println(msg.getContent());
                        System.out.println(msg.getTopic());
                        // 确认消费状态
                        QmcsMessagesConfirmRequest cReq = new QmcsMessagesConfirmRequest();
                        cReq.setsMessageIds(msg.getId());
                        QmcsMessagesConfirmResponse cRsp = client.execute(cReq);
                        System.out.println(cRsp.isSuccess());
                    }
                }
                System.out.println(rsp.getBody());
            } while (rsp != null && rsp.isSuccess() && rsp.getQmcsMessages() != null);
            try {
                Thread.sleep(5000L); //根据自身服务器处理能力合理设置轮训时间
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } while (true);

    }
}
