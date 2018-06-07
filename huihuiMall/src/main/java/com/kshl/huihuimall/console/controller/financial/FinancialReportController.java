package com.kshl.huihuimall.console.controller.financial;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.console.controller.financial.request.FinancialReportRequest;
import com.kshl.huihuimall.console.service.financial.FinancialReportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 财务Controller
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/financialReport")
public class FinancialReportController {

    private static final Logger logger = LoggerFactory.getLogger(FinancialReportController.class);

    @Autowired
    private FinancialReportService financialReportService;

    /**
     * 畅销排行报表
     * @param financialReportRequest
     * @return
     */
    @RequestMapping(value = "/bestSell", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse bestSell(FinancialReportRequest financialReportRequest) {
        logger.debug("bestSell start");
        BaseResponse response;
        return financialReportService.bestSell(financialReportRequest);
    }

    /**
     * 分润报表
     * @param financialReportRequest
     * @return
     */
    @RequestMapping(value = "/shareProfit", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse shareProfit(FinancialReportRequest financialReportRequest) {
        logger.debug("shareProfit start");
        BaseResponse response;
        return financialReportService.shareProfit(financialReportRequest);
    }

    /**
     * 本月销售日报
     * @param financialReportRequest
     * @return
     */
    @RequestMapping(value = "/ThisMonthDaily", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse ThisMonthDaily(FinancialReportRequest financialReportRequest) {
        logger.debug("ThisMonthDaily start");
        BaseResponse response;
        return financialReportService.ThisMonthDaily(financialReportRequest);
    }


    /**
     * 销售月报
     * @param financialReportRequest
     * @return
     */
    @RequestMapping(value = "/MonthReport", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse MonthReport(FinancialReportRequest financialReportRequest) {
        logger.debug("MonthReport start");
        BaseResponse response;
        return financialReportService.MonthReport(financialReportRequest);
    }

    /**
     * 销售日报
     * @param financialReportRequest
     * @return
     */
    @RequestMapping(value = "/dayReport", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse dayReport(FinancialReportRequest financialReportRequest) {
        logger.debug("dayReport start");
        BaseResponse response;
        return financialReportService.dayReport(financialReportRequest);
    }

    /**
     * 银行对账
     * @param financialReportRequest
     * @return
     */
    @RequestMapping(value = "/BankReconciliation", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse BankReconciliation(FinancialReportRequest financialReportRequest) {
        logger.debug("BankReconciliation start");
        BaseResponse response;
        return financialReportService.BankReconciliation(financialReportRequest);
    }
}
