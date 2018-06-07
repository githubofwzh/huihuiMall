package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * Created by 40513 on 2018/1/17.
 */
public class AliRefundRequest extends BaseRequest {

    @NotNull(message = "tradeNo should not be null")
    private String tradeNo;//商户订单号，商户网站订单系统中唯一订单号

    @NotNull(message = "outTradeNo should not be null")
    private String outTradeNo;//支付宝交易号

    @NotNull(message = "refundAmount should not be null")
    private BigDecimal refundAmount;

    @NotNull(message = "refundReason should not be null")
    private String refundReason;

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public BigDecimal getRefundAmount() {
        return refundAmount;
    }

    public void setRefundAmount(BigDecimal refundAmount) {
        this.refundAmount = refundAmount;
    }

    public String getRefundReason() {
        return refundReason;
    }

    public void setRefundReason(String refundReason) {
        this.refundReason = refundReason;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }
}
