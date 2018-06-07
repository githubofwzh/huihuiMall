package com.kshl.huihuimall.portal.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.OrderDetail;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.portal.controller.request.ReturnRecordquest;
import com.kshl.huihuimall.portal.controller.request.ReturnRequest;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AllOrderMapper {
    List<Map<String, Object>>  getAllOrder(Map<String, Object> map);

    int getAllOrderCount(Integer userId);

    List<ReturnRecordquest> getDetail(String orderNumber);

    List<Map<String,Object>> getReturnP(Map<String, Object> map);

    ReturnRequest getReturnAdd(@Param("orderNumber")String orderNumber, @Param("prId") Integer prId);

    List<OrderDetail> getReturnStatus(Integer userId);

    List<Map<String,Object>> selfServiceReturnStatus(Map<String, Object> map);

    int UserReStatus(Map<String, Object> map);

    int selfServiceStatus(Map<String, Object> map);

    List<ReturnRecordquest> getDetailReturnStatus (String orderNumber);

    int ReorderStatus(@Param("order_number")String order_number,@Param("pending") Integer pending, @Param("prId") Integer prId);

    List<Map<String,Object>> getReturnDetail(Map<String, Object> map);

    List<StoreOrder> userIdIfExist(Integer userId);
    //支付失败之后的处理
    int updateStoreOrderIf(String parentid);

    int deleteDetail(String orderNumber);

    int deleteOrder(String orderNumber);

    int deleteInventoryOut(String orderNumber);

    OrderDetail selectOrdertotal(String orderNumber);

    int Ordertotal(StoreOrder storeOrder);

    List<StoreOrder> selectorderNumber();

    String selectEntcode(Map<String, Object> map);

    List<Map<String,Object>> ReturnRecord(Map<String, Object> map);

    int ReturnRecordCount(Map<String, Object> map);

    Map<String,Object> ReturnRecordDetail(String orderNumber);

    int updateOrderStutas(StoreOrder storeOrder);

    List<StoreOrder> selectOrderNumberByParentId(String parentId);

    List<StoreOrder>  selectPayOrderByParentId(String parentId);
}
