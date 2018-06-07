package com.kshl.huihuimall.console.dal.dao;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.console.base.dto.Stock;
import com.kshl.huihuimall.console.base.pojo.InventoryInPojo;
import com.kshl.huihuimall.console.base.pojo.OrderDetailProduct;
import com.kshl.huihuimall.console.controller.inventory.request.InventoryRequest;
import com.kshl.huihuimall.console.controller.inventory.request.InventoryTransfRequest;
import com.kshl.huihuimall.console.controller.inventory.request.TransferActionRequest;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface InventoryDao {


    List<Map<String,Object>> getInventory(Integer pageSize, Integer pageNum, String productName, String productCode, Integer storehouseId);

    int getInventoryCount(String productName, String productCode, Integer storehouseId);

    int inInventory(InventoryIn inventoryin);

    int inlink(InventoryToProduct inventoryToProduct);

    int updateInventory(Inventory inventory);

    List<Map<String,Object>> queryOutInventory(String orderStatus,Integer pageSize, Integer pageNum, String code, String status, String storeHouse, String startTime, String endTime,Integer storehouserId,Integer exchangeStatus,Integer retType);

    int queryOutInventoryCount(String orderStatus,String code, String status, String storeHouse, String startTime, String endTime,Integer StorehouserId,Integer exchangeStatus,Integer retType);

    Inventory getInventorybyProductId(Integer productId);

    List<Map<String,Object>> queryInInventoryRecord(Integer pageNum, Integer pageSize, String code, Integer status, String startTime, String endTime, Integer  StorehouserId);

    int queryInInventoryRecordCount(String code, Integer status, String startTime, String endTime, Integer storehouserId);

    List<Map<String,Object>> queryOutInventoryRecord(Integer pageNum, Integer pageSize, String code, Integer status, String startTime, String endTime,Integer StorehouserId);

    int queryOutInventoryRecordCount(String code, Integer status, String startTime, String endTime,Integer storehouserId);

    List<Map<String,Object>> queryTransferInventoryRecord(Integer pageNum, Integer pageSize, String code, Integer status, String startTime, String endTime);

    int queryTransferInventoryRecordCount(String code, Integer status, String startTime, String endTime);

    List<Map<String,Object>> InOutInventory(Integer pageSize, Integer pageNum, String code, Integer status, String startTime, String endTime, Integer storehouserId);

    int InOutInventoryCount(String code, Integer status, String startTime, String endTime, Integer storehouserId);

    void transfer(InventoryTransfer inventoryTransfer);

    InventoryTransfer getInventoryTransfer(String code);

    List<InventoryToProduct> getproductListBycode(String code);

    OutInventoryRecordDetail getOutInventoryRecordDetail(String orderNumber);////

    Inventory getInventorybyProductIdAndhouseId(Inventory inventory);

    InventoryIn getInventoryIn(String code);

    InventoryInPojo getInventoryInById(Integer id);

    InventoryOut getInventoryOut(String code);

    int insertInventory(Inventory inventoryinset);

    int insertOutInventory(InventoryOut inventoryOut);

    InventoryTransfer getInventoryTransferbycode(String code);

    List<Map<String,Object>> getInInventory(Integer pageSize, Integer pageNum, String productName, String productCode, Integer storehouserId);

    int getInInventoryCount(String productName, String productCode, Integer storehouserId);

    int updateOutInventory(InventoryOut inventoryOut);

    List<Product> getProductListByOrderNumber(String orderNumber);

    int insertSelective(InventoryTransfer inventoryTransfer);

    List<OrderDetailProduct> getProductListByInventoryInId(Integer id);

    List<OrderDetailProduct> getProductListByTranferCode(String code);

    int updateInventoryIn(InventoryIn inventoryin);

    int updateInlink(InventoryToProduct inventoryToProduct);

    InventoryToProduct selectByPrimaryKey(Integer inLineId);

    List<Map<String, Object>> InOutInventoryRecord(Integer pageSize, Integer pageNum, String code, Integer status, String startTime, String endTime, Integer storehouseId);

    int InOutInventoryRecordCount(String code, Integer status, String startTime, String endTime, Integer storehouseId);

    int updateInventoryTransferBycode(InventoryTransfer inventoryTransfer);

    int updateInventoryTransfer(InventoryTransfer inventoryTransfer);

    List<Map<String,Object>> queryApproveInventory(Integer pageSize, Integer pageNum, String code, String startTime, String endTime);

    int queryApproveInventoryCount(String code, String startTime, String endTime);

    //换货入库
    List<Map<String,Object>> exchengOutInventory(String orderStatus,Integer pageSize, Integer pageNum, String code, String status, String storeHouse, String startTime, String endTime,Integer storehouserId,Integer exchangeStatus,Integer retType);

    int exchengOutInventoryCount(String orderStatus,String code, String status, String storeHouse, String startTime, String endTime,Integer StorehouserId,Integer exchangeStatus,Integer retType);
    //换货的商品
    List<Product> getExcangeProduct(String orderNumber);
    InventoryTransfRequest getInventoryDetail(String code);
    OutInventoryRecordDetail getOutReturnExchangeDetail(String orderNumber);
}
