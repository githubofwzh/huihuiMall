package com.kshl.huihuimall.portal.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;

import java.util.List;
import java.util.Map;

/**
 * 前台门店
 */

public interface FrontStoreManualMapper {


    Device getDeviceByStoreId(Integer id);

    List<Map<String,Object>> queryAllRecord(Map<String, Object> map);

    int queryAllRecordCount(Map<String, Object> map);
    //通过账户得门店id
    Shopkeeper getStoreId(String account);
   //更新社备
    int updateDevice(Device device);
    //根据门店id查询店主信息
    Shopkeeper getShopKeeperById(Integer id);
    //根据门店Id清除之前社备
    int updateDeviceByStoreId(Integer storeId);

    int updateShopKeeper(Shopkeeper shopkeeper);
}
