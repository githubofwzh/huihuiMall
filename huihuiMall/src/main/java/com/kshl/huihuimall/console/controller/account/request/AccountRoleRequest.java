package com.kshl.huihuimall.console.controller.account.request;

import com.kshl.base.reqeust.BasePageRequest;
import com.kshl.base.reqeust.BaseRequest;
import org.hibernate.validator.constraints.NotBlank;

public class AccountRoleRequest extends BasePageRequest {
    @NotBlank(message = "roleId should not be blank")
    private Integer roleId;

    @NotBlank(message = "accountId should not be blank")
    private Integer accountId;

    @NotBlank(message = "roleName should not be blank")
    private String roleName;

    @NotBlank(message = "remark should not be blank")
    private String remark;




    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
