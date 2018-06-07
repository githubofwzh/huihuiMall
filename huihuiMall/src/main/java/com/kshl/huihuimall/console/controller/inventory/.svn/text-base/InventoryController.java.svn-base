package com.kshl.huihuimall.console.controller.inventory;

import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.InventoryIn;
import com.kshl.huihuimall.base.dal.entity.InventoryOut;
import com.kshl.huihuimall.base.dal.entity.InventoryRecord;
import com.kshl.huihuimall.base.dal.entity.InventoryTransfer;
import com.kshl.huihuimall.console.controller.inventory.request.*;
import com.kshl.huihuimall.console.controller.order.OrderController;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.console.service.order.OrderService;
import com.kshl.huihuimall.console.service.storehouse.StoreHouseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.console.service.inventory.InventoryService;

import javax.servlet.http.HttpServletRequest;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

/**
 * 库存管理
 * @author yxj
 */
@Controller
@RequestMapping("/Inventory")
public class InventoryController {


    @Autowired
    private InventoryService inventoryService;

    /**
     * 库存管理
     * 分页查询库存管理
     * @param request
     * @return
     */
    @RequestMapping(value="/queryInventory", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryInventory(InventoryMgRequest request,HttpServletRequest servletRequest){
        
        return inventoryService.getInventory(request,servletRequest);
    }
    /**
     * 入库管理
     * 分页查询入库存管理
     * @param request
     * @return
     */
    @RequestMapping(value="/queryInInventory", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryInInventory(InventoryMgRequest request,HttpServletRequest servletRequest){

        return inventoryService.getInInventory(request,servletRequest);
    }

    /**
     * 入库管理
     * 发起入库单
     * @param
     * @return
     */
    @RequestMapping(value="/InInventoryAction", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse InInventoryAction(StockRequest stockRequest,HttpServletRequest request){

        return inventoryService.InInventoryAction(stockRequest,request);
    }

    /**
     * 入库管理
     * 入库按钮
     * @param request
     * @return
     */
    @RequestMapping(value="/InInventory", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse InInventory(StockRequest stockRequest,HttpServletRequest request){

        return inventoryService.InInventory(stockRequest,request);
    }

    /**
     * 入库记录
     * 分页查询入库记录
     * @param request
     * @return
     */
    @RequestMapping(value="/queryInventoryRecord", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryInventoryRecord(InventoryRecordRequest request,HttpServletRequest servletRequest){

        return inventoryService.queryInventoryRecord(request,servletRequest);
    }
    /**
     * 出库管理
     * 出库记录
     * 分页查询出库管理
     * @param request
     * @return
     */
    @RequestMapping(value="/queryOutInventory", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryOutInventory(OutInventoryRequest request,HttpServletRequest servletRequest){

        return inventoryService.queryOutInventory(request,servletRequest);
    }

    /**
     * 出库管理
     * 出库按钮
     * @param orderNumber
     * @return
     */
    @RequestMapping(value="/OutInventory", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse OutInventory(String orderNumber,HttpServletRequest servletRequest){

        return inventoryService.OutInventory(orderNumber,servletRequest);
    }

   /**
     * 调库管理
     * 分页查询调库管理
     * @param request
     * @return
     */
    @RequestMapping(value="/InOutInventory", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse InOutInventory(InventoryRecordRequest request, HttpServletRequest servletRequest){

        return inventoryService.InOutInventory(request, servletRequest);
    }

    /**
     * 调库管理
     * 发起调拨单
     * 转库商品
     * @param
     * @return
     */
    @RequestMapping(value="/TransferAction", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse TransferAction(TransferActionRequest request,HttpServletRequest servletRequest){

        return inventoryService.TransferAction(request,servletRequest);
    }


    /**
     * 调库管理
     * 确定调拨单
     * 是否出入库
     * @param
     * @return
     */

    @RequestMapping(value="/confirmTransfer", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse confirmTransfer(TransferRequest request,HttpServletRequest servletRequest){

        return inventoryService.confirmTransfer(request,servletRequest);
    }

    /**
     * 调库审批
     * 分页查询调库审批
     * @param request
     * @return
     */
    @RequestMapping(value="/queryApproveInventory", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryApproveInventory(InventoryRecordRequest request, HttpServletRequest servletRequest){
        return inventoryService.queryApproveInventory(request, servletRequest);
    }

    /**
     * 调库审批
     * 审批按钮
     * @param request
     * @return
     */
    @RequestMapping(value="/ApproveInventory", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse ApproveInventory(TransferActionRequest request, HttpServletRequest servletRequest){
        return inventoryService.ApproveInventory(request, servletRequest);
    }


    /**
     * 调库记录
     * 分页查询调库记录
     * @param request
     * @return
     */
    @RequestMapping(value="/InOutInventoryRecord", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse InOutInventoryRecord(InventoryRecordRequest request,  HttpServletRequest servletRequest){
        return inventoryService.InOutInventoryRecord(request,servletRequest);
    }

    /**
     * 查看入库记录详情
     * @param request
     * @return
     */
    @RequestMapping(value="/InInventoryRecordDetail", method={RequestMethod.GET})
    @ResponseBody
    public BaseResponse InInventoryRecordDetail(InventoryIn request,HttpServletRequest servletRequest){

        return inventoryService.InInventoryRecordDetail(request,servletRequest);
    }
    /**
     * 查看出库记录详情
     * @param request
     * @return
     */
    @RequestMapping(value="/outInventoryRecordDetail", method={RequestMethod.GET})
    @ResponseBody
    public BaseResponse outInventoryRecordDetail(InventoryOut request,HttpServletRequest servletRequest){

        return inventoryService.outInventoryRecordDetail(request,servletRequest);
    }

    /**
     * 查看调库记录详情
     * @param request
     * @return
     */
    @RequestMapping(value="/TransferRecordDetail", method={RequestMethod.GET})
    @ResponseBody
    public BaseResponse TransferRecordDetail(InventoryTransfer request,HttpServletRequest servletRequest){

        return inventoryService.TransferRecordDetail(request,servletRequest);
    }


    /**
     * 我的库房
     * @param
     * @return
     */
    @RequestMapping(value="/getMyStorehouse", method={RequestMethod.GET})
    @ResponseBody
    public BaseResponse getMyStorehouse(HttpServletRequest request){
        return inventoryService.getMyStorehouse(request);
    }

    /**
     * 库房list
     * @param
     * @return
     */
    @RequestMapping(value="/getStorehouseList", method={RequestMethod.GET})
    @ResponseBody
    public BaseResponse getStorehouseList(HttpServletRequest request){

        return inventoryService.getStorehouseList(request);
    }

    /**
     * 换货出库管理
     * 换货出库记录
     * 分页查询出库管理
     * @param request
     * @return
     */
    @RequestMapping(value="/exchengOutInventory", method={RequestMethod.GET})
    @ResponseBody
    public BasePageResponse exchengOutInventory(OutInventoryRequest request,HttpServletRequest servletRequest){

        return inventoryService.exchengOutInventory(request,servletRequest);
    }

    /**
     * HUANHUO出库记录详情
     */
    @RequestMapping(value="/exchengOutRecordDetail", method={RequestMethod.GET})
    @ResponseBody
    public BaseResponse exchengOutRecordDetail(InventoryOut request,String returnNumber,HttpServletRequest servletRequest){
        return inventoryService.exchengOutRecordDetail(request,returnNumber,servletRequest);
    }

    /**
     * 换货出库
     */
    @RequestMapping(value="/exchengOut", method={RequestMethod.POST})
    @ResponseBody
    public BaseResponse exchengOut(String orderNumber,HttpServletRequest servletRequest){

        return inventoryService.exchengOut(orderNumber,servletRequest);
    }

}
