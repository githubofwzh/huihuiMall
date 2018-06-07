package com.kshl.huihuimall.console.controller.device;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.console.controller.device.request.DeviceRequest;
import com.kshl.huihuimall.console.service.device.DeviceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

/**
 * 社备管理订单Controller
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/device")
public class DeviceController {

    private static final Logger logger = LoggerFactory.getLogger(DeviceController.class);

    @Autowired
    private DeviceService deviceService;

    /**
     * 分页查询所有社备
     * @param deviceRequest
     * @return
     */
    @RequestMapping(value = "/queryAllDevice", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllDevice(DeviceRequest deviceRequest) {
        logger.debug("queryAllDevice start");
        return deviceService.queryAllDevice(deviceRequest);
    }

    /**
     * 添加一个终端社备
     * @param deviceRequest
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/addDevice", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addDevice(@Valid DeviceRequest deviceRequest,
                                 BindingResult bindingResult) {
        logger.debug("addDevice start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[DeviceRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = deviceService.addDevice(deviceRequest);
        }
        return response;
    }


    /**
     * 删除一条社备记录
     * @param deviceRequest
     * @return
     */
    @RequestMapping(value = "/deleteDevice", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteDevice(DeviceRequest deviceRequest) {
        logger.debug("deleteDevice start");
        BaseResponse response;
        if (deviceRequest.getId() == null) {
            logger.warn("[DeviceRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = deviceService.deleteDevice(deviceRequest);
        }
        return response;
    }

    /**
     * 解绑
     * @param deviceRequest
     * @return
     */
    @RequestMapping(value = "/updateDevice", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateDevice(DeviceRequest deviceRequest) {
        logger.debug("updateDevice start");
        BaseResponse response;
        if (deviceRequest.getId() == null) {
            logger.warn("[DeviceRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = deviceService.updateDevice(deviceRequest);
        }
        return response;
    }



}
