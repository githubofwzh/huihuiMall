package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.ProfitRecord;
import com.kshl.huihuimall.base.dal.entity.ReturnExchangeOrder;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.console.base.pojo.OrderDetailProduct;
import com.kshl.huihuimall.console.base.pojo.ProfitPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 订单
 */

public interface OrderManualMapper {

    List<Map<String, Object>> getAllOrder(Map<String, Object> map);

    Integer getAllOrderCount(Map<String, Object> map);

    List<OrderDetailProduct> getOrderDetail(String orderNumber);

    StoreOrder getOrderByOrderNumber(String orderNumber);

    //派单Count
    int getAllsendOrder(Map<String, Object> map);
    //派单集合
    List<Map<String,Object>> sendOrder(Map<String, Object> map);
    //退换货集合
    List<Map<String,Object>> queryReturnExchangeOrder(Map<String, Object> map);
    //退换货Count
    int queryReturnExchangeOrderCount(Map<String, Object> map);
    //根据退换货单号查询退换货详情
    Map<String,Object> getRExchangeOrderByOrderNumber(String orderNumber);

    StoreOrder getOrderById(String id);

    List<Map<String,Object>> queryOutInventory(Map<String, Object> map);

    int queryOutInventoryCount(Map<String, Object> map);

    int updateStoreOrder(StoreOrder storeOrder);

    int  updateReturnExchange(ReturnExchangeOrder returnExchangeOrder);

    //单条订单分润记录
    ProfitPojo getOrderProfit(@Param("storeId") Integer storeId,  @Param("orderNumber")String orderNumber);

    //门店分润集合
    List<ProfitPojo> getOrderProfitList(@Param("storeId")Integer storeId, @Param("startTime")String startTime, @Param("endTime")String endTime, @Param("type")int type, @Param("status")int status);
   //换货出库管理
    List<Map<String,Object>> exchengOutInventory(Map<String, Object> map);

    int exchengOutInventoryCount(Map<String, Object> map);

    List<OrderDetailProduct> ReturnExchengDetail(String orderNumber);

    int updateOrderProfit(ProfitRecord profitRecord);
}
