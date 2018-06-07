package com.kshl.huihuimall.base.request;

import com.kshl.base.reqeust.BasePageRequest;

public class RoleRequest extends BasePageRequest{

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
