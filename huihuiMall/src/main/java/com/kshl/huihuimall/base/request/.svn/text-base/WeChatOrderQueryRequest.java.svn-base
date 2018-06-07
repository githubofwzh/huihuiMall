package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;

/**
 * Created by 40513 on 2018/1/17.
 */
public class WeChatOrderQueryRequest extends BaseRequest {

    private String transactionID;//微信订单号

    private String outTradeNo;//商户订单号

    @NotNull(message = "appID should not be null")
    private String appID;//公众账号ID

    @NotNull(message = "mchID should not be null")
    private String mchID;//商户号

    @NotNull(message = "mchKey should not be null")
    private String mchKey;

    public String getMchKey() {
        return mchKey;
    }

    public void setMchKey(String mchKey) {
        this.mchKey = mchKey;
    }

    public String getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(String transactionID) {
        this.transactionID = transactionID;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getAppID() {
        return appID;
    }

    public void setAppID(String appID) {
        this.appID = appID;
    }

    public String getMchID() {
        return mchID;
    }

    public void setMchID(String mchID) {
        this.mchID = mchID;
    }
}
