package com.kshl.huihuimall.portal.dal.dao.impl;

import com.github.pagehelper.PageHelper;
import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.LivingPay;
import com.kshl.huihuimall.base.dal.entity.LivingPayBill;
import com.kshl.huihuimall.base.dal.entity.LivingPayExample;
import com.kshl.huihuimall.base.dal.mapper.LivingPayBillMapper;
import com.kshl.huihuimall.base.dal.mapper.LivingPayMapper;
import com.kshl.huihuimall.portal.dal.dao.LivingPayDao;
import com.kshl.huihuimall.portal.dal.manualmapper.LivingPayManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class LivingPayDaoImpl implements LivingPayDao{
    @Autowired
    private LivingPayMapper livingPayMapper;
    @Autowired
    private LivingPayBillMapper livingPayBillMapper;
    @Autowired
    private LivingPayManualMapper livingPayManualMapper;

    @Override
    public List<LivingPay> getAllPay(Integer pageNum, Integer pageSize, Integer productType,String StartTime,String endTime,String pay_time) {
        if (pageNum != null && pageSize != null) {
            PageHelper.startPage(pageNum, pageSize);
        }
        LivingPayExample livingPayExample = new LivingPayExample();
        com.kshl.huihuimall.base.dal.entity.LivingPayExample.Criteria criteria = livingPayExample.createCriteria();
        if(productType != null) {
            criteria.andProductTypeEqualTo(productType);
        }
        Date date1 = null;
        Date date2 = null;
        if(StartTime!=null&& !StartTime.isEmpty() && endTime!=null && !endTime.isEmpty()) {
            DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            try {
                date1 = format1.parse(StartTime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            try {
                DateFormat format2= new SimpleDateFormat("yyyy-MM-dd");
                date2 = format2.parse(endTime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            criteria.andPayTimeBetween(date1,date2);
        }
        livingPayExample.setOrderByClause("pay_time");
        return livingPayMapper.selectByExample(livingPayExample);
    }

    @Override
    public LivingPay selectByPrimaryKey(Integer id) {
        return livingPayMapper.selectByPrimaryKey(id);
    }

    @Override
    public int insertSelective(LivingPay record) {
        return livingPayMapper.insertSelective(record);
    }

    @Override
    public int insert(LivingPayBill record) {
        return livingPayBillMapper.insertSelective(record);
    }

    @Override
    public   List<Map<String,Object>>getLivingBill(Integer pageNum, Integer pageSize, String outertid, Integer paytype, Integer rechargestate, String StartTime, String endTime){
        Map<String, Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            PageHelper.startPage(pageNum, pageSize);
        }
        if(!KSStringUtils.isEmpty(outertid)){
            map.put("outertid",outertid);
        }
        if(!KSStringUtils.isEmpty(paytype)){
            map.put("paytype",paytype);
        }
        if(!KSStringUtils.isEmpty(rechargestate)){
            map.put("rechargestate",rechargestate);
        }
        if(KSStringUtils.isEmpty(StartTime) & !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("StartTime",endTime);
        }
        if(!KSStringUtils.isEmpty(StartTime) & KSStringUtils.isEmpty(endTime)){
            map.put("endTime",StartTime);
            map.put("StartTime",StartTime);
        }
        if(!KSStringUtils.isEmpty(StartTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("StartTime",StartTime);
        }
        return livingPayManualMapper.getLivingBill(map);
    }

    @Override
    public int updatePayOrder(LivingPayBill livingPayBill) {
        return livingPayManualMapper.updatePayOrder(livingPayBill);
    }

    @Override
    public int updatepay(LivingPay livingPay) {
        return livingPayManualMapper.updatepay(livingPay);
    }

    @Override
    public LivingPay getLivingPayPhone(String sordernumber) {
        return livingPayManualMapper.getLivingPayPhone(sordernumber);
    }

    @Override
    public KsArea getLivingPrince(String pid) {
        return livingPayManualMapper.getLivingPrince(pid);
    }

    @Override
    public List<Map<String, Object>> getLivingPay(Integer pageNum, Integer pageSize, Integer productType, String StartTime, String endTime, String pay_time,String outerTid) {
        Map<String, Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            PageHelper.startPage(pageNum, pageSize);
        }
        if(!KSStringUtils.isEmpty(productType)){
            map.put("productType",productType);
        }
        if(!KSStringUtils.isEmpty(outerTid)){
            map.put("outerTid",outerTid);
        }
        if(KSStringUtils.isEmpty(StartTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("StartTime",endTime);
        }
        if(!KSStringUtils.isEmpty(StartTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",StartTime);
            map.put("StartTime",StartTime);
        }
        if(!KSStringUtils.isEmpty(StartTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("StartTime",StartTime);
        }
        return livingPayManualMapper.getLivingPay(map);
    }


}
