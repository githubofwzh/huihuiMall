package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * Created by 40513 on 2018/1/17.
 */
public class WeChatPublicPayRequest extends BaseRequest {

    @NotNull(message = "price should not be null")
    private BigDecimal money;

    @NotNull(message = "orderNumber should not be null")
    private String orderNumber;

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }
}

