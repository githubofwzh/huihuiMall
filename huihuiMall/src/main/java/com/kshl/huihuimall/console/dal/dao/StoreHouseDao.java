package com.kshl.huihuimall.console.dal.dao;

import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.console.controller.inventory.request.InventoryRequest;
import com.kshl.huihuimall.console.controller.storehouse.model.StoreHouseExtends;

import java.util.List;
import java.util.Map;

public interface StoreHouseDao {

    List<Storehouse> getAllStoreHouse(Integer pageSize, Integer pageNum, Integer areaId, String storeHouseName);

    int addStoreHouse(String storeHouseName, Integer areaId, String areaName, Double space, String address);
    
    int updateStoreHouse(Integer id, String storeHouseName, Integer areaId, String areaName, Double space, String address);
    
    int deleteStoreHouse(Integer id);
    
    public List<Map<String, Object>> getAllLevelOneArea();

    StoreHouseExtends getStoreHouseById(Integer id);

    Storehouse getStoreHousebyManageId(Integer accountId);

    List<Storehouse> getStorehouseList();

    //根据managerId查询库房
    Storehouse findStoreHouseById(Integer id);
    //更新库房管理员
    int updateManager(Storehouse house);
}
