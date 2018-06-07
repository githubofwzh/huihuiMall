package com.kshl.huihuimall.console.service.inventory.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.dao.ProductDao;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.base.pojo.InventoryInPojo;
import com.kshl.huihuimall.console.base.pojo.OrderDetailProduct;
import com.kshl.huihuimall.console.base.pojo.TransferPojo;
import com.kshl.huihuimall.console.base.vo.InInventoryExcel;
import com.kshl.huihuimall.console.controller.inventory.request.*;
import com.kshl.huihuimall.console.dal.dao.InventoryDao;
import com.kshl.huihuimall.console.dal.dao.OrderDao;
import com.kshl.huihuimall.console.dal.dao.StoreHouseDao;
import com.kshl.util.PoiExcelExport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kshl.huihuimall.console.service.inventory.InventoryService;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class InventoryServiceImpl implements InventoryService{
    @Autowired
    private InventoryDao inventoryDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private StoreHouseDao storeHouseDao;

    @Override
    public BasePageResponse getInventory(InventoryMgRequest request,HttpServletRequest httpServletRequest) {
        HttpSession session=httpServletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer StorehouserId=null;
        if(storehouse!=null){
            StorehouserId=storehouse.getId();
        }

        if(storehouse==null&&request.getStorehouseId()!=null){
            StorehouserId=request.getStorehouseId();
        }

        List<Map<String, Object>> result = inventoryDao.getInventory(request.getPageSize(),
                request.getPageNum(), request.getProductName(),request.getProductCode(),StorehouserId);

        int total = inventoryDao.getInventoryCount(request.getProductName(),request.getProductCode(),StorehouserId);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);

        return pageResponse;
    }

    //发起入库单
    @Override
    public BaseResponse InInventoryAction(StockRequest stockRequest,HttpServletRequest request) {
        BaseResponse response;
        HttpSession session=request.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouseId=null;
        if(storehouse!=null){
            storehouseId=storehouse.getId();
        }
        // 入库单号
        String code = "rk"+ DateFormatUtil.getOrderIdByUUId();
        Integer Status;

        JSONArray jsonArray = JSONArray.fromObject(stockRequest.getProuducts());
        Object[] objs = jsonArray.toArray();
        InventoryToProduct inventoryToProduct=new InventoryToProduct();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
             Status= new Integer(jsonObject.get("stockStatus").toString());//商品数量;
            Integer productId = new Integer(jsonObject.get("id").toString());//商品id;
            Integer onhand= new Integer(jsonObject.get("count").toString());//商品数量;
            //更新商品库存中间表
            inventoryToProduct.setType(Constants.INVENTORY_TYPE.NOIN);//未入库
            inventoryToProduct.setCode(code);
            inventoryToProduct.setProductId(productId);
            inventoryToProduct.setCount(onhand);
            int num = inventoryDao.inlink(inventoryToProduct);
            if (num < 0) {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                response.setRetMsg("添加商品库存中间表失败");
                return response;
            }
            //入库
            InventoryIn inventoryin=new InventoryIn();
            inventoryin.setCode(code);
            inventoryin.setStatus(Status);//默认采购
            inventoryin.setStorehouseId(storehouseId);//从用户对象获取
            inventoryin.setCreateUser(account.getName());//从用户对象获取
            inventoryin.setCreateTime(new Date());
            int count = inventoryDao.inInventory(inventoryin);//添加入库单
            if (count < 0) {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                response.setRetMsg("添加入库单失败");
                return response;
            }
        }
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        return response;
    }

    //入库
    @Override
    @Transactional
    public BaseResponse InInventory(StockRequest stockRequest,HttpServletRequest request) {
        BaseResponse response;
        HttpSession session=request.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouseId=null;
        if(storehouse!=null){
            storehouseId=storehouse.getId();
        }
        Integer inLineId = stockRequest.getInLineId();
        InventoryIn inventoryin=new InventoryIn();
        inventoryin.setId(inLineId);
        int count = inventoryDao.updateInventoryIn(inventoryin);//添加入库单
        if (count < 0) {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            response.setRetMsg("更新入库单失败");
            return response;
        }
        InventoryToProduct inProduct = inventoryDao.selectByPrimaryKey(inLineId);
        Inventory selectInventory=new Inventory();
        InventoryToProduct inventoryToProduct=new InventoryToProduct();
        if(inProduct!=null) {
            Integer productId = inProduct.getProductId();//商品id;
            Integer onhand = inProduct.getCount();//商品数量
            //更新商品库存中间表
            inventoryToProduct.setType(Constants.INVENTORY_TYPE.IN);//入库
            inventoryToProduct.setId(inLineId);
            int num = inventoryDao.updateInlink(inventoryToProduct);
            if (num < 0) {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                response.setRetMsg("更新商品库存中间表状态失败");
                return response;
            }
            selectInventory.setStorehouseId(storehouseId);
            selectInventory.setProductId(productId);
            Inventory inventory = inventoryDao.getInventorybyProductIdAndhouseId(selectInventory);
            if(inventory!=null){
                selectInventory.setOnhand(inventory.getOnhand()+onhand);
                int total = inventoryDao.updateInventory(selectInventory);
                if(total < 0){
                    response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                    return response;
                }
            }else{
                selectInventory.setOnhand(onhand);
                int total = inventoryDao.insertInventory(selectInventory);
                if(total < 0){
                    response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                    return response;
                }
            }
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        return response;
    }


    @Override
    public BasePageResponse queryOutInventory(OutInventoryRequest request,HttpServletRequest servletRequest) {
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouserId=null;
        if(storehouse!=null){
            storehouserId=storehouse.getId();
        }
        List<Map<String, Object>> result = inventoryDao.queryOutInventory(request.getOrderStatus(),
                request.getPageSize(), request.getPageNum(),
                request.getCode(), request.getStatus(), request.getStoreHouse(),request.getStartTime(),request.getEndTime(),storehouserId,request.getExchangeStatus(),request.getRetType());

        int total = inventoryDao.queryOutInventoryCount(request.getOrderStatus(),request.getCode(), request.getStatus(),request.getStoreHouse(),
                request.getStartTime(),request.getEndTime(),storehouserId,request.getExchangeStatus(),request.getRetType());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);

        return pageResponse;
    }

    //查询入库记录
    @Override
    public BasePageResponse queryInventoryRecord(InventoryRecordRequest request,HttpServletRequest servletRequest) {
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouserId=null;
        if(storehouse!=null){
            storehouserId=storehouse.getId();
        }
        List<Map<String, Object>> result=inventoryDao.queryInInventoryRecord(request.getPageNum(),request.getPageSize(),request.getCode(),
                request.getStatus(),request.getStartTime(),request.getEndTime(),storehouserId);
        int total=inventoryDao.queryInInventoryRecordCount(request.getCode(),request.getStatus(),
                request.getStartTime(),request.getEndTime(),storehouserId);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);

        return pageResponse;
    }
    //出库
    @Override
    public BaseResponse OutInventory(String orderNumber, HttpServletRequest servletRequest) {
        BaseResponse response;
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouserId=null;
        if(storehouse!=null){
            storehouserId=storehouse.getId();
        }
        Inventory selectInventory=new Inventory();
        selectInventory.setStorehouseId(storehouserId);

        List<Product> productList = inventoryDao.getProductListByOrderNumber(orderNumber);
        for(Product product : productList) {
            selectInventory.setProductId(product.getId());
            Inventory inventory = inventoryDao.getInventorybyProductIdAndhouseId(selectInventory);
            if (inventory==null || inventory.getOnhand()==0){
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                response.setRetMsg("出库失败：该订单有商品库存不足");
                response.setData(20005);
                return response;
            } else {
                selectInventory.setOnhand(inventory.getOnhand() - 1);
                inventoryDao.updateInventory(selectInventory);
            }
        }

        InventoryOut inventoryOut = new InventoryOut();
        inventoryOut.setOrderNumber(orderNumber);
        inventoryOut.setCreateUser(account.getName());
        int count = inventoryDao.updateOutInventory(inventoryOut);
        StoreOrder storeOrder = new StoreOrder();
        storeOrder.setOrderNumber(orderNumber);
        storeOrder.setOrderstatus("4");
        int total = orderDao.updateStoreOrder(storeOrder);

        if(count>0 && total>0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setRetMsg("出库成功");
            return response;
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            response.setRetMsg("出库失败");
            return response;
        }
    }

    @Override
    public BasePageResponse InOutInventory(InventoryRecordRequest request, HttpServletRequest servletRequest) {
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouserId=null;
        if(storehouse!=null){
            storehouserId=storehouse.getId();
        }
        List<Map<String, Object>> result = inventoryDao.InOutInventory(request.getPageSize(),
                request.getPageNum(), request.getCode(),request.getStatus(),request.getStartTime(),request.getEndTime(),storehouserId);

        int total = inventoryDao.InOutInventoryCount(request.getCode(),request.getStatus(),request.getStartTime(),request.getEndTime(),storehouserId);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);

        return pageResponse;
    }


    @Override
    public BasePageResponse InOutInventoryRecord(InventoryRecordRequest request, HttpServletRequest servletRequest) {
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouseId=null;
        if(storehouse!=null){
            storehouseId=storehouse.getId();
        }
        List<Map<String, Object>> result = inventoryDao.InOutInventoryRecord(request.getPageSize(),
                request.getPageNum(), request.getCode(),request.getStatus(),request.getStartTime(),request.getEndTime(),storehouseId);
        int total = inventoryDao.InOutInventoryRecordCount(request.getCode(),request.getStatus(),request.getStartTime(),request.getEndTime(),storehouseId);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);

        return pageResponse;
    }

    @Override
    public BasePageResponse queryApproveInventory(InventoryRecordRequest request, HttpServletRequest servletRequest) {
        List<Map<String, Object>> result = inventoryDao.queryApproveInventory(request.getPageSize(),
                request.getPageNum(), request.getCode(),request.getStartTime(),request.getEndTime());

        int total = inventoryDao.queryApproveInventoryCount(request.getCode(),request.getStartTime(),request.getEndTime());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);

        return pageResponse;
    }
//换货出库管理
    @Override
    public BasePageResponse exchengOutInventory(OutInventoryRequest request, HttpServletRequest servletRequest) {
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouserId=null;
        if(storehouse!=null){
            storehouserId=storehouse.getId();
        }
        List<Map<String, Object>> result = inventoryDao.exchengOutInventory(request.getOrderStatus(),
                request.getPageSize(), request.getPageNum(),
                request.getCode(), request.getStatus(), request.getStoreHouse(),request.getStartTime(),request.getEndTime(),storehouserId,request.getExchangeStatus(),request.getRetType());

        int total = inventoryDao.exchengOutInventoryCount(request.getOrderStatus(),request.getCode(), request.getStatus(),request.getStoreHouse(),
                request.getStartTime(),request.getEndTime(),storehouserId,request.getExchangeStatus(),request.getRetType());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);

        return pageResponse;

    }

    @Override
    public BaseResponse exchengOutRecordDetail(InventoryOut request,String returnNumber,HttpServletRequest servletRequest) {
        BaseResponse response;
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        //获取系统登陆人和当前时间
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String czName=account.getName();
        String czTime=df.format(day);
        OutInventoryRecordDetail inventoryDetail = inventoryDao.getOutReturnExchangeDetail(returnNumber);
        List<OrderDetailProduct> orderDetailList = orderDao.ReturnExchengDetail(returnNumber);
        inventoryDetail.setOrderDetailProduct(orderDetailList);
        inventoryDetail.setCzTime(czTime);
        inventoryDetail.setCzName(czName);
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(inventoryDetail);
        return response;
    }
    //换货入库
    @Override
    public BaseResponse exchengOut(String orderNumber, HttpServletRequest servletRequest) {
        BaseResponse response;
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouserId=null;
        if(storehouse!=null){
            storehouserId=storehouse.getId();
        }
        Inventory selectInventory=new Inventory();
        selectInventory.setStorehouseId(storehouserId);

        List<Product> productList = inventoryDao.getExcangeProduct(orderNumber);
        for(Product product : productList) {
            selectInventory.setProductId(product.getId());
            Inventory inventory = inventoryDao.getInventorybyProductIdAndhouseId(selectInventory);
            if (inventory==null || inventory.getOnhand()==0){
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                response.setRetMsg("出库失败：该订单有商品库存不足");
                response.setData(20005);
                return response;
            } else {
                selectInventory.setOnhand(inventory.getOnhand() - 1);
                inventoryDao.updateInventory(selectInventory);
            }
        }

        InventoryOut inventoryOut = new InventoryOut();
        inventoryOut.setOrderNumber(orderNumber);
        inventoryOut.setCreateUser(account.getName());
        int count = inventoryDao.updateOutInventory(inventoryOut);
        ReturnExchangeOrder storeOrder = new ReturnExchangeOrder();
        storeOrder.setOrderNumber(orderNumber);
        storeOrder.setReturnStatus(4);
        int total = orderDao.updateReturnExchange(storeOrder);

        if(count>0 && total>0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setRetMsg("出库成功");
            return response;
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            response.setRetMsg("出库失败");
            return response;
        }

    }

    //发起调库审批
    @Override
    public BaseResponse ApproveInventory(TransferActionRequest request, HttpServletRequest servletRequest) {
        BaseResponse response;
        InventoryTransfer inventoryTransfer = new InventoryTransfer();
        inventoryTransfer.setId(request.getId());
        inventoryTransfer.setOuthouseId(request.getStorehouseout());
        inventoryTransfer.setStatus(Constants.INVENTORY_TRANSFER_STATUS.START);
        // 更新调库单信息
        int count = inventoryDao.updateInventoryTransfer(inventoryTransfer);
        if(count<0){
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            response.setRetMsg("审批失败");
            return response;
        }else {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            return response;
        }
    }

    @Override
    @Transactional
    public BaseResponse confirmTransfer(TransferRequest request,HttpServletRequest servletRequest) {
        BaseResponse response;
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        String code = request.getCode();
        InventoryTransfer inventoryTransfer = new InventoryTransfer();
        inventoryTransfer.setCode(code);
        Integer type = request.getType();
        List<InventoryToProduct> inventoryToProductList = inventoryDao.getproductListBycode(code);
        if(storehouse!=null && inventoryToProductList!=null && type!=null) {
            if (type.equals(0)){
                inventoryTransfer.setStatus(Constants.INVENTORY_TRANSFER_STATUS.OUT);
                for (InventoryToProduct outProduct: inventoryToProductList) {
                    //出库仓库更新库存商品数量
                    Inventory outInventory = new Inventory();
                    outInventory.setStorehouseId(storehouse.getId());
                    outInventory.setProductId(outProduct.getProductId());
                    Inventory inventoryOut = inventoryDao.getInventorybyProductIdAndhouseId(outInventory);
                    if (inventoryOut != null) {
                        if (inventoryOut.getOnhand() >= outProduct.getCount()) {
                            outInventory.setOnhand(inventoryOut.getOnhand() - outProduct.getCount());
                            inventoryDao.updateInventory(outInventory);
                        } else {
                            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                            response.setRetMsg("调库出库失败：该调库单有商品库存不足");
                            response.setData(20005);
                            return response;
                        }
                    } else {
                        response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                        response.setRetMsg("调库出库失败：该调库单有商品库存不足");
                        response.setData(20005);
                        return response;
                    }
                }
            }else {
                inventoryTransfer.setStatus(Constants.INVENTORY_TRANSFER_STATUS.IN);
                for (InventoryToProduct inProduct : inventoryToProductList) {
                    //入库仓库更新库存商品数量
                    Inventory inInventory = new Inventory();
                    inInventory.setStorehouseId(storehouse.getId());
                    inInventory.setProductId(inProduct.getProductId());
                    Inventory inventoryIn = inventoryDao.getInventorybyProductIdAndhouseId(inInventory);
                    if (inventoryIn != null) {
                        inInventory.setOnhand(inventoryIn.getOnhand() + inProduct.getCount());
                        int count = inventoryDao.updateInventory(inInventory);
                        if (count < 0) {
                            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                            response.setRetMsg("调库入库失败");
                            return response;
                        }
                    } else {
                        inInventory.setOnhand(inProduct.getCount());
                        int count = inventoryDao.insertInventory(inInventory);
                        if (count < 0) {
                            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                            response.setRetMsg("调库入库失败");
                            return response;
                        }
                    }
                }
            }
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
        // 更新调库单信息
        int line = inventoryDao.updateInventoryTransferBycode(inventoryTransfer);
        if(line<0){
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            response.setRetMsg("调库失败");
            return response;
        }
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        return response;
    }

    @Override
    @Transactional
    public BaseResponse TransferAction(TransferActionRequest request,HttpServletRequest servletRequest) {
        BaseResponse response;
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(account.getId());
        Integer storehouseId = null;
        if(storehouse!=null){
            storehouseId = storehouse.getId();
        }
        // 调库单号
        String code = "dk"+ DateFormatUtil.getOrderIdByUUId();
        // 解析商品json串
        JSONArray jsonArray = JSONArray.fromObject(request.getProducts());
        Object[] objs = jsonArray.toArray();
        InventoryToProduct inventoryToProduct=new InventoryToProduct();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Integer productId = new Integer(jsonObject.get("id").toString());//商品id;
            Integer onhand= new Integer(jsonObject.get("count").toString());//商品数量;
            //更新商品库存中间表
            inventoryToProduct.setType(Constants.INVENTORY_TYPE.TRANSFER);
            inventoryToProduct.setCode(code);
            inventoryToProduct.setProductId(productId);
            inventoryToProduct.setCount(onhand);
            int num = inventoryDao.inlink(inventoryToProduct);
            if (num<0) {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                response.setRetMsg("插入商品库存中间表失败");
                return response;
            }
        }
        // 插入调库单信息
        InventoryTransfer inventoryTransfer = new InventoryTransfer();
        inventoryTransfer.setInhouseId(storehouseId);
        inventoryTransfer.setCode(code);
        inventoryTransfer.setStatus(Constants.INVENTORY_TRANSFER_STATUS.PAUSE); //默认审核中
        inventoryTransfer.setCreateTime(new Date());
        inventoryTransfer.setCreateUser(account.getName());
        int line = inventoryDao.insertSelective(inventoryTransfer);
        if(line<0){
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            response.setRetMsg("插入调库记录失败");
            return response;
        }
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        return response;
    }

    @Override
    public BaseResponse InInventoryRecordDetail(InventoryIn request,HttpServletRequest servletRequest) {
        BaseResponse response;
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        //获取系统登陆人和当前时间
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String czName=account.getName();
        String czTime=df.format(day);
        List<OrderDetailProduct> OrderDetailProduct = inventoryDao.getProductListByInventoryInId(request.getId());
        InventoryInPojo inventoryInPojo = inventoryDao.getInventoryInById(request.getId());
        inventoryInPojo.setOrderDetailProduct(OrderDetailProduct);
        inventoryInPojo.setCzName(czName);
        inventoryInPojo.setCzTime(czTime);
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(inventoryInPojo);
        return response;
    }

    @Override
    public BaseResponse outInventoryRecordDetail(InventoryOut request,HttpServletRequest servletRequest) {
        BaseResponse response;
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        //获取系统登陆人和当前时间
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String czName=account.getName();
        String czTime=df.format(day);
        OutInventoryRecordDetail inventoryDetail = inventoryDao.getOutInventoryRecordDetail(request.getOrderNumber());
        List<OrderDetailProduct> orderDetailList = orderDao.getOrderDetail(request.getOrderNumber());
        inventoryDetail.setOrderDetailProduct(orderDetailList);
        inventoryDetail.setCzName(czName);
        inventoryDetail.setCzTime(czTime);
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(inventoryDetail);
        return response;
    }

    @Override
    public BaseResponse TransferRecordDetail(InventoryTransfer request,HttpServletRequest servletRequest) {
        BaseResponse response;
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        //获取系统登陆人和当前时间
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String czName=account.getName();
        String czTime=df.format(day);
        InventoryTransfRequest inventoryTransfer = inventoryDao.getInventoryDetail(request.getCode());
        List<OrderDetailProduct> OrderDetailProduct = inventoryDao.getProductListByTranferCode(request.getCode());
        TransferPojo transferPojo = new TransferPojo();
        transferPojo.setInventoryTransfer(inventoryTransfer);
        transferPojo.setOrderDetailProduct(OrderDetailProduct);
        transferPojo.setCzName(czName);
        transferPojo.setCzTime(czTime);
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(transferPojo);
        return response;
    }

    @Override
    public BaseResponse getStorehouseList(HttpServletRequest request) {
        BaseResponse response;
        List<Storehouse> list=storeHouseDao.getStorehouseList();
        if(list.size()>0&&list!=null){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(list);
        }else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BasePageResponse getInInventory(InventoryMgRequest request, HttpServletRequest servletRequest) {
        HttpSession session=servletRequest.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Integer accountId=account.getId();
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(accountId);
        Integer storehouseId=null;
        if(storehouse!=null){
            storehouseId=storehouse.getId();
        }
        List<Map<String, Object>> result = inventoryDao.getInInventory(request.getPageSize(),
                request.getPageNum(), request.getProductName(),request.getProductCode(),storehouseId);

        int total = inventoryDao.getInInventoryCount(request.getProductName(),request.getProductCode(),storehouseId);
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);

        return pageResponse;
    }

    @Override
    public BaseResponse getMyStorehouse(HttpServletRequest request) {
        BaseResponse response;
        HttpSession session=request.getSession();//从session取用户
        KsAccount account=(KsAccount)session.getAttribute("KSAccount");
        Storehouse storehouse=storeHouseDao.getStoreHousebyManageId(account.getId());
        if(storehouse!=null){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(storehouse);
        }else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

}
