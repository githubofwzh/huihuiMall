package com.kshl.base.response;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public class BaseResponse <T> {

    protected Long retCode;

    protected String retMsg;

    protected T data;


    public Long getRetCode() {
        return retCode;
    }

    public void setRetCode(Long retCode) {
        this.retCode = retCode;
    }

    public String getRetMsg() {
        return retMsg;
    }

    public void setRetMsg(String retMsg) {
        this.retMsg = retMsg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
