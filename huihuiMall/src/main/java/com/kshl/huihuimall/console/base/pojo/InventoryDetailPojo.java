package com.kshl.huihuimall.console.base.pojo;

import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.console.base.dto.Stock;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class InventoryDetailPojo implements Serializable {

    //商品详情集合
    private  List<Stock> list;
   //入库记录对象
    private InventoryIn inventoryIn;
    //出库记录对象
    private InventoryOut inventoryOut;
    //调库记录对象
    private InventoryTransfer inventoryTransfer;
    //下单对象
    private StoreOrder storeOrder;

    public StoreOrder getStoreOrder() {
        return storeOrder;
    }

    public void setStoreOrder(StoreOrder storeOrder) {
        this.storeOrder = storeOrder;
    }

    public InventoryOut getInventoryOut() {
        return inventoryOut;
    }

    public void setInventoryOut(InventoryOut inventoryOut) {
        this.inventoryOut = inventoryOut;
    }

    public InventoryTransfer getInventoryTransfer() {
        return inventoryTransfer;
    }

    public void setInventoryTransfer(InventoryTransfer inventoryTransfer) {
        this.inventoryTransfer = inventoryTransfer;
    }

    public List<Stock> getList() {
        return list;
    }

    public void setList(List<Stock> list) {
        this.list = list;
    }

    public InventoryIn getInventoryIn() {
        return inventoryIn;
    }

    public void setInventoryIn(InventoryIn inventoryIn) {
        this.inventoryIn = inventoryIn;
    }
}