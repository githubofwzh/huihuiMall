package com.kshl.huihuimall.portal.controller.request;

import java.math.BigDecimal;

public class OderSplitRequest {
    //订单详情
    private Integer detialId;
    private String productname;
    private Integer number;
    private BigDecimal total;
    private String orderNumber;
    private String code;

    //订单
    private Integer storeorderId;
    private String type;
    private String orderstatus;
    private String merchantname;
    private String storename;
    private String storeaddress;
    private String parentId;
    private Integer storeId;
    private Integer recomStoreId;
    private Integer storehouseId;
    private Integer shopkeeperId;
    private Integer userId;
    private String entCode;

    public Integer getDetialId() {
        return detialId;
    }

    public void setDetialId(Integer detialId) {
        this.detialId = detialId;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getStoreorderId() {
        return storeorderId;
    }

    public void setStoreorderId(Integer storeorderId) {
        this.storeorderId = storeorderId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }

    public String getMerchantname() {
        return merchantname;
    }

    public void setMerchantname(String merchantname) {
        this.merchantname = merchantname;
    }

    public String getStorename() {
        return storename;
    }

    public void setStorename(String storename) {
        this.storename = storename;
    }

    public String getStoreaddress() {
        return storeaddress;
    }

    public void setStoreaddress(String storeaddress) {
        this.storeaddress = storeaddress;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getRecomStoreId() {
        return recomStoreId;
    }

    public void setRecomStoreId(Integer recomStoreId) {
        this.recomStoreId = recomStoreId;
    }

    public Integer getStorehouseId() {
        return storehouseId;
    }

    public void setStorehouseId(Integer storehouseId) {
        this.storehouseId = storehouseId;
    }

    public Integer getShopkeeperId() {
        return shopkeeperId;
    }

    public void setShopkeeperId(Integer shopkeeperId) {
        this.shopkeeperId = shopkeeperId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getEntCode() {
        return entCode;
    }

    public void setEntCode(String entCode) {
        this.entCode = entCode;
    }


}
