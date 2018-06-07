package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * Created by 40513 on 2018/1/17.
 */
public class WeChatPayRequest extends BaseRequest {

    @NotNull(message = "price should not be null")
    private BigDecimal price;

    @NotNull(message = "orderNumber should not be null")
    private String orderNumber;

    @NotNull(message = "authCode should not be null")
    private String authCode;

    private String productName;

    @NotNull(message = "appID should not be null")
    private String appID;

    @NotNull(message = "mchID should not be null")
    private String mchID;

    @NotNull(message = "mchKey should not be null")
    private String mchKey;

    @NotNull(message = "billCreateIP should not be null")
    private String billCreateIP;

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public String getBillCreateIP() {
        return billCreateIP;
    }

    public void setBillCreateIP(String billCreateIP) {
        this.billCreateIP = billCreateIP;
    }
}
