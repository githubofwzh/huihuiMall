package com.kshl.huihuimall.portal.service.sms.impl;

import com.kshl.huihuimall.portal.service.sms.SmsService;
import com.kshl.huihuimall.portal.smsinterface.SmsResponse;
import com.kshl.huihuimall.portal.smsinterface.smsinterface;
import org.springframework.stereotype.Service;

import java.util.Random;
@Service
public class SmsServiceImpl implements SmsService{
   private String appId = "EUCP-EMY-SMS1-5ZLZX";//
   private String secretKey = "9EC3653D45A62950";//密钥
   private String host = "bjmtn.b2m.cn";//接口地址
   private String algorithm = "AES/ECB/PKCS5Padding";//加密算法
   private String encode = "UTF-8";//编码
   private boolean isGizp = false;//是否压缩

    @Override
    public String smsContent(String content, String mobile) {
        content="【惠惠网店】"+content;
        SmsResponse s= smsinterface.setSingleSms(appId,secretKey,host,algorithm,  content, null, null,mobile ,isGizp,encode);
        return content;
    }

    @Override
    public String smsCode(String mobile,String content) {
        smsinterface.setSingleSms(appId,secretKey,host,algorithm,  content, null, null,mobile ,isGizp,encode);
        return content;
    }


}
