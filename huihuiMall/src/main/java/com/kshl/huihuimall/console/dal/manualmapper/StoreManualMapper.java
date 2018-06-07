package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.console.base.pojo.StoreDetailPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StoreManualMapper {


    List<Map<String,Object>> queryStoreCheck(Map<String, Object> map);

    int queryStoreCheckCount(Map<String, Object> map);

    List<Map<String,Object>> queryStore(Map<String, Object> map);

    int queryStoreCount(Map<String, Object> map);

    int updateStore(Map<String, Object> map);

    List<StoreOrder> storeprofit(Integer id);

    List<Map<String,Object>> querystoreprofit(Map<String, Object> map);

    int querystoreprofitCount(Map<String, Object> map);

    List recommendClientList(Integer id);

    StoreDetailPojo queryStoreDetail(Integer id);

    int updateCheckStatus(Integer id);

    int updateStatusPass(@Param("id")Integer id,@Param("shopkeeperid") Integer shopkeeperid);

    int updateshopStart(Integer id);

    //门店管理
    int storeOpen(Integer id);
    int storeOff(Integer id);
    int shopkeepOpen(Integer id);
    int shopkeepOff(Integer id);

    Shopkeeper selectshopkeeperID(Integer id);
    int updateStorebyid(Store store);
    List<Storehouse> selectStroehouse();
    List<Map<String,Object>> getStoreDetail(Map<String, Object> map);
    List<Map<String,Object>> getStoreMgDetail(Map<String, Object> map);

    Store getStorebyShopkeeperId(Integer shopkeeperId);
}