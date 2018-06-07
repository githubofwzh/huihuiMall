package com.kshl.huihuimall.portal;

import com.kshl.base.common.enums.BaseErrorCode;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public enum PTErrorCode implements BaseErrorCode{


    // 公共code
    SUCCESS(0L, "成功"),
    INVALID_PARAM(1L, "参数错误"),
    REQUEST_FAILED(2L, "网络请求失败"),

    //文件上传相关
    FILE_UPLOAD_FAILED(30001L, "文件上传失败"),

    // 微信支付相关
    WECHAT_PAY_FAILED_NOTENOUGH(40001L, "用户帐号余额不足，请用户充值或更换支付卡后再支付"),
    WECHAT_PAY_FAILED_ORDERPAID(40002L, "商户订单已支付，无需重复操作"),
    WECHAT_PAY_FAILED_ORDERCLOSED(40003L, "当前订单已关闭，请重新下单"),
    WECHAT_PAY_FAILED_SYSTEMERROR(40004L, "系统超时"),
    WECHAT_PAY_FAILED_LOGICERROR(40005L, "业务逻辑错误"),
    WECHAT_PAY_FAILED_AUTHCODEEXPIRE(40006L, "用户的条码已经过期，请刷新条码后重试"),
    WECHAT_PAY_FAILED_NOTSUPORTCARD(40007L, "该卡不支持当前支付，提示用户换卡支付或绑新卡支付"),
    WECHAT_PAY_FAILED_ORDERREVERSED(40008L, "订单已撤销，请重新支付"),
    WECHAT_PAY_FAILED_AUTH_CODE_ERROR(40009L, "每个二维码仅限使用一次，请刷新再试"),
    WECHAT_PAY_FAILED_AUTH_CODE_INVALID(40010L, "请扫描微信支付被扫条码/二维码"),
    WECHAT_ORDERQUERY_FAILED_ORDERNOTEXIST(40011L, "查询系统中不存在此交易订单号"),
    WECHAT_ORDERQUERY_FAILED_SYSTEMERROR(40012L, "后台系统返回错误"),
    WECHAT_PAY_FAILED_NOAUTH(40013L, "商户未开通此接口权限"),
    WECHAT_PAY_FAILED_OUT_TRADE_NO_USED(40014L, "请核实商户订单号是否重复提交"),
    WECHAT_CLOSEORDER_FAILED_ORDERPAID(40015L, "订单已支付，不能发起关单"),
    WECHAT_CLOSEORDER_FAILED_ORDERCLOSED(40016L, "订单已关闭，无法重复关闭"),
    WECHAT_CLOSEORDER_FAILED_SYSTEMERROR(40017L, "系统错误");



    private Long code;
    private String message;

    PTErrorCode(Long code, String message) {
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
