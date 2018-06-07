package com.kshl.huihuimall.console.base.pojo;

import com.kshl.huihuimall.base.dal.entity.StoreOrder;

import java.io.Serializable;
import java.util.List;

public class OrderDetailPojo implements Serializable {

  //订单详情，商品集合
  private  List<OrderDetailProduct> list;
  //订单对象
   private StoreOrder storeOrder;
   //订单Customer对象
   private OrderCustomer orderCustomer;

    public StoreOrder getStoreOrder() {
        return storeOrder;
    }

    public void setStoreOrder(StoreOrder storeOrder) {
        this.storeOrder = storeOrder;
    }

    public List<OrderDetailProduct> getList() {
        return list;
    }

    public void setList(List<OrderDetailProduct> list) {
        this.list = list;
    }

    public OrderCustomer getOrderCustomer() {
        return orderCustomer;
    }

    public void setOrderCustomer(OrderCustomer orderCustomer) {
        this.orderCustomer = orderCustomer;
    }

    @Override
    public String toString() {
        return "OrderDetailPojo{" +
                "list=" + list +
                ", storeOrder=" + storeOrder +
                ", orderCustomer=" + orderCustomer +
                '}';
    }
}