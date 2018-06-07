package com.kshl.huihuimall.portal.livingpay;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.LivingPay;
import com.kshl.huihuimall.base.dal.entity.LivingPayBill;
import com.kshl.huihuimall.base.request.AliRefundRequest;
import com.kshl.huihuimall.portal.controller.request.LivingPayRequest;
import com.kshl.huihuimall.portal.service.livingpay.LivingPayService;
import com.kshl.huihuimall.portal.service.pay.AliPayService;
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

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class LivingPayUtils {
    protected static String url = "http://api.bm001.com/api";
    protected static String appKey = "10001771";
    protected static String appSecret = "cVXMBG0JMLWqvnBmZpoL7Ph8nmOqABpv";
    protected static String accessToken = "bd44b1fd6a014616b8259c081e5f5dc8";

    //通过缴费类型获取itemId
    public List  GetItemInfo(String ProjectId,String Province)  {
        OpenClient client = new DefaultOpenClient(url, appSecret);
        List list=new ArrayList<>();
        BmDirectRechargeWaterCoalItemListRequest req = new BmDirectRechargeWaterCoalItemListRequest();
        //req.setProvinceVid("v2280");
        req.setProvince(Province);
        req.setProjectId(ProjectId);
        try {
            BmDirectRechargeWaterCoalItemListResponse response = client.execute(req, accessToken);
            JSONArray jsonArray = JSONArray.fromObject(response.getItems());
            Object[] objs = jsonArray.toArray();
            for (Object object : objs) {
                JSONObject jsonObject = JSONObject.fromObject(object);
                Object code= jsonObject.get("itemId");
                String itemId= String.valueOf(code);
                list.add(itemId);
            }
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return list;
    }

    //获取商品列表属性
    public List  testGetItemInfo2(String ProjectId,String Province) {
        List list=new ArrayList<>();
        for(int i=0;i<GetItemInfo(ProjectId,Province).size();i++) {
            String itemId = (String) GetItemInfo(ProjectId,Province).get(i);
            OpenClient client = new DefaultOpenClient(url, appSecret);
            BmDirectRechargeWaterCoalItemPropsListRequest req = new BmDirectRechargeWaterCoalItemPropsListRequest();
            req.setItemId(itemId);
            Living living=new Living();
            try {
                BmDirectRechargeWaterCoalItemPropsListResponse response = client.execute(req, accessToken);
                living.setCid(response.getCid());
                living.setItemId(itemId);
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
                    }
                    if (type.equals("PRVCIN")) {
                        living.setPRVCINvid(String.valueOf(vid));
                        living.setPRVCINvname(String.valueOf(vname));
                    }
                    if (type.equals("CITYIN")) {
                        living.setCITYINvid(String.valueOf(vid));
                        living.setCITYINvname(String.valueOf(vname));
                    }
                    if (type.equals("SPECIAL")) {
                        living.setSPECIALvid(String.valueOf(vid));
                        //living.setPRVCINvname(String.valueOf(vname));
                    }
                }

            } catch (ApiException e) {
                e.printStackTrace();
            }
            list.add(living);
        }
        return list;
    }

    //账单查询
    public Living testGetItemInfo3(Living live,String account)  {

        Living living=new Living();
        OpenClient client = new DefaultOpenClient(url, appSecret);
        BmDirectRechargeWaterCoalGetAccountInfoRequest req = new BmDirectRechargeWaterCoalGetAccountInfoRequest();
        req.setItemId(live.getItemId());
        req.setAccount(account);
        req.setProjectId(live.getCid());
        req.setUnitId(live.getBRANDvid());
        req.setProvince(live.getPRVCINvname());
        req.setCity(live.getCITYINvname());
        req.setUnitName(live.getBRANDvname());
        req.setCityId(live.getCITYINvid());
        req.setModeType("2");
        req.setModeId(live.getSPECIALvid());
        try {
            BmDirectRechargeWaterCoalGetAccountInfoResponse response = client.execute(req, accessToken);
            living.setItemId(live.getItemId());
            living.setChannel(response.getChannel());
            living.setStatus(response.getStatus());
            living.setMessage(response.getMessage());
            JSONArray jsonArray = JSONArray.fromObject(response.getWaterCoalBills());
            Object[] objs = jsonArray.toArray();
            for (Object object : objs) {
                JSONObject jsonObject = JSONObject.fromObject(object);
                if(jsonObject.size()>0){
                    Object payAmount = jsonObject.getString("payAmount");
                    Object billCycle = jsonObject.getString("billCycle");
                    living.setPayAmount(String.valueOf(payAmount));
                    living.setBillCycle(String.valueOf(billCycle));
                }
            }
           // System.out.println(response.getMessage()+"--"+response.getStatus()+"--"+response.getChannel()+"--"+response.getWaterCoalBills());
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return living;
    }

    public PayDetail testGetItemInfo4(LivingPayRequest livingPayRequest) {
        PayDetail payDetail=new PayDetail();
        OpenClient client = new DefaultOpenClient(url, appSecret);
        BmDirectRechargeLifeRechargePayBillRequest req = new BmDirectRechargeLifeRechargePayBillRequest();
//        req.setItemId(livingPayRequest.getItemId());
//        req.setItemNum(livingPayRequest.getItemNum());
//        req.setRechargeAccount(livingPayRequest.getRechargeAccount());
       req.setOuterTid(livingPayRequest.getOuterTid());
        req.setItemId(livingPayRequest.getItemId());
        req.setItemNum(livingPayRequest.getItemNum());
        req.setRechargeAccount(livingPayRequest.getRechargeAccount());
        try {
            BmDirectRechargeLifeRechargePayBillResponse response = client.execute(req, accessToken);
            System.out.println(response.getSubMsg()+""+response.getBody()+""+response.getErrorCode());
            if(response.getOrderDetailInfo()!=null){
                System.out.println("--=============-------");
                payDetail.setBillId(response.getOrderDetailInfo().getBillId());
                payDetail.setOperateTime(response.getOrderDetailInfo().getOperateTime());
                payDetail.setOrderTime(response.getOrderDetailInfo().getOrderTime());
                payDetail.setOuterTid(response.getOrderDetailInfo().getOuterTid());
                payDetail.setPayState(response.getOrderDetailInfo().getPayState());
                payDetail.setRechargeAccount(response.getOrderDetailInfo().getRechargeAccount());
                payDetail.setRechargeState(response.getOrderDetailInfo().getRechargeState());
                payDetail.setSaleAmount(response.getOrderDetailInfo().getSaleAmount());
            }
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return payDetail;
    }

    public BaseResponse testGetItemInfo5() throws ApiException {
        BaseResponse response=new BaseResponse();
        OpenClient client = new DefaultOpenClient(url, appKey, appSecret);
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
                        JSONObject jsStr = JSONObject.fromObject(msg.getContent());
                        String outer_tid=  jsStr.getString("outer_tid").toString();
                        String recharge_state=  jsStr.getString("recharge_state").toString();
                        System.out.println(outer_tid+""+recharge_state);
                        if(outer_tid!=null){
//                            LivingPayBill livingPayBill=new LivingPayBill();
//                            livingPayBill.setRechargestate(Integer.valueOf(recharge_state));
//                            livingPayBill.setBillid(outer_tid);
//                            livingPayService.updatePayOrder(livingPayBill);
//                            LivingPay livingPay=livingPayService.getLivingPayPhone("S1804286183014");
                            ///////////发送短信
//                            if(livingPay.getPayStatus().equals(9)){
//                                String content="您的充值失败";
//                                String mobile=livingPay.getUserAccount();
//                                smsService.smsContent(content,mobile);
//                                //支付宝退款
//                                AliRefundRequest aliRefundRequest=new AliRefundRequest();
//                                aliRefundRequest.setTradeNo("0.1");
//                                BigDecimal amount=new BigDecimal("0.1");
//                                aliRefundRequest.setRefundAmount(amount);
//                                aliRefundRequest.setRefundReason("ss");
//                                response = aliPayService.aliRefund(aliRefundRequest);
//                            }else if(livingPay.getPayStatus().equals(1)){
//                                String content="您的充值已到账";
//                                String mobile=livingPay.getUserAccount();
//                                smsService.smsContent(content,mobile);
//                            }

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
                Thread.sleep(5000L); //根据自身服务器处理能力合理设置轮训时间
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } while (true);

    }

}
