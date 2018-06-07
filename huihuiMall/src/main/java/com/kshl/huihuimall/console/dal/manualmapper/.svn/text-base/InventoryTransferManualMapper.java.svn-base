package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.InventoryTransfer;
import com.kshl.huihuimall.console.controller.inventory.request.InventoryTransfRequest;

import java.util.List;
import java.util.Map;

public interface InventoryTransferManualMapper {


    List<Map<String,Object>> queryTransferInventoryRecord(Map<String, Object> map);

    int queryTransferInventoryRecordCountCount(Map<String, Object> map);

    List<Map<String,Object>> InOutInventory(Map<String, Object> map);

    int InOutInventoryCount(Map<String, Object> map);

    InventoryTransfer getInventoryTransferbycode(String code);

    int InOutInventoryRecordCount(Map<String, Object> map);

    List<Map<String,Object>> InOutInventoryRecord(Map<String, Object> map);

    int updateInventoryTransferBycode(InventoryTransfer inventoryTransfer);

    List<Map<String,Object>> queryApproveInventory(Map<String, Object> map);

    int queryApproveInventoryCount(Map<String, Object> map);

    InventoryTransfRequest getInventoryDetail(String code);
}