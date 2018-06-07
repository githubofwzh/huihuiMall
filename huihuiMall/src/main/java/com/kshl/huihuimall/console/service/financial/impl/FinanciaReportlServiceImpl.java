package com.kshl.huihuimall.console.service.financial.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.FinancialConfigure;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.controller.financial.request.FinancialReportRequest;
import com.kshl.huihuimall.console.dal.dao.FinancialDao;
import com.kshl.huihuimall.console.dal.dao.FinancialReportDao;
import com.kshl.huihuimall.console.service.financial.FinancialReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

/**
 * 财务报表service实现类
 */
@Service
public class FinanciaReportlServiceImpl implements FinancialReportService {

    @Autowired
    private FinancialReportDao financialReportDao;

    @Autowired
    private FinancialDao financialDao;

    /**
     * 畅销排行榜
     * @param financialReportRequest
     * @return
     */
    @Override
    public BasePageResponse bestSell(FinancialReportRequest financialReportRequest) {
        BaseResponse response;
        String data= financialReportRequest.getDate();
        if(data==null||data==""){
            Date date1 = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM");
            data = format.format(date1); //2013-01-14
        }
        String startTime="";
        String endTime="";
        try {
            String firstLast= DateFormatUtil.getTime(data);
            String[] str1 = firstLast.split(",");
            startTime = str1[0];
            endTime = str1[1];
        } catch (ParseException e) {
            e.printStackTrace();
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        List<Map<String, Object>> result = financialReportDao.getAllBestSell(financialReportRequest.getPageSize(), financialReportRequest.getPageNum(),startTime,endTime);
        int total = financialReportDao.getAllBestSellCount(startTime,endTime);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (financialReportRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (financialReportRequest.getPageSize() * financialReportRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / financialReportRequest.getPageSize();
        pageResponse.setPages(total % financialReportRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /**
     * 分润报表
     * @param financialReportRequest
     * @return
     */
    @Override
    public BasePageResponse shareProfit(FinancialReportRequest financialReportRequest) {
        BaseResponse response;
        String data= financialReportRequest.getDate();
        String startTime=financialReportRequest.getStartTime();
        String endTime=financialReportRequest.getEndTime();
        if(startTime==""&& endTime==""){
            Date date1 = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM");
            data = format.format(date1); //2013-01-14
        }
        if(data!=null||data==""){
            try {
                String firstLast= DateFormatUtil.getTime(data);
                String[] str1 = firstLast.split(",");
                startTime = str1[0];
                endTime = str1[1];
            } catch (ParseException e) {
                e.printStackTrace();
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        }
        List<Map<String, Object>> result = financialReportDao.shareProfit(financialReportRequest.getPageSize(), financialReportRequest.getPageNum(),startTime,endTime);
        int total = financialReportDao.shareProfitCount(startTime,endTime);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (financialReportRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (financialReportRequest.getPageSize() * financialReportRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / financialReportRequest.getPageSize();
        pageResponse.setPages(total % financialReportRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;

    }

    /*
      本月销售日报
     */

    @Override
    public BasePageResponse ThisMonthDaily(FinancialReportRequest financialReportRequest) {
        BaseResponse response;
        String data= financialReportRequest.getDate();
        if(data==null||data==""){
            Date date1 = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM");
            data = format.format(date1); //2013-01-14
        }
        String startTime="";
        String endTime="";
        try {
            String firstLast= DateFormatUtil.getTime(data);
            String[] str1 = firstLast.split(",");
            startTime = str1[0];
            endTime = str1[1];
        } catch (ParseException e) {
            e.printStackTrace();
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        List<Map<String, Object>> result = financialReportDao.ThisMonthDaily(financialReportRequest.getPageSize(), financialReportRequest.getPageNum(),startTime,endTime);
        int total = financialReportDao.ThisMonthDailyCount(startTime,endTime);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (financialReportRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (financialReportRequest.getPageSize() * financialReportRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / financialReportRequest.getPageSize();
        pageResponse.setPages(total % financialReportRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }
/*
   月报
 */
    @Override
    public BasePageResponse MonthReport(FinancialReportRequest financialReportRequest) {
        BaseResponse response;
        String data= financialReportRequest.getDate();
        if(data==null||data==""){
            Date date1 = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM");
            data = format.format(date1); //2013-01-14
        }
        String startTime="";
        String endTime="";
        try {
            String firstLast= DateFormatUtil.getTime(data);
            String[] str1 = firstLast.split(",");
            startTime = str1[0];
            endTime = str1[1];
        } catch (ParseException e) {
            e.printStackTrace();
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        List<Map<String, Object>> result = financialReportDao.MonthReport(financialReportRequest.getPageSize(), financialReportRequest.getPageNum(),startTime,endTime);
        int total = financialReportDao.MonthReportCount(startTime,endTime);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (financialReportRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (financialReportRequest.getPageSize() * financialReportRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / financialReportRequest.getPageSize();
        pageResponse.setPages(total % financialReportRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /*
      日报
     */
    @Override
    public BasePageResponse dayReport(FinancialReportRequest financialReportRequest) {
        BaseResponse response;
        String data= financialReportRequest.getDate();
        String startTime=financialReportRequest.getStartTime();
        String endTime=financialReportRequest.getEndTime();
        if(startTime==""&& endTime==""){
            Date date1 = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM");
            data = format.format(date1); //2013-01-14
        }
        if(data!=null||data==""){
            try {
                String firstLast= DateFormatUtil.getTime(data);
                String[] str1 = firstLast.split(",");
                startTime = str1[0];
                endTime = str1[1];
            } catch (ParseException e) {
                e.printStackTrace();
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        }
        List<Map<String, Object>> result = financialReportDao.dayReport(financialReportRequest.getPageSize(), financialReportRequest.getPageNum(),startTime,endTime);
        int total = financialReportDao.dayReportCount(startTime,endTime);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (financialReportRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (financialReportRequest.getPageSize() * financialReportRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / financialReportRequest.getPageSize();
        pageResponse.setPages(total % financialReportRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /*
     银行对账
     */
    @Override
    public BasePageResponse BankReconciliation(FinancialReportRequest financialReportRequest) {
        BaseResponse response;
        String data= financialReportRequest.getDate();
        String startTime=financialReportRequest.getStartTime();
        String endTime=financialReportRequest.getEndTime();
        if(startTime==""&& endTime==""){
            Date date1 = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM");
            data = format.format(date1); //2013-01-14
        }
        if(data!=null){
            try {
                String firstLast= DateFormatUtil.getTime(data);
                String[] str1 = firstLast.split(",");
                startTime = str1[0];
                endTime = str1[1];
            } catch (ParseException e) {
                e.printStackTrace();
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        }
        List<Map<String, Object>> result = financialReportDao.BankReconciliation(financialReportRequest.getPageSize(), financialReportRequest.getPageNum(),startTime,endTime);
        int total = financialReportDao.BankReconciliationCount(startTime,endTime);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (financialReportRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (financialReportRequest.getPageSize() * financialReportRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / financialReportRequest.getPageSize();
        pageResponse.setPages(total % financialReportRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }
}
