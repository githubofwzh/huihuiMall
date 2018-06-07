package com.kshl.huihuimall.portal.service.allorder;

import com.kshl.base.response.BasePageResponse;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.portal.controller.request.AllDetailRequest;
import com.kshl.huihuimall.portal.controller.request.ReturnRecordquest;
import com.kshl.huihuimall.portal.controller.request.ReturnRequest;

import java.util.List;
import java.util.Map;

public interface AllOrderService {
    List<Map<String, Object>> getAllOrder(AllDetailRequest ad);

    int getAllOrderCount(Integer userId);
    //订单详情
    List<ReturnRecordquest> SelectDetail(String orderNumber);
    //订单详情的退换货状态
    List<ReturnRecordquest> getDetailReturnStatus(String orderNumber);

    List<Map<String, Object>> SelectReturnP(AllDetailRequest allDetailRequest);

    ReturnRequest getReturnAdd(AllDetailRequest allDetailRequest);

    List<OrderDetail> getReturnStatus(Integer userId);

    List<Map<String, Object>> selfServiceReturnStatus(AllDetailRequest allDetailRequest);

    int selfServiceStatus(ReturnExchangeOrder returnExchangeOrder);

    int UserReStatus(ReturnExchangeOrder returnExchangeOrder);

    int ReorderStatus(String order_number, Integer pending, Integer prId);

    List<Map<String, Object>> getReturnDetail(AllDetailRequest allDetailRequest);

    int insert(ReturnExchangeOrder record);

    List<StoreOrder> userIdIfExist(Integer userId);

    int insert(InventoryIn record);

    int updateStoreOrderIf(String parentid);

    int Detaildelete(String orderNumber);

    int deleteOrder(String orderNumber);
    int deleteInventoryOut(String orderNumber);

    OrderDetail selectOrdertotal(String orderNumber);

    int Ordertotal(StoreOrder storeOrder);

    List<StoreOrder> selectorderNumber();

    String selectEntcode(String name);

    BasePageResponse ReturnRecord(Integer type, Integer pageNum, Integer pageSize, String orderNumber, String storeName,String startTime,String endTime);
    //int ReturnRecordCount(Integer type,String orderNumber,String storeName,String orderTime);
    Map<String,Object> ReturnRecordDetail(String orderNumber);

    int updateOrderStutas(StoreOrder storeOrder);

    List<StoreOrder> selectOrderNumberByParentId(String parentId);

    List<StoreOrder>  selectPayOrderByParentId(String parentId);
}
