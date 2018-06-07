package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

/**
 * Created by 40513 on 2018/1/17.
 */
public class AliQueryRequest extends BaseRequest {

    private String tradeNo;//商户订单号，商户网站订单系统中唯一订单号

    private String outTradeNo;//支付宝交易号

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }
}
