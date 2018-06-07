package com.kshl.huihuimall.portal.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.base.dal.mapper.DeviceMapper;
import com.kshl.huihuimall.base.dal.mapper.ShopkeeperMapper;
import com.kshl.huihuimall.base.dal.mapper.StoreApplyMapper;
import com.kshl.huihuimall.base.dal.mapper.StoreMapper;
import com.kshl.huihuimall.portal.dal.dao.FrontStoreDao;
import com.kshl.huihuimall.portal.dal.manualmapper.FrontStoreManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FrontStoreDaoImpl implements FrontStoreDao {


    @Autowired
    private FrontStoreManualMapper frontStoreManualMapper;

    @Autowired
    private StoreMapper storeMapper;

    @Autowired
    private DeviceMapper deviceMapper;

    @Autowired
    private StoreApplyMapper  storeApplyMapper;
    @Autowired
    private ShopkeeperMapper shopkeeperMapper;

    @Override
    public Device getDeviceByStoreId(Integer id) {
        return frontStoreManualMapper.getDeviceByStoreId(id);
    }

    @Override
    public Store getStoreById(Integer id) {
        return storeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateDevice(Device device) {
        return frontStoreManualMapper.updateDevice(device);
    }

    @Override
    public List<Map<String, Object>> queryAllRecord(Integer pageSize, Integer pageNum, String orderstatus, String startTime, String endTime, Integer storeId) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(orderstatus)){
            map.put("orderstatus", orderstatus);
        }

        //日期转换
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            if (startTime!=null){
                Date start= sdf.parse(startTime);
                map.put("start", start);
            }
            if (endTime!=null){
                Date end= sdf.parse(endTime);
                map.put("end", end);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (storeId!=null){
            map.put("storeId", storeId);
        }
        return frontStoreManualMapper.queryAllRecord(map);
    }


    @Override
    public int queryAllRecordCount(String orderstatus, String startTime, String endTime, Integer storeId) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(orderstatus)){
            map.put("orderstatus", orderstatus);
        }
        //日期转换
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            if (startTime!=null){
                Date start= sdf.parse(startTime);
                map.put("start", start);
            }
            if (endTime!=null){
                Date end= sdf.parse(endTime);
                map.put("end", end);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (storeId!=null){
            map.put("storeId", storeId);
        }

        return frontStoreManualMapper.queryAllRecordCount(map);
    }

    /**
     * 开店申请接口
     * @param store
     * @return
     */
    @Override
    public int addStoreApply(Store store) {
        return storeMapper.insertSelective(store);
    }

    /**
     * 添加店主信息
     * @param shopkeeper
     * @return
     */
    @Override
    public int addShopKeeper(Shopkeeper shopkeeper) {
        return shopkeeperMapper.insertSelective(shopkeeper);
    }

    /**
     * 通过账户得门店id
     * @param account
     * @return
     */
    @Override
    public Shopkeeper getStoreId(String account) {
        return frontStoreManualMapper.getStoreId(account);
    }

    /**
     * 更新门店信息
     * @param store
     * @return
     */
    @Override
    public int updateStore(Store store) {
        return storeMapper.updateByPrimaryKeySelective(store);
    }

    /**
     * 根据门店id查询店主信息
     * @param id
     * @return
     */
    @Override
    public Shopkeeper getShopKeeperById(Integer id) {
        return frontStoreManualMapper.getShopKeeperById(id);
    }

    /**
     * 根据门店Id清除之前社备
     * @param storeId
     * @return
     */
    @Override
    public int updateDeviceByStoreId(Integer storeId) {
        return frontStoreManualMapper.updateDeviceByStoreId(storeId);
    }

    /**
     * 更新店主信息
     * @param shopkeeper
     * @return
     */
    @Override
    public int updateShopKeeper(Shopkeeper shopkeeper) {
        return frontStoreManualMapper.updateShopKeeper(shopkeeper);
    }
}
