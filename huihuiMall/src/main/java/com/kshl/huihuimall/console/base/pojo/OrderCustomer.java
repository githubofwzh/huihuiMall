package com.kshl.huihuimall.console.base.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class OrderCustomer implements Serializable {
    private Integer id;

    private String orderNumber;

    private Date startTime;

    private Date endTime;

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

    private Integer ifdelete;

    private BigDecimal ordertotal;

    private Date receiveTime;

    //下单人
    private String phoneNumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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

    public Integer getIfdelete() {
        return ifdelete;
    }

    public void setIfdelete(Integer ifdelete) {
        this.ifdelete = ifdelete;
    }

    public BigDecimal getOrdertotal() {
        return ordertotal;
    }

    public void setOrdertotal(BigDecimal ordertotal) {
        this.ordertotal = ordertotal;
    }

    public Date getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(Date receiveTime) {
        this.receiveTime = receiveTime;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "OrderCustomer{" +
                "id=" + id +
                ", orderNumber='" + orderNumber + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", type='" + type + '\'' +
                ", orderstatus='" + orderstatus + '\'' +
                ", merchantname='" + merchantname + '\'' +
                ", storename='" + storename + '\'' +
                ", storeaddress='" + storeaddress + '\'' +
                ", parentId='" + parentId + '\'' +
                ", storeId=" + storeId +
                ", recomStoreId=" + recomStoreId +
                ", storehouseId=" + storehouseId +
                ", shopkeeperId=" + shopkeeperId +
                ", userId=" + userId +
                ", entCode='" + entCode + '\'' +
                ", ifdelete=" + ifdelete +
                ", ordertotal=" + ordertotal +
                ", receiveTime=" + receiveTime +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}