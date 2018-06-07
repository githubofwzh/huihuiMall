package com.kshl.huihuimall.console.service.financial.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.FinancialConfigure;
import com.kshl.huihuimall.base.dal.entity.Payinfo;
import com.kshl.huihuimall.console.controller.financial.request.StandardRequest;
import com.kshl.huihuimall.console.controller.financial.request.TradeRequest;
import com.kshl.huihuimall.console.dal.dao.FinancialDao;
import com.kshl.huihuimall.console.service.financial.FinancialService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;
import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

@Service
public class FinancialServiceImpl implements FinancialService {


    @Autowired
    private FinancialDao financialDao;


    /**
     * 分页查询列表
     *
     * @param tradeRequest
     * @return
     */
    @Override
    public BasePageResponse queryAllPayInfo(TradeRequest tradeRequest) {
        List<Map<String, Object>> result = financialDao.queryAllPayInfo(tradeRequest.getPageSize(), tradeRequest.getPageNum(), tradeRequest.getType(), tradeRequest.getOutTradeNo(), tradeRequest.getPaytype(),tradeRequest.getPaystatus(), tradeRequest.getStartTime(), tradeRequest.getEndTime());
        int total = financialDao.getPayInfoCount(tradeRequest.getType(), tradeRequest.getOutTradeNo(), tradeRequest.getPaytype(),tradeRequest.getPaystatus(), tradeRequest.getStartTime(), tradeRequest.getEndTime());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (tradeRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (tradeRequest.getPageSize() * tradeRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / tradeRequest.getPageSize();
        pageResponse.setPages(total % tradeRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /**
     * 添加一条交易记录
     *
     * @param tradeRequest
     * @return
     */
    @Override
    public BaseResponse addPayInfo(TradeRequest tradeRequest) {
        BaseResponse response;
        Payinfo payinfo = new Payinfo();
        BeanUtils.copyProperties(tradeRequest, payinfo);
        int inseret = financialDao.addPayInfo(payinfo);
        if (inseret > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }


    /**
     * 更新一条交易对账记录
     *
     * @param tradeRequest
     * @return
     */
    @Override
    public BaseResponse updatePayInfo(TradeRequest tradeRequest) {
        BaseResponse response;
        Payinfo payinfo = new Payinfo();
        BeanUtils.copyProperties(tradeRequest, payinfo);
        int update = financialDao.updatePayInfo(payinfo);
        if (update > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 删除一条交易对账记录
     *
     * @param tradeRequest
     * @return
     */
    @Override
    public BaseResponse deletePayInfo(TradeRequest tradeRequest) {
        BaseResponse response;
        int delete = financialDao.deleteOrder(tradeRequest.getId());
        if (delete > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 更新标准配置管理
     * @param standardRequest
     * @return
     */
    @Override
    public BaseResponse updateStandard(StandardRequest standardRequest) {
        BaseResponse response;
        FinancialConfigure financialConfigure = new FinancialConfigure();
        BeanUtils.copyProperties(standardRequest, financialConfigure);
        int update = financialDao.updateStandard(financialConfigure);
        if (update > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 查出财务配置
     * @return
     */
    @Override
    public BaseResponse getStandard() {
        BaseResponse response;
        List<FinancialConfigure> standardList = financialDao.getStandard();
        if (standardList != null && standardList.size() > 0 ) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(standardList);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }


}
