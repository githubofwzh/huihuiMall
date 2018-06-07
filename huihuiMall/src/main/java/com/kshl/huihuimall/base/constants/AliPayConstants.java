package com.kshl.huihuimall.base.constants;

/**
 * 常量
 */
public class AliPayConstants {

    public static final String SERVER_URL = "https://openapi.alipaydev.com/gateway.do";//支付宝测试网关，

    public static final String APPID = "2016080600181048";// 合作身份者ID，

    public static final String APP_PRIVATE_KEY = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCLHB8eKjU7l5vr0llejCTe82c8Fm+nIDg8hVxShwvxoG0/l83ZcmQ6FmI1oEUV9amghuihHkDJsW0+aqlfVK8xNX9iIXNiKQrFzKia4J50BASKDZa/Rls/0f93uOaxr06xKRhYOEI8w0ux8/I+O8puSby3M3hv6NJGactqG1kqtnL/ciQNRick9WdrPFpYBzOiyTSkqipurwLHcmGOTl5uxwEe37lZ+5V4DNWoavFcwvjnKwa3K87dBtXbWaQYYD1FYqPZCQxmvFsHTb2M+GZ+KrSm5AQWmKB4QC3I2KrXcvDCjXOJAAER33B4Ag0LVN67iVcPuf1PmVTK1uhoInetAgMBAAECggEAav4YGPVRuCHldL12qzeS7D+9eQOwoJQxbKsN1RO1ZgSDwlOZqdNHrz2kD6bTPA6Uhrj8l19TaU2jvkv/NSlHDcwdy3X67tauSHAehfCZLpYgf6Xv+fG9IRr9KDH4jVVOawg2hzPODjoPMDF2cdM+4RCpqyZVTY1+nVWldFjQff5q3Oq3y2DSQhZl8rv8l84hWFTHq7loawvAxXPjk9gbddjMGoqmnxt+8KTjq6rWAgnHzqqlavsN4tAD0beFDDb+RMNUt3prhyTjar8IjXNmXcKdI6zNuNfpUL3XDElE7TpWIOZgue9/W0Gyk37fMxB1MlU7yQbLsjhMU6aSSopTqQKBgQDiXoQpjTLkKIf05D+Z5amKh04cQrY5d8jbzMKXbpFYsc/kiu1i1xwO0A6DnSxaW+0kgycoHg9i5fGmGoZwb3bCk+F4jdIYbrWnfu9bRI2g06DjSmQmFUM0SKgDdiguBEIDczPCRHneJ5ntHdCIL5JHyp3Cdxl9tq1AKb22HVUL8wKBgQCdUZn7fC6JVRlvMJuraVzU/ElVYtn3v1OMuJQDfrkTHadGFbxQd/5syMhkgemITQclK9JHsymkdkP9OyfHkzHuL4VTgNnLE67YltSpYhCn0UYvObsHFYIlNkWtWrjut/42uOUD0PXxnel/OOj4blhUmSrPd8ZKd+ZuIztlqc113wKBgBz55kb/WQVVntmdIfsMJ+Cgo0IA1ByVFbP1CO+jap2E3Uyu7+YYDPJkdYcpZlUGsVtcInYDKwsIzh7qBE1+JyCPF2x8Eumnuj7/g5oWM17j2BNgIWOykxCtQDx5Mnl5eA3DAFwcsdDbFtwAVgIovLvN1tXesvehm5m7/hnCtXE7AoGAKjxtRdpqOA6z3GlFcfjApqHxIk5+zIf+a2pmuqV8FMjCTwuo2kXM9fHV8z35r9FWWMFyHDPauz/RMxx9qpQ3NIZnmiqezmnDaHzeLXeZlySVXjp2nwlEPq9ad5dCzTxysMhlG+gvD6ZguPpTeddOObBBkR/MCdQ09l7ZJIs5ESsCgYBfYnZdvkw3fynj20aNzFCe3PPBg1u2I9tXnKxU8Uo2rTeGIDBcF11Ekp6WBpvFsUAqDwpgIrZDqPVfTAcWy1+JtOmkHgIYrPg0NHfVPrFE2/zpIQeMAY+gNuzw7PXYDyW8dHjLAHGfZwTVjAxkIXj8d8onGmcOmFpCWP+nr+xjQg==";
    public static final String CHARSET = "UTF-8";//编码格式

    public static final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvixWzJCdsbWtjWhEXb5krACccpY1afnXTvsPVTOksVSg9QKuhA05H3N14UmS2XHstgwGmhICZ+u5CPqu0l5ADoKxZ0YlkDgZsEi9RN7K2d2Srp8fi3nPlNE0XpbUMYXv+ny0GA01UQYEc/BpNuE1PE63btURWoii/T69Ea9H8zVuSJoNO3StnOYc/nLcXgW2/fWrkfMYZM1W9D28ZKGjTMaWp+2RNOGjeTCrXWWl2HxgMEzv8xOMAh/lqVDOrQbLJ/HdcmvEL66o67hyoswtYq5rdbUjZygJJSW8wuG1ndf6WlkbEe+aC5INmIn4ZrhRbr5w7SaTteZEp+8zskUWeQIDAQAB";
    public static final String SIGN_TYPE = "RSA2";//生成签名字符串所使用的签名算法类型

    public static  final String FORMAT = "json";
    public static  final String ENCRYPT_KEY = "/ADDZTlHrCg1QuweVynPGg==";
    public static  final String ENCRYPT_TYPE = "AES";
    public static  final String RETURN_URL = "http://ttoethan.free.ngrok.cc/pay.do?reqCode=aliPayReturnUrl";//同步回调地址
    public static  final String NOTIFY_URL = "http://ttoethan.free.ngrok.cc/pay.do?reqCode=aliPayNotifyUrl";//异步回调地址

    public static class TRADE_STATUS {
        public static final String WAIT_BUYER_PAY = "WAIT_BUYER_PAY";//交易创建，等待买家付款
        public static final String TRADE_CLOSED = "TRADE_CLOSED";//未付款交易超时关闭，或支付完成后全额退款
        public static final String TRADE_SUCCESS = "TRADE_SUCCESS";//交易支付成功
        public static final String TRADE_FINISHED = "TRADE_FINISHED";//交易结束，不可退款
    }

}

