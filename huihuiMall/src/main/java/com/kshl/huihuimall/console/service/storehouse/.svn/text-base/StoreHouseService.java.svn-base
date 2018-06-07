package com.kshl.huihuimall.console.service.storehouse;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.console.controller.storehouse.request.StoreHouseMgrRequest;
import com.kshl.huihuimall.console.controller.storehouse.request.StoreHouseRequest;
import com.kshl.huihuimall.console.controller.storehouse.model.StoreHouseExtends;

import java.util.List;

public interface StoreHouseService {

    List<StoreHouseExtends> getAllStoreHouse(StoreHouseRequest request);
    
    BaseResponse addStoreHouse(StoreHouseMgrRequest request);
    
    BaseResponse updateStoreHouse(StoreHouseMgrRequest request);
    
    BaseResponse deleteStoreHouse(Integer id);
    
    BaseResponse getLevelOneArea();

    StoreHouseExtends getStoreHouseById(Integer id);
    //更新库房管理员
    BaseResponse updateManager(StoreHouseMgrRequest request);
}
