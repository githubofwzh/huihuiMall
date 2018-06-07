package com.kshl.huihuimall.console.controller.device.request;

import com.kshl.base.reqeust.BasePageRequest;

import javax.validation.constraints.NotNull;


/**
 * 设备管理请求
 */
public class DeviceRequest extends BasePageRequest {

    //id
    private Integer id;
    //终端号
    @NotNull(message = "deviceCode should not be null")
    private String deviceCode;
    //门店名称
    private String name;
   //绑定状态
    private Integer bindingStatus;
   //门店id
    private Integer storeId;


    public String getDeviceCode() {
        return deviceCode;
    }

    public void setDeviceCode(String deviceCode) {
        this.deviceCode = deviceCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getBindingStatus() {
        return bindingStatus;
    }

    public void setBindingStatus(Integer bindingStatus) {
        this.bindingStatus = bindingStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }
}
