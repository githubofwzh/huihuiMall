package com.kshl.huihuimall.console.dal.dao;

import java.util.List;
import java.util.Map;

/**
 * 财务报表Dao
 */
public interface FinancialReportDao {

    //查询畅销排行集合
    List<Map<String,Object>> getAllBestSell(Integer pageSize, Integer pageNum, String startTime, String endTime);
    //查询畅销排行数量
    int getAllBestSellCount(String startTime, String endTime);
    //分润报表集合
    List<Map<String,Object>> shareProfit(Integer pageSize, Integer pageNum, String startTime, String endTime);
    //分润报表数量
    int shareProfitCount(String startTime, String endTime);
    //本月销售日报
    List<Map<String,Object>> ThisMonthDaily(Integer pageSize, Integer pageNum, String startTime, String endTime);

    int ThisMonthDailyCount(String startTime, String endTime);

    List<Map<String,Object>> MonthReport(Integer pageSize, Integer pageNum, String startTime, String endTime);

    int MonthReportCount(String startTime, String endTime);

    List<Map<String,Object>> dayReport(Integer pageSize, Integer pageNum, String startTime, String endTime);

    int dayReportCount(String startTime, String endTime);

    List<Map<String,Object>> BankReconciliation(Integer pageSize, Integer pageNum, String startTime, String endTime);

    int BankReconciliationCount(String startTime, String endTime);
}
