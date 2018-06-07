package com.kshl.huihuimall.portal.dal.dao;

import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;

import java.util.List;
import java.util.Map;

public interface FrontStoreDao {
    //根据门店id 查询终端
    Device getDeviceByStoreId(Integer id);

   //根据门店id查询门店信息
    Store getStoreById(Integer id);

    int updateDevice(Device device);

    List<Map<String,Object>> queryAllRecord(Integer pageSize, Integer pageNum, String orderstatus,  String startTime, String endTime, Integer storeId);

    int queryAllRecordCount(String orderstatus, String startTime, String endTime, Integer storeId);
    //开店申请
    int addStoreApply(Store store);
    //添加店主信息
    int addShopKeeper(Shopkeeper shopkeeper);
    //通过账户得门店id
    Shopkeeper getStoreId(String account);

    int updateStore(Store store);

    Shopkeeper getShopKeeperById(Integer id);
    //根据门店Id清除之前社备
    int updateDeviceByStoreId(Integer storeId);

    int updateShopKeeper(Shopkeeper shopkeeper);
}
