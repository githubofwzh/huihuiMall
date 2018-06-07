package com.kshl.huihuimall.console.controller.merchant.request;

import com.kshl.base.reqeust.BasePageRequest;

public class MerchantMgRequest extends BasePageRequest {

    //省
    private Integer provinceId;
    //市
    private Integer town;
    //区
    private Integer district;
    //街道
    private Integer street;
    //门店名称
    private String  name;

    private Integer accountId;

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public Integer getTown() {
        return town;
    }

    public void setTown(Integer town) {
        this.town = town;
    }

    public Integer getDistrict() {
        return district;
    }

    public void setDistrict(Integer district) {
        this.district = district;
    }

    public Integer getStreet() {
        return street;
    }

    public void setStreet(Integer street) {
        this.street = street;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}