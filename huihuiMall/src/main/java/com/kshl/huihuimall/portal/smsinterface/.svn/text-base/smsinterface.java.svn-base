package com.kshl.huihuimall.portal.smsinterface;

import java.util.HashMap;
import java.util.Map;

public class smsinterface {

    /**
     * 发送单条短信
     * @param isGzip 是否压缩
     */
    public static SmsResponse setSingleSms(String appId, String secretKey, String host, String algorithm, String content, String customSmsId, String extendCode, String mobile, boolean isGzip, String encode) {
        SmsResponse respons=new SmsResponse();
        SmsSingleRequest pamars = new SmsSingleRequest();
        pamars.setContent(content);
        pamars.setCustomSmsId(customSmsId);
        pamars.setExtendedCode(extendCode);
        pamars.setMobile(mobile);
        ResultModel result = request(appId,secretKey,algorithm,pamars, "http://" + host + "/inter/sendSingleSMS",isGzip,encode);
        if("SUCCESS".equals(result.getCode())){
            respons = JsonHelper.fromJson(SmsResponse.class, result.getResult());
            if (respons != null) {
               System.out.println("data : " + respons.getMobile() + "," + respons.getSmsId() + "," + respons.getContent());
            }
        }
        return respons;
    }



    /**
     * 公共请求方法
     */
    public static ResultModel request(String appId,String secretKey,String algorithm,Object content, String url,final boolean isGzip,String encode) {
        Map<String, String> headers = new HashMap<String, String>();
        EmayHttpRequestBytes request = null;
        try {
            headers.put("appId", appId);
            headers.put("encode", encode);
            String requestJson = JsonHelper.toJsonString(content);
            System.out.println("result json: " + requestJson);
            byte[] bytes = requestJson.getBytes(encode);
            System.out.println("request data size : " + bytes.length);
            if (isGzip) {
                headers.put("gzip", "on");
                bytes = GZIPUtils.compress(bytes);
                System.out.println("request data size [com]: " + bytes.length);
            }
            byte[] parambytes = AES.encrypt(bytes, secretKey.getBytes(), algorithm);
            System.out.println("request data size [en] : " + parambytes.length);
            request = new EmayHttpRequestBytes(url, encode, "POST", headers, null, parambytes);
        } catch (Exception e) {
            System.out.println("加密异常");
            e.printStackTrace();
        }
        EmayHttpClient client = new EmayHttpClient();
        String code = null;
        String result = null;
        try {
            EmayHttpResponseBytes res = client.service(request, new EmayHttpResponseBytesPraser());
            if(res == null){
                System.out.println("请求接口异常");
                return new ResultModel(code, result);
            }
            if (res.getResultCode().equals(EmayHttpResultCode.SUCCESS)) {
                if (res.getHttpCode() == 200) {
                    code = res.getHeaders().get("result");
                    if (code.equals("SUCCESS")) {
                        byte[] data = res.getResultBytes();
                        System.out.println("response data size [en and com] : " + data.length);
                        data = AES.decrypt(data, secretKey.getBytes(), algorithm);
                        if (isGzip) {
                            data = GZIPUtils.decompress(data);
                        }
                        System.out.println("response data size : " + data.length);
                        result = new String(data, encode);
                        System.out.println("response json: " + result);
                    }
                } else {
                    System.out.println("请求接口异常,请求码:" + res.getHttpCode());
                }
            } else {
                System.out.println("请求接口网络异常:" + res.getResultCode().getCode());
            }
        } catch (Exception e) {
            System.out.println("解析失败");
            e.printStackTrace();
        }
        ResultModel re = new ResultModel(code, result);
        return re;
    }

}
