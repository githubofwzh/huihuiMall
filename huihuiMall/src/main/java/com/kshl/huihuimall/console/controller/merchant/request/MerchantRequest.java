package com.kshl.huihuimall.console.controller.merchant.request;

import com.kshl.base.reqeust.BasePageRequest;

public class MerchantRequest extends BasePageRequest {

    //商家ID
    private Integer id;
    //商家名字

    public Integer getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(Integer auditStatus) {
        this.auditStatus = auditStatus;
    }

    public Integer getEnableStatus() {
        return enableStatus;
    }

    public void setEnableStatus(Integer enableStatus) {
        this.enableStatus = enableStatus;
    }

    private String name;
    //商品id
    private Integer productid;
    private Integer auditStatus;
    private Integer enableStatus;
    private String entCode;

    public String getEntCode() {
        return entCode;
    }

    public void setEntCode(String entCode) {
        this.entCode = entCode;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}