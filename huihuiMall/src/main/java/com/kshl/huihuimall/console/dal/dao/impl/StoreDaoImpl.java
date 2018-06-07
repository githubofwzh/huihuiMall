package com.kshl.huihuimall.console.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.base.dal.mapper.StoreApplyMapper;
import com.kshl.huihuimall.base.dal.mapper.StoreMapper;
import com.kshl.huihuimall.console.base.pojo.StoreDetailPojo;
import com.kshl.huihuimall.console.dal.dao.StoreDao;
import com.kshl.huihuimall.console.dal.manualmapper.StoreManualMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class StoreDaoImpl implements StoreDao {

    @Autowired
    private StoreMapper storeMapper;
    @Autowired
    private StoreManualMapper storeManualMapper;
    @Autowired
    private StoreApplyMapper storeApplyMapper;


    @Override
    public List<Map<String, Object>> queryStoreCheck(Integer pageSize, Integer pageNum, String shopName, String shopKeeper) {

        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(shopName)){
            map.put("shopName", shopName);
        }
        if(!KSStringUtils.isEmpty(shopKeeper)){
            map.put("shopKeeper", shopKeeper);
        }
         map.put("status", Constants.COMPANY_AUDIT_STATUS.AUDITING);
        return storeManualMapper.queryStoreCheck(map);
    }

    @Override
    public int queryStoreCheckCount(String shopName, String shopKeeper) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(shopName)){
            map.put("shopName", shopName);
        }
        if(!KSStringUtils.isEmpty(shopKeeper)){
            map.put("shopKeeper", shopKeeper);
        }
        return storeManualMapper.queryStoreCheckCount(map);

    }

    @Override
    public StoreDetailPojo queryStoreDetail(Integer id) {
         return  storeManualMapper.queryStoreDetail(id);
    }

    @Override
    public int updateCheckStatus(Store store) {

        return  storeMapper.updateByPrimaryKey(store);
    }

    @Override
    public List<Map<String, Object>> queryStore(int pageSize, int pageNum, Integer district, Integer provinceId, Integer town, Integer street, String storeName) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(storeName)){
            map.put("storeName", storeName);
        }

        return storeManualMapper.queryStore(map);
    }

    @Override
    public int queryStoreCount(Integer district, Integer provinceId, Integer town, Integer street, String storeName) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(storeName)){
            map.put("storeName", storeName);
        }
        return storeManualMapper.queryStoreCount(map);
    }

    @Override
    public int updateStore(String shopName, Integer keeperId, Integer deviceId,
                           String storehouseId, String address, String remark, String tel) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(shopName)){
            map.put("shopName",shopName);
        }
        if(!KSStringUtils.isEmpty(storehouseId)){
            map.put("storehouseId",storehouseId);
        }
        if(!KSStringUtils.isEmpty(address)){
            map.put("address",address);
        }
        if(!KSStringUtils.isEmpty(remark)){
            map.put("remark",remark);
        }
        if(!KSStringUtils.isEmpty(tel)){
            map.put("tel",tel);
        }
        if(keeperId!=null){
            map.put("keeperId",keeperId);
        }
        if(deviceId!=null){
            map.put("deviceId",deviceId);
        }


        return storeManualMapper.updateStore(map);
    }

    @Override
    public List<StoreOrder> storeprofit(Integer id) {
        return storeManualMapper.storeprofit(id);
    }

    @Override
    public List<Map<String, Object>> querystoreprofit(Integer pageSize, Integer pageNum, String shopName) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(shopName)){
            map.put("shopName", shopName);
        }

        return storeManualMapper.querystoreprofit(map);
    }

    @Override
    public int querystoreprofitCount(String shopName) {
        Map<String, Object> map = new HashMap<>();

        if(!KSStringUtils.isEmpty(shopName)){
            map.put("shopName", shopName);
        }
        return storeManualMapper.querystoreprofitCount(map);
    }

    @Override
    public int updateCheckStatus(Integer id) {
        return storeManualMapper.updateCheckStatus(id);
    }

    @Override
    public int updateStatusPass(@Param("id")Integer id, @Param("shopkeeperid") Integer shopkeeperid) {
        return storeManualMapper.updateStatusPass(id, shopkeeperid);
    }

    @Override
    public int updateshopStart(Integer id) {
        return storeManualMapper.updateshopStart(id);
    }

    @Override
    public int storeOpen(Integer id) {
        return storeManualMapper.storeOpen(id);
    }

    @Override
    public int storeOff(Integer id) {
        return storeManualMapper.storeOff(id);
    }

    @Override
    public int shopkeepOpen(Integer id) {
        return storeManualMapper.shopkeepOpen(id);
    }

    @Override
    public int shopkeepOff(Integer id) {
        return storeManualMapper.shopkeepOff(id);
    }

    @Override
    public int updateStorebyid(Store store) {
        return storeManualMapper.updateStorebyid(store);
    }

    @Override
    public List<Storehouse> selectStroehouse() {
        return storeManualMapper.selectStroehouse();
    }

    @Override
    public List<Map<String, Object>> getStoreDetail(Integer id) {
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        return storeManualMapper.getStoreDetail(map);
    }

    @Override
    public List<Map<String, Object>> getStoreMgDetail(Integer id) {
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        return storeManualMapper.getStoreMgDetail(map);
    }

    @Override
    public Store getStorebyShopkeeperId(Integer shopkeeperId) {
        return storeManualMapper.getStorebyShopkeeperId(shopkeeperId);
    }


    @Override
    public Shopkeeper selectshopkeeperID(Integer id) {
        return storeManualMapper.selectshopkeeperID(id);
    }


    @Override
    public List recommendClientList(Integer id) {
        return storeManualMapper.recommendClientList(id);
    }


}
