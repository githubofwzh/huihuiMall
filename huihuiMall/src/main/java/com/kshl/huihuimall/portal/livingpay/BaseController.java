package com.kshl.huihuimall.portal.livingpay;

import com.qianmi.open.api.DefaultOpenClient;
import com.qianmi.open.api.OpenClient;

public class BaseController {
    private static final String  url = "http://api.bm001.com/api";
    protected static final String appKey = "10001771";
    protected static final String appSecret = "cVXMBG0JMLWqvnBmZpoL7Ph8nmOqABpv";
    protected static String accessToken = "586b09734aaf4163a41dcafde08b9630";
    // 创建一个客户端，默认连接超时时间为3秒，请求超时时间为15秒。
    protected static final OpenClient client = new DefaultOpenClient(url, appKey, appSecret);

}