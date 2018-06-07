package com.kshl.huihuimall.portal.dal.dao;

import com.kshl.huihuimall.base.dal.entity.Payinfo;

import java.util.List;
import java.util.Map;

public interface PayDao {

    List<Payinfo> queryPayInfo(Map<String, Object> map);

    void updatePayStatus(Map<String, Object> map);

    void addPayInfo(Payinfo payInfo);

    Payinfo getByTradeNo(String tradeNo);

    void updatePayInfo(Payinfo payInfo);

    List<Payinfo> getAllPayInfo();

}
