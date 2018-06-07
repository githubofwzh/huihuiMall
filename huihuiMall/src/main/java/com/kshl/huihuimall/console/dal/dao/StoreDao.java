package com.kshl.huihuimall.console.dal.dao;

import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.console.base.pojo.StoreDetailPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StoreDao {


    List<Map<String,Object>> queryStoreCheck(Integer pageSize, Integer pageNum, String shopName, String shopKeeper);

    int queryStoreCheckCount(String shopName, String shopKeeper);

    StoreDetailPojo queryStoreDetail(Integer id);

    int updateCheckStatus(Store store);

    List<Map<String,Object>> queryStore(int pageSize, int pageNum, Integer district, Integer provinceId, Integer town, Integer street, String storeName);

    int queryStoreCount(Integer district, Integer provinceId, Integer town, Integer street, String storeName);

    List recommendClientList(Integer id);

    int updateStore(String shopName, Integer keeperId, Integer deviceId, String storehouseId, String address, String remark, String tel);

    List<StoreOrder> storeprofit(Integer id);

    List<Map<String,Object>> querystoreprofit(Integer pageSize, Integer pageNum, String shopName);

    int querystoreprofitCount(String shopName);

    int updateCheckStatus(Integer id);

    int updateStatusPass(@Param("id")Integer id,@Param("shopkeeperid") Integer shopkeeperid);

    int updateshopStart(Integer id);

    int storeOpen(Integer id);
    int storeOff(Integer id);
    int shopkeepOpen(Integer id);
    int shopkeepOff(Integer id);

    Shopkeeper selectshopkeeperID(Integer shopkeeperId);

    int updateStorebyid(Store store);
    List<Storehouse> selectStroehouse();
    List<Map<String,Object>> getStoreDetail(Integer id);
    List<Map<String,Object>> getStoreMgDetail(Integer id);

    Store getStorebyShopkeeperId(Integer id);
}
