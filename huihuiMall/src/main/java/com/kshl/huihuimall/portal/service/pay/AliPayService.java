package com.kshl.huihuimall.portal.service.pay;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.request.AliPayRequest;
import com.kshl.huihuimall.base.request.AliQueryRequest;
import com.kshl.huihuimall.base.request.AliRefundRequest;
import com.kshl.huihuimall.base.request.AliScanCodePayRequest;

import java.util.Map;

/**
 * Created by 40513 on 2018/1/16.
 */
public interface AliPayService {

    BaseResponse aliPay(AliPayRequest aliPayRequest);

    BaseResponse aliPhoneWebPay(AliPayRequest aliPayRequest);

    BaseResponse aliScanCodePay(AliScanCodePayRequest aliScanCodePayRequest);

    BaseResponse aliQuery(AliQueryRequest aliQueryRequest);

    BaseResponse aliRefund(AliRefundRequest aliRefundRequest);

    String aliPayReturn(Map<String, String> map);

    String aliPayNotify(Map<String, String> map);

}
