package com.kshl.huihuimall.console.controller.order;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.ReturnExchangeOrder;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.console.controller.order.request.ReturnExchangeRequest;
import com.kshl.huihuimall.console.controller.order.request.SendOrderRequest;
import com.kshl.huihuimall.console.service.order.OrderService;
import com.kshl.huihuimall.portal.controller.request.ReturnRecordquest;
import com.kshl.huihuimall.portal.service.allorder.AllOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import java.util.Date;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

/**
 * 订单Controller
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/order")
public class OrderController {

    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;
    @Autowired
    private AllOrderService allOrderService;

    /**
     * 分页查询订单表
     *
     * @param orderRequest
     * @return
     */
    @RequestMapping(value = "/queryAllOrder", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllOrder(OrderRequest orderRequest) {
        logger.debug("queryAllOrder start");
        return orderService.getAllOrder(orderRequest);
    }

    /**
     * 添加订单
     */
    @RequestMapping(value = "/addOrder", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addOrder(@Valid OrderRequest orderRequest,
                                 BindingResult bindingResult) {
        logger.debug("addOrder start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[OrderRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            //获取订单号
            String orderNumber = DateFormatUtil.getHaoMiao();
            Date date =new Date();
            orderRequest.setOrderNumber(orderNumber);
            //orderRequest.setStartTime(date);
            response = orderService.addOrder(orderRequest);
        }
        return response;
    }

    /**
     * 更新订单信息(第三方商家更新订单状态，改为已出库)
     */
    @RequestMapping(value = "/updateOrder", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateOrder(OrderRequest orderRequest) {
        logger.debug("updateOrder start");
        BaseResponse response;
        if (orderRequest.getId() == null) {
            logger.warn("[OrderRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = orderService.updateOrder(orderRequest);
        }
        return response;
    }

    /**
     * 删除订单信息
     */
    @RequestMapping(value = "/deleteOrder", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteOrder(OrderRequest orderRequest) {
        logger.debug("deleteOrder start");
        BaseResponse response;
        if (orderRequest.getId() == null) {
            logger.warn("[OrderRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = orderService.deleteOrder(orderRequest);
        }
        return response;
    }

    /**
     * 根据订单号查看订单详情
     *
     * @param orderRequest
     * @return
     */
    @RequestMapping(value = "/getOrderDetail", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getOrderDetail(OrderRequest orderRequest) {
        logger.debug("getOrderDetail start");
        BaseResponse response;
        if (orderRequest.getOrderNumber() == null) {
            logger.warn("[OrderRequest] param error orderNumber can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = orderService.getOrderDetail(orderRequest.getOrderNumber());
        }

        return response;
    }

    /**
     * 派单列表（即是状态是已支付的订单）
     *
     * @param orderRequest
     * @return
     */
    @RequestMapping(value = "/sendOrder", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse sendOrder(OrderRequest orderRequest) {
        logger.debug("sendOrder start");
        //设置状态为已支付的
        orderRequest.setOrderstatus("3");
        return orderService.sendOrder(orderRequest);
    }

    /**
     * 添加一条派单记录
     */
    @RequestMapping(value = "/addSendOrder", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addOrder(@Valid SendOrderRequest sendOrderRequest,
                                 BindingResult bindingResult) {
        logger.debug("addSendOrder start");
        BaseResponse response;
        if (bindingResult.hasErrors()) {
            logger.warn("[SendOrderRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            Date date = new Date();
            sendOrderRequest.setSendtime(date);
            response = orderService.addSendOrder(sendOrderRequest);
        }
        return response;
    }

    /**
     * 退换货列表
     *
     * @param returnExchangeRequest
     * @return
     */
    @RequestMapping(value = "/queryReturnExchangeOrder", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryReturnExchangeOrder(ReturnExchangeRequest returnExchangeRequest) {
        logger.debug("queryReturnExchangeOrder start");
        //退货单状态
       // returnExchangeRequest.setReturnStatus(1);
        //换货单状态
       // returnExchangeRequest.setExchangeStatus(1);
        //审核状态默认是1
        //returnExchangeRequest.setAuditStatus(1);
        return orderService.queryReturnExchangeOrder(returnExchangeRequest);
    }


    /**
     * 根据订单号，退换货单号查询退换货详情
     *
     * @param returnExchangeRequest
     * @return
     */
    @RequestMapping(value = "/getReturnExchangeDetail", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getReturnExchangeDetail(ReturnExchangeRequest returnExchangeRequest) {
        logger.debug("getReturnExchangeDetail start");
        BaseResponse response;
        if (returnExchangeRequest.getOrderNumber() == null) {
            logger.warn("[returnExchangeRequest] param error orderNumber");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
        response = orderService.getReturnExchangeDetail(returnExchangeRequest.getOrderNumber(), returnExchangeRequest.getOrderId());
        }
        return response;
        }

    /**
     * 更新退换货订单状态
     */
    @RequestMapping(value = "/updateReturnExchangeStus", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateReturnExchangeStus(ReturnExchangeOrder returnExchangeOrder) {
        logger.debug("updateReturnExchangeOrder start");
        BaseResponse response=new BaseResponse();
        if (returnExchangeOrder.getOrderNumber() == null) {
            logger.warn("[ReturnExchangeRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            allOrderService.selfServiceStatus(returnExchangeOrder);
            response.setRetCode(Long.valueOf(0));
        }
        return response;
    }


    @RequestMapping(value = "/ReturnRecord", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse ReturnRecord(ReturnRecordquest re,String startTime,String endTime) {
        logger.debug("updateReturnExchangeOrder start");
        BasePageResponse response=new BasePageResponse();
        return allOrderService.ReturnRecord(re.getType(),re.getPageNum(),re.getPageSize(),re.getOrderNumber(),re.getStoreName(),startTime,endTime);
    }

    @RequestMapping(value = "/ReturnRecordDetail", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse ReturnRecordDetail(ReturnRecordquest re) {
        logger.debug("updateReturnExchangeOrder start");
        BaseResponse response=new BaseResponse();
        Map<String, Object> enty= allOrderService.ReturnRecordDetail(re.getOrderNumber());
        response.setData(enty);
        response.setRetCode(Long.valueOf(0));
        return response;
    }

}
