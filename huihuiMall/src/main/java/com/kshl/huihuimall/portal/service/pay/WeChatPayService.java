package com.kshl.huihuimall.portal.service.pay;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.request.WeChatCloseOrderRequest;
import com.kshl.huihuimall.base.request.WeChatOrderQueryRequest;
import com.kshl.huihuimall.base.request.WeChatPayRequest;
import com.kshl.huihuimall.base.request.WeChatUnifiedOrderRequest;
import com.kshl.huihuimall.base.dal.entity.Payinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by 40513 on 2018/1/16.
 */
public interface WeChatPayService {

    BaseResponse weChatPay(WeChatPayRequest weChatPayRequest);

    BaseResponse weChatOrderQuery(WeChatOrderQueryRequest weChatOrderQueryRequest);

    BaseResponse weChatCloseOrder(WeChatCloseOrderRequest weChatCloseOrderRequest);

    List<Payinfo> queryPayInfo(Map<String, Object> map);

    String weChatNotifyUrl(HttpServletRequest request, HttpServletResponse response);

    void updatePayStatus(Map<String, Object> map);

    BaseResponse weChatUnifiedOrder(WeChatUnifiedOrderRequest weChatUnifiedOrderRequest, HttpSession session);
}
