package com.kshl.huihuimall.console.dal.dao;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.console.base.pojo.OrderDetailProduct;
import com.kshl.huihuimall.console.base.pojo.ProfitPojo;

import java.util.List;
import java.util.Map;
public interface OrderDao {

    //分页查询订单
    List<Map<String,Object>> getAllOrder(Integer pageSize, Integer pageNum,Integer accountId ,String type, String orderstatus, String orderNumber, String storename,String startTime,String endTime,String entCode,String merchantname);

    int getAllOrderCount(Integer accountId,String type, String orderstatus, String orderNumber, String storename,String startTime,String endTime,String entCode,String merchantname);
    //添加订单
    int addOrder(StoreOrder storeOrder);
    //更新订单
    int updateOrder(StoreOrder storeOrder);
    //删除订单
    int deleteOrder(Integer id);
    //根据订单号查询订单详情
    List<OrderDetailProduct> getOrderDetail(String orderNumber);
    List<OrderDetailProduct> ReturnExchengDetail(String orderNumber);
    StoreOrder getOrderByOrderNumber(String orderNumber);

    //分页查询派单列表
    List<Map<String,Object>> sendOrder(Integer pageSize, Integer pageNum, String orderstatus, String orderNumber, String storename);
    int getAllsendOrder(String orderstatus,String orderNumber, String storename);
    //添加一条派单记录
    int addSendOrder(SendOrder sendOrder);
    //分页查询退换货列表
    List<Map<String,Object>> queryReturnExchangeOrder(Integer pageSize, Integer pageNum, Integer type, String orderNumber, String storeName, String orderType,Integer returnStatus, Integer exchangeStatus,Integer auditStatus);
    int queryReturnExchangeOrderCount(Integer type, String orderNumber, String storeName, String orderType,Integer returnStatus, Integer exchangeStatus,Integer auditStatus);
    //根据退换货单号查询退换货详情
    Map<String,Object> getRExchangeOrderByOrderNumber(String orderNumber);
    //退换货管理（不同意/同意）
    int updateReturnExchangeOrder(ReturnExchangeOrder returnExchangeOrder);

    StoreOrder getOrderById(String id);

    List<OrderDetail> getProductListbyCode(String code);

    int updateStoreOrder(StoreOrder storeOrder);

    int  updateReturnExchange(ReturnExchangeOrder returnExchangeOrder);

    //单条订单分润记录
    ProfitPojo getOrderProfit(Integer storeId,String orderNumber);

    // 插入分润
    int insertProfitRecord(ProfitRecord recommend);

    //分润集合
    List<ProfitPojo> getOrderProfitList(Integer storeId, String startTime, String endTime, int type, int status);

    //更新分润记录
    int updateOrderProfit(ProfitRecord profitRecord);
}
