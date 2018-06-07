package com.kshl.huihuimall.portal.service.livingpay.impl;

import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.LivingPay;
import com.kshl.huihuimall.base.dal.entity.LivingPayBill;
import com.kshl.huihuimall.portal.dal.dao.LivingPayDao;
import com.kshl.huihuimall.portal.service.livingpay.LivingPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LivingPayServiceImpl implements LivingPayService {
    @Autowired
    private LivingPayDao livingPayDao;
    @Override
    public List<LivingPay> getAllPay(Integer pageNum, Integer pageSize, Integer productType, String StartTime, String endTime,String pay_time) {
        List<LivingPay> list=livingPayDao.getAllPay(pageNum,pageSize,productType,StartTime,endTime,pay_time);
        return list;
    }

    @Override
    public LivingPay selectByPrimaryKey(Integer id) {
        return livingPayDao.selectByPrimaryKey(id);
    }

    @Override
    public int insertSelective(LivingPay record) {
        return livingPayDao.insertSelective(record);
    }

    @Override
    public int insertSelective(LivingPayBill record) {
        return livingPayDao.insert(record);
    }

    @Override
    public  List<Map<String,Object>> getLivingBill(Integer pageNum, Integer pageSize, String outertid, Integer paytype, Integer rechargestate, String StartTime, String endTime){
        List<Map<String,Object>> list=livingPayDao.getLivingBill(pageNum,pageSize,outertid,paytype,rechargestate,StartTime,endTime);
        return list;
    }

    @Override
    public int updatePayOrder(LivingPayBill livingPayBill) {
        return livingPayDao.updatePayOrder(livingPayBill);
    }

    @Override
    public int updatepay(LivingPay livingPay) {
        return livingPayDao.updatepay(livingPay);
    }

    @Override
    public LivingPay getLivingPayPhone(String sordernumber) {
        return livingPayDao.getLivingPayPhone(sordernumber);
    }

    @Override
    public KsArea getLivingPrince(String pid) {
        return livingPayDao.getLivingPrince(pid);
    }

    @Override
    public List<Map<String, Object>> getLivingPay(Integer pageNum, Integer pageSize, Integer productType, String StartTime, String endTime, String pay_time,String outerTid) {
        return livingPayDao.getLivingPay(pageNum,pageSize,productType,StartTime,endTime,pay_time,outerTid);
    }
}
