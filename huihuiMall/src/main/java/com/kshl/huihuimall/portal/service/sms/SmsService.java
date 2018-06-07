package com.kshl.huihuimall.portal.service.sms;


public interface SmsService {
    /*
      发送文本
     */
    String smsContent(String content, String mobile);
    /*
      发送验证码
     */
    String smsCode(String mobile,String content);
 }