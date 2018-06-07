package com.kshl.huihuimall.console.base.pojo;

import java.util.Date;
import java.util.List;

public class InventoryInPojo {
    private String code;
    private Integer status;
    private String storehouseName;
    private String createUser;
    private Date createTime;
    //打印从系统获取的
    private String czName;
    private String czTime;
    List<OrderDetailProduct> OrderDetailProduct;

    public String getCzName() {
        return czName;
    }

    public void setCzName(String czName) {
        this.czName = czName;
    }

    public String getCzTime() {
        return czTime;
    }

    public void setCzTime(String czTime) {
        this.czTime = czTime;
    }

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

    public String getStorehouseName() {
        return storehouseName;
    }

    public void setStorehouseName(String storehouseName) {
        this.storehouseName = storehouseName;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public List<com.kshl.huihuimall.console.base.pojo.OrderDetailProduct> getOrderDetailProduct() {
        return OrderDetailProduct;
    }

    public void setOrderDetailProduct(List<com.kshl.huihuimall.console.base.pojo.OrderDetailProduct> orderDetailProduct) {
        OrderDetailProduct = orderDetailProduct;
    }
}
