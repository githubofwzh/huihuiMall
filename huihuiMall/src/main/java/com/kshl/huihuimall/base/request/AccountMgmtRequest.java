package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BasePageRequest;

public class AccountMgmtRequest extends BasePageRequest {

    private String account;
    private String name;
    private String phone;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

}
