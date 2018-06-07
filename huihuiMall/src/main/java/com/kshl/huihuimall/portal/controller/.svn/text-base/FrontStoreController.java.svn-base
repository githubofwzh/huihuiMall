package com.kshl.huihuimall.portal.controller;

import com.kshl.base.common.utils.KSHLUtils;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.console.controller.account.request.ShopKeeperRequest;
import com.kshl.huihuimall.console.controller.device.request.DeviceRequest;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.portal.controller.request.StoreApplyRequest;
import com.kshl.huihuimall.portal.controller.request.StoreRequest;
import com.kshl.huihuimall.portal.service.frontstore.FrontStoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

/**
 * 前台店主端门店Controller
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/frontstore")
public class FrontStoreController {

    private static final Logger logger = LoggerFactory.getLogger(FrontStoreController.class);

    @Autowired
    private FrontStoreService frontStoreService;

    /**
     * 获取门店信息接口
     * @param storeRequest
     * @return
     */
    @RequestMapping(value = "/getFrontStoreDetail", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getFrontStoreDetail(StoreRequest storeRequest) {
        logger.debug("getFrontStoreDetail start");
        BaseResponse response;
        if (storeRequest.getId() == null) {
            logger.warn("[StoreRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = frontStoreService.getFrontStoreDetail(storeRequest.getId());
        }
        return response;
    }


    /**
     * 判断是否有该设备
     */
    @RequestMapping(value = "/isDevice", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Boolean isDevice(String deviceCode) {
        logger.debug("isDevice start");
        if (KSHLUtils.isNotEmpty(deviceCode)) {
            return false;
        } else {
            return frontStoreService.isDevice(deviceCode);
        }
    }


    /**
     * 绑定终端设备接口
     */
    @RequestMapping(value = "/updateDevice", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateDevice(DeviceRequest deviceRequest) {
        logger.debug("updateDevice start");
        BaseResponse response;
        if (deviceRequest.getStoreId()==null) {
            logger.warn("[DeviceRequest] param error StoreId can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = frontStoreService.updateDevice(deviceRequest);
        }
        return response;
    }

    /**
     * 获取门店销售记录接口
     * @param orderRequest
     * @return
     */
    @RequestMapping(value = "/queryAllRecord", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllRecord(OrderRequest orderRequest) {
        logger.debug("queryAllRecord start");
        return frontStoreService.queryAllRecord(orderRequest);
    }


    /**
     * 开店申请接口
     * @param storeApplyRequest
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/addStoreApply", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addStoreApply(StoreApplyRequest storeApplyRequest,
                                      BindingResult bindingResult, HttpServletRequest request) {
        logger.debug("addStoreApply start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[StoreApplyRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            Date date = new Date();
            storeApplyRequest.setApplyTime(date);
            response = frontStoreService.addStoreApply(storeApplyRequest,request);
        }
        return response;
    }

    /**
     * 通过账户得门店id
     * @param shopKeeperRequest
     * @return
     */
    @RequestMapping(value = "/getStoreId", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getOrderDetail(ShopKeeperRequest shopKeeperRequest) {
        logger.debug("getStoreId start");
        BaseResponse response;
        if (shopKeeperRequest.getAccount() == null) {
            logger.warn("[shopKeeperRequest] param error account can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = frontStoreService.getStoreId(shopKeeperRequest);
        }
        return response;
    }





}
