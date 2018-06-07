package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * Created by 40513 on 2018/1/17.
 */
public class AliPayRequest extends BaseRequest {

    @NotNull(message = "totalAmount should not be null")
    private BigDecimal totalAmount;//付款金额

    @NotNull(message = "outTradeNo should not be null")
    private String outTradeNo;//系统内部订单号

    @NotNull(message = "subject should not be null")
    private String subject;//订单名称

    private String body;//商品描述

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
