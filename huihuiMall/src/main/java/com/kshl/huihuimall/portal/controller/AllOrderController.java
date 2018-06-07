package com.kshl.huihuimall.portal.controller;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.dal.dao.InventoryDao;
import com.kshl.huihuimall.portal.controller.request.AllDetailRequest;
import com.kshl.huihuimall.portal.controller.request.ReturnRecordquest;
import com.kshl.huihuimall.portal.controller.request.ReturnRequest;
import com.kshl.huihuimall.portal.service.allorder.AllOrderService;
import com.kshl.huihuimall.portal.service.ordersplit.PortalStroeOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Controller
@EnableAutoConfiguration
@RequestMapping("/PortalallOrder")
public class AllOrderController {
    private static Logger logger = LoggerFactory.getLogger(AllOrderController.class);

    @Autowired
    private AllOrderService allOrderService;
    @Autowired
    private PortalStroeOrderService portalStroeOrderService;
    @Autowired
    private InventoryDao inventoryDao;
    /*
     查询订单列表
    */
    @RequestMapping(value = "/getAllOrder", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getAllOrder(AllDetailRequest ar,HttpServletRequest request){
        logger.debug("getAllOrder start");
        int total=allOrderService.getAllOrderCount(ar.getUserId());
       // System.out.println("总共条数"+total);
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<Map<String, Object>> list=allOrderService.getAllOrder(ar);
        map.put("list",list);
        map.put("userInfo",userInfo);
        BasePageResponse pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(map);
        pageResponse.setTotal(total);
        if (ar.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (ar.getPageSize() * ar.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / ar.getPageSize();
        pageResponse.setPages(total % ar.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }
    /*
    订单详情
     */
    @RequestMapping(value = "/getDetail", method = {RequestMethod.POST})
    @ResponseBody
    @Transactional
    public BaseResponse getDetail(AllDetailRequest allDetailRequest,HttpServletRequest request){
        logger.debug("getDetail start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<ReturnRecordquest> list=allOrderService.SelectDetail(allDetailRequest.getOrderNumber());
        List<ReturnRecordquest> returnExchangeOrder= allOrderService.getDetailReturnStatus(allDetailRequest.getOrderNumber());
        //list.addAll(returnExchangeOrder);
        map.put("list",list);
        map.put("userInfo",userInfo);
        map.put("returnExchangeOrder",returnExchangeOrder);
        baseResponse.setData(map);
        return baseResponse;
    }
        /*
        获取退货的数据
         */
    @RequestMapping(value = "/getReturnP", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getReturnP(AllDetailRequest allDetailRequest,HttpServletRequest request){
        logger.debug("getReturnP start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<Map<String, Object>> list=allOrderService.SelectReturnP(allDetailRequest);
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }
    /*
      提交退货
     */
    @RequestMapping(value = "/AddReturn", method = {RequestMethod.POST})
    @ResponseBody
    @Transactional
    public  BaseResponse AddReturn(AllDetailRequest ar,HttpServletRequest request){
        BaseResponse baseResponse=new BaseResponse();
        logger.debug("AddReturn start");
        ReturnRequest list=allOrderService.getReturnAdd(ar);
        String exchangeNumber=DateFormatUtil.getOrderIdByUUId();//换货单号
        if(list!=null){
            Integer type=Integer.parseInt(request.getParameter("type"));
            String reason=  request.getParameter("reason");
            String img=  request.getParameter("reasonImg");
            ReturnExchangeOrder retur=new ReturnExchangeOrder();
            retur.setOrderNumber(exchangeNumber);//退货单号
            retur.setStoreId(list.getStore_id());
            retur.setOrderTime(new Date());
            retur.setType(type);// 退货类型
            retur.setProductId(list.getPrId());
            retur.setCount(list.getNumber());
            retur.setStoreName(list.getStorename());
            retur.setOrderType(list.getType());
            retur.setReturnImg(img);
            if(type.equals(0)){
                retur.setReturnStatus(0);
            }else{
                retur.setExchangeStatus(0);
            }
            retur.setAuditStatus(0);
            retur.setWarehouseId(list.getStorehouse_id());
            retur.setProductName(list.getName());
            retur.setOrderId(list.getOrder_number());
            retur.setReason(reason);
            allOrderService.insert(retur);
            /*
              先入库
             */
            String code="rk"+DateFormatUtil.getOrderIdByUUId();
            InventoryIn inventoryIn=new InventoryIn();
            inventoryIn.setCode(code);//入库单号
            inventoryIn.setCreateTime(new Date());
            if(type.equals(0)){
                inventoryIn.setStatus(2);
            }else{
                inventoryIn.setStatus(3);
            }
            inventoryIn.setStorehouseId(list.getStorehouse_id());
            allOrderService.insert(inventoryIn);
            InventoryToProduct inventoryToProduct=new InventoryToProduct();
            inventoryToProduct.setType(Constants.INVENTORY_TYPE.NOIN);//未入库
            inventoryToProduct.setCode(code);
            inventoryToProduct.setProductId(list.getPrId());
            int count=list.getNumber().intValue();
            inventoryToProduct.setCount(count);
            inventoryDao.inlink(inventoryToProduct);
             /*
               如果是换货再出库
             */
            if(type.equals(1)) {
                InventoryOut inventoryOut = new InventoryOut();
                inventoryOut.setCode("ck" + DateFormatUtil.getOrderIdByUUId());
                inventoryOut.setOrderNumber(exchangeNumber);
                inventoryOut.setStatus(1);
                inventoryOut.setStorehouseId(list.getStorehouse_id());
                portalStroeOrderService.insert(inventoryOut);
            }
            baseResponse.setRetCode(Long.valueOf(0));
            return baseResponse;
        }else {
            baseResponse.setRetCode(Long.valueOf(1));
            return baseResponse;
        }

    }
    /*
     退货列表
     */
    @RequestMapping(value = "/getReturnStatus", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getReturnStatus(AllDetailRequest allDetailRequest,HttpServletRequest request){
        logger.debug("getReturnStatus start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<OrderDetail> list =allOrderService.getReturnStatus(allDetailRequest.getUserId());
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

    /*
     自助机退货列表
     */
    @RequestMapping(value = "/selfServiceReturnStatus", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse selfServiceReturnStatus(AllDetailRequest allDetailRequest,HttpServletRequest request){
        logger.debug("getReturnStatus start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        List<Map<String, Object>> list =allOrderService.selfServiceReturnStatus(allDetailRequest);
        map.put("list",list);
        baseResponse.setData(map);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

   /*
     店主退货状态
    */
    @RequestMapping(value = "/UserReStatus", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse UserReStatus(ReturnExchangeOrder returnExchangeOrder,HttpServletRequest request){
        logger.debug("getReturnStatus start");
        BaseResponse baseResponse=new BaseResponse();
        allOrderService.UserReStatus(returnExchangeOrder);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

    /*
        退货状态
        */
    @RequestMapping(value = "/selfServiceStatus", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse selfServiceStatus(ReturnExchangeOrder returnExchangeOrder,HttpServletRequest request){
        logger.debug("getReturnStatus start");
        BaseResponse baseResponse=new BaseResponse();
        allOrderService.selfServiceStatus(returnExchangeOrder);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }


    /*
     退货列表详情
     */
    @RequestMapping(value = "/getReturnDetail", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getReturnDetail(AllDetailRequest allDetailRequest,HttpServletRequest request){
        logger.debug("getReturnDetail start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<Map<String, Object>> list=allOrderService.getReturnDetail(allDetailRequest);
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

    @RequestMapping(value = "/updateStoreOrderIf", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateStoreOrderIf(AllDetailRequest allDetailRequest){
        logger.debug("getReturnDetail start");
        BaseResponse baseResponse=new BaseResponse();
        allOrderService.updateStoreOrderIf(allDetailRequest.getParentId());
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

    @RequestMapping(value = "/Detaildelete", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse Detaildelete(AllDetailRequest allDetailRequest){
        logger.debug("getReturnDetail start");
        BaseResponse baseResponse=new BaseResponse();
        allOrderService.Detaildelete(allDetailRequest.getParentId());
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

    @RequestMapping(value = "/deleteOrder", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteOrder(AllDetailRequest allDetailRequest){
        logger.debug("getReturnDetail start");
        BaseResponse baseResponse=new BaseResponse();
        allOrderService.deleteOrder(allDetailRequest.getParentId());
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

    @RequestMapping(value = "/selectEntcode", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse selectEntcode(String name){
        logger.debug("getReturnDetail start");
        BaseResponse baseResponse=new BaseResponse();
        String merchant= allOrderService.selectEntcode("碧桂园");
        baseResponse.setData(merchant);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }
}
