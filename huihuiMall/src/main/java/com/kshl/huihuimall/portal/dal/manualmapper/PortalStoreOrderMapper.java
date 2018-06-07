package com.kshl.huihuimall.portal.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.InventoryOut;
import com.kshl.huihuimall.base.dal.entity.OrderDetail;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;

public interface PortalStoreOrderMapper {
    int insert(StoreOrder record);

    int insert(OrderDetail record);

    int insert(InventoryOut record);
}
