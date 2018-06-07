package com.kshl.huihuimall.portal.dal.dao;

import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.console.base.pojo.OrderCustomer;

import java.util.List;
import java.util.Map;

public interface FrontOrderDao {


    List<Map<String, Object>> getOrderByStoreId(Integer pageSize, Integer pageNum, Integer storeId, String orderstatus, String orderNumber);

    int getOrderByStoreIdCount(Integer storeId, String orderstatus, String orderNumber);
    //根据订单号更新订单状态
    int updateFrontOrder(StoreOrder storeOrder);

    OrderCustomer getOrderByOrderNumber(String orderNumber);
}
