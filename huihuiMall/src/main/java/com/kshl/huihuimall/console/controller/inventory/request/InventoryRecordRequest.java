package com.kshl.huihuimall.console.controller.inventory.request;

import com.kshl.base.reqeust.BasePageRequest;

import  java.util.Date;

public class InventoryRecordRequest extends BasePageRequest {

    private String code;

    private Integer status;
    //开始时间
    private String startTime;
    //结束时间
    private String endTime;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}