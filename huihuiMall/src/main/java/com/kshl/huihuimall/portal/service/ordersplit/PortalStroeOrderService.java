package com.kshl.huihuimall.portal.service.ordersplit;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.InventoryOut;
import com.kshl.huihuimall.base.dal.entity.OrderDetail;
import com.kshl.huihuimall.base.dal.entity.ProfitRecord;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.portal.controller.request.ProfitRequest;

public interface PortalStroeOrderService {

    int insertStore(StoreOrder record);

    int insertDetail(OrderDetail record);

    int insert(InventoryOut record);
    //记录分店分润
    BaseResponse insertOrderProfit(ProfitRequest profitRequest);
    //分润用
    BaseResponse getOrderProfit(ProfitRequest profitRequest);
    //总分润用
    BaseResponse getTotalOrderProfit(ProfitRequest profitRequest);
    //更新分润状态
    int updateOrderProfit(ProfitRecord profitRecord);
}
