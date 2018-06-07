package com.kshl.huihuimall.console.base.vo;

import java.util.Date;

public class InInventoryExcel {

    //单号
    private String code;

    //日期
    private Date time;

    //入库仓库名称
    private String inhouseName;

    //出库仓库名称
    private String outhouseName;

    //类型
    private Integer status;

    //操作人
    private String user;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getInhouseName() {
        return inhouseName;
    }

    public void setInhouseName(String inhouseName) {
        this.inhouseName = inhouseName;
    }

    public String getOuthouseName() {
        return outhouseName;
    }

    public void setOuthouseName(String outhouseName) {
        this.outhouseName = outhouseName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}