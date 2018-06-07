package com.kshl.huihuimall.console.service.financial;

import com.kshl.base.response.BasePageResponse;
import com.kshl.huihuimall.console.controller.financial.request.FinancialReportRequest;

/**
 * 财务报表service
 */
public interface FinancialReportService {
    //畅销排行榜
    BasePageResponse bestSell(FinancialReportRequest financialReportRequest);
    //分润报表
    BasePageResponse shareProfit(FinancialReportRequest financialReportRequest);

    BasePageResponse ThisMonthDaily(FinancialReportRequest financialReportRequest);

    BasePageResponse MonthReport(FinancialReportRequest financialReportRequest);

    BasePageResponse dayReport(FinancialReportRequest financialReportRequest);

    BasePageResponse BankReconciliation(FinancialReportRequest financialReportRequest);
}
