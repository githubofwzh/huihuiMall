package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;

import java.util.List;
import java.util.Map;

/**
 * 店主账户
 */

public interface ShopKeeperManualMapper {

    List<Map<String,Object>> getAllShopKeeper(Map<String, Object> map);

    int getAllShopKeeperCount(Map<String, Object> map);

    Store getAuditstatusBystore(Integer openId);

    Shopkeeper getphnoe(String phoneNumber);

    int updateOpenId(Shopkeeper shopkeeper);

    Shopkeeper getOpenId(String openId);

    int deletePhone(String phoneNumber);
}
