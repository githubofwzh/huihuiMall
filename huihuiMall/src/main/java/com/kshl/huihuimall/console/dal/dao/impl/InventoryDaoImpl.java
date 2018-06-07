package com.kshl.huihuimall.console.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.dal.mapper.*;
import com.kshl.huihuimall.console.base.pojo.InventoryInPojo;
import com.kshl.huihuimall.console.base.pojo.OrderDetailProduct;
import com.kshl.huihuimall.console.controller.inventory.request.InventoryTransfRequest;
import com.kshl.huihuimall.console.dal.dao.InventoryDao;
import com.kshl.huihuimall.console.dal.manualmapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class InventoryDaoImpl implements InventoryDao{

    @Autowired
    private InventoryMapper inventoryMapper;
    @Autowired
    private InventoryManualMapper inventoryManualMapper;
    @Autowired
    private InventoryInMapper inventoryInMapper;
    @Autowired
    private InventoryInManualMapper inventoryInManualMapper;
    @Autowired
    private InventoryOutMapper inventoryOutMapper;
    @Autowired
    private InventoryOutManualMapper inventoryOutManualMapper;
    @Autowired
    private InventoryTransferMapper inventoryTransferMapper;
    @Autowired
    private InventoryTransferManualMapper inventoryTransferManualMapper;
    @Autowired
    private InventoryToProductMapper inventoryToProductMapper;
    @Autowired
    private InventoryToProductManualMapper inventoryToProductManualMapper;
    @Autowired
    private StoreOrderMapper storeOrderMapper;
    @Autowired
    private OrderManualMapper orderManualMapper;

    @Override
    public List<Map<String, Object>> getInventory(Integer pageSize, Integer pageNum,
                                                  String productName, String productCode, Integer storehouseId) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(productName)){
            map.put("productName", productName);
        }
        if(!KSStringUtils.isEmpty(productCode)){
            map.put("productCode", productCode);
        }
        if(storehouseId !=null){
            map.put("storehouseId",storehouseId);
        }
        return inventoryManualMapper.getInventory(map);
    }

    @Override
    public int getInventoryCount(String productName, String productCode, Integer storehouseId) {
        Map<String, Object> map = new HashMap<>();

        if(!KSStringUtils.isEmpty(productName)){
            map.put("productName", productName);
        }
        if(!KSStringUtils.isEmpty(productCode)){
            map.put("productCode", productCode);
        }
        if(storehouseId !=null){
            map.put("storehouseId",storehouseId);
        }
        return inventoryManualMapper.getInventoryCount(map);
    }

    @Override
    public int inInventory(InventoryIn inventoryin) {

        return  inventoryInMapper.insertSelective(inventoryin);
    }

    @Override
    public int inlink(InventoryToProduct inventoryToProduct) {
        return  inventoryToProductMapper.insertSelective(inventoryToProduct);
    }

    @Override
    public int updateInventory(Inventory inventory) {
        return inventoryManualMapper.updateInventory(inventory);
    }

    @Override
    public List<Map<String, Object>> queryOutInventory(String orderStatus, Integer pageSize, Integer pageNum, String code, String status,
                                                       String storeHouse, String startTime, String endTime,Integer storehouserId,Integer exchangeStatus,Integer retType) {
        Map<String ,Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(!KSStringUtils.isEmpty(status)){
            map.put("status",status);
        }
        if(!KSStringUtils.isEmpty(storeHouse)){
            map.put("storeHouse",storeHouse);
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
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        if(orderStatus!=null){
            map.put("orderStatus", orderStatus);
        }
        if(exchangeStatus!=null){
            map.put("exchangeStatus", exchangeStatus);
        }
        if(retType!=null){
            map.put("retType", retType);
        }
        map.put("type",Constants.ORDER_TYPE.AUTOTROPHY);

        return orderManualMapper.queryOutInventory(map);
    }

    @Override
    public int queryOutInventoryCount(String orderStatus, String code, String status, String storeHouse, String startTime,
                                      String endTime,Integer storehouserId,Integer exchangeStatus,Integer retType) {
        Map<String ,Object> map=new HashMap<>();
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(!KSStringUtils.isEmpty(status)){
            map.put("status",status);
        }
        if(!KSStringUtils.isEmpty(storeHouse)){
            map.put("storeHouse",storeHouse);
        }
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
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
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        if(orderStatus!=null){
            map.put("orderStatus", Integer.parseInt(orderStatus));
        }
        if(exchangeStatus!=null){
            map.put("exchangeStatus", exchangeStatus);
        }
        if(retType!=null){
            map.put("retType", retType);
        }
        map.put("type",Constants.ORDER_TYPE.AUTOTROPHY);

        return orderManualMapper.queryOutInventoryCount(map);
    }


    @Override
    public Inventory getInventorybyProductId(Integer productId) {
        return  inventoryManualMapper.getInventorybyProductId(productId);
    }

    @Override
    public List<Map<String, Object>> queryInInventoryRecord(Integer pageNum, Integer pageSize, String code, Integer status, String startTime, String endTime, Integer storehouserId) {
        Map<String ,Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            map.put("status",status);
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
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        map.put("type",Constants.INVENTORY_TYPE.IN);
        return inventoryInManualMapper.queryInInventoryRecord(map);
    }

    @Override
    public int queryInInventoryRecordCount(String code, Integer status, String startTime, String endTime, Integer storehouserId) {
        Map<String ,Object> map=new HashMap<>();
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            map.put("status",status);
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
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        map.put("type",Constants.INVENTORY_TYPE.IN);
        return inventoryInManualMapper.queryInInventoryRecordCount(map);
    }

    @Override
    public List<Map<String, Object>> queryOutInventoryRecord(Integer pageNum, Integer pageSize, String code, Integer status, String startTime, String endTime,Integer storehouserId) {
        Map<String ,Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            map.put("status",status);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        return inventoryOutManualMapper.queryOutInventoryRecord(map);
    }

    @Override
    public int queryOutInventoryRecordCount(String code, Integer status, String startTime, String endTime,Integer storehouserId) {
        Map<String ,Object> map=new HashMap<>();
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            map.put("status",status);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        return inventoryOutManualMapper.queryOutInventoryRecordCount(map);
    }

    @Override
    public List<Map<String, Object>> queryTransferInventoryRecord(Integer pageNum, Integer pageSize, String code, Integer status, String startTime, String endTime) {
        Map<String ,Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            map.put("status",status);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        return inventoryTransferManualMapper.queryTransferInventoryRecord(map);
    }

    @Override
    public int queryTransferInventoryRecordCount(String code, Integer status, String startTime, String endTime) {
        Map<String ,Object> map=new HashMap<>();
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            map.put("status",status);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        return inventoryTransferManualMapper.queryTransferInventoryRecordCountCount(map);
    }

    @Override
    public List<Map<String, Object>> InOutInventory(Integer pageSize, Integer pageNum, String code, Integer status, String startTime, String endTime, Integer storehouserId) {
        Map<String, Object> map=new HashMap<>();
        List<Integer> list = new ArrayList<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            list.add(status);
            map.put("status",list);
        } else{
            list.add(Constants.INVENTORY_TRANSFER_STATUS.PAUSE);
            list.add(Constants.INVENTORY_TRANSFER_STATUS.START);
            list.add(Constants.INVENTORY_TRANSFER_STATUS.OUT);
            map.put("status",list);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        return inventoryTransferManualMapper.InOutInventory(map);
    }

    @Override
    public int InOutInventoryCount(String code, Integer status, String startTime, String endTime, Integer storehouserId) {
        Map<String ,Object> map=new HashMap<>();
        List<Integer> list = new ArrayList<>();
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            list.add(status);
            map.put("status",list);
        } else{
            list.add(Constants.INVENTORY_TRANSFER_STATUS.PAUSE);
            list.add(Constants.INVENTORY_TRANSFER_STATUS.START);
            list.add(Constants.INVENTORY_TRANSFER_STATUS.OUT);
            map.put("status",list);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        return inventoryTransferManualMapper.InOutInventoryCount(map);
    }

    @Override
    public void transfer(InventoryTransfer inventoryTransfer) {
        inventoryTransferMapper.insertSelective(inventoryTransfer);
    }

    @Override
    public InventoryTransfer getInventoryTransfer(String code) {

        return inventoryTransferManualMapper.getInventoryTransferbycode(code);
    }

    @Override
    public List<InventoryToProduct> getproductListBycode(String code) {
       return inventoryToProductManualMapper.getproductListBycode(code);
    }

    @Override
    public OutInventoryRecordDetail getOutInventoryRecordDetail(String orderNumber) {
        return inventoryManualMapper.getOutInventoryRecordDetail(orderNumber);
    }

    @Override
    public Inventory getInventorybyProductIdAndhouseId(Inventory inventory) {
        return inventoryManualMapper.getInventorybyProductIdAndhouseId(inventory);
    }

    @Override
    public InventoryIn getInventoryIn(String code) {

        return inventoryInManualMapper.getInventoryIn(code);
    }

    @Override
    public InventoryInPojo getInventoryInById(Integer id) {
        return inventoryInManualMapper.getInventoryInById(id);
    }

    @Override
    public InventoryOut getInventoryOut(String code)
    {
        return inventoryOutManualMapper.getInventoryOut(code);
    }

    @Override
    public int insertInventory(Inventory inventoryinset) {
        return inventoryMapper.insertSelective(inventoryinset);
    }

    @Override
    public int insertOutInventory(InventoryOut inventoryOut) {
        return inventoryOutMapper.insertSelective(inventoryOut);
    }

    @Override
    public InventoryTransfer getInventoryTransferbycode(String code) {
        return  inventoryTransferManualMapper.getInventoryTransferbycode(code);
    }

    @Override
    public List<Map<String, Object>> getInInventory(Integer pageSize, Integer pageNum, String productName, String productCode, Integer storehouserId) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(productName)){
            map.put("productName", productName);
        }
        if(!KSStringUtils.isEmpty(productCode)){
            map.put("productCode", productCode);
        }
        if(storehouserId !=null){
            map.put("storehouseId",storehouserId);
        }
        map.put("type",Constants.INVENTORY_TYPE.NOIN);
        return inventoryInManualMapper.getInInventory(map);
    }

    @Override
    public int getInInventoryCount(String productName, String productCode, Integer storehouserId) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(productName)){
            map.put("productName", productName);
        }
        if(!KSStringUtils.isEmpty(productCode)){
            map.put("productCode", productCode);
        }
        if(storehouserId !=null){
            map.put("storehouseId",storehouserId);
        }
        map.put("type",Constants.INVENTORY_TYPE.NOIN);
        return inventoryInManualMapper.getInInventoryCount(map);

    }

    @Override
    public int updateOutInventory(InventoryOut inventoryOut) {
        return inventoryOutManualMapper.updateOutInventory(inventoryOut);
    }

    @Override
    public List<Product> getProductListByOrderNumber(String orderNumber) {
        return inventoryManualMapper.getProductListByOrderNumber(orderNumber);
    }

    @Override
    public List<OrderDetailProduct> getProductListByTranferCode(String code) {
        return inventoryManualMapper.getProductListByTranferCode(code);
    }

    @Override
    public int updateInventoryIn(InventoryIn inventoryin) {
        return inventoryManualMapper.updateInventoryIn(inventoryin);
    }

    @Override
    public int updateInlink(InventoryToProduct inventoryToProduct) {
        return  inventoryManualMapper.updateInlink(inventoryToProduct);
    }

    @Override
    public InventoryToProduct selectByPrimaryKey(Integer inLineId) {
        return inventoryToProductMapper.selectByPrimaryKey(inLineId);
    }

    @Override
    public List<Map<String, Object>> InOutInventoryRecord(Integer pageSize, Integer pageNum, String code, Integer status, String startTime, String endTime, Integer storehouseId) {
        Map<String, Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            map.put("status",status);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        if(storehouseId!=null){
            map.put("storehouserId",storehouseId);
        }
        map.put("status",Constants.INVENTORY_TRANSFER_STATUS.IN);
        return inventoryTransferManualMapper.InOutInventoryRecord(map);
    }

    @Override
    public int InOutInventoryRecordCount(String code, Integer status, String startTime, String endTime, Integer storehouseId) {
        Map<String ,Object> map=new HashMap<>();
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(status!=null){
            map.put("status",status);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        if(storehouseId!=null){
            map.put("storehouserId",storehouseId);
        }
        map.put("status",Constants.INVENTORY_TRANSFER_STATUS.IN);
        return inventoryTransferManualMapper.InOutInventoryRecordCount(map);
    }

    @Override
    public int updateInventoryTransferBycode(InventoryTransfer inventoryTransfer) {
        return inventoryTransferManualMapper.updateInventoryTransferBycode(inventoryTransfer);
    }

    @Override
    public int updateInventoryTransfer(InventoryTransfer inventoryTransfer) {
        return inventoryTransferMapper.updateByPrimaryKeySelective(inventoryTransfer);
    }

    @Override
    public List<Map<String, Object>> queryApproveInventory(Integer pageSize, Integer pageNum, String code, String startTime, String endTime) {
        Map<String, Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        map.put("status",Constants.INVENTORY_TRANSFER_STATUS.PAUSE);
        return inventoryTransferManualMapper.queryApproveInventory(map);
    }

    @Override
    public int queryApproveInventoryCount(String code,String startTime, String endTime) {
        Map<String ,Object> map=new HashMap<>();
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        map.put("status",Constants.INVENTORY_TRANSFER_STATUS.PAUSE);
        return inventoryTransferManualMapper.queryApproveInventoryCount(map);
    }

    @Override
    public List<Map<String, Object>> exchengOutInventory(String orderStatus, Integer pageSize, Integer pageNum, String code, String status, String storeHouse, String startTime, String endTime, Integer storehouserId, Integer exchangeStatus, Integer retType) {
        Map<String ,Object> map=new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(!KSStringUtils.isEmpty(status)){
            map.put("status",status);
        }
        if(!KSStringUtils.isEmpty(storeHouse)){
            map.put("storeHouse",storeHouse);
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
        if(storehouserId!=null){
            map.put("storehouserId",storehouserId);
        }
        if(orderStatus!=null){
            map.put("orderStatus", orderStatus);
        }
        if(exchangeStatus!=null){
            map.put("exchangeStatus", exchangeStatus);
        }
        if(retType!=null){
            map.put("retType", retType);
        }
        map.put("type",Constants.ORDER_TYPE.AUTOTROPHY);

        return orderManualMapper.exchengOutInventory(map);

    }

    @Override
    public int exchengOutInventoryCount(String orderStatus, String code, String status, String storeHouse, String startTime, String endTime, Integer StorehouserId, Integer exchangeStatus, Integer retType) {
        Map<String ,Object> map=new HashMap<>();
        if(!KSStringUtils.isEmpty(code)){
            map.put("code",code);
        }
        if(!KSStringUtils.isEmpty(status)){
            map.put("status",status);
        }
        if(!KSStringUtils.isEmpty(storeHouse)){
            map.put("storeHouse",storeHouse);
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
        if(orderStatus!=null){
            map.put("orderStatus", Integer.parseInt(orderStatus));
        }
        if(exchangeStatus!=null){
            map.put("exchangeStatus", exchangeStatus);
        }
        if(retType!=null){
            map.put("retType", retType);
        }
        map.put("type",Constants.ORDER_TYPE.AUTOTROPHY);

        return orderManualMapper.exchengOutInventoryCount(map);
    }

    @Override
    public List<Product> getExcangeProduct(String orderNumber) {
        return inventoryManualMapper.getExcangeProduct(orderNumber);
    }

    @Override
    public InventoryTransfRequest getInventoryDetail(String code) {
        return inventoryTransferManualMapper.getInventoryDetail(code);
    }

    @Override
    public OutInventoryRecordDetail getOutReturnExchangeDetail(String orderNumber) {
        return inventoryManualMapper.getOutReturnExchangeDetail(orderNumber);
    }

    @Override
    public int insertSelective(InventoryTransfer inventoryTransfer) {
        return inventoryTransferMapper.insertSelective(inventoryTransfer);
    }

    @Override
    public List<OrderDetailProduct> getProductListByInventoryInId(Integer id) {
        return inventoryManualMapper.getProductListByInventoryInId(id);
    }


}
