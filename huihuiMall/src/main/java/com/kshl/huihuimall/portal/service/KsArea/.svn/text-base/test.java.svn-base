package com.kshl.huihuimall.portal.service.KsArea;


import com.kshl.huihuimall.base.dal.entity.LivingPay;
import com.kshl.huihuimall.base.dal.entity.LivingPayBill;
import com.kshl.huihuimall.portal.livingpay.Living;
import com.kshl.huihuimall.portal.service.livingpay.LivingPayService;
import com.kshl.huihuimall.portal.service.sms.SmsService;
import com.qianmi.open.api.ApiException;
import com.qianmi.open.api.DefaultOpenClient;
import com.qianmi.open.api.OpenClient;
import com.qianmi.open.api.domain.common.QmcsMessage;
import com.qianmi.open.api.request.*;
import com.qianmi.open.api.response.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class test {

    @Autowired
    private LivingPayService livingPayService;
    @Autowired
    private SmsService smsService;

    protected static String url = "http://api.bm001.com/api";
    protected static String url12 = "http://gw.api.qianmi.com/api";//消费消息（获得订单的支付状态）和确认消息（清空已获取的订单状态）

    protected static String appKey = "10001771";
    protected static String appSecret = "cVXMBG0JMLWqvnBmZpoL7Ph8nmOqABpv";
    protected static String accessToken = "bd44b1fd6a014616b8259c081e5f5dc8";


    public List testGetItemInfo1()  {

        OpenClient client = new DefaultOpenClient(url, appSecret);
        BmDirectRechargeWaterCoalItemListRequest req = new BmDirectRechargeWaterCoalItemListRequest();
        req.setProvinceVid("v1953");
        req.setCityVid("v1954");
        req.setProjectId("c2681");

        List list=new ArrayList();
        try {
            BmDirectRechargeWaterCoalItemListResponse response = client.execute(req, accessToken);
            JSONArray jsonArray = JSONArray.fromObject(response.getItems());
            Object[] objs = jsonArray.toArray();
            for (Object object : objs) {
                JSONObject jsonObject = JSONObject.fromObject(object);
                Object code= jsonObject.get("itemId");
                String  itemId= String.valueOf(code);
                list.add(itemId);
            }
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return list;
    }


    public Living testGetItemInfo2() {
        System.out.println(" testGetItemInfo1()======================="+ testGetItemInfo1());
        Living living=new Living();
       for(int i=0;i<testGetItemInfo1().size();i++){
            System.out.println(testGetItemInfo1().get(i));
            String itemId= (String) testGetItemInfo1().get(i);
           OpenClient client = new DefaultOpenClient(url, appSecret);
           BmDirectRechargeWaterCoalItemPropsListRequest req = new BmDirectRechargeWaterCoalItemPropsListRequest();
           req.setItemId(itemId);
           try {
               BmDirectRechargeWaterCoalItemPropsListResponse response = client.execute(req, accessToken);
               living.setCid(response.getCid());
               living.setItemId(response.getItemId());
               JSONArray jsonArray = JSONArray.fromObject(response.getItemProps());
               Object[] objs = jsonArray.toArray();
               for (Object object : objs) {
                   JSONObject jsonObject = JSONObject.fromObject(object);
                   Object vid = jsonObject.getString("vid");
                   Object vname = jsonObject.getString("vname");
                   Object type = jsonObject.get("type");

                   if (type.equals("BRAND")) {
                       living.setBRANDvid(String.valueOf(vid));
                       living.setBRANDvname(String.valueOf(vname));
                       System.out.println(vname+"===="+vid+"===="+type);
                   }
                   if (type.equals("PRVCIN")) {
                       living.setPRVCINvid(String.valueOf(vid));
                       living.setPRVCINvname(String.valueOf(vname));
                       System.out.println(vname+"===="+vid+"===="+type);
                   }
                   if (type.equals("CITYIN")) {
                       living.setCITYINvid(String.valueOf(vid));
                       living.setCITYINvname(String.valueOf(vname));
                       System.out.println(vname+"===="+vid+"===="+type);
                   }
                   if (type.equals("SPECIAL")) {
                       living.setSPECIALvid(String.valueOf(vid));
                       living.setPRVCINvname(String.valueOf(vname));
                       System.out.println(vname+"===="+vid+"===="+type);
                   }
               }
           } catch (ApiException e) {
               e.printStackTrace();
           }
        }
        return living;
    }

    public Living testGetItemInfo3()  {
        OpenClient client = new DefaultOpenClient(url, appSecret);
        Living living=new Living();
        BmDirectRechargeWaterCoalGetAccountInfoRequest req = new BmDirectRechargeWaterCoalGetAccountInfoRequest();
        req.setItemId(testGetItemInfo2().getItemId());
        req.setAccount("050805481");
        req.setProjectId(testGetItemInfo2().getCid());
        req.setUnitId(testGetItemInfo2().getBRANDvid());
        req.setProvince(testGetItemInfo2().getPRVCINvname());
        req.setCity(testGetItemInfo2().getCITYINvname());
        req.setUnitName(testGetItemInfo2().getBRANDvname());
        req.setCityId(testGetItemInfo2().getCITYINvid());
        req.setModeType("2");
        req.setModeId(testGetItemInfo2().getSPECIALvid());
        try {
            BmDirectRechargeWaterCoalGetAccountInfoResponse response = client.execute(req, accessToken);
            living.setMessage(response.getMessage());
            living.setStatus(response.getStatus());
            living.setChannel(response.getChannel());
           // living.setBills(response.getWaterCoalBills());
            System.out.println(response.getMessage()+"--"+response.getStatus()+"--"+response.getChannel()+"--"+response.getWaterCoalBills());
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return living;
    }


    public Living testGetItemInfo4()  {
        Living living=new Living();
        OpenClient client = new DefaultOpenClient(url, appSecret);
        BmDirectRechargeLifeRechargePayBillRequest req = new BmDirectRechargeLifeRechargePayBillRequest();
        req.setItemId("64401001");
        req.setItemNum("1");
        req.setRechargeAccount("050805481");
        try {
            BmDirectRechargeLifeRechargePayBillResponse response = client.execute(req, accessToken);
            System.out.println(response.getMsg()+"-");
            System.out.println(response.getBody()+"--");
            System.out.println(response.getErrorCode()+"---");
            System.out.println(response.getParams()+"=");
            System.out.println(response.getSubCode()+"==");
            System.out.println(response.getSubMsg()+"===");
            if(response.getOrderDetailInfo()!=null){
                System.out.println(response.getMsg()+"--");
                System.out.println(response.getOrderDetailInfo().getBattleAccount()+"--");
                System.out.println(response.getOrderDetailInfo().getBillId()+"--");
                System.out.println(response.getOrderDetailInfo().getBuyerAddress()+"--");
                System.out.println(response.getOrderDetailInfo().getBuyerRemark()+"--");
                System.out.println(response.getOrderDetailInfo().getCardNo()+"--");
            }

        } catch (ApiException e) {
            e.printStackTrace();
        }
        return living;
    }




    public void testGetItemInfo5() throws ApiException {
        OpenClient client = new DefaultOpenClient(url12, appKey, appSecret);
        do {
            Integer quantity = 20;
            String groupName = "A2458419";
            QmcsMessagesConsumeResponse rsp = null;
            do {
                QmcsMessagesConsumeRequest req1 = new QmcsMessagesConsumeRequest();
                req1.setQuantity(quantity);
                req1.setGroupName(groupName);
                rsp = client.execute(req1);
                if (rsp.isSuccess() && rsp.getQmcsMessages() != null) {
                    for (QmcsMessage msg : rsp.getQmcsMessages()) {
                        System.out.println(msg.getContent());
                        JSONObject jsStr = JSONObject.fromObject(msg.getContent());
                        Object a=  jsStr.getString("tid");
                        System.out.println(a+"======================");
                        System.out.println(msg.getTopic());
                        // 确认消费状态
                        QmcsMessagesConfirmRequest cReq = new QmcsMessagesConfirmRequest();
                        cReq.setsMessageIds(msg.getId());
                         QmcsMessagesConfirmResponse cRsp = client.execute(cReq);
                        System.out.println("确认结果"+cRsp.isSuccess());
                    }
                }
                System.out.println(rsp.isSuccess());
                System.out.println(rsp.getQmcsMessages());
                System.out.println(rsp.isSuccess());
            } while (rsp != null && rsp.isSuccess() && rsp.getQmcsMessages() != null);
            try {
                Thread.sleep(1000L); //根据自身服务器处理能力合理设置轮训时间
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } while (true);

    }


    public static void main(String[] args) {
        //new test().testGetItemInfo1();
       // new test().testGetItemInfo2();
       // new test().testGetItemInfo3();
        new test().testGetItemInfo4();
//        try {
//            new test().testGetItemInfo5();
//        } catch (ApiException e) {
//            e.printStackTrace();
//        }
    }



    public void testGetItemInfo6() throws ApiException {
        OpenClient client = new DefaultOpenClient(url12, appKey, appSecret);
        do {
            Integer quantity = 100;
            String groupName = "A2458419";
            QmcsMessagesConsumeResponse rsp = null;
            do {
                QmcsMessagesConsumeRequest req1 = new QmcsMessagesConsumeRequest();
                req1.setQuantity(quantity);
                req1.setGroupName(groupName);
                rsp = client.execute(req1);
                if (rsp.isSuccess() && rsp.getQmcsMessages() != null) {
                    for (QmcsMessage msg : rsp.getQmcsMessages()) {
                        System.out.println(msg.getContent());
                        JSONObject jsStr = JSONObject.fromObject(msg.getContent());
                        String outer_tid=  jsStr.getString("tid").toString();
                        String recharge_state=  jsStr.getString("recharge_state").toString();
                        System.out.println(outer_tid+"==========="+recharge_state);
                        if(outer_tid!=null){
                            LivingPayBill livingPayBill=new LivingPayBill();
                            livingPayBill.setRechargestate(Integer.valueOf(recharge_state));
                            livingPayBill.setBillid(outer_tid);
                            livingPayService.updatePayOrder(livingPayBill);
                            LivingPay livingPay=livingPayService.getLivingPayPhone("S1804286183014");
                            ///////////发送短信
                            if(livingPay.getPayStatus().equals(9)){
                                String content="您的充值失败";
                                String mobile=livingPay.getUserAccount();
                                smsService.smsContent(content,mobile);
                            }else if(livingPay.getPayStatus().equals(1)){
                                String content="您的充值已到账";
                                String mobile=livingPay.getUserAccount();
                                smsService.smsContent(content,mobile);
                            }

                        }
                        // 处理消息
                        System.out.println(msg.getContent());
                        System.out.println(msg.getTopic());
                        // 确认消费状态
                        QmcsMessagesConfirmRequest cReq = new QmcsMessagesConfirmRequest();
                        cReq.setsMessageIds(msg.getId());
                        QmcsMessagesConfirmResponse cRsp = client.execute(cReq);
                        System.out.println(cRsp.isSuccess());
                    }
                }
                System.out.println(rsp.getBody());
            } while (rsp != null && rsp.isSuccess() && rsp.getQmcsMessages() != null);
            try {
                System.out.println("kaishi轮训时间");
                Thread.sleep(50000L); //根据自身服务器处理能力合理设置轮训时间
                System.out.println("jieshu轮训时间");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } while (true);

    }



}