package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;

/**
 * Created by 40513 on 2018/1/17.
 */
public class WeChatRefundRequest extends BaseRequest {

    @NotNull(message = "appID should not be null")
    private String appID;

    @NotNull(message = "mchID should not be null")
    private String mchID;

    @NotNull(message = "mchKey should not be null")
    private String mchKey;

    @NotNull(message = "outTradeNo should not be null")
    private String outTradeNo;

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

    public String getMchKey() {
        return mchKey;
    }

    public void setMchKey(String mchKey) {
        this.mchKey = mchKey;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }
}
