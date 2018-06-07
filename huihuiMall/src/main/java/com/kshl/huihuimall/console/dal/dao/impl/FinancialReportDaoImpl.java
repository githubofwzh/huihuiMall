package com.kshl.huihuimall.console.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.mapper.OrderDetailMapper;
import com.kshl.huihuimall.console.dal.dao.FinancialReportDao;
import com.kshl.huihuimall.console.dal.manualmapper.FinancialReportManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FinancialReportDaoImpl implements FinancialReportDao {

    @Autowired
    private FinancialReportManualMapper financialReportManualMapper;

    @Override
    public List<Map<String, Object>> getAllBestSell(Integer pageSize, Integer pageNum, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(startTime)){
            map.put("startTime", startTime);
        }
        if(!KSStringUtils.isEmpty(endTime)){
            map.put("endTime", endTime);
        }

        return financialReportManualMapper.getAllBestSell(map);
    }

    @Override
    public int getAllBestSellCount(String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();

        if(!KSStringUtils.isEmpty(startTime)){
            map.put("startTime", startTime);
        }
        if(!KSStringUtils.isEmpty(endTime)){
            map.put("endTime", endTime);
        }

        return financialReportManualMapper.getAllBestSellCount(map);
    }


    @Override
    public List<Map<String, Object>> shareProfit(Integer pageSize, Integer pageNum, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }

        return financialReportManualMapper.shareProfit(map);
    }

    @Override
    public int shareProfitCount(String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }
        return financialReportManualMapper.shareProfitCount(map);
    }

    @Override
    public List<Map<String, Object>> ThisMonthDaily(Integer pageSize, Integer pageNum, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(startTime)){
            map.put("startTime", startTime);
        }
        if(!KSStringUtils.isEmpty(endTime)){
            map.put("endTime", endTime);
        }
        return financialReportManualMapper.ThisMonthDaily(map);
    }

    @Override
    public int ThisMonthDailyCount(String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(startTime)){
            map.put("startTime", startTime);
        }
        if(!KSStringUtils.isEmpty(endTime)){
            map.put("endTime", endTime);
        }
        return financialReportManualMapper.ThisMonthDailyCount(map);
    }

    @Override
    public List<Map<String, Object>> MonthReport(Integer pageSize, Integer pageNum, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(startTime)){
            map.put("startTime", startTime);
        }
        if(!KSStringUtils.isEmpty(endTime)){
            map.put("endTime", endTime);
        }
        return financialReportManualMapper.MonthReport(map);
    }

    @Override
    public int MonthReportCount(String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(startTime)){
            map.put("startTime", startTime);
        }
        if(!KSStringUtils.isEmpty(endTime)){
            map.put("endTime", endTime);
        }
        return financialReportManualMapper.MonthReportCount(map);
    }

    @Override
    public List<Map<String, Object>> dayReport(Integer pageSize, Integer pageNum, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }
        return financialReportManualMapper.dayReport(map);
    }

    @Override
    public int dayReportCount(String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }
        return financialReportManualMapper.dayReportCount(map);
    }

    @Override
    public List<Map<String, Object>> BankReconciliation(Integer pageSize, Integer pageNum, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }
        return financialReportManualMapper.BankReconciliation(map);
    }

    @Override
    public int BankReconciliationCount(String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }
        return financialReportManualMapper.BankReconciliationCount(map);
    }


}
