package com.kshl.huihuimall.portal.service.frontorder.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.StoreOrder;
import com.kshl.huihuimall.console.base.pojo.OrderCustomer;
import com.kshl.huihuimall.console.base.pojo.OrderDetailPojo;
import com.kshl.huihuimall.console.base.pojo.OrderDetailProduct;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.console.dal.dao.OrderDao;
import com.kshl.huihuimall.portal.dal.dao.FrontOrderDao;
import com.kshl.huihuimall.portal.service.frontorder.FrontOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class FrontOrderServiceImpl implements FrontOrderService {


    @Autowired
    private FrontOrderDao frontOrderDao;

    @Autowired
    private OrderDao orderDao;


    /**
     * 根据门店Id查询订单（分页查询）
     *
     * @param orderRequest
     * @return
     */
    @Override
    public BasePageResponse getOrderByStoreId(OrderRequest orderRequest) {
        List<Map<String, Object>> result = frontOrderDao.getOrderByStoreId(orderRequest.getPageSize(), orderRequest.getPageNum(), orderRequest.getStoreId(), orderRequest.getOrderstatus(),orderRequest.getOrderNumber());
        int total = frontOrderDao.getOrderByStoreIdCount(orderRequest.getStoreId(), orderRequest.getOrderstatus(),orderRequest.getOrderNumber());
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
     *更新订单状态（收货取货）
     * @param orderStatus
     * @param objs
     * @return
     */
    @Override
    public BaseResponse updateFrontOrder(String orderStatus, Object[] objs) {
        BaseResponse response;
        StoreOrder storeOrder = new StoreOrder();
        Date date = new Date();
        if (objs.length > 0) {
            for (int i=0;i<objs.length;i++){
                String orderNumber= objs[i].toString();
                storeOrder.setOrderstatus(orderStatus);
                storeOrder.setOrderNumber(orderNumber);
                //收货取货时间
                if (orderStatus.equals("4")){
                    storeOrder.setReceiveTime(date);
                }else if (orderStatus.equals("5")){
                    storeOrder.setEndTime(date);
                }
               int update = frontOrderDao.updateFrontOrder(storeOrder);
            }
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    /**
     * 查看订单详情
     * @param orderNumber
     * @return
     */
    @Override
    public BaseResponse getOrderDetail(String orderNumber) {
        BaseResponse response;
        List<OrderDetailProduct> orderDetailList = orderDao.getOrderDetail(orderNumber);
        OrderCustomer orderCustomer = frontOrderDao.getOrderByOrderNumber(orderNumber);
        if (orderDetailList != null && orderDetailList.size() >=0 && orderCustomer != null) {

            OrderDetailPojo orderDetailPojo = new OrderDetailPojo();
            orderDetailPojo.setList(orderDetailList);
            orderDetailPojo.setOrderCustomer(orderCustomer);
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(orderDetailPojo);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }
}
