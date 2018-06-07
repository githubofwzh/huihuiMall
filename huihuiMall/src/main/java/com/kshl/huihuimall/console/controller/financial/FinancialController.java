package com.kshl.huihuimall.console.controller.financial;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.console.controller.financial.request.StandardRequest;
import org.springframework.validation.BindingResult;
import com.kshl.huihuimall.console.controller.financial.request.TradeRequest;
import com.kshl.huihuimall.console.service.financial.FinancialService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

import java.util.Date;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

/**
 * 财务Controller
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/financial")
public class FinancialController {

    private static final Logger logger = LoggerFactory.getLogger(FinancialController.class);

    @Autowired
    private FinancialService financialService;

    /**
     * 分页查询交易对账记录
     *
     * @param tradeRequest
     * @return
     */
    @RequestMapping(value = "/queryAllPayInfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllPayInfo(TradeRequest tradeRequest) {
        logger.debug("queryAllPayInfo start");
        return financialService.queryAllPayInfo(tradeRequest);
    }

    /**
     * 添加一条交易对账记录
     *
     * @param tradeRequest
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/addPayInfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addPayInfo(@Valid TradeRequest tradeRequest,
                                   BindingResult bindingResult) {
        logger.debug("addPayInfo start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[TradeRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {

            Date date = new Date();
            tradeRequest.setPaytime(date);
            response = financialService.addPayInfo(tradeRequest);
        }
        return response;
    }


    /**
     * 更新一条交易对账记录
     *
     * @param tradeRequest
     * @return
     */
    @RequestMapping(value = "/updatePayInfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updatePayInfo(TradeRequest tradeRequest) {
        logger.debug("updatePayInfo start");
        BaseResponse response;
        if (tradeRequest.getId() == null) {
            logger.warn("[TradeRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = financialService.updatePayInfo(tradeRequest);
        }
        return response;
    }

    /**
     * 删除一条交易对账记录
     */
    @RequestMapping(value = "/deletePayInfo", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deletePayInfo(TradeRequest tradeRequest) {
        logger.debug("deletePayInfo start");
        BaseResponse response;
        if (tradeRequest.getId() == null) {
            logger.warn("[TradeRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = financialService.deletePayInfo(tradeRequest);
        }
        return response;
    }


    /**
     * 更新标准配置管理
     * @param standardRequest
     * @return
     */
    @RequestMapping(value = "/updateStandard", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateStandard(StandardRequest standardRequest) {
        logger.debug("updateStandard start");
        BaseResponse response;
        if (standardRequest.getId() == null) {
            logger.warn("[StandardRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = financialService.updateStandard(standardRequest);
        }
        return response;
    }

    /**
     * 查出财务配置
     * @return
     */
    @RequestMapping(value = "/getStandard", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getStandard() {
        logger.debug("getStandard start");
        return financialService.getStandard();
    }


}
