package com.kshl.huihuimall.console.service.device.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.console.controller.device.request.DeviceRequest;
import com.kshl.huihuimall.console.dal.dao.DeviceDao;
import com.kshl.huihuimall.console.service.device.DeviceService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.*;

@Service
public class DeviceServiceImpl implements DeviceService {


    @Autowired
    private DeviceDao deviceDao;

    /**
     * 分页查询所有社备
     * @param deviceRequest
     * @return
     */
    @Override
    public BasePageResponse queryAllDevice(DeviceRequest deviceRequest) {
        List<Map<String, Object>> result = deviceDao.getAllDevice(deviceRequest.getPageSize(), deviceRequest.getPageNum(),deviceRequest.getDeviceCode(),deviceRequest.getName(),deviceRequest.getBindingStatus());
        int total = deviceDao.getAllDeviceCount(deviceRequest.getDeviceCode(),deviceRequest.getName(),deviceRequest.getBindingStatus());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (deviceRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (deviceRequest.getPageSize() * deviceRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / deviceRequest.getPageSize();
        pageResponse.setPages(total % deviceRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /**
     * 添加一条社备信息
     * @param deviceRequest
     * @return
     */
    @Override
    public BaseResponse addDevice(DeviceRequest deviceRequest) {
        BaseResponse response;
        Device device =new Device();
        BeanUtils.copyProperties(deviceRequest, device);
        int inseret = deviceDao.addDevice(device);
        if (inseret > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 删除一条社备记录
     * @param deviceRequest
     * @return
     */
    @Override
    public BaseResponse deleteDevice(DeviceRequest deviceRequest) {
        BaseResponse response;
        Device device = deviceDao.findDeviceById(deviceRequest.getId());
        //状态为0 是未绑定状态
        if (device.getStoreId()!=null||device.getBindingStatus()!=0){
            response = ResponseBuilder.buildBaseResponse(REQUEST_FAILED);
        }else{
            int delete = deviceDao.deleteDevice(deviceRequest.getId());
            if (delete > 0) {
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
            } else {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        }
        return response;
    }


    /**
     * 解绑
     * @param deviceRequest
     * @return
     */
    @Override
    public BaseResponse updateDevice(DeviceRequest deviceRequest) {
        BaseResponse response;
        Device device = new Device();
        BeanUtils.copyProperties(deviceRequest, device);
        int update = deviceDao.updateDevice(device);
        if (update > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }


}
