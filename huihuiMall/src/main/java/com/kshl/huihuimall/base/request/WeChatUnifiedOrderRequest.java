package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;

/**
 * Created by 40513 on 2018/1/17.
 */
public class WeChatUnifiedOrderRequest extends BaseRequest {

    @NotNull(message = "appID should not be null")
    private String appID;

    @NotNull(message = "mchID should not be null")
    private String mchID;

    @NotNull(message = "mchKey should not be null")
    private String mchKey;

    @NotNull(message = "totalFee should not be null")
    private Integer totalFee;//订单金额

    @NotNull(message = "outTradeNo should not be null")
    private String outTradeNo;

    private String productName;

    @NotNull(message = "spBillCreateIp should not be null")
    private String spBillCreateIp;

    @NotNull(message = "tradeType should not be null")
    private String tradeType;

    private String productId;

    @NotNull(message = "userCode should not be null")
    private String userCode;

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    @NotNull(message = "notifyUrl should not be null")
    private String notifyUrl;

    public String getNotifyUrl() {
        return notifyUrl;
    }

    public void setNotifyUrl(String notifyUrl) {
        this.notifyUrl = notifyUrl;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getTradeType() {
        return tradeType;
    }

    public void setTradeType(String tradeType) {
        this.tradeType = tradeType;
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

    public String getMchKey() {
        return mchKey;
    }

    public void setMchKey(String mchKey) {
        this.mchKey = mchKey;
    }

    public Integer getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(Integer totalFee) {
        this.totalFee = totalFee;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSpBillCreateIp() {
        return spBillCreateIp;
    }

    public void setSpBillCreateIp(String spBillCreateIp) {
        this.spBillCreateIp = spBillCreateIp;
    }
}
