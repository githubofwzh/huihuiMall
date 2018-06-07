package com.kshl.huihuimall.portal.dal.dao;

import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.LivingPay;
import com.kshl.huihuimall.base.dal.entity.LivingPayBill;

import java.util.List;
import java.util.Map;

public interface LivingPayDao {

    List<LivingPay> getAllPay(Integer pageNum, Integer pageSize, Integer productType,String StartTime,String endTime,String pay_time);

    LivingPay selectByPrimaryKey(Integer id);

    int insertSelective(LivingPay record);

    int insert(LivingPayBill record);

    List<Map<String,Object>>getLivingBill(Integer pageNum, Integer pageSize, String outertid, Integer paytype, Integer rechargestate, String StartTime, String endTime);

    int updatePayOrder(LivingPayBill livingPayBill);

    int updatepay(LivingPay livingPay);

    LivingPay getLivingPayPhone(String sordernumber);

    KsArea getLivingPrince(String pid);

    List<Map<String,Object>>getLivingPay(Integer pageNum, Integer pageSize, Integer productType,String StartTime,String endTime,String pay_time,String outerTid);
}
