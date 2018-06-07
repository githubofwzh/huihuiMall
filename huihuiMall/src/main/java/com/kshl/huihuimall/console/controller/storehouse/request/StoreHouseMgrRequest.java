package com.kshl.huihuimall.console.controller.storehouse.request;

import com.kshl.base.reqeust.BasePageRequest;

import javax.validation.constraints.NotNull;

public class StoreHouseMgrRequest extends BasePageRequest{

    //仓库名称
    private Integer id;

    @NotNull(message = "storeHouseName should not be null")
    private String storeHouseName;
    
    //地区
    @NotNull(message = "areaId should not be null")
    private Integer areaId;

    @NotNull(message = "areaName should not be null")
    private String areaName;

    @NotNull(message = "space should not be null")
    private Double space;

    @NotNull(message = "address should not be null")
    private String address;
    //库房管理员id
    private Integer managerId;
    
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Double getSpace() {
        return space;
    }

    public void setSpace(Double space) {
        this.space = space;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }
}
