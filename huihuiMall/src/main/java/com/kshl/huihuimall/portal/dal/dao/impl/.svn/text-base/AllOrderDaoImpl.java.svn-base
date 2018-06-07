package com.kshl.huihuimall.portal.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.dal.mapper.InventoryInMapper;
import com.kshl.huihuimall.base.dal.mapper.ReturnExchangeOrderMapper;
import com.kshl.huihuimall.portal.controller.request.ReturnRecordquest;
import com.kshl.huihuimall.portal.controller.request.ReturnRequest;
import com.kshl.huihuimall.portal.dal.dao.AllOrderDao;
import com.kshl.huihuimall.portal.dal.manualmapper.AllOrderMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class AllOrderDaoImpl implements AllOrderDao {
    @Autowired
    private AllOrderMapper allOrderMapper;
    @Autowired
    private ReturnExchangeOrderMapper returnExchangeOrderMapper;
    @Autowired
    private InventoryInMapper inventoryInMapper;

    @Override
    public List<Map<String, Object>> getAllOrder(@Param("userId")Integer userId,@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize){

        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
            map.put("userId",userId);
        }
        return allOrderMapper.getAllOrder(map);
    }

    @Override
    public int getAllOrderCount(Integer userId) {
        return allOrderMapper.getAllOrderCount(userId);
    }

    @Override
    public List<ReturnRecordquest> getDetail(String orderNumber) {
        return allOrderMapper.getDetail(orderNumber);
    }

    @Override
    public List<Map<String, Object>> getReturnP(String orderNumber, Integer prId) {
        Map<String,Object> map=new HashMap<>();
        map.put("orderNumber",orderNumber);
        map.put("prId",prId);
        return allOrderMapper.getReturnP(map);
    }

    @Override
    public ReturnRequest getReturnAdd(@Param("orderNumber")String orderNumber, @Param("prId") Integer prId) {
       System.out.println("getReturnAdd start");
        return allOrderMapper.getReturnAdd(orderNumber,prId);
    }

    @Override
    public List<OrderDetail> getReturnStatus(Integer userId) {
        return allOrderMapper.getReturnStatus(userId);
    }

    @Override
    public List<Map<String, Object>> selfServiceReturnStatus(Integer storeId, Integer type,String orderNumber) {
        Map<String,Object> map=new HashMap<>();
        map.put("storeId",storeId);
        map.put("orderNumber",orderNumber);
        map.put("type",type);
        return allOrderMapper.selfServiceReturnStatus(map);
    }

    @Override
    public int UserReStatus(Integer returnStatus, Integer exchangeStatus, String orderNumber) {
        Map<String,Object> map=new HashMap<>();
        map.put("returnStatus",returnStatus);
        map.put("orderNumber",orderNumber);
        map.put("exchangeStatus",exchangeStatus);
        return allOrderMapper.UserReStatus(map);
    }

    @Override
    public int selfServiceStatus(Integer auditStatus, String orderNumber) {
        Map<String,Object> map=new HashMap<>();
        map.put("orderNumber",orderNumber);
        map.put("auditStatus",auditStatus);
        return allOrderMapper.selfServiceStatus(map);
    }

    @Override
    public int ReorderStatus(String order_number,Integer pending,Integer prId) {
        return allOrderMapper.ReorderStatus(order_number,pending,prId);
    }

    @Override
    public List<Map<String, Object>> getReturnDetail(String orderNumber, Integer prId) {
        Map<String,Object> map=new HashMap<>();
        map.put("orderNumber",orderNumber);
        map.put("prId",prId);
        return allOrderMapper.getReturnDetail(map);
    }

    @Override
    public List<ReturnRecordquest> getDetailReturnStatus(String orderNumber) {
        return allOrderMapper.getDetailReturnStatus(orderNumber);
    }

    @Override
    public int insert(ReturnExchangeOrder record) {
        return returnExchangeOrderMapper.insert(record);
    }

    @Override
    public List<StoreOrder> userIdIfExist(Integer userId) {
        return allOrderMapper.userIdIfExist(userId);
    }

    @Override
    public int insert(InventoryIn record) {
        return inventoryInMapper.insert(record);
    }

    @Override
    public int updateStoreOrderIf(String parentid) {
        return allOrderMapper.updateStoreOrderIf(parentid);
    }

    @Override
    public int Detaildelete(String parentid) {
        return allOrderMapper.deleteDetail(parentid);
    }

    @Override
    public int deleteOrder(String parentid) {
        return allOrderMapper.deleteOrder(parentid);
    }

    @Override
    public int deleteInventoryOut(String orderNumber) {
        return allOrderMapper.deleteInventoryOut(orderNumber);
    }

    @Override
    public OrderDetail selectOrdertotal(String orderNumber) {
        return allOrderMapper.selectOrdertotal(orderNumber);
    }

    @Override
    public int Ordertotal(StoreOrder storeOrder) {
        return allOrderMapper.Ordertotal(storeOrder);
    }

    @Override
    public List<StoreOrder> selectorderNumber() {
        return allOrderMapper.selectorderNumber();
    }

    @Override
    public String selectEntcode(String name) {
        Map<String,Object> map=new HashMap<>();
        map.put("name",name);
        return allOrderMapper.selectEntcode(map);
    }

    @Override
    public List<Map<String, Object>> ReturnRecord(Integer type, Integer pageNum, Integer pageSize, String orderNumber, String storeName,String startTime,String endTime) {
        Map<String,Object> map=new HashMap<>();
        if(!KSStringUtils.isEmpty(type)){
            map.put("type",type);
        }
        if(!KSStringUtils.isEmpty(orderNumber)){
            map.put("orderNumber",orderNumber);
        }
        if(!KSStringUtils.isEmpty(storeName)){
            map.put("storeName",storeName);
        }
        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        return allOrderMapper.ReturnRecord(map);
    }

    @Override
    public int ReturnRecordCount(Integer type, String orderNumber, String storeName,String startTime,String endTime) {
        Map<String,Object> map=new HashMap<>();
//        map.put("type",type);
//        map.put("orderNumber",orderNumber);
//        map.put("storeName",storeName);
        if(!KSStringUtils.isEmpty(type)){
            map.put("type",type);
        }
        if(!KSStringUtils.isEmpty(orderNumber)){
            map.put("orderNumber",orderNumber);
        }
        if(!KSStringUtils.isEmpty(storeName)){
            map.put("storeName",storeName);
        }
        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }
        return allOrderMapper.ReturnRecordCount(map);
    }

    @Override
    public Map<String, Object> ReturnRecordDetail(String orderNumber) {
        return  allOrderMapper.ReturnRecordDetail(orderNumber);
    }

    @Override
    public int updateOrderStutas(StoreOrder storeOrder) {
        return allOrderMapper.updateOrderStutas(storeOrder);
    }

    @Override
    public List<StoreOrder> selectOrderNumberByParentId(String parentId) {
        return allOrderMapper.selectOrderNumberByParentId(parentId);
    }

    @Override
    public List<StoreOrder>  selectPayOrderByParentId(String parentId) {
        return allOrderMapper.selectPayOrderByParentId(parentId);

    }


}
