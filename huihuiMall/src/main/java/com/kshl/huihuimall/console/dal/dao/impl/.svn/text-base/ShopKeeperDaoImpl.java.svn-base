package com.kshl.huihuimall.console.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.base.dal.mapper.ShopkeeperMapper;
import com.kshl.huihuimall.console.dal.dao.ShopKeeperDao;
import com.kshl.huihuimall.console.dal.manualmapper.ShopKeeperManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ShopKeeperDaoImpl implements ShopKeeperDao {


    @Autowired
    private ShopKeeperManualMapper shopKeeperManualMapper;

    @Autowired
    private ShopkeeperMapper shopkeeperMapper;

    /**
     * 查询店主集合
     * @param pageSize
     * @param pageNum
     * @param storeName
     * @param status
     * @return
     */
    @Override
    public List<Map<String, Object>> getAllShopKeeper(Integer pageSize, Integer pageNum, String storeName, Integer status) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(storeName)){
            map.put("storeName", storeName);
        }
        if (status!=null){
            map.put("status", status);
        }
        return shopKeeperManualMapper.getAllShopKeeper(map);
    }

    /**
     * 查询店主数量
     * @param storeName
     * @param status
     * @return
     */
    @Override
    public int getAllShopKeeperCount(String storeName,Integer status) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(storeName)){
            map.put("storeName", storeName);
        }
        if (status!=null){
            map.put("status", status);
        }
        return shopKeeperManualMapper.getAllShopKeeperCount(map);
    }

    /**
     * 店主账户的启用禁用
     * @param shopkeeper
     * @return
     */
    @Override
    public int updateShopKeeper(Shopkeeper shopkeeper) {
        return shopkeeperMapper.updateByPrimaryKeySelective(shopkeeper);
    }

    @Override
    public  Shopkeeper getOpenId(String openId) {
        return shopKeeperManualMapper.getOpenId(openId);
    }

    @Override
    public Store getAuditstatusBystore(Integer storeId) {

        return shopKeeperManualMapper.getAuditstatusBystore(storeId);
    }

    @Override
    public Shopkeeper getphnoe(String phoneNumber) {

        return shopKeeperManualMapper.getphnoe(phoneNumber);
    }

    @Override
    public int updateOpenId(Shopkeeper shopkeeper) {
        return shopKeeperManualMapper.updateOpenId(shopkeeper);
    }

    @Override
    public int deletePhone(String phoneNumber) {
        return shopKeeperManualMapper.deletePhone(phoneNumber);
    }


}
