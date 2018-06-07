package com.kshl.huihuimall.console.controller.inventory.request;

import com.kshl.base.reqeust.BasePageRequest;
import com.kshl.huihuimall.console.base.dto.Stock;

import java.util.List;

public class TransferRequest extends BasePageRequest{

    //调拨单号
    private String code;
    //出入库类型
    private Integer type;
    //商品list
    private List<Stock> products;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public List<Stock> getProducts() {
        return products;
    }

    public void setProducts(List<Stock> products) {
        this.products = products;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }


}
