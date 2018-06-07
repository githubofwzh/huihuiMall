package com.kshl.huihuimall.portal.controller;


import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.WeChatPayConstants;
import com.kshl.huihuimall.base.request.*;
import com.kshl.huihuimall.portal.service.pay.AliPayService;
import com.kshl.huihuimall.portal.service.pay.WeChatPayService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import static com.kshl.huihuimall.portal.PTErrorCode.*;

@RestController
@EnableAutoConfiguration
@RequestMapping("/pay")
public class PayController {

    private static Logger logger = LoggerFactory.getLogger(PayController.class);

    @Autowired
    private WeChatPayService weChatPayService;

    @Autowired
    private AliPayService aliPayService;

    /**
     * 微信授权码支付（商户F扫用户）
     */
    @RequestMapping(value = "/weChatPay", method = {RequestMethod.POST})
    public BaseResponse weChatPay(@Valid WeChatPayRequest weChatPayRequest, BindingResult bindingResult) {
        logger.debug("WeChatPay start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[WeChatPayRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = weChatPayService.weChatPay(weChatPayRequest);
        }

        return response;
    }

    /**
     * 微信扫码支付（用户扫商户 模式二 统一下单）
     */
    @RequestMapping(value = "/weChatUnifiedOrder", method = {RequestMethod.POST})
    public BaseResponse weChatUnifiedOrder(@Valid WeChatUnifiedOrderRequest weChatUnifiedOrderRequest, BindingResult bindingResult, HttpSession session) {
        logger.debug("WeChatUnifiedOrder start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[WeChatUnifiedOrderRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else if(WeChatPayConstants.TRADE_TYPE_NATIVE.equals(weChatUnifiedOrderRequest.getTradeType())
                && KSStringUtils.isEmpty(weChatUnifiedOrderRequest.getProductId())){
            logger.warn("[WeChatUnifiedOrderRequest] ProductId can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else if(WeChatPayConstants.TRADE_TYPE_JSAPI.equals(weChatUnifiedOrderRequest.getTradeType())
                && KSStringUtils.isEmpty(session.getAttribute("openid"))){
            logger.warn("[WeChatUnifiedOrderRequest] OpenId can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = weChatPayService.weChatUnifiedOrder(weChatUnifiedOrderRequest, session);
        }

        return response;
    }

    /**
     * 关闭订单
     */
    @RequestMapping(value = "/weChatCloseOrder", method = {RequestMethod.POST})
    public BaseResponse weChatCloseOrder(@Valid WeChatCloseOrderRequest weChatCloseOrderRequest, BindingResult bindingResult) {
        logger.debug("weChatCloseOrder start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[WeChatCloseOrderRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = weChatPayService.weChatCloseOrder(weChatCloseOrderRequest);
        }

        return response;
    }

    /**
     * 申请退款
     */
    @RequestMapping(value = "/weChatRefund", method = {RequestMethod.POST})
    public BaseResponse weChatRefund(@Valid WeChatCloseOrderRequest weChatCloseOrderRequest, BindingResult bindingResult) {
        logger.debug("weChatRefund start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[WeChatCloseOrderRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = weChatPayService.weChatCloseOrder(weChatCloseOrderRequest);
        }

        return response;
    }

    @RequestMapping(value = "/weChatNotifyUrl", method = {RequestMethod.POST})
    public String weChatNotifyUrl(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String returnCode = weChatPayService.weChatNotifyUrl(request, response);
        return returnCode;
    }

    //TODO 扫码支付: 申请退款 查询退款 下载对账单 支付结果通知 交易保障 转换短链接 退款结果通知 拉取订单评价数据


    /**
     * 查询订单
     */
    @RequestMapping(value = "/weChatOrderQuery", method = {RequestMethod.POST})
    public BaseResponse weChatOrderQuery(@Valid WeChatOrderQueryRequest weChatOrderQueryRequest, BindingResult bindingResult) {
        logger.debug("weChatOrderQuery start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[WeChatOrderQueryRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else if(KSStringUtils.isEmpty(weChatOrderQueryRequest.getTransactionID()) && KSStringUtils.isEmpty(weChatOrderQueryRequest.getOutTradeNo())){
            logger.warn("[WeChatOrderQueryRequest] TransactionID and OutTradeNo can not be all null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else if(!KSStringUtils.isEmpty(weChatOrderQueryRequest.getTransactionID()) && !KSStringUtils.isEmpty(weChatOrderQueryRequest.getOutTradeNo())){
            logger.warn("[WeChatOrderQueryRequest] TransactionID and OutTradeNo must choose one");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else{
            response = weChatPayService.weChatOrderQuery(weChatOrderQueryRequest);
        }

        return response;
    }

    /**
     * 支付宝统一下单
     */
    @RequestMapping(value = "/aliPay", method = {RequestMethod.POST})
    public BaseResponse aliPay(@Valid AliPayRequest aliPayRequest, BindingResult bindingResult) {
        logger.debug("aliPay start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[AliPayRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = aliPayService.aliPay(aliPayRequest);
        }

        return response;
    }

    /**
     * 支付宝 手机网页支付
     * @return
     */
    @RequestMapping(value = "/aliPhoneWebPay", method = {RequestMethod.POST})
    public BaseResponse aliPhoneWebPay(@Valid AliPayRequest aliPayRequest, BindingResult bindingResult){
        logger.debug("aliPhoneWebPay start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[AliPayRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = aliPayService.aliPhoneWebPay(aliPayRequest);
        }

        return response;
    }

    /**
     * 支付宝扫码支付
     */
    @RequestMapping(value = "/aliScanCodePay", method = {RequestMethod.POST})
    public BaseResponse aliScanCodePay(@Valid AliScanCodePayRequest aliScanCodePayRequest, BindingResult bindingResult) {
        logger.debug("aliScanCodePay start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[AliScanCodePayRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = aliPayService.aliScanCodePay(aliScanCodePayRequest);
        }

        return response;
    }

    /**
     * 交易查询
     * @return
     */
    @RequestMapping(value = "/aliQuery", method = {RequestMethod.POST})
    public BaseResponse aliQuery(@Valid AliQueryRequest aliQueryRequest, BindingResult bindingResult){
        logger.debug("aliQuery start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[AliQueryRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else if(KSStringUtils.isEmpty(aliQueryRequest.getTradeNo()) && KSStringUtils.isEmpty(aliQueryRequest.getOutTradeNo())){
            logger.warn("[AliQueryRequest] param TradeNo and OutTradeNo can not be all null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else {
            response = aliPayService.aliQuery(aliQueryRequest);
        }
        return response;
    }

    /**
     * 支付宝 支付成功同步回调
     * @param request
     * @return
     */
    @RequestMapping("/aliPayReturnUrl")
    @ResponseBody
    public BaseResponse aliPayReturn(HttpServletRequest request, HttpServletResponse response){
        Map<String, String> params = returnMap(request);
        String redirectUrl = aliPayService.aliPayReturn(params);
        try {
            response.sendRedirect(redirectUrl);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 支付宝 支付成功异步回调
     * @param request
     * @return
     */
    @RequestMapping("/aliPayNotifyUrl")
    @ResponseBody
    public BaseResponse aliPayNotify(HttpServletRequest request){
        Map<String, String> params = returnMap(request);
        String result = aliPayService.aliPayNotify(params);
        return null;
    }

    /**
     * 退款
     * @return
     */
    @RequestMapping("/aliRefund")
    @ResponseBody
    public BaseResponse aliRefund(@Valid AliRefundRequest aliRefundRequest, BindingResult bindingResult){
        logger.debug("aliRefund start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[AliRefundRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else {
            response = aliPayService.aliRefund(aliRefundRequest);
        }
        return response;
    }

    private Map<String, String> returnMap(HttpServletRequest request){
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。
            // valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
            System.out.println(name+" : "+valueStr);
        }
        return params;
    }

}

