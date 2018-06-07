package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;

/**
 * Created by 40513 on 2018/1/17.
 */
public class PayInfoRequest extends BaseRequest {

    @NotNull(message = "paytype should not be null")
    private Integer paytype;

    @NotNull(message = "orderNumber should not be null")
    private String orderNumber;

    @NotNull(message = "transactionId should not be null")
    private String transactionId;

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public Integer getPaytype() {
        return paytype;
    }

    public void setPaytype(Integer paytype) {
        this.paytype = paytype;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }
}

