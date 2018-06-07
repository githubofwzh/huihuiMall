package com.kshl.huihuimall.console.service.inventory;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.console.controller.inventory.request.*;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface InventoryService {
    //库存管理
    public BasePageResponse getInventory(InventoryMgRequest request,HttpServletRequest httpServletRequest);
    //入库
    public BaseResponse InInventory(StockRequest stockRequest, HttpServletRequest request);
    //出库管理
    BasePageResponse queryOutInventory(OutInventoryRequest request,HttpServletRequest servletRequest);
    //记录
    BasePageResponse queryInventoryRecord(InventoryRecordRequest request,HttpServletRequest servletRequest);
    //出库
    BaseResponse OutInventory(String  orderCode,HttpServletRequest servletRequest);
    //调库管理
    BasePageResponse InOutInventory(InventoryRecordRequest request, HttpServletRequest servletRequest);
    //确定调拨单（是否出入库）
    BaseResponse confirmTransfer(TransferRequest request,HttpServletRequest servletRequest);
    //发起调拨单（转库商品）
   BaseResponse TransferAction(TransferActionRequest request,HttpServletRequest servletRequest);
   //入库记录详情
    BaseResponse InInventoryRecordDetail(InventoryIn request,HttpServletRequest servletRequest);
    //出库记录详情
    BaseResponse outInventoryRecordDetail(InventoryOut request,HttpServletRequest servletRequest);
    //调库详情
    BaseResponse TransferRecordDetail(InventoryTransfer request,HttpServletRequest servletRequest);
//    //导出入库记录excel表格
//    BaseResponse inExportExcel(ExportExcelRequest request);
//    //导出出库记录excel表格
//    BaseResponse outExportExcel(ExportExcelRequest request);
//    //导调库库记录excel表格
//    BaseResponse transferExportExcel(ExportExcelRequest request);
    //获取库房list
    BaseResponse getStorehouseList(HttpServletRequest request);
    //分页查询入库
    BasePageResponse getInInventory(InventoryMgRequest request, HttpServletRequest servletRequest);
    //我的库房
    BaseResponse getMyStorehouse(HttpServletRequest request);
    //发起入库单
    BaseResponse InInventoryAction(StockRequest stockRequest,HttpServletRequest request);
    //分页查询调库记录
    BasePageResponse InOutInventoryRecord(InventoryRecordRequest request,HttpServletRequest servletRequest);
    //发起调库审批
    BaseResponse ApproveInventory(TransferActionRequest request, HttpServletRequest servletRequest);
    //分页查询调库审批
    BasePageResponse queryApproveInventory(InventoryRecordRequest request, HttpServletRequest servletRequest);
    //退货出库管理
    BasePageResponse exchengOutInventory(OutInventoryRequest request,HttpServletRequest servletRequest);
    //退货出库记录详情
    BaseResponse exchengOutRecordDetail(InventoryOut request,String returnNumber,HttpServletRequest servletRequest);
    // 换货出库
    BaseResponse exchengOut(String  orderCode,HttpServletRequest servletRequest);
}
