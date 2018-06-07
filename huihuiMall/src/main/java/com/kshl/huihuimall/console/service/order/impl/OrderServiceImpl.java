package com.kshl.huihuimall.console.service.order.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.ReturnExchangeOrder;
import com.kshl.huihuimall.base.dal.entity.SendOrder;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.console.base.pojo.*;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.console.controller.order.request.ReturnExchangeRequest;
import com.kshl.huihuimall.console.controller.order.request.SendOrderRequest;
import com.kshl.huihuimall.console.dal.dao.OrderDao;
import com.kshl.huihuimall.console.service.order.OrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;
import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    /**
     * 分页查询订单
     *
     * @param orderRequest
     * @return
     */
    @Override
    public BasePageResponse getAllOrder(OrderRequest orderRequest) {
        List<Map<String, Object>> result = orderDao.getAllOrder(orderRequest.getPageSize(), orderRequest.getPageNum(),orderRequest.getAccountId(), orderRequest.getType(), orderRequest.getOrderstatus(), orderRequest.getOrderNumber(), orderRequest.getStorename(),orderRequest.getStartTime(),orderRequest.getEndTime(),orderRequest.getEntCode(),orderRequest.getMerchantname());
        int total = orderDao.getAllOrderCount(orderRequest.getAccountId(),orderRequest.getType(), orderRequest.getOrderstatus(), orderRequest.getOrderNumber(), orderRequest.getStorename(),orderRequest.getStartTime(),orderRequest.getEndTime(),orderRequest.getEntCode(),orderRequest.getMerchantname());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (orderRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (orderRequest.getPageSize() * orderRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / orderRequest.getPageSize();
        pageResponse.setPages(total % orderRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /**
     * 添加订单
     *
     * @param orderRequest
     * @return
     */
    @Override
    public BaseResponse addOrder(OrderRequest orderRequest) {
        BaseResponse response;
        StoreOrder storeOrder = new StoreOrder();
        BeanUtils.copyProperties(orderRequest, storeOrder);
        int inseret = orderDao.addOrder(storeOrder);
        if (inseret > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }


    /**
     * 更新订单
     *
     * @param orderRequest
     * @return
     */
    @Override
    public BaseResponse updateOrder(OrderRequest orderRequest) {
        BaseResponse response;
        StoreOrder storeOrder = new StoreOrder();
        BeanUtils.copyProperties(orderRequest, storeOrder);
        int update = orderDao.updateOrder(storeOrder);
        if (update > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 删除订单
     *
     * @param orderRequest
     * @return
     */
    @Override
    public BaseResponse deleteOrder(OrderRequest orderRequest) {
        BaseResponse response;
        int delete = orderDao.deleteOrder(orderRequest.getId());
        if (delete > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 根据订单号orderNumber查看订单详情
     *
     * @param orderNumber
     * @return
     */
    @Override
    public BaseResponse getOrderDetail(String orderNumber) {
        BaseResponse response;
        List<OrderDetailProduct> orderDetailList = orderDao.getOrderDetail(orderNumber);
        StoreOrder storeOrder = orderDao.getOrderByOrderNumber(orderNumber);
        if (orderDetailList != null && orderDetailList.size() >=0 && storeOrder != null) {

            OrderDetailPojo orderDetailPojo = new OrderDetailPojo();
            orderDetailPojo.setList(orderDetailList);
            orderDetailPojo.setStoreOrder(storeOrder);
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(orderDetailPojo);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 派单列表
     * @param orderRequest
     * @return
     */
    @Override
    public BasePageResponse sendOrder(OrderRequest orderRequest) {

        List<Map<String, Object>> result = orderDao.sendOrder(orderRequest.getPageSize(), orderRequest.getPageNum(), orderRequest.getOrderstatus(), orderRequest.getOrderNumber(), orderRequest.getStorename());
        int total = orderDao.getAllsendOrder(orderRequest.getOrderstatus(), orderRequest.getOrderNumber(), orderRequest.getStorename());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (orderRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (orderRequest.getPageSize() * orderRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / orderRequest.getPageSize();
        pageResponse.setPages(total % orderRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /**
     * 添加一条派单记录
     * @param sendOrderRequest
     * @return
     */
    @Override
    public BaseResponse addSendOrder(SendOrderRequest sendOrderRequest) {
        BaseResponse response;
        SendOrder sendOrder = new SendOrder();
        BeanUtils.copyProperties(sendOrderRequest, sendOrder);
        int inseret = orderDao.addSendOrder(sendOrder);
        if (inseret > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 退换货列表
     * @param returnExchangeRequest
     * @return
     */
    @Override
    public BasePageResponse queryReturnExchangeOrder(ReturnExchangeRequest returnExchangeRequest) {

        List<Map<String, Object>> result = orderDao.queryReturnExchangeOrder(returnExchangeRequest.getPageSize(), returnExchangeRequest.getPageNum(), returnExchangeRequest.getType(), returnExchangeRequest.getOrderNumber(),returnExchangeRequest.getStoreName(),returnExchangeRequest.getOrderType(),returnExchangeRequest.getReturnStatus(),returnExchangeRequest.getExchangeStatus(),returnExchangeRequest.getAuditStatus() );
        int total = orderDao.queryReturnExchangeOrderCount(returnExchangeRequest.getType(), returnExchangeRequest.getOrderNumber(),returnExchangeRequest.getStoreName(),returnExchangeRequest.getOrderType(),returnExchangeRequest.getReturnStatus(),returnExchangeRequest.getExchangeStatus(),returnExchangeRequest.getAuditStatus());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (returnExchangeRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (returnExchangeRequest.getPageSize() * returnExchangeRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / returnExchangeRequest.getPageSize();
        pageResponse.setPages(total % returnExchangeRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;

    }

    /**
     * 根据订单号，退换货单号查询退换货详情
     * @param orderNumber
     * @return
     */
    @Override
    public BaseResponse getReturnExchangeDetail(String orderNumber, String orderId) {
        BaseResponse response=new BaseResponse();
        //StoreOrder storeOrder = orderDao.getOrderByOrderNumber(orderId);
        //退换货单号
        //if ( storeOrder != null&&returnExchangeOrder!=null) {
         //ReturnExchangePojo returnExchangePojo = new ReturnExchangePojo();
            //returnExchangePojo.setStoreOrder(storeOrder);
            //returnExchangePojo.setReturnExchangeOrder(returnExchangeOrder);
            //response = ResponseBuilder.buildBaseResponse(SUCCESS);
            //response.setData(returnExchangePojo);
        //} else {
          //  response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        //}
        Map<String,Object> returnExchangeOrder = orderDao.getRExchangeOrderByOrderNumber(orderNumber);
        response.setData(returnExchangeOrder);
        response.setRetCode(Long.valueOf(0));
        return response;
    }

    /**
     * 退换货管理（不同意/同意）
     * @param returnExchangeRequest
     * @return
     */
    @Override
    public BaseResponse updateReturnExchangeOrder(ReturnExchangeRequest returnExchangeRequest) {
        BaseResponse response;
        ReturnExchangeOrder returnExchangeOrder = new ReturnExchangeOrder();
        BeanUtils.copyProperties(returnExchangeRequest, returnExchangeOrder);
        int update = orderDao.updateReturnExchangeOrder(returnExchangeOrder);
        if (update > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

}
