package com.kshl.huihuimall.portal.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.console.base.pojo.OrderCustomer;

import java.util.List;
import java.util.Map;

/**
 * 前台订单
 */

public interface FrontOrderManualMapper {


    List<Map<String,Object>> getOrderByStoreId(Map<String, Object> map);

    int getOrderByStoreIdCount(Map<String, Object> map);
    //更新订单状态（收货取货）
    int updateFrontOrder(StoreOrder storeOrder);
    //查看订单详情（联表）
    OrderCustomer getOrderByOrderNumber(String orderNumber);
}
