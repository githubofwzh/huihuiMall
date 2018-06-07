package com.kshl.huihuimall.portal.controller.request;

import com.kshl.base.reqeust.BasePageRequest;


/**
 * 终端社备请求
 */
public class DeviceRequest extends BasePageRequest {
    //id
    private Integer id;
    //设备号
    private String deviceCode;
   //门店id
    private Integer storeId;
   //绑定状态 0未绑定 1已绑定
    private Integer bindingStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeviceCode() {
        return deviceCode;
    }

    public void setDeviceCode(String deviceCode) {
        this.deviceCode = deviceCode;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getBindingStatus() {
        return bindingStatus;
    }

    public void setBindingStatus(Integer bindingStatus) {
        this.bindingStatus = bindingStatus;
    }
}
