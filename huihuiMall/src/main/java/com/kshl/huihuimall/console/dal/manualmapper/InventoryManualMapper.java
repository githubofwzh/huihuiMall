package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.console.base.pojo.OrderDetailProduct;
import com.kshl.huihuimall.console.controller.inventory.request.TransferActionRequest;

import java.util.List;
import java.util.Map;

public interface InventoryManualMapper {


    List<Map<String,Object>> getInventory(Map<String, Object> map);

    int updateInventory(Inventory inventory);

    Inventory getInventorybyProductId(Integer productId);

    Inventory getInventorybyProductIdAndhouseId(Inventory inventory);

    int getInventoryCount(Map<String, Object> map);

    OutInventoryRecordDetail getOutInventoryRecordDetail(String orderNumber);

    List<Product> getProductListByOrderNumber(String orderNumber);

    List<OrderDetailProduct> getProductListByInventoryInId(Integer id);

    List<OrderDetailProduct> getProductListByTranferCode(String code);

    int updateInventoryIn(InventoryIn inventoryin);

    int updateInlink(InventoryToProduct inventoryToProduct);
    //换货的商品
    List<Product> getExcangeProduct(String orderNumber);
    //换货详情
    OutInventoryRecordDetail getOutReturnExchangeDetail(String orderNumber);

}