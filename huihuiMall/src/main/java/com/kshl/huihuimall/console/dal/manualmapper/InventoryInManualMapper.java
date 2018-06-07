package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.InventoryIn;
import com.kshl.huihuimall.console.base.pojo.InventoryInPojo;

import java.util.List;
import java.util.Map;

public interface InventoryInManualMapper {


    List<Map<String,Object>> queryInInventoryRecord(Map<String, Object> map);

    Integer queryInInventoryRecordCount(Map<String, Object> map);

    InventoryIn getInventoryIn(String code);

    List<Map<String,Object>> getInInventory(Map<String, Object> map);

    int getInInventoryCount(Map<String, Object> map);

    InventoryInPojo  getInventoryInById(Integer id);
}