package com.kshl.huihuimall.console.dal.manualmapper;

import java.util.List;
import java.util.Map;

/**
 * 财务报表
 */
public interface FinancialReportManualMapper {


    List<Map<String,Object>> getAllBestSell(Map<String, Object> map);

    int getAllBestSellCount(Map<String, Object> map);

    List<Map<String,Object>> shareProfit(Map<String, Object> map);

    int shareProfitCount(Map<String, Object> map);

    List<Map<String,Object>> ThisMonthDaily(Map<String, Object> map);

    int ThisMonthDailyCount(Map<String, Object> map);

    List<Map<String,Object>> MonthReport(Map<String, Object> map);

    int MonthReportCount(Map<String, Object> map);

    List<Map<String,Object>> dayReport(Map<String, Object> map);

    int dayReportCount(Map<String, Object> map);

    List<Map<String,Object>> BankReconciliation(Map<String, Object> map);

    int BankReconciliationCount(Map<String, Object> map);


}

