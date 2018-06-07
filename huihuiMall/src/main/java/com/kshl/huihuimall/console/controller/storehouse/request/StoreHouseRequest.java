package com.kshl.huihuimall.console.controller.storehouse.request;

import javax.validation.constraints.NotNull;

import com.kshl.base.reqeust.BasePageRequest;

public class StoreHouseRequest extends BasePageRequest{

    //仓库名称
    private String storeHouseName;
    
    //地区
    private Integer areaId;
    
    public String getStoreHouseName() {
        return storeHouseName;
    }

    public void setStoreHouseName(String storeHouseName) {
        this.storeHouseName = storeHouseName;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }
}
