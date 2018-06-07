package com.kshl.huihuimall.console;

import com.kshl.base.common.enums.BaseErrorCode;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public enum CSErrorCode implements BaseErrorCode{


    // 公共code
    SUCCESS(0L, "成功"),
    INVALID_PARAM(1L, "参数错误"),
    REQUEST_FAILED(2L, "网络请求失败"),

    // 登录相关
    LOGIN_FAILED_WRONG_USERNAME(10001L, "用户名或者密码错误"),
    LOGIN_FAILED_WRONG_USERNAME_EXITS(10002L, "用户名已存在"),
    LOGIN_FAILED_WRONG_ENTCODE(10003L, "企业代码错误"),
    LOGIN_FAILED_WRONG_ENABLE(10005L, "该账户已被禁用"),
    LOGIN_FAILED_WRONG_PASSWORD(10006L, "密码错误"),

    //个人中心登录相关
    PERSONAL_CENTER_LOGIN_WRONG_CODE(12003L,"手机验证码错误"),
    PERSONAL_CENTER_LOGIN_FAILED(12002L,"登录失败"),

    //注册相关
    REGIST_FAILED_WRONG_CHECKCODE(10004L, "验证码错误"),
    REGIST_FAILED_ALREADY_EXIST(10007L, "账号已存在"),

    //菜单相关的
    MENU_GET_SYSTEM_MENU_FAILED(20001L, "获取系统菜单错误"),
    MENU_GET_ROLE_MENU_FAILED(20002L, "获取角色菜单错误"),
    MENU_GET_ACCOUNt_MENU_FAILED(20003L, "获取用户菜单错误"),

    //文件上传相关
    FILE_UPLOAD_FAILED(30001L, "文件上传失败"),

    //个人中心相关
    UER_CENTER_HAD_BIND(4000L,"用户已绑定");

    private Long code;
    private String message;

    CSErrorCode(Long code, String message) {
        this.code = code;
        this.message = message;
    }


    @Override
    public Long getCode() {
        return code;
    }


    @Override
    public String getMessage() {
        return message;
    }

}
