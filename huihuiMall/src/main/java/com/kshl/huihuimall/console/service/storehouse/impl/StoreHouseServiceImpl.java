package com.kshl.huihuimall.console.service.storehouse.impl;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.dao.Account.AccountDao;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.console.controller.storehouse.model.StoreHouseExtends;
import com.kshl.huihuimall.console.controller.storehouse.request.StoreHouseMgrRequest;
import com.kshl.huihuimall.console.controller.storehouse.request.StoreHouseRequest;
import com.kshl.huihuimall.console.dal.dao.StoreHouseDao;
import com.kshl.huihuimall.console.service.storehouse.StoreHouseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.REQUEST_FAILED;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class StoreHouseServiceImpl implements StoreHouseService {


    @Autowired
    private StoreHouseDao storeHouseDao;

    @Autowired
    private AccountDao accountDao;

    @Override
    public List<StoreHouseExtends> getAllStoreHouse(StoreHouseRequest request) {
        List<Storehouse> result = storeHouseDao.getAllStoreHouse(request.getPageSize(),
                request.getPageNum(), request.getAreaId(), request.getStoreHouseName());
        List<StoreHouseExtends> storeHouseExtends = new ArrayList<>();
        for(Storehouse storehouse :result) {
            StoreHouseExtends houseExtend = new StoreHouseExtends();
            BeanUtils.copyProperties(storehouse, houseExtend);
            if(storehouse.getManagerId() != null && storehouse.getManagerId() > 0) {
                KsAccount ksAccount = accountDao.getAccountById(storehouse.getManagerId());
                houseExtend.setManagerName(ksAccount.getName());
                houseExtend.setPhone(ksAccount.getPhone());
            }
            storeHouseExtends.add(houseExtend);
        }
        return storeHouseExtends;
    }

    @Override
    public BaseResponse addStoreHouse(StoreHouseMgrRequest request) {
        BaseResponse response;
        int add = storeHouseDao.addStoreHouse(request.getStoreHouseName(), request.getAreaId(), request.getAreaName(), request.getSpace(), request.getAddress());
        if (add > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse updateStoreHouse(StoreHouseMgrRequest request) {
        BaseResponse response;
        int result = storeHouseDao.updateStoreHouse(request.getId(), request.getStoreHouseName(), request.getAreaId(), request.getAreaName(), request.getSpace(), request.getAddress());
        if (result > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse deleteStoreHouse(Integer id) {
        BaseResponse response;
        int delete = storeHouseDao.deleteStoreHouse(id);
        if (delete > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse getLevelOneArea() {
        List<Map<String, Object>> result = storeHouseDao.getAllLevelOneArea();
        BaseResponse response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(result);
        return response;
    }

    @Override
    public StoreHouseExtends getStoreHouseById(Integer id) {
        return storeHouseDao.getStoreHouseById(id);
    }

    /**
     * 更新库房管理员
     * @param request
     * @return
     */
    @Override
    public BaseResponse updateManager(StoreHouseMgrRequest request) {
        BaseResponse response;
        Storehouse storehouse = storeHouseDao.findStoreHouseById(request.getManagerId());
        if (storehouse==null){
            //没绑定库房id
            Storehouse house = new Storehouse();
            BeanUtils.copyProperties(request, house);
            int update = storeHouseDao.updateManager(house);
            if (update > 0) {
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
            } else {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        }else {
            response = ResponseBuilder.buildBaseResponse(REQUEST_FAILED);
            response.setData(100055);
        }
        return response;
    }
}
