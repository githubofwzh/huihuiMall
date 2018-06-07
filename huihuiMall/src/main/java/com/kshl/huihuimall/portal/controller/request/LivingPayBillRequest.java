package com.kshl.huihuimall.portal.controller.request;

import com.kshl.base.reqeust.BasePageRequest;

public class LivingPayBillRequest extends BasePageRequest {
    //开始时间
    private String endTime;
    //结束时间
    private String StartTime;
    //支付类型
    private Integer PayType;
    //支付状态
    private Integer PayState;
    //内部订单号
    private String OuterTid;
    private Integer rechargestate;

    public Integer getRechargestate() {
        return rechargestate;
    }

    public void setRechargestate(Integer rechargestate) {
        this.rechargestate = rechargestate;
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

    public Integer getPayType() {
        return PayType;
    }

    public void setPayType(Integer payType) {
        PayType = payType;
    }

    public Integer getPayState() {
        return PayState;
    }

    public void setPayState(Integer payState) {
        PayState = payState;
    }

    public String getOuterTid() {
        return OuterTid;
    }

    public void setOuterTid(String outerTid) {
        OuterTid = outerTid;
    }
}
