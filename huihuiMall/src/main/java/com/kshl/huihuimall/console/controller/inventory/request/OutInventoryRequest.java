package com.kshl.huihuimall.console.controller.inventory.request;

import com.kshl.base.reqeust.BasePageRequest;

import java.util.Date;

public class OutInventoryRequest extends BasePageRequest{
    //出库单号
    private String code;
    //仓库名称
    private String storeHouse;
    //开始日期
    private String startTime;
    //结束日期
    private String endTime;
    //已出库状态
    private String orderStatus;
    //出库类型
    private String status;

    private Integer exchangeStatus;

    private Integer retType;

    public Integer getRetType() {
        return retType;
    }

    public void setRetType(Integer retType) {
        this.retType = retType;
    }

    public Integer getExchangeStatus() {
        return exchangeStatus;
    }

    public void setExchangeStatus(Integer exchangeStatus) {
        this.exchangeStatus = exchangeStatus;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getStoreHouse() {
        return storeHouse;
    }

    public void setStoreHouse(String storeHouse) {
        this.storeHouse = storeHouse;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }


}
