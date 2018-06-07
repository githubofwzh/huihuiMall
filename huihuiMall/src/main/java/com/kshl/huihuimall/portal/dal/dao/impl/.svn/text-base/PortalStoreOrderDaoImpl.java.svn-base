package com.kshl.huihuimall.portal.dal.dao.impl;

import com.kshl.huihuimall.base.dal.entity.InventoryOut;
import com.kshl.huihuimall.base.dal.entity.OrderDetail;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.base.dal.mapper.InventoryOutMapper;
import com.kshl.huihuimall.base.dal.mapper.OrderDetailMapper;
import com.kshl.huihuimall.base.dal.mapper.StoreOrderMapper;
import com.kshl.huihuimall.portal.dal.dao.PortalStoreOrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PortalStoreOrderDaoImpl implements PortalStoreOrderDao{
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Autowired
    private StoreOrderMapper storeOrderMapper;
    @Autowired
    private InventoryOutMapper inventoryOut;

    @Override
    public int insertStore(StoreOrder record) {
        return storeOrderMapper.insert(record);
    }

    @Override
    public int insertDetail(OrderDetail record) {
        return orderDetailMapper.insert(record);
    }

    @Override
    public int insert(InventoryOut record) {
        return inventoryOut.insert(record);
    }
}
