package com.kshl.huihuimall.console.controller.storehouse;

import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.console.controller.storehouse.model.StoreHouseExtends;
import com.kshl.huihuimall.console.controller.storehouse.request.StoreHouseMgrRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.console.controller.storehouse.request.StoreHouseRequest;
import com.kshl.huihuimall.console.service.storehouse.StoreHouseService;

import java.util.List;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

/**
 * 库房管理
 *
 * @author 刘广飞
 */
@Controller
@RequestMapping("/storeHouseMgmt")
public class StoreHouseMgmtController {

    private static final Logger logger = LoggerFactory.getLogger(StoreHouseMgmtController.class);

    @Autowired
    private StoreHouseService storeHouseService;

    /**
     * 分页查询库房信息
     * 筛选参数 area, storeHouseName
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/queryAllStoreHouse", method = {RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryAllStoreHouse(StoreHouseRequest request) {
        List<StoreHouseExtends> storehouses = storeHouseService.getAllStoreHouse(request);
        BasePageResponse<List<StoreHouseExtends>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(storehouses);
        return pageResponse;
    }

    /**
     * 添加库房信息
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/addStroeHouse", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addStroeHouse(StoreHouseMgrRequest request) {
        return storeHouseService.addStoreHouse(request);
    }

    /**
     * 修改库房信息
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateStroeHouse", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateStroeHouse(StoreHouseMgrRequest request) {
        return storeHouseService.updateStoreHouse(request);
    }

    /**
     * 修改库房信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/getStoreHouseById", method = {RequestMethod.GET})
    @ResponseBody
    public BaseResponse getStoreHouseById(Integer id) {
        StoreHouseExtends storeHouseExtends =  storeHouseService.getStoreHouseById(id);
        BaseResponse<StoreHouseExtends> response;
        if(storeHouseExtends != null) {
            response = ResponseBuilder.buildBasePageResponse(SUCCESS);
            response.setData(storeHouseExtends);
            return response;
        }
        response = ResponseBuilder.buildBasePageResponse(INVALID_PARAM);
        return response;
    }

    /**
     * 删除库房信息
     *
     */
    @RequestMapping(value = "/deleteStroeHouse", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteStroeHouse(Integer id) {
        return storeHouseService.deleteStoreHouse(id);
    }

    /**
     * 查询所有一级地区
     *
     */
    @RequestMapping(value = "/queryLevelOneArea", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse queryLevelOneArea() {
        return storeHouseService.getLevelOneArea();
    }

    /**
     * 更新库房管理员
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateManager", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateManager(StoreHouseMgrRequest request) {
        logger.debug("updateManager start");
        BaseResponse response;
        if (request.getId() == null||request.getManagerId()==null) {
            logger.warn("[StoreHouseMgrRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = storeHouseService.updateManager(request);
        }
        return response;
    }

   

}
