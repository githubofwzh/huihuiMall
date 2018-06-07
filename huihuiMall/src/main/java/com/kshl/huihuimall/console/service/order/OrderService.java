package com.kshl.huihuimall.console.service.order;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.console.controller.order.request.ReturnExchangeRequest;
import com.kshl.huihuimall.console.controller.order.request.SendOrderRequest;

/**
 * 订单表service接口
 */
public interface OrderService {
    //分页查询订单
    BasePageResponse getAllOrder(OrderRequest orderRequest);

    //添加订单
    BaseResponse addOrder(OrderRequest orderRequest);

    //更新订单
    BaseResponse updateOrder(OrderRequest orderRequest);

    //删除订单
    BaseResponse deleteOrder(OrderRequest orderRequest);

    //根据订单id查看订单详情
    BaseResponse getOrderDetail(String orderNumber);

    //查询派单列表
    BasePageResponse sendOrder(OrderRequest orderRequest);
    //添加一条派单记录
    BaseResponse addSendOrder(SendOrderRequest sendOrderRequest);

    //退换货列表
    BasePageResponse queryReturnExchangeOrder(ReturnExchangeRequest returnExchangeRequest);
    //根据订单号查询退换货详情
    BaseResponse getReturnExchangeDetail(String orderNumber, String orderId);
    //退换货管理（不同意/同意）
    BaseResponse updateReturnExchangeOrder(ReturnExchangeRequest returnExchangeRequest);
}
