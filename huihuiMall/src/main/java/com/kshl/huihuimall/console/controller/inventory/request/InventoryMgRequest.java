package com.kshl.huihuimall.console.controller.inventory.request;

import com.kshl.base.reqeust.BasePageRequest;

public class InventoryMgRequest extends BasePageRequest{

    //库房id
    private Integer storehouseId;
    //商品名称
    private String productName;
    //商品编号
    private String productCode;

    public Integer getStorehouseId() {
        return storehouseId;
    }

    public void setStorehouseId(Integer storehouseId) {
        this.storehouseId = storehouseId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }
}
