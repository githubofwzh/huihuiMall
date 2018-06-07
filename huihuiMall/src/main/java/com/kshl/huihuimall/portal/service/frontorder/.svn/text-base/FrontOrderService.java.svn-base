package com.kshl.huihuimall.portal.service.frontorder;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;

/**
 * 前台订单表service接口
 */
public interface FrontOrderService {

    //根据门店Id查询订单（分页查询）
    BasePageResponse getOrderByStoreId(OrderRequest orderRequest);
   //更新订单状态（收货取货）
    BaseResponse updateFrontOrder(String orderStatus, Object[] objs);

    BaseResponse getOrderDetail(String orderNumber);
}
