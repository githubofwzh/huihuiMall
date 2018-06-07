package com.kshl.huihuimall.portal.controller;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.service.product.ProductService;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.portal.controller.request.OderSplitRequest;
import com.kshl.huihuimall.portal.controller.request.OrderSplit;
import com.kshl.huihuimall.portal.controller.request.ProfitRequest;
import com.kshl.huihuimall.portal.service.allorder.AllOrderService;
import com.kshl.huihuimall.portal.service.customer.CustomerService;
import com.kshl.huihuimall.portal.service.ordersplit.PortalStroeOrderService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

@Controller
@EnableAutoConfiguration
@RequestMapping("/ProtalStoreOrder")
public class ProtalOrderSplitController {
    private static Logger logger = LoggerFactory.getLogger(AllOrderController.class);
    @Autowired
    private PortalStroeOrderService portalStroeOrderService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private AllOrderService allOrderService;
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/OrderSplit", method = {RequestMethod.POST})
    @ResponseBody
    @Transactional
    public BaseResponse OrderSplit(OrderSplit oderSplitRequest, HttpServletRequest request, HttpServletResponse response){
        logger.debug("OrderSplit start");
        BaseResponse baseResponse=new BaseResponse();
        String store=request.getParameter("StoreOder");
        JSONArray jsonArray = JSONArray.fromObject(store);
        String PrOrder= DateFormatUtil.getHaoMiao();// zong订单
        String ordernumber= DateFormatUtil.getOrderIdByUUId();//自营子订单
        String Address=request.getParameter("commodity_Address");
        String faceId=request.getParameter("commodity_faceId");
        String ShopkeeperId=request.getParameter("commodity_faceShopkeeperId");
        String userid=request.getParameter("commodity_retuserId");//用户id
        String faceName=request.getParameter("commodity_faceName");
        String orderStatus=request.getParameter("commodity_Orderstate");
        String RoomId=request.getParameter("commodity_StorageRoomId");
        String refereeId=request.getParameter("commodity_RefereeId");
        String ordernumber4="";
        Customer customer=new Customer();
       //支付成功
        if(orderStatus.equals("1")) {
            List<StoreOrder> userIdIfExist = allOrderService.userIdIfExist(Integer.valueOf(userid));
            if (userIdIfExist.size() == 0) {
                System.out.println("开始更新用户");
                customer.setId(Integer.valueOf(userid));
                customer.setStoreId(Integer.valueOf(faceId));
                customer.setRecommendPersonId(Integer.valueOf(refereeId));
                customerService.updateByPrimaryKey(customer);
            }
            List list = new ArrayList();
            List list1 = new ArrayList();
            Object[] objs = jsonArray.toArray();
            for (Object object : objs) {
                JSONObject jsonObject = JSONObject.fromObject(object);
                String code = DateFormatUtil.getOrderIdByUUId();//入库号
                Object type = jsonObject.get("Sj_type");//商家类型
                Object shopName = jsonObject.get("commodity_shopName");//商店名称
                Object entcode = allOrderService.selectEntcode(String.valueOf(shopName));
                if (list1.contains(entcode)) {
                    System.out.println("existed: " + entcode);
                } else {
                    list1.add(entcode);
                    ordernumber4 = DateFormatUtil.getOrderIdByUUId();//第三方子订单
                }
                Object productname = jsonObject.get("commodity_name");//商品名称
                Object productcode = jsonObject.get("commodity_shopCode");//商品编码
                Object merId = jsonObject.get("commodity_merId").toString();//商家code
                Object moneye = jsonObject.get("commodity_money");//总金额
                BigDecimal mone = new BigDecimal(String.valueOf(moneye));
                int productnumber = Integer.valueOf(jsonObject.get("commodity_number").toString());//商品数量;
                int prnumber = Integer.valueOf(jsonObject.get("commodity_number").toString());//商品数量;
                BigDecimal number = new BigDecimal(prnumber);
                BigDecimal Total = mone.multiply(number);
                Product product = productService.getPrductPrices(String.valueOf(productcode));
                if (merId.equals("0")) {
                    OrderDetail Detail = new OrderDetail();
                    Detail.setOrderNumber(ordernumber);
                    Detail.setNumber(productnumber);
                    Detail.setCode(String.valueOf(productcode));
                    Detail.setProductname(String.valueOf(productname));
                    Detail.setMaterialPrice(product.getMaterialPrice());
                    Detail.setPackingPrice(product.getPackingPrice());
                    Detail.setPurchasePrice(product.getPurchasePrice());
                    Detail.setTransportPrice(product.getTransportPrice());
                    Detail.setTotal(Total);
                    portalStroeOrderService.insertDetail(Detail);
                    if (list.contains(merId)) {
                        System.out.println("existed: " + merId);
                    } else {
                        list.add(merId);
                        InventoryOut inventoryOut = new InventoryOut();
                        inventoryOut.setCode("ck" + code);
                        inventoryOut.setOrderNumber(ordernumber);
                        inventoryOut.setStatus(1);
                        inventoryOut.setStorehouseId(Integer.valueOf(RoomId));
                        portalStroeOrderService.insert(inventoryOut);
                        StoreOrder record = new StoreOrder();
                        record.setOrderNumber(ordernumber);
                        record.setStartTime(new Date());
                        record.setType(String.valueOf(type));
                        record.setOrderstatus(orderStatus);
                        record.setStorename(faceName);
                        record.setMerchantname(String.valueOf(shopName));
                        record.setStoreaddress(Address);
                        record.setParentId(PrOrder);
                        record.setStoreId(Integer.valueOf(faceId));
                        record.setRecomStoreId(Integer.valueOf(refereeId));
                        record.setStorehouseId(Integer.valueOf(RoomId));
                        record.setShopkeeperId(Integer.valueOf(ShopkeeperId));
                        record.setUserId(Integer.valueOf(userid));
                        record.setEntCode(String.valueOf(merId));
                        portalStroeOrderService.insertStore(record);
                        //插入分润记录
                        ProfitRequest profitRequest = new ProfitRequest();
                        profitRequest.setOrderNumber(ordernumber);
                        profitRequest.setStatus(Constants.PROFIT_STATUS.NOPAY);
                        profitRequest.setStoreId(Integer.valueOf(faceId));
                        Integer storeId = customer.getStoreId();
                        if (storeId != null) {
                            profitRequest.setReStoreId(storeId);
                        } else {
                            profitRequest.setReStoreId(Integer.valueOf(faceId));
                        }
                        portalStroeOrderService.insertOrderProfit(profitRequest);
                    }

                } else if (merId.equals(entcode)) {
                    OrderDetail Detail = new OrderDetail();
                    Detail.setOrderNumber(ordernumber4);
                    Detail.setNumber(productnumber);
                    Detail.setCode(String.valueOf(productcode));
                    Detail.setProductname(String.valueOf(productname));
                    Detail.setMaterialPrice(product.getMaterialPrice());
                    Detail.setPackingPrice(product.getPackingPrice());
                    Detail.setPurchasePrice(product.getPurchasePrice());
                    Detail.setTransportPrice(product.getTransportPrice());
                    Detail.setTotal(Total);
                    portalStroeOrderService.insertDetail(Detail);
                    if (list.contains(merId)) {
                        System.out.println("existed: " + merId);
                    } else {
                        list.add(merId);
                        InventoryOut inventoryOut = new InventoryOut();
                        inventoryOut.setCode("ck" + code);
                        inventoryOut.setOrderNumber(ordernumber4);
                        inventoryOut.setStatus(1);
                        inventoryOut.setStorehouseId(Integer.valueOf(RoomId));
                        portalStroeOrderService.insert(inventoryOut);
                        StoreOrder record = new StoreOrder();
                        record.setOrderNumber(ordernumber4);
                        record.setStartTime(new Date());
                        record.setType(String.valueOf(type));
                        record.setOrderstatus(orderStatus);
                        record.setStorename(faceName);
                        record.setMerchantname(String.valueOf(shopName));
                        record.setStoreaddress(Address);
                        record.setParentId(PrOrder);
                        record.setStoreId(Integer.valueOf(faceId));
                        record.setRecomStoreId(Integer.valueOf(refereeId));
                        record.setStorehouseId(Integer.valueOf(RoomId));
                        record.setShopkeeperId(Integer.valueOf(ShopkeeperId));
                        record.setUserId(Integer.valueOf(userid));
                        record.setEntCode(String.valueOf(merId));
                        portalStroeOrderService.insertStore(record);
                    }

                }
                OrderDetail totalzi = allOrderService.selectOrdertotal(ordernumber4);
                if (totalzi != null) {
                    StoreOrder orderDetail = new StoreOrder();
                    orderDetail.setOrdertotal(totalzi.getTotal());
                    orderDetail.setOrderNumber(ordernumber4);
                    allOrderService.Ordertotal(orderDetail);
                }
            }
                OrderDetail total = allOrderService.selectOrdertotal(ordernumber);
                if (total != null) {
                    StoreOrder orderDetail = new StoreOrder();
                    orderDetail.setOrdertotal(total.getTotal());
                    orderDetail.setOrderNumber(ordernumber);
                    allOrderService.Ordertotal(orderDetail);
                }
        }
        baseResponse.setRetCode((long) 0);
        baseResponse.setData(PrOrder);
        return baseResponse;
    }



    /**
     * 支付完成或者失败
     * @param
     * @return
     */
    @RequestMapping(value = "/CompletePayment", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse CompletePayment(OderSplitRequest oderSplitRequest,String parentId) {
        logger.debug("getOrderProfit start");
        BaseResponse response=new BaseResponse();
        //支付成功更改订单状态
        if(oderSplitRequest.getOrderstatus().equals("3")){
            StoreOrder storeOrder=new StoreOrder();
            storeOrder.setOrderstatus("3");
            storeOrder.setParentId(parentId);
            allOrderService.updateOrderStutas(storeOrder);
            List<StoreOrder>  orders =allOrderService.selectPayOrderByParentId(parentId);
            if(orders.size()!=0) {
                for (StoreOrder order : orders) {
                    ProfitRecord profitRecord = new ProfitRecord();
                    profitRecord.setStatus(Constants.PROFIT_STATUS.PAY);
                    profitRecord.setOrderNumber(order.getOrderNumber());
                    int count = portalStroeOrderService.updateOrderProfit(profitRecord);
                    if (count == 0) {
                        response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                        response.setRetMsg("更新分润状态失败");
                        return response;
                    }
                }
            }
            response.setRetCode(Long.valueOf(0));
            response.setRetMsg("订单状态已支付");
        }else{
            List<StoreOrder> numbers=allOrderService.selectOrderNumberByParentId(parentId);
            if(numbers.size()!=0){
                for(int j=0;j<numbers.size();j++){
                    String number= String.valueOf(numbers.get(j).getOrderNumber());
                    //System.out.println(number);
                    allOrderService.Detaildelete(number);
                    allOrderService.deleteOrder(number);
                    allOrderService.deleteInventoryOut(number);
                }
            }
            response.setRetCode(Long.valueOf(1));
            response.setRetMsg("支付失败，删除订单、详情、出库信息");
        }
        return response;
    }




    /**
     * 分润记录用
     * @param profitRequest
     * @return
     */
    @RequestMapping(value = "/getOrderProfit", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getOrderProfit(ProfitRequest profitRequest) {
        logger.debug("getOrderProfit start");
        BaseResponse response;
        if (profitRequest.getStoreId() == null) {
            logger.warn("[ProfitRequest] param error storeId can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = portalStroeOrderService.getOrderProfit(profitRequest);
        }
        return response;
    }

    /**
     * 门店总利润
     * @param profitRequest
     * @return
     */
    @RequestMapping(value = "/getTotalOrderProfit", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getTotalOrderProfit(ProfitRequest profitRequest) {
        logger.debug("getTotalOrderProfit start");
        BaseResponse response;
        if (profitRequest.getStoreId() == null) {
            logger.warn("[ProfitRequest] param error storeId can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = portalStroeOrderService.getTotalOrderProfit(profitRequest);
        }
        return response;
    }


}



