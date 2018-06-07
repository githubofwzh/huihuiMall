package com.kshl.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kshl.huihuimall.base.constants.WeChatPayConstants;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.*;

public class PayUtil {
    /**
     * 通过微信用户的code换取网页授权access_token
     *
     * access_token
     * openid
     *
     * @return
     * @throws IOException
     * @throws
     */
    public static Map<String, Object> accessToken(String code){
        Map<String, Object> map = new HashMap<String, Object>();
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="
                + WeChatPayConstants.GZHID + "&secret=" + WeChatPayConstants.GZHSecret + "&code=" + code + "&grant_type=authorization_code";
        try {
            HttpClient client = new DefaultHttpClient();
            HttpPost post = new HttpPost(url);
            HttpResponse res = client.execute(post);
            if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                HttpEntity entity = res.getEntity();
                String str = EntityUtils.toString(entity, "utf-8");
                ObjectMapper mapper = new ObjectMapper();
                Map<String, Object> jsonOb = mapper.readValue(str, Map.class);
                map.putAll(jsonOb);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * @author
     * @date 2018-4-18
     * @Description：sign签名
     * @param characterEncoding
     *            编码格式
     * @param packageParams
     *            请求参数
     * @return
     */
    public static String createSign(String characterEncoding, Map<String, String> packageParams, String API_KEY) {
        StringBuffer sb = new StringBuffer();
        Set es = packageParams.entrySet();
        Iterator it = es.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            String v = (String) entry.getValue();
            if (null != v && !"".equals(v) && !"sign".equals(k) && !"key".equals(k)) {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.append("key=" + API_KEY);
        String sign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toUpperCase();
        return sign;
    }

    public static String ToUrlParams(Map<String, String> packageParams){
        StringBuffer sb = new StringBuffer();
        Set es = packageParams.entrySet();
        Iterator it = es.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            String v = (String) entry.getValue();
            if (null != v && !"".equals(v)) {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.deleteCharAt(sb.length()-1);//删掉最后一个&
        return sb.toString();
    }

    /**
     * 获取当前时间戳
     *
     * @return 当前时间戳字符串
     */
    public static String getTimeStamp() {
        return String.valueOf(System.currentTimeMillis() / 1000);
    }
}
