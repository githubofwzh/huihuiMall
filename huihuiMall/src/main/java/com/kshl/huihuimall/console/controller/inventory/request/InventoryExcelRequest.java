package com.kshl.huihuimall.console.controller.inventory.request;

public class InventoryExcelRequest {
    private String code;
    private String create_time;
    private String status;
    private String create_user;
    private String storehouse_name;

    private String order_number;
    private String start_time;
    private String storename;
    private String ordertotal;
    private String total;

    private String ck_name;
    private String rk_name;

    public String getCk_name() {
        return ck_name;
    }

    public void setCk_name(String ck_name) {
        this.ck_name = ck_name;
    }

    public String getRk_name() {
        return rk_name;
    }

    public void setRk_name(String rk_name) {
        this.rk_name = rk_name;
    }

    public String getOrder_number() {
        return order_number;
    }

    public void setOrder_number(String order_number) {
        this.order_number = order_number;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getStorename() {
        return storename;
    }

    public void setStorename(String storename) {
        this.storename = storename;
    }

    public String getOrdertotal() {
        return ordertotal;
    }

    public void setOrdertotal(String ordertotal) {
        this.ordertotal = ordertotal;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreate_user() {
        return create_user;
    }

    public void setCreate_user(String create_user) {
        this.create_user = create_user;
    }

    public String getStorehouse_name() {
        return storehouse_name;
    }

    public void setStorehouse_name(String storehouse_name) {
        this.storehouse_name = storehouse_name;
    }
}
