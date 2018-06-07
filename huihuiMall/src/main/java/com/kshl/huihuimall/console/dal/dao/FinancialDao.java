package com.kshl.huihuimall.console.dal.dao;

import com.kshl.huihuimall.base.dal.entity.FinancialConfigure;
import com.kshl.huihuimall.base.dal.entity.Payinfo;

import java.util.List;
import java.util.Map;

public interface FinancialDao {


    List<Map<String, Object>> queryAllPayInfo(Integer pageSize, Integer pageNum, String type, String outTradeNo, Integer paytype, Integer payStatus, String startTime, String endTime);

    int getPayInfoCount(String type, String outTradeNo, Integer paytype, Integer payStatus, String startTime, String endTime);

    int addPayInfo(Payinfo payinfo);

    int updatePayInfo(Payinfo payinfo);

    int deleteOrder(Integer id);
    //更新标准配置管理
    int updateStandard(FinancialConfigure financialConfigure);
    //查出配置
    List<FinancialConfigure> getStandard();
}
