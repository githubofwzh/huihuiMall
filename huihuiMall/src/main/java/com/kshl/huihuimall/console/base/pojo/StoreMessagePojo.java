package com.kshl.huihuimall.console.base.pojo;

import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;

import java.io.Serializable;

/**
 * 门店信息返回pojo
 */
public class StoreMessagePojo implements Serializable {
   //门店
   private Store store;
   //终端
   private Device device;
   //店主信息
   private Shopkeeper shopkeeper;

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public Device getDevice() {
        return device;
    }

    public void setDevice(Device device) {
        this.device = device;
    }

    public Shopkeeper getShopkeeper() {
        return shopkeeper;
    }

    public void setShopkeeper(Shopkeeper shopkeeper) {
        this.shopkeeper = shopkeeper;
    }
}