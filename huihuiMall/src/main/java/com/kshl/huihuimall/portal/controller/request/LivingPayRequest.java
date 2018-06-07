package com.kshl.huihuimall.portal.controller.request;

import com.kshl.base.reqeust.BasePageRequest;

public class LivingPayRequest extends BasePageRequest {
    private String endTime;
    private String StartTime;
    private Integer productType;
    private String itemId;
    private String itemNum;
    private String rechargeAccount;
    private String outerTid;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getItemNum() {
        return itemNum;
    }

    public void setItemNum(String itemNum) {
        this.itemNum = itemNum;
    }

    public String getRechargeAccount() {
        return rechargeAccount;
    }

    public void setRechargeAccount(String rechargeAccount) {
        this.rechargeAccount = rechargeAccount;
    }

    public String getOuterTid() {
        return outerTid;
    }

    public void setOuterTid(String outerTid) {
        this.outerTid = outerTid;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStartTime() {
        return StartTime;
    }

    public void setStartTime(String startTime) {
        StartTime = startTime;
    }

    public Integer getProductType() {
        return productType;
    }

    public void setProductType(Integer productType) {
        this.productType = productType;
    }
}
