package com.kshl.huihuimall.console.dal.dao;

import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;

import java.util.List;
import java.util.Map;

public interface ShopKeeperDao {

    //分页查询店主账户
    List<Map<String,Object>> getAllShopKeeper(Integer pageSize, Integer pageNum, String storeName, Integer status);
    //店主账户数量
    int getAllShopKeeperCount(String storeName,Integer status);

    int updateShopKeeper(Shopkeeper shopkeeper);

    Shopkeeper getOpenId(String openId);

    Store getAuditstatusBystore(Integer storeId);

    Shopkeeper getphnoe(String phoneNumber);

    int updateOpenId(Shopkeeper shopkeeper);

    int deletePhone(String phoneNumber);
}
