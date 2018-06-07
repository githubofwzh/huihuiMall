package com.kshl.huihuimall.console.controller.financial;
import com.alipay.api.domain.Contract;
import com.kshl.base.response.BasePageResponse;
import com.kshl.huihuimall.console.controller.financial.request.BankReconciliationRequest;
import com.kshl.huihuimall.console.controller.financial.request.FinancialReportRequest;
import com.kshl.huihuimall.console.service.financial.FinancialReportService;
import com.kshl.util.PoiExcelExport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@EnableAutoConfiguration
@RequestMapping("/FinanncialReportExecel")
public class FinanncialReportExecel {

    private static final Logger logger = LoggerFactory.getLogger(FinancialReportController.class);
    @Autowired
    private FinancialReportService financialReportService;

    /*
      导出银行对账报表
     */
    @RequestMapping(value = "/BankReconciliationReport", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String BankReconciliationReport(HttpServletRequest request, HttpServletResponse response, FinancialReportRequest financialReportRequest) throws IOException {
        BasePageResponse ponse  =  financialReportService.BankReconciliation( financialReportRequest);
        List  list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object WeChat= jsonObject.get("WeChat");
            Object Alipay= jsonObject.get("Alipay");
            Object payTime= jsonObject.get("payTime");
            Object sum= jsonObject.get("sum");
            Object bankcard= jsonObject.get("bankcard");
            BankReconciliationRequest bank=new BankReconciliationRequest();
            bank.setAlipay(String.valueOf(Alipay));
            bank.setBankcard(String.valueOf(bankcard));
            bank.setPayTime(String.valueOf(payTime));
            bank.setSum(String.valueOf(sum));
            bank.setWeChat(String.valueOf(WeChat));
            list.add(bank);
        }
        String fileName="银行对账报表";
        PoiExcelExport pee = new PoiExcelExport(response,"银行对账报表","sheet1");
        String titleColumn[] = {"payTime","WeChat","Alipay","bankcard","sum"};
        String titleName[] = {"日期","微信","支付宝","银行卡","合计"};
        int titleSize[] = {15,13,13,13,13};
        //其他设置 set方法可全不调用
        String colFormula[] = new String[5];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "1";
    }

    /*
      畅销排行报表
     */
    @RequestMapping(value = "/bestSell", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String bestSell(HttpServletRequest request, HttpServletResponse response, FinancialReportRequest financialReportRequest) throws IOException {
        BasePageResponse ponse  =  financialReportService.bestSell( financialReportRequest);
        System.out.println(ponse.getData());
        List list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object allNumber= jsonObject.get("allNumber");
            Object productname= jsonObject.get("productname");
            Object code= jsonObject.get("code");
            Object ordertime= jsonObject.get("ordertime");
            BankReconciliationRequest bank=new BankReconciliationRequest();
            bank.setAllNumber(String.valueOf(allNumber));
            bank.setProductname(String.valueOf(productname));
            bank.setCode(String.valueOf(code));
            bank.setOrdertime(String.valueOf(ordertime));
            list.add(bank);
        }
        String fileName="畅销排行榜报表";
        PoiExcelExport pee = new PoiExcelExport(response,"畅销排行榜报表","sheet1");
        String titleColumn[] = {"code","productname","allNumber","ordertime"};
        String titleName[] = {"商品编号","商品名称","销量","下单时间"};
        int titleSize[] = {20,25,13,15};
        String colFormula[] = new String[4];
        colFormula[3] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "2";
    }




    /*
      导出日报
     */
    @RequestMapping(value = "/dayReport", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String dayReport(HttpServletRequest request, HttpServletResponse response, FinancialReportRequest financialReportRequest) throws IOException {
        BasePageResponse ponse  =  financialReportService.dayReport( financialReportRequest);
        System.out.println(ponse.getData());
        List  list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object price= jsonObject.get("price");
            Object count= jsonObject.get("count");
            Object shareProfit= jsonObject.get("shareProfit");
            Object Profit= jsonObject.get("Profit");
            Object starttime= jsonObject.get("starttime");
            Object ordercount= jsonObject.get("ordercount");
            BankReconciliationRequest bank=new BankReconciliationRequest();
            bank.setProfit(String.valueOf(Profit));
            bank.setPrice(String.valueOf(price));
            bank.setCount(String.valueOf(count));
            bank.setShareProfit(String.valueOf(shareProfit));
            bank.setStarttime(String.valueOf(starttime));
            bank.setOrdercount(String.valueOf(ordercount));
            list.add(bank);
        }
        String fileName="销售日报表";
        PoiExcelExport pee = new PoiExcelExport(response,"销售日报表","sheet1");
        String titleColumn[] = {"starttime","price","shareProfit","Profit","count","count"};
        String titleName[] = {"日期","销售金额","销售利润","门店利润","销售单数","销售物品数量"};
        int titleSize[] = {18,15,15,15,13,13};
        String colFormula[] = new String[6];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "2";
    }

    /*
     月报
     */
    @RequestMapping(value = "/MonthReport", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String MonthReport(HttpServletRequest request, HttpServletResponse response, FinancialReportRequest financialReportRequest) throws IOException {
        BasePageResponse ponse  =  financialReportService.MonthReport( financialReportRequest);
        System.out.println(ponse.getData());
        List  list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
           // String bank_number= jsonObject.get("bank_number").toString();
            Object bing_time= jsonObject.get("bing_time");
            Object price= jsonObject.get("price");
            Object device_code= jsonObject.get("device_code");
            Object name= jsonObject.get("name");
            //String bank_name= jsonObject.get("bank_name").toString();
            Object store_name= jsonObject.get("store_name");
            Object phone_number= jsonObject.get("phone_number");
            Object shareProfit= jsonObject.get("shareProfit");
            Object Profit= jsonObject.get("Profit");
            Object Recome= jsonObject.get("Recome");
            BankReconciliationRequest bank=new BankReconciliationRequest();
            bank.setBing_time(String.valueOf(bing_time));
            bank.setPrice(String.valueOf(price));
            bank.setDevice_code(String.valueOf(device_code));
            bank.setName(String.valueOf(name));
            bank.setStore_name(String.valueOf(store_name));
            bank.setPhone_number(String.valueOf(phone_number));
            bank.setShareProfit(String.valueOf(shareProfit));
            bank.setProfit(String.valueOf(Profit));
            bank.setRecome(String.valueOf(Recome));
            list.add(bank);
        }
        String fileName="销售月报表";
        PoiExcelExport pee = new PoiExcelExport(response,"销售月报表","sheet1");
        String titleColumn[] = {"device_code","store_name","price","shareProfit","Profit","Recome","name","phone_number","bing_time"};
        String titleName[] = {"终端号","门店名称","门店销售额","公司利润","门店利润","推广人利润","开户行","手机号","装机时间"};
        int titleSize[] = {15,22,15,15,15,15,22,15,18};
        String colFormula[] = new String[9];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "2";
    }

    /*
        本月销售日报
        */
    @RequestMapping(value = "/ThisMonthDaily", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String ThisMonthDaily(HttpServletRequest request, HttpServletResponse response, FinancialReportRequest financialReportRequest) throws IOException {
        BasePageResponse ponse  =  financialReportService.ThisMonthDaily( financialReportRequest);
        System.out.println(ponse.getData());
        List  list=new ArrayList();
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object code= jsonObject.get("code");
            Object order_number= jsonObject.get("order_number");
            Object starttime= jsonObject.get("starttime");
            Object number= jsonObject.get("number");
            Object price= jsonObject.get("price");
            Object purchase_price= jsonObject.get("purchase_price");
            Object productname= jsonObject.get("productname");
            Object shareProfit= jsonObject.get("shareProfit");
            BankReconciliationRequest bank=new BankReconciliationRequest();
            bank.setShareProfit(String.valueOf(shareProfit));
            bank.setCode(String.valueOf(code));
            bank.setOrder_number(String.valueOf(order_number));
            bank.setStarttime(String.valueOf(starttime));
            bank.setPrice(String.valueOf(price));
            bank.setPurchase_price(String.valueOf(purchase_price));
            bank.setProductname(String.valueOf(productname));
            bank.setCount(String.valueOf(number));
            list.add(bank);
        }
        String fileName="本月销售日报表";
        PoiExcelExport pee = new PoiExcelExport(response,"本月销售日报表","sheet1");
        String titleColumn[] = {"starttime","order_number","code","productname","purchase_price","price","count","shareProfit"};
        String titleName[] = {"销售日期","订单号","商品编号","商品名称","进货价","售价","数量","分润"};
        int titleSize[] = {18,22,22,22,13,13,13,15};
        String colFormula[] = new String[8];
        colFormula[4] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "2";
    }

    /*
       分润报表
       */
    @RequestMapping(value = "/shareProfit", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String shareProfit(HttpServletRequest request, HttpServletResponse response, FinancialReportRequest financialReportRequest) throws IOException {
        BasePageResponse ponse  =  financialReportService.shareProfit( financialReportRequest);
        System.out.println(ponse.getData());
        List  list=new ArrayList();;
        JSONArray jsonArray = JSONArray.fromObject(ponse.getData());
        Object[] objs = jsonArray.toArray();
        for (Object object : objs) {
            JSONObject jsonObject = JSONObject.fromObject(object);
            Object shelves_date= jsonObject.get("shelves_date");
            Object code= jsonObject.get("code");
            Object name= jsonObject.get("name");
            Object price= jsonObject.get("price");
            Object purchase_price= jsonObject.get("purchase_price");
            Object shareProfit= jsonObject.get("shareProfit");
            BankReconciliationRequest bank=new BankReconciliationRequest();
            bank.setShelves_date(String.valueOf(shelves_date));
            bank.setCode(String.valueOf(code));
            bank.setPrice(String.valueOf(price));
            bank.setName(String.valueOf(name));
            bank.setPurchase_price(String.valueOf(purchase_price));
            bank.setShareProfit(String.valueOf(shareProfit));
            list.add(bank);
        }
        String fileName="分润报表";
        PoiExcelExport pee = new PoiExcelExport(response,"分润报表","sheet1");
        String titleColumn[] = {"shelves_date","code","name","purchase_price","price","shareProfit"};
        String titleName[] = {"上架日期","商品编号","商品名称","进货价","售价","利润"};
        int titleSize[] = {18,25,20,13,13,18};
        String colFormula[] = new String[6];
        colFormula[5] = "D@*12";   //设置第5列的公式
        pee.setColFormula(colFormula);
        pee.setAddress("A:D");  //自动筛选
        pee.wirteExcel(titleColumn, titleName, titleSize, list,response,fileName);
        return "2";
    }


}
