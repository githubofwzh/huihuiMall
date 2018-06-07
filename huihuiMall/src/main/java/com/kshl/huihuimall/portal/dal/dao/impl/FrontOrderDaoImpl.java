package com.kshl.huihuimall.portal.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.base.dal.mapper.StoreOrderMapper;
import com.kshl.huihuimall.console.base.pojo.OrderCustomer;
import com.kshl.huihuimall.portal.dal.dao.FrontOrderDao;
import com.kshl.huihuimall.portal.dal.manualmapper.FrontOrderManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FrontOrderDaoImpl implements FrontOrderDao {

    @Autowired
    private FrontOrderManualMapper frontOrderManualMapper;


    @Autowired
    private StoreOrderMapper storeOrderMapper;

    @Override
    public List<Map<String, Object>> getOrderByStoreId(Integer pageSize, Integer pageNum, Integer storeId, String orderstatus, String orderNumber) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if (!KSStringUtils.isEmpty(orderstatus)) {
            map.put("orderstatus", orderstatus);
        }
        if (storeId != null) {
            map.put("storeId", storeId);
        }
        if (!KSStringUtils.isEmpty(orderNumber)) {
            map.put("orderNumber", orderNumber);
        }
        return frontOrderManualMapper.getOrderByStoreId(map);
    }

    @Override
    public int getOrderByStoreIdCount(Integer storeId, String orderstatus, String orderNumber) {
        Map<String, Object> map = new HashMap<>();

        if (!KSStringUtils.isEmpty(orderstatus)) {
            map.put("orderstatus", orderstatus);
        }
        if (storeId != null) {
            map.put("storeId", storeId);
        }
        if (!KSStringUtils.isEmpty(orderNumber)) {
            map.put("orderNumber", orderNumber);
        }
        return frontOrderManualMapper.getOrderByStoreIdCount(map);
    }


    @Override
    public int updateFrontOrder(StoreOrder storeOrder) {
        return frontOrderManualMapper.updateFrontOrder(storeOrder);
    }

    /**
     * 查看订单详情（联表）
     * @param orderNumber
     * @return
     */
    @Override
    public OrderCustomer getOrderByOrderNumber(String orderNumber) {
        return frontOrderManualMapper.getOrderByOrderNumber(orderNumber);
    }
}
