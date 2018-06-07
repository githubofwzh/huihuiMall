package com.kshl.huihuimall.portal.controller;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.console.service.order.OrderService;
import com.kshl.huihuimall.portal.service.frontorder.FrontOrderService;
import com.kshl.huihuimall.portal.service.sms.SmsService;
import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

/**
 * 前台店主端订单Controller
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/frontorder")
public class FrontOrderController {

    private static final Logger logger = LoggerFactory.getLogger(FrontOrderController.class);

    @Autowired
    private FrontOrderService frontOrderService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private SmsService smsService;

    /**
     * 根据门店Id查询已完成订单（分页查询）
     * @param orderRequest
     * @return
     */
    @RequestMapping(value = "/getOrderByStoreId", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse getOrderByStoreId(OrderRequest orderRequest) {
        logger.debug("getOrderByStoreId start");
        //订单状态设为已完成
        return frontOrderService.getOrderByStoreId(orderRequest);
    }

    /**
     * 根据订单号查询订单详情（关联Customer和Product）
     * @param orderRequest
     * @return
     */
    @RequestMapping(value = "/getFrontOrderDetail", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getFrontOrderDetail(OrderRequest orderRequest) {
        logger.debug("getFrontOrderDetail start");
        BaseResponse response;
        if (orderRequest.getOrderNumber() == null) {
            logger.warn("[OrderRequest] param error orderNumber can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = frontOrderService.getOrderDetail(orderRequest.getOrderNumber());
        }

        return response;
    }

    /**
     * 更新订单状态（收货取货），收货orderStatus=4取货orderStatus=5
     * @param orderStatus
     * @param data
     * @return
     */
    @RequestMapping(value = "/updateFrontOrder", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateFrontOrder(String orderStatus,String data,String phoneNumber,String storeaddress) {
        logger.debug("updateFrontOrder start");
        BaseResponse response;
        //json对象转换成数组
        JSONArray jsonArray = JSONArray.fromObject(data);
        Object[] objs = jsonArray.toArray();
        if (objs==null||objs.length==0) {
            logger.warn("[data] param error data can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            //传过去一个id，一个String类型的数组
            response = frontOrderService.updateFrontOrder(orderStatus,objs);
           if(orderStatus.equals("6")){
               if(phoneNumber!=null&&phoneNumber!=""){
                   String content="您的商品已到"+storeaddress+"，请及时收取";
                   smsService.smsContent(content,phoneNumber);
               }
           }

        }
        return response;
    }



}
