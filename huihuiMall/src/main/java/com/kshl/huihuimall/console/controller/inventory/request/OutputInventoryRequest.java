package com.kshl.huihuimall.console.controller.inventory.request;

import com.kshl.base.reqeust.BasePageRequest;

import java.util.Date;

public class OutputInventoryRequest extends BasePageRequest{
    //订单号
    private String orderNumber;
    //订单开始时间
    private Date startTime;
    //门店名称
    private String storename;

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getStorename() {
        return storename;
    }

    public void setStorename(String storename) {
        this.storename = storename;
    }
}
