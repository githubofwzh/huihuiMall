package com.kshl.huihuimall.console.controller.order.request;

import com.kshl.base.reqeust.BasePageRequest;
import javax.validation.constraints.NotNull;
import java.util.Date;


/**
 * 派单请求
 */
public class SendOrderRequest extends BasePageRequest {

    private Integer id;
    @NotNull(message = "orderNumber should not be null")
    private String orderNumber;
    @NotNull(message = "warehouseId should not be null")
    private Integer warehouseId;
    @NotNull(message = "warehouseName should not be null")
    private String warehouseName;

    private Date sendtime;

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

    public Integer getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }
}
