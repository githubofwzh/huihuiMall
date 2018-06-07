package com.kshl.huihuimall.portal.service.allorder.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.portal.controller.request.AllDetailRequest;
import com.kshl.huihuimall.portal.controller.request.ReturnRecordquest;
import com.kshl.huihuimall.portal.controller.request.ReturnRequest;
import com.kshl.huihuimall.portal.dal.dao.AllOrderDao;
import com.kshl.huihuimall.portal.service.allorder.AllOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class AllOrderServiceImpl implements AllOrderService {

    @Autowired
    private AllOrderDao allOrderDao;
    @Override
    public List<Map<String, Object>> getAllOrder(AllDetailRequest ad) {
        List<Map<String, Object>> list=allOrderDao.getAllOrder(ad.getUserId(),ad.getPageNum(),ad.getPageSize());
        return list;
    }

    @Override
    public int getAllOrderCount(Integer userId) {
        return allOrderDao.getAllOrderCount(userId);
    }

    @Override
    public List<ReturnRecordquest> SelectDetail(String orderNumber) {
        List<ReturnRecordquest> list=allOrderDao.getDetail(orderNumber);
        return list;
    }

    @Override
    public List<ReturnRecordquest> getDetailReturnStatus(String orderNumber) {
        return allOrderDao.getDetailReturnStatus(orderNumber);
    }

    @Override
    public List<Map<String, Object>> SelectReturnP(AllDetailRequest ar) {
        List<Map<String, Object>> list=allOrderDao.getReturnP(ar.getOrderNumber(),ar.getPrId());
        return list;
    }

    @Override
    public ReturnRequest getReturnAdd(AllDetailRequest ar) {
        ReturnRequest list=allOrderDao.getReturnAdd(ar.getOrderNumber(),ar.getPrId());
        return list;
    }

    @Override
    public List<OrderDetail> getReturnStatus(Integer userId) {
        List<OrderDetail> list=allOrderDao.getReturnStatus(userId);
        return list;
    }

    @Override
    public List<Map<String, Object>> selfServiceReturnStatus(AllDetailRequest allDetailRequest) {
        List<Map<String, Object>> list=allOrderDao.selfServiceReturnStatus(allDetailRequest.getStoreId(),allDetailRequest.getType(),allDetailRequest.getOrderNumber());
        return list;
    }

    @Override
    public int selfServiceStatus(ReturnExchangeOrder returnExchangeOrder) {
        return  allOrderDao.selfServiceStatus(returnExchangeOrder.getAuditStatus(),returnExchangeOrder.getOrderNumber());

    }

    @Override
    public int UserReStatus(ReturnExchangeOrder returnExchangeOrder) {
        return allOrderDao.UserReStatus(returnExchangeOrder.getReturnStatus(),returnExchangeOrder.getExchangeStatus(),returnExchangeOrder.getOrderNumber());
    }

    @Override
    public int ReorderStatus(String order_number, Integer pending, Integer prId) {
        return allOrderDao.ReorderStatus(order_number,pending,prId);
    }


    @Override
    public List<Map<String, Object>> getReturnDetail(AllDetailRequest ar) {
        List<Map<String, Object>> list=allOrderDao.getReturnDetail(ar.getOrderNumber(),ar.getPrId());
        return list;
    }

    @Override
    public int insert(ReturnExchangeOrder record) {
        return allOrderDao.insert(record);
    }

    @Override
    public List<StoreOrder> userIdIfExist(Integer userId) {
        return allOrderDao.userIdIfExist(userId);
    }

    @Override
    public int insert(InventoryIn record) {
        return allOrderDao.insert(record);
    }

    @Override
    public int updateStoreOrderIf(String parentid) {
        return allOrderDao.updateStoreOrderIf(parentid);
    }

    @Override
    public int Detaildelete(String orderNumber) {
        return allOrderDao.Detaildelete(orderNumber);
    }

    @Override
    public int deleteOrder(String orderNumber) {
        return allOrderDao.deleteOrder(orderNumber);
    }

    @Override
    public int deleteInventoryOut(String orderNumber) {
        return allOrderDao.deleteInventoryOut(orderNumber);
    }

    @Override
    public OrderDetail selectOrdertotal(String orderNumber) {
        return allOrderDao.selectOrdertotal(orderNumber);
    }

    @Override
    public int Ordertotal(StoreOrder storeOrder) {
        return allOrderDao.Ordertotal(storeOrder);
    }

    @Override
    public List<StoreOrder> selectorderNumber() {
        return allOrderDao.selectorderNumber();
    }

    @Override
    public String selectEntcode(String name) {
        return allOrderDao.selectEntcode(name);
    }

    @Override
    public BasePageResponse ReturnRecord(Integer type, Integer pageNum, Integer pageSize, String orderNumber, String storeName,String startTime,String endTime) {
        List<Map<String, Object>> result = allOrderDao.ReturnRecord(type,pageNum,pageSize,orderNumber,storeName,startTime,endTime);
        int total =  allOrderDao.ReturnRecordCount(type,orderNumber,storeName,startTime,endTime);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (pageNum > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (pageSize * pageNum >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / pageSize;
        pageResponse.setPages(total % pageSize == 0 ? count : count + 1);
        return pageResponse;

    }


    @Override
    public Map<String, Object> ReturnRecordDetail(String orderNumber) {
        return allOrderDao.ReturnRecordDetail(orderNumber);
    }

    @Override
    public int updateOrderStutas(StoreOrder storeOrder) {
        return allOrderDao.updateOrderStutas(storeOrder);
    }

    @Override
    public List<StoreOrder> selectOrderNumberByParentId(String parentId) {
        return allOrderDao.selectOrderNumberByParentId(parentId);
    }

    @Override
    public List<StoreOrder>  selectPayOrderByParentId(String parentId) {
        return allOrderDao.selectPayOrderByParentId(parentId);
    }

}
