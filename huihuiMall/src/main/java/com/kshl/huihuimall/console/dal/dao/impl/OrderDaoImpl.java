package com.kshl.huihuimall.console.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.dal.mapper.*;
import com.kshl.huihuimall.console.base.pojo.OrderDetailProduct;
import com.kshl.huihuimall.console.base.pojo.ProfitPojo;
import com.kshl.huihuimall.console.dal.dao.OrderDao;
import com.kshl.huihuimall.console.dal.manualmapper.OrderDetailManualMapper;
import com.kshl.huihuimall.console.dal.manualmapper.OrderManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private OrderManualMapper orderManualMapper;

    @Autowired
    private StoreOrderMapper storeOrderMapper;

    @Autowired
    private SendOrderMapper sendOrderMapper;

    @Autowired
    private ReturnExchangeOrderMapper returnExchangeOrderMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Autowired
    private OrderDetailManualMapper orderDetailManualMapper;
    @Autowired
    private ProfitRecordMapper profitRecordMapper;


    @Override
    public List<Map<String, Object>> getAllOrder(Integer pageSize, Integer pageNum,Integer accountId, String type, String orderstatus, String orderNumber, String storename,String startTime,String endTime,String entCode,String merchantname) {

        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(type)){
            map.put("type", type);
        }

        if(!KSStringUtils.isEmpty(accountId)){
            map.put("accountId", accountId);
        }

        if(!KSStringUtils.isEmpty(orderstatus)){
            map.put("orderstatus", orderstatus);
        }
        if(!KSStringUtils.isEmpty(orderNumber)){
            map.put("orderNumber", orderNumber);
        }
        if(!KSStringUtils.isEmpty(storename)){
            map.put("storename", storename);
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
        if(!KSStringUtils.isEmpty(entCode)){
            map.put("entCode", entCode);
        }
        if(!KSStringUtils.isEmpty(merchantname)){
            map.put("merchantname", merchantname);
        }
        return orderManualMapper.getAllOrder(map);
    }


    @Override
    public int getAllOrderCount(Integer accountId,String type, String orderstatus, String orderNumber, String storename,String startTime,String endTime,String entCode,String merchantname) {

        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(type)){
            map.put("type", type);
        }
        if(!KSStringUtils.isEmpty(accountId)){
            map.put("accountId", accountId);
        }
        if(!KSStringUtils.isEmpty(orderstatus)){
            map.put("orderstatus", orderstatus);
        }
        if(!KSStringUtils.isEmpty(orderNumber)){
            map.put("orderNumber", orderNumber);
        }
        if(!KSStringUtils.isEmpty(storename)){
            map.put("storename", storename);
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
        if(!KSStringUtils.isEmpty(entCode)){
            map.put("entCode", entCode);
        }
        if(!KSStringUtils.isEmpty(merchantname)){
            map.put("merchantname", merchantname);
        }
        return orderManualMapper.getAllOrderCount(map);
    }

    @Override
    public int addOrder(StoreOrder storeOrder) {
        return storeOrderMapper.insert(storeOrder);
    }

    @Override
    public int updateOrder(StoreOrder storeOrder) {
        return storeOrderMapper.updateByPrimaryKeySelective(storeOrder);
    }

    @Override
    public int deleteOrder(Integer id) {
        return storeOrderMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<OrderDetailProduct> getOrderDetail(String orderNumber) {
        return orderManualMapper.getOrderDetail(orderNumber);
    }

    @Override
    public List<OrderDetailProduct> ReturnExchengDetail(String orderNumber) {
        return orderManualMapper.ReturnExchengDetail(orderNumber);
    }

    @Override
    public StoreOrder getOrderByOrderNumber(String orderNumber) {
        return orderManualMapper.getOrderByOrderNumber(orderNumber);
    }

    /**
     * 派单列表
     * @param pageSize
     * @param pageNum
     * @param orderNumber
     * @param storename
     * @return
     */
    @Override
    public List<Map<String, Object>> sendOrder(Integer pageSize, Integer pageNum,String orderstatus, String orderNumber, String storename) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(orderstatus)){
            map.put("orderstatus", orderstatus);
        }
        if(!KSStringUtils.isEmpty(orderNumber)){
            map.put("orderNumber", orderNumber);
        }
        if(!KSStringUtils.isEmpty(storename)){
            map.put("storename", storename);
        }

        return orderManualMapper.sendOrder(map);

    }

    /**
     * 派单数量
     * @param orderNumber
     * @param storename
     * @return
     */
    @Override
    public int getAllsendOrder(String orderstatus,String orderNumber, String storename) {

        Map<String, Object> map = new HashMap<>();

        if(!KSStringUtils.isEmpty(orderstatus)){
            map.put("orderstatus", orderstatus);
        }

        if(!KSStringUtils.isEmpty(orderNumber)){
            map.put("orderNumber", orderNumber);
        }
        if(!KSStringUtils.isEmpty(storename)){
            map.put("storename", storename);
        }
        return orderManualMapper.getAllsendOrder(map);

    }

    /**
     * 添加一条派单记录
     * @param sendOrder
     * @return
     */
    @Override
    public int addSendOrder(SendOrder sendOrder) {
        return sendOrderMapper.insert(sendOrder);
    }

    /**
     * 退换货列表
     * @param pageSize
     * @param pageNum
     * @param type
     * @param orderNumber
     * @param storeName
     * @return
     */
    @Override
    public List<Map<String, Object>> queryReturnExchangeOrder(Integer pageSize, Integer pageNum, Integer type, String orderNumber, String storeName, String orderType,Integer returnStatus, Integer exchangeStatus,Integer auditStatus) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(type != null){
            map.put("type", type);
        }
        //退换货单号
        if(!KSStringUtils.isEmpty(orderNumber)){
            map.put("orderNumber", orderNumber);
        }
        if(!KSStringUtils.isEmpty(storeName)){
            map.put("storeName", storeName);
        }
        if(!KSStringUtils.isEmpty(orderType)){
            map.put("orderType", orderType);
        }
        //退货状态
        if(returnStatus != null){
            map.put("returnStatus", returnStatus);
        }
        //换货状态
        if(exchangeStatus != null){
            map.put("exchangeStatus", exchangeStatus);
        }

        //审核状态
        if(auditStatus != null){
            map.put("auditStatus", auditStatus);
        }

        return orderManualMapper.queryReturnExchangeOrder(map);
    }

    /**
     * 退换货列表Count
     * @param type
     * @param orderNumber
     * @param storeName
     * @return
     */
    @Override
    public int queryReturnExchangeOrderCount(Integer type, String orderNumber, String storeName, String orderType,Integer returnStatus, Integer exchangeStatus,Integer auditStatus) {
        Map<String, Object> map = new HashMap<>();

        if(type != null){
            map.put("type", type);
        }
        if(!KSStringUtils.isEmpty(orderNumber)){
            map.put("orderNumber", orderNumber);
        }
        if(!KSStringUtils.isEmpty(storeName)){
            map.put("storeName", storeName);
        }
        if(!KSStringUtils.isEmpty(orderType)){
            map.put("orderType", orderType);
        }
        //退货状态
        if(returnStatus != null){
            map.put("returnStatus", returnStatus);
        }
        //换货状态
        if(exchangeStatus != null){
            map.put("exchangeStatus", exchangeStatus);
        }

        //审核状态
        if(auditStatus != null){
            map.put("auditStatus", auditStatus);
        }

        return orderManualMapper.queryReturnExchangeOrderCount(map);
    }

    /**
     * 根据退换货单号查询退换货详情
     * @param orderNumber
     * @return
     */
    @Override
    public Map<String,Object> getRExchangeOrderByOrderNumber(String orderNumber) {
        return orderManualMapper.getRExchangeOrderByOrderNumber(orderNumber);
    }

    /**
     *  //退换货管理（不同意/同意）
     * @param returnExchangeOrder
     * @return
     */
    @Override
    public int updateReturnExchangeOrder(ReturnExchangeOrder returnExchangeOrder) {

        return returnExchangeOrderMapper.updateByPrimaryKeySelective(returnExchangeOrder);
    }

    @Override
    public StoreOrder getOrderById(String id) {

        return orderManualMapper.getOrderById(id);
    }

    @Override
    public List<OrderDetail> getProductListbyCode(String code) {

        return orderDetailManualMapper.getProductListbyCode(code);
    }

    /**
     *  出库
     * @param storeOrder
     * @return
     */
    @Override
    public int updateStoreOrder(StoreOrder storeOrder) {
        return orderManualMapper.updateStoreOrder(storeOrder);
    }

    @Override
    public int updateReturnExchange(ReturnExchangeOrder returnExchangeOrder) {
        return orderManualMapper.updateReturnExchange(returnExchangeOrder);
    }

    /**
     * 单条订单分润记录
     * @param storeId
     * @param orderNumber
     * @return
     */
    @Override
    public ProfitPojo getOrderProfit(Integer storeId,String orderNumber) {
        return orderManualMapper.getOrderProfit(storeId,orderNumber);
    }

    // 插入分润
    @Override
    public int insertProfitRecord(ProfitRecord profitRecord) {
        return profitRecordMapper.insertSelective(profitRecord);
    }

    @Override
    public List<ProfitPojo> getOrderProfitList(Integer storeId, String startTime, String endTime, int type, int status) {
        return orderManualMapper.getOrderProfitList(storeId,startTime,endTime,type,status);
    }

    @Override
    public int updateOrderProfit(ProfitRecord profitRecord) {
        return orderManualMapper.updateOrderProfit(profitRecord);
    }
}
