package com.kshl.huihuimall.portal.service.KsArea;

import com.qianmi.open.api.ApiException;
import com.qianmi.open.api.DefaultOpenClient;
import com.qianmi.open.api.OpenClient;
import com.qianmi.open.api.domain.common.QmcsMessage;
import com.qianmi.open.api.qmcs.QmcsClient;
import com.qianmi.open.api.qmcs.channel.ChannelException;
import com.qianmi.open.api.qmcs.handler.MessageHandler;
import com.qianmi.open.api.qmcs.message.Message;
import com.qianmi.open.api.qmcs.message.MessageStatus;
import com.qianmi.open.api.request.QmcsMessagesConfirmRequest;
import com.qianmi.open.api.request.QmcsMessagesConsumeRequest;
import com.qianmi.open.api.response.QmcsMessagesConfirmResponse;
import com.qianmi.open.api.response.QmcsMessagesConsumeResponse;
import net.sf.json.JSONObject;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.util.*;

/**
 * Created by QianMi
 */
public class test2 {
  //  protected static String url = "http://gw.api.qianmi.com/api";//消费消息（获得订单的支付状态）和确认消息（清空已获取的订单状态）
    protected static String appkey = "10001771";
    protected static String appSecret = "cVXMBG0JMLWqvnBmZpoL7Ph8nmOqABpv";
   // protected static String accessToken = "bd44b1fd6a014616b8259c081e5f5dc8";

    public static void main(String[] args) throws ChannelException {

        //创建链接客户端,使用默认分组
        QmcsClient client = new QmcsClient(appkey,appSecret,"A2458419");
        //消息处理
        client.setMessageHandler(new MessageHandler(){
            @Override
            public void onMessage(Message message, MessageStatus status) throws Exception {
                try {
                    //以下仅为示例代码,实际业务处理根据自身需要开发
                    System.out.println(message.getTopic());
                    System.out.println(message.getContent());

                    if(message.getTopic().equals("qianmi_elife_rechargeStateChange")){
                        JSONObject jsStr = JSONObject.fromObject(message.getContent());
                        Object tid=  jsStr.getString("tid");
                        System.out.println("+++++++++++++++"+tid);
                        System.out.println("确认");
                    }
                    if(message.getTopic().equals("bm_elife_rechargeStateChange")){
                        System.out.println("确认22222");
                    }

                } catch (Exception e){
                    e.printStackTrace();
                    status.fail();//消息处理失败,需要服务端重新推送
                }
            }
        });
        client.connect("ws://mc.bm001.com");//发起连接请求
    }
}
