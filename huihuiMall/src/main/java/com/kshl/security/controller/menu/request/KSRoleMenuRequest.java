package com.kshl.security.controller.menu.request;

import com.kshl.base.reqeust.BaseRequest;

import javax.validation.constraints.NotNull;

/**
 * Created by xufengfeng on 2017/6/5.
 */
public class KSRoleMenuRequest extends BaseRequest {

    @NotNull(message = "roleId should not be null")
    private Integer roleId;


    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
