package com.kshl.huihuimall.portal.dal.dao;

import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.portal.controller.request.ReturnRecordquest;
import com.kshl.huihuimall.portal.controller.request.ReturnRequest;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AllOrderDao {

    List<Map<String, Object>> getAllOrder(@Param("userId")Integer userId,@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize);

    int getAllOrderCount(Integer userId);

    List<ReturnRecordquest> getDetail(String orderNumber);

    List<Map<String,Object>> getReturnP(String orderNumber, Integer prId);

    ReturnRequest getReturnAdd(@Param("orderNumber")String orderNumber, @Param("prId")Integer prId);

    List<OrderDetail> getReturnStatus(Integer userId);

    List<Map<String, Object>> selfServiceReturnStatus(Integer storeId,Integer type,String orderNumber);

    int UserReStatus(Integer returnStatus,Integer exchangeStatus,String orderNumber);

    int selfServiceStatus(Integer auditStatus,String orderNumber);

    int ReorderStatus(@Param("order_number")String order_number,@Param("pending")Integer pending,@Param("prId")Integer prId);

    List<Map<String,Object>> getReturnDetail(String orderNumber,Integer prId);

    List<ReturnRecordquest> getDetailReturnStatus(String orderNumber);

    int insert(ReturnExchangeOrder record);

    List<StoreOrder> userIdIfExist(Integer userId);

    int insert(InventoryIn record);
//支付失败之后的处理
    int updateStoreOrderIf(String parentid);

    int Detaildelete(String orderNumber);

    int deleteOrder(String orderNumber);

    int deleteInventoryOut(String orderNumber);

    OrderDetail selectOrdertotal(String orderNumber);

    int Ordertotal(StoreOrder storeOrder);

    List<StoreOrder> selectorderNumber();

    String selectEntcode(String name);

    List<Map<String,Object>> ReturnRecord(Integer type,Integer pageNum,Integer pageSize,String orderNumber,String storeName,String startTime,String endTime);

    int ReturnRecordCount(Integer type,String orderNumber,String storeName,String startTime,String endTime);

    Map<String,Object> ReturnRecordDetail(String orderNumber);

    int updateOrderStutas(StoreOrder storeOrder);

    List<StoreOrder> selectOrderNumberByParentId(String parentId);

    List<StoreOrder>  selectPayOrderByParentId(String parentId);
}
