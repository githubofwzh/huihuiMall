package com.kshl.huihuimall.console.base.pojo;

import com.kshl.huihuimall.base.dal.entity.InventoryTransfer;
import com.kshl.huihuimall.console.controller.inventory.request.InventoryTransfRequest;

import java.util.List;

public class TransferPojo {
    InventoryTransfer inventoryTransfer;
    InventoryTransfRequest inventoryTransfRequest;
    List<OrderDetailProduct> OrderDetailProduct;
    //打印从系统获取
    private String czName;
    private String czTime;

    public String getCzName() {
        return czName;
    }

    public void setCzName(String czName) {
        this.czName = czName;
    }

    public String getCzTime() {
        return czTime;
    }

    public void setCzTime(String czTime) {
        this.czTime = czTime;
    }

    public InventoryTransfRequest getInventoryTransfRequest() {
        return inventoryTransfRequest;
    }

    public void setInventoryTransfRequest(InventoryTransfRequest inventoryTransfRequest) {
        this.inventoryTransfRequest = inventoryTransfRequest;
    }

    public InventoryTransfer getInventoryTransfer() {
        return inventoryTransfer;
    }

    public void setInventoryTransfer(InventoryTransfer inventoryTransfer) {
        this.inventoryTransfer = inventoryTransfer;
    }

    public List<com.kshl.huihuimall.console.base.pojo.OrderDetailProduct> getOrderDetailProduct() {
        return OrderDetailProduct;
    }

    public void setOrderDetailProduct(List<com.kshl.huihuimall.console.base.pojo.OrderDetailProduct> orderDetailProduct) {
        OrderDetailProduct = orderDetailProduct;
    }
}
