package com.kshl.huihuimall.console.controller.inventory;

import com.kshl.base.response.BasePageResponse;
import com.kshl.huihuimall.console.controller.financial.request.BankReconciliationRequest;
import com.kshl.huihuimall.console.controller.financial.request.FinancialReportRequest;
import com.kshl.huihuimall.console.controller.inventory.request.*;
import com.kshl.huihuimall.console.controller.merchant.request.MerchantMgRequest;
import com.kshl.huihuimall.console.controller.store.request.StoreMgRequest;
import com.kshl.huihuimall.console.service.inventory.InventoryService;
import com.kshl.huihuimall.console.service.merchant.MerchantService;
import com.kshl.huihuimall.console.service.store.StoreService;
import com.kshl.util.PoiExcelExport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@EnableAutoConfiguration
@RequestMapping("/InventoryExecel")
public class InventoryExecel {

    @Autowired
    private InventoryService inventoryService;
    @Autowired
    private MerchantService merchantService;
    @Autowired
    private StoreService storeService;
    /*
     导出入库记录
    */
    @RequestMapping(value = "/InInventoryRecord", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String InInventoryRecord(InventoryRecordRequest request, HttpServletRequest servletRequest,HttpServletResponse response) throws IOException {
        BasePageResponse ponse  =  inventoryService.queryInventoryRecord(request,servletRequest);
        System.out.println(ponse.getData());
        List list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object status="";
            Object create_user= jsonObject.get("create_user");
            Object code= jsonObject.get("code");
            Object create_time= jsonObject.get("create_time");
            Object storehouse_name= jsonObject.get("storehouse_name");
            if(jsonObject.get("status").equals(1)){
                status="采购";
            }else if(jsonObject.get("status").equals(2)){
                status="退货";
            }else if(jsonObject.get("status").equals(3)){
                status="换货";
            }
            InventoryExcelRequest inventoryExcel=new InventoryExcelRequest();
            inventoryExcel.setCode(String.valueOf(code));
            inventoryExcel.setCreate_time(String.valueOf(create_time));
            inventoryExcel.setCreate_user(String.valueOf(create_user));
            inventoryExcel.setStatus(String.valueOf(status));
            inventoryExcel.setStorehouse_name(String.valueOf(storehouse_name));
            list.add(inventoryExcel);
        }
        String fileName="入库记录";
        PoiExcelExport pee = new PoiExcelExport(response,"入库记录","sheet1");
        String titleColumn[] = {"code","status","create_time","storehouse_name","create_user"};
        String titleName[] = {"入库单号","入库类型","入库时间","仓库名称","操作人"};
        int titleSize[] = {20,13,18,13,13};
        //其他设置 set方法可全不调用
        String colFormula[] = new String[5];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "1";
    }

    /*
  导出订单出库记录
 */
    @RequestMapping(value = "/OrderOutInventory", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String OrderOutInventory(OutInventoryRequest request, HttpServletRequest servletRequest,HttpServletResponse response) throws IOException {
        BasePageResponse ponse  =  inventoryService.queryOutInventory(request,servletRequest);
        System.out.println(ponse.getData());
        List list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object code= jsonObject.get("code");
            Object status= jsonObject.get("status");
            Object create_time= jsonObject.get("create_time");
            Object storehouse_name= jsonObject.get("storehouse_name");
            Object order_number= jsonObject.get("order_number");

            Object start_time= jsonObject.get("start_time");
            Object storename= jsonObject.get("storename");
            Object ordertotal= jsonObject.get("ordertotal");
            Object create_user= jsonObject.get("create_user");
            InventoryExcelRequest inventoryExcel=new InventoryExcelRequest();
            inventoryExcel.setCode(String.valueOf(code));
            inventoryExcel.setStatus("订单");
            inventoryExcel.setCreate_time(String.valueOf(create_time));
            inventoryExcel.setStorehouse_name(String.valueOf(storehouse_name));
            inventoryExcel.setOrder_number(String.valueOf(order_number));
            inventoryExcel.setStart_time(String.valueOf(start_time));
            inventoryExcel.setStorename(String.valueOf(storename));
            inventoryExcel.setOrdertotal(String.valueOf(ordertotal));
            inventoryExcel.setCreate_user(String.valueOf(create_user));
            list.add(inventoryExcel);
        }
        String fileName="订单出库记录";
        PoiExcelExport pee = new PoiExcelExport(response,"订单出库记录","sheet1");
        String titleColumn[] = {"code","status","create_time","storehouse_name","order_number","start_time","storename","ordertotal","create_user"};
        String titleName[] = {"出库单号","出库类型","出库日期","仓库名称","订单号","下单日期","门店名称","订单金额(元)","操作人"};
        int titleSize[] = {20,13,18,18,22,18,25,13,13};
        //其他设置 set方法可全不调用
        String colFormula[] = new String[9];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "1";
    }

    /*
  导出退换货出库记录
 */
    @RequestMapping(value = "/RetunrnOutInventory", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String RetunrnOutInventory(OutInventoryRequest request,HttpServletRequest servletRequest,HttpServletResponse response) throws IOException {
        BasePageResponse ponse  =  inventoryService.exchengOutInventory(request,servletRequest);
        System.out.println(ponse.getData());
        List list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object code= jsonObject.get("code");
            Object status= jsonObject.get("status");
            Object create_time= jsonObject.get("create_time");
            Object storehouse_name= jsonObject.get("storehouse_name");
            Object order_number= jsonObject.get("order_number");

            Object start_time= jsonObject.get("start_time");
            Object storename= jsonObject.get("storename");
            Object total= jsonObject.get("total");
            Object create_user= jsonObject.get("create_user");
            InventoryExcelRequest inventoryExcel=new InventoryExcelRequest();
            inventoryExcel.setCode(String.valueOf(code));
            inventoryExcel.setStatus("换货");
            inventoryExcel.setCreate_time(String.valueOf(create_time));
            inventoryExcel.setStorehouse_name(String.valueOf(storehouse_name));
            inventoryExcel.setOrder_number(String.valueOf(order_number));
            inventoryExcel.setStart_time(String.valueOf(start_time));
            inventoryExcel.setStorename(String.valueOf(storename));
            inventoryExcel.setTotal(String.valueOf(total));
            inventoryExcel.setCreate_user(String.valueOf(create_user));
            list.add(inventoryExcel);
        }
        String fileName="退货出库记录";
        PoiExcelExport pee = new PoiExcelExport(response,"退货出库记录","sheet1");
        String titleColumn[] = {"code","status","create_time","storehouse_name","order_number","start_time","storename","total","create_user"};
        String titleName[] = {"出库单号","出库类型","出库日期","仓库名称","订单号","下单日期","门店名称","订单金额(元)","操作人"};
        int titleSize[] = {22,13,18,13,20,18,22,13,13};
        //其他设置 set方法可全不调用
        String colFormula[] = new String[5];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "1";
    }

    /*
  导出调库记录
 */
    @RequestMapping(value = "/callLibraryRecord", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String callLibraryRecord(InventoryRecordRequest request, HttpServletRequest servletRequest,HttpServletResponse response) throws IOException {
        BasePageResponse ponse  =  inventoryService.InOutInventoryRecord(request,servletRequest);
        System.out.println(ponse.getData());
        List list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object code= jsonObject.get("code");
            Object create_time= jsonObject.get("create_time");
            Object ck_name= jsonObject.get("ck_name");
            Object rk_name= jsonObject.get("rk_name");
            Object status= jsonObject.get("status");
            InventoryExcelRequest inventoryExcel=new InventoryExcelRequest();
            inventoryExcel.setCode(String.valueOf(code));
            inventoryExcel.setStatus("已入库");
            inventoryExcel.setCreate_time(String.valueOf(create_time));
            inventoryExcel.setRk_name(String.valueOf(rk_name));
            inventoryExcel.setCk_name(String.valueOf(ck_name));
            list.add(inventoryExcel);
        }
        String fileName="调库记录";
        PoiExcelExport pee = new PoiExcelExport(response,"调库记录","sheet1");
        String titleColumn[] = {"code","create_time","ck_name","rk_name","status"};
        String titleName[] = {"调库单号","调库日期","出库仓库","入库仓库","调库状态"};
        int titleSize[] = {20,18,13,13,13};
        //其他设置 set方法可全不调用
        String colFormula[] = new String[5];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list, response,fileName);
        return "1";
    }


    /*
      导出商家管理
    */
    @RequestMapping(value = "/MerchantMgExecel", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String MerchantMgExecel(MerchantMgRequest request,HttpServletResponse response) throws IOException {
        BasePageResponse ponse  =  merchantService.queryMerchantMg(request);
        System.out.println(ponse.getData());
        List list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object coverage_area= jsonObject.get("coverage_area");
            Object bank_number= jsonObject.get("bank_number");
            Object main_product= jsonObject.get("main_product");
            Object regist_address= jsonObject.get("regist_address");
            Object bank_name= jsonObject.get("bank_name");
            Object legal_person_name= jsonObject.get("legal_person_name");
            Object name= jsonObject.get("name");
            Object legal_person_contact= jsonObject.get("legal_person_contact");
            Object annual_sales= jsonObject.get("annual_sales");
            Object profit= jsonObject.get("profit");
            MerchantMgExecelRequest merchantMgExecelRequest=new MerchantMgExecelRequest();
            merchantMgExecelRequest.setAnnual_sales(String.valueOf(annual_sales));
            merchantMgExecelRequest.setBank_name(String.valueOf(bank_name));
            merchantMgExecelRequest.setBank_number(String.valueOf(bank_number));
            merchantMgExecelRequest.setCoverage_area(String.valueOf(coverage_area));
            merchantMgExecelRequest.setLegal_person_contact(String.valueOf(legal_person_contact));
            merchantMgExecelRequest.setLegal_person_name(String.valueOf(legal_person_name));
            merchantMgExecelRequest.setMain_product(String.valueOf(main_product));
            merchantMgExecelRequest.setName(String.valueOf(name));
            merchantMgExecelRequest.setProfit(String.valueOf(profit));
            merchantMgExecelRequest.setRegist_address(String.valueOf(regist_address));

            list.add(merchantMgExecelRequest);
        }
        String fileName="商家管理";
        PoiExcelExport pee = new PoiExcelExport(response,"商家管理","sheet1");
        String titleColumn[] = {"name","legal_person_name","legal_person_contact","regist_address","main_product","coverage_area","annual_sales","profit","bank_name","bank_number"};
        String titleName[] = {"商家名称","负责人","联系方式","地址","主营商品","覆盖区域","年销售额(万元)","年利润(万元)","开行名称","开行卡号"};
        int titleSize[] = {22,13,13,22,20,13,13,13,25,22};
        //其他设置 set方法可全不调用
        String colFormula[] = new String[5];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "1";
    }


    /*
    导出门店管理
  */
    @RequestMapping(value = "/StoreMgExecel", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String StoreMgExecel(StoreMgRequest request,HttpServletResponse response) throws IOException {
        BasePageResponse ponse  =  storeService.queryStore(request);
        System.out.println(ponse.getData());
        List list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object storehouse_name= jsonObject.get("storehouse_name");
            Object store_name= jsonObject.get("store_name");
            Object store_address= jsonObject.get("store_address");
            Object product1= jsonObject.get("product1");
            Object price1= jsonObject.get("price1");
            Object product2= jsonObject.get("product2");
            Object price2= jsonObject.get("price2");
            Object phone_number= jsonObject.get("phone_number");
            Object name= jsonObject.get("name");
            Object idCard= jsonObject.get("idCard");
            Object address= jsonObject.get("address");
            Object device_code= jsonObject.get("device_code");
            Object area_name= jsonObject.get("area_name");
            Object merchant_type= jsonObject.get("merchant_type");
            if(merchant_type.equals(0)){
                merchant_type="企业";
            }else {
                merchant_type="个体户";
            }
            Object business_year= jsonObject.get("business_year");
            Object apply_time= jsonObject.get("apply_time");
            Object daily_flow= jsonObject.get("daily_flow");
            Object income= jsonObject.get("income");
            StoreMgExecelRequest storeMgExecelRequest=new StoreMgExecelRequest();
            storeMgExecelRequest.setAddress(String.valueOf(address));
            storeMgExecelRequest.setArea_name(String.valueOf(area_name));
            storeMgExecelRequest.setDevice_code(String.valueOf(device_code));
            storeMgExecelRequest.setIdCard(String.valueOf(idCard));
            storeMgExecelRequest.setName(String.valueOf(name));
            storeMgExecelRequest.setPhone_number(String.valueOf(phone_number));
            storeMgExecelRequest.setPrice1(String.valueOf(price1));
            storeMgExecelRequest.setProduct1(String.valueOf(product1));
            storeMgExecelRequest.setProduct2(String.valueOf(product2));
            storeMgExecelRequest.setPrice2(String.valueOf(price2));
            storeMgExecelRequest.setStore_address(String.valueOf(store_address));
            storeMgExecelRequest.setStore_name(String.valueOf(store_name));
            storeMgExecelRequest.setStorehouse_name(String.valueOf(storehouse_name));
            storeMgExecelRequest.setBusiness_year(String.valueOf(business_year));
            storeMgExecelRequest.setDaily_flow(String.valueOf(daily_flow));
            storeMgExecelRequest.setMerchant_type(String.valueOf(merchant_type));
            storeMgExecelRequest.setIncome(String.valueOf(income));
          //  storeMgExecelRequest.setApply_time(apply_time);
            list.add(storeMgExecelRequest);
        }
        String fileName="门店管理";
        PoiExcelExport pee = new PoiExcelExport(response,"门店管理","sheet1");
        String titleColumn[] = {"store_name","merchant_type","name","device_code","phone_number","store_address","storehouse_name","product1","product2","business_year","income","daily_flow"};
        String titleName[] = {"门店名称","商户类型","门店负责人","终端设备号","联系方式","门店地址","仓库名称","主营商品1","主营商品2","经营年限(年)","去年营收情况(万元)","人流量(人)"};
        int titleSize[] = {22,13,13,13,13,30,13,13,13,13,13,13};
        //其他设置 set方法可全不调用
        String colFormula[] = new String[5];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "1";
    }


}
