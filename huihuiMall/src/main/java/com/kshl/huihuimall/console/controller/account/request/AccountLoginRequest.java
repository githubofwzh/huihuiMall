package com.kshl.huihuimall.console.controller.account.request;

import com.kshl.base.reqeust.BaseRequest;
import org.hibernate.validator.constraints.NotBlank;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public class AccountLoginRequest extends BaseRequest {

    @NotBlank(message = "userName should not be blank")
    private String username;

    @NotBlank(message = "password should not be blank")
    private String password;

    private String entCode;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEntCode() {
        return entCode;
    }

    public void setEntCode(String entCode) {
        this.entCode = entCode;
    }
}
