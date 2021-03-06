package com.kshl.huihuimall.portal.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.Payinfo;
import com.kshl.huihuimall.base.dal.entity.PayinfoExample;
import com.kshl.huihuimall.base.dal.mapper.PayinfoMapper;
import com.kshl.huihuimall.portal.dal.dao.PayDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PayDaoImpl implements PayDao {

    @Autowired
    private PayinfoMapper payinfoMapper;

    @Override
    public List<Payinfo> queryPayInfo(Map<String, Object> map) {
        PayinfoExample example = new PayinfoExample();
        PayinfoExample.Criteria criteria= example.createCriteria();

        String orderNo = (String) map.get("orderNo");
        if(!KSStringUtils.isEmpty(orderNo)){
            criteria.andOutTradeNoEqualTo(orderNo);
        }

        String userid = (String) map.get("userid");
        if(!KSStringUtils.isEmpty(userid)){
            criteria.andUseridEqualTo(userid);
        }

        return payinfoMapper.selectByExample(example);
    }

    @Override
    public void updatePayStatus(Map<String, Object> map) {
        PayinfoExample example = new PayinfoExample();
        PayinfoExample.Criteria criteria= example.createCriteria();

        String orderNo = (String) map.get("out_trade_no");
        if(!KSStringUtils.isEmpty(orderNo)){
            criteria.andOutTradeNoEqualTo(orderNo);
        }

        String userid = (String) map.get("userid");
        if(!KSStringUtils.isEmpty(userid)){
            criteria.andUseridEqualTo(userid);
        }

        Payinfo record = new Payinfo();
        record.setPaystatus((Integer) map.get("payStatus"));

        payinfoMapper.updateByExampleSelective(record, example);
    }

    @Override
    public void addPayInfo(Payinfo payInfo) {
        payinfoMapper.insert(payInfo);
    }

    @Override
    public Payinfo getByTradeNo(String tradeNo) {
        PayinfoExample alipayPayInfoExample = new PayinfoExample();
        alipayPayInfoExample.createCriteria().andOutTradeNoEqualTo(tradeNo);
        List<Payinfo> list = payinfoMapper.selectByExample(alipayPayInfoExample);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public void updatePayInfo(Payinfo payInfo) {
        payinfoMapper.updateByPrimaryKey(payInfo);
    }

    @Override
    public List<Payinfo> getAllPayInfo() {
        return payinfoMapper.selectByExample(null);
    }
}
