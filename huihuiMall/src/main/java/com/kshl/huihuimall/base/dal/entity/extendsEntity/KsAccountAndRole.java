package com.kshl.huihuimall.base.dal.entity.extendsEntity;

import com.kshl.huihuimall.base.dal.entity.KsAccount;

/**
 * Created by Administrator on 2017/5/21.
 */
public class KsAccountAndRole extends KsAccount{
    private Integer roleId;
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }


}
