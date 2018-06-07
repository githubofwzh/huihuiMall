package com.kshl.huihuimall.portal.controller;

import com.kshl.base.common.utils.KSHLUtils;
import com.kshl.huihuimall.portal.service.pay.WeChatPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;

/**
 * Created by chen on 2018-03-19.
 */

@Controller
@EnableAutoConfiguration
@RequestMapping("/portalLink")
public class PortalLinkController {
    @Autowired
    private WeChatPayService weChatPayService;

    @RequestMapping("/wxScanCodeLogin")
    @ResponseBody
    public ModelAndView wxScanCodeLogin(){
        ModelAndView result = new ModelAndView("/frontPages/terminal/wxScanCodeLogin");
        return result;
    }

    @RequestMapping("/wxLogin")
    @ResponseBody
    public ModelAndView wxLogin(){
        ModelAndView result = new ModelAndView("/frontPages/terminal/wxLogin");
        return result;
    }

    /*第三方注册*/
    @RequestMapping("/ThirdPartyEnroll")
    @ResponseBody
    public ModelAndView ThirdPartyEnroll(){
        ModelAndView result = new ModelAndView("/frontPages/ThirdParty");
        return result;
    }


    /*用户端跳转*/
    //验证手机号
    @RequestMapping("/userTerminalLogin")
    @ResponseBody
    public ModelAndView userTerminalLogin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/login");
        result.getModel().put("openId",request.getParameter("openId"));
        return result;
    }

    //首页
    @RequestMapping("/linkToUserTerminalIndex")
    @ResponseBody
    public ModelAndView linkToUserTerminalIndex(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/index");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        result.getModel().put("phone",String.valueOf(request.getParameter("phone")));
        return result;
    }

    //商品列表
    @RequestMapping("/linkToGoodsList")
    @ResponseBody
    public ModelAndView linkToGoodsList(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/goodslist");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        result.getModel().put("classifyId",Integer.parseInt(request.getParameter("classifyId")));
        return result;
    }

    //商品详情
    @RequestMapping("/linkToGoodsDetail")
    @ResponseBody
    public ModelAndView linkToGoodsDetail(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/goodsdetail");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        result.getModel().put("goodsId",String.valueOf(request.getParameter("goodsId")));
        return result;
    }

    //商品结算
    @RequestMapping("/linkToGoodsSettlement")
    @ResponseBody
    public ModelAndView linkToGoodsSettlement(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/goodssettlement");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        return result;
    }

    //我的订单
    @RequestMapping("/linkToMineOrders")
    @ResponseBody
    public ModelAndView linkToMineOrders(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/mineorders");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
//        result.getModel().put("uid",Integer.parseInt(request.getParameter("uid")));
//        result.getModel().put("phone",String.valueOf(request.getParameter("phone")));
        return result;
    }

    //跳转填报售后服务
    @RequestMapping("/linkToCommitSaleService")
    @ResponseBody
    public ModelAndView linkToCommitSaleService(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/saleservicecommit");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        result.getModel().put("retId",Integer.parseInt(request.getParameter("retId")));
        result.getModel().put("orderNumber",String.valueOf(request.getParameter("orderNumber")));
        return result;
    }

    //售后服务
    @RequestMapping("/linkToSaleService")
    @ResponseBody
    public ModelAndView linkToSaleService(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/saleservice");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        return result;
    }

    //售后服务详情
    @RequestMapping("/linkToSaleServiceDetail")
    @ResponseBody
    public ModelAndView linkToSaleServiceDetail(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/userPages/saleservicedetail");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        result.getModel().put("retProductId",Integer.parseInt(request.getParameter("retProductId")));
        result.getModel().put("orderNumber",String.valueOf(request.getParameter("orderNumber")));
        return result;
    }


    /*********************************************** 店主 **************************************************/
    /*店主端跳转*/
    //店主登录
    @RequestMapping("/linkToBusinessLogin")
    @ResponseBody
    public ModelAndView linkToBusinessLogin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/login");
        result.getModel().put("openId",request.getParameter("openId").toString());
        return result;
    }
    //店主开店申请授权
    @RequestMapping("/linkToWxApplyStore")
    @ResponseBody
    public ModelAndView linkToWxApplyStore(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/wxApplyStore");
        return result;
    }
    //店主开店申请
    @RequestMapping("/linkToApply")
    @ResponseBody
    public ModelAndView linkToApply(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/apply");
        result.getModel().put("openId",request.getParameter("openId").toString());
        return result;
    }
    //门店主页
    @RequestMapping("/linkToMyStore")
    @ResponseBody
    public ModelAndView linkToMyStore(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/mystore");
        result.getModel().put("id",Integer.parseInt(request.getParameter("id")));
        return result;
    }
    //门店基本信息
    @RequestMapping("/linkToBasic")
    @ResponseBody
    public ModelAndView linkToBasic(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/basic");
        result.getModel().put("id",Integer.parseInt(request.getParameter("id")));
        return result;
    }
    //店主收货
    @RequestMapping("/linkToGoodsReceipt")
    @ResponseBody
    public ModelAndView linkToGoodsReceipt(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/goodsreceipt");
        result.getModel().put("id",Integer.parseInt(request.getParameter("id")));
        return result;
    }

    //店主--用户取货
    @RequestMapping("/linkToPickUp")
    @ResponseBody
    public ModelAndView linkToPickUp(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/pickup");
        result.getModel().put("id",Integer.parseInt(request.getParameter("id")));
        return result;
    }

    //店主--门店丰润详情
    @RequestMapping("/linkToStoreFinanceDetail")
    @ResponseBody
    public ModelAndView linkToStoreFinanceDetail(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/salesrecord");
        result.getModel().put("storeId",Integer.parseInt(request.getParameter("storeId")));
        return result;
    }

    //店主--收货订单详情
    @RequestMapping("/linkToOrderDetail")
    @ResponseBody
    public ModelAndView linkToOrderDetail(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/details");
        result.getModel().put("orderNum",request.getParameter("orderNum"));
        return result;
    }

    //店主--退换货
    @RequestMapping("/linkToRetreatChange")
    @ResponseBody
    public ModelAndView linkToRetreatChange(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/retreatChange");
        result.getModel().put("storeId",Integer.parseInt(request.getParameter("storeId")));
        return result;
    }

    //店主--订单记录
    @RequestMapping("/linkToOrderRecords")
    @ResponseBody
    public ModelAndView linkToOrderRecords(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/terminal/shopkeeperPages/orderrecord");
        result.getModel().put("storeId",Integer.parseInt(request.getParameter("storeId")));
        return result;
    }


    /*********************************************** 自助机 **************************************************/
    /*自助机跳转*/

    //自助机登录
    @RequestMapping("/linkToSignin")
    @ResponseBody
    public ModelAndView linkToSignin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/Signin");
        return result;
    }

    //自助机退出登录
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/homePage");
        Enumeration em = session.getAttributeNames();
        while(em.hasMoreElements()){
            session.removeAttribute(em.nextElement().toString());
        }
        return result;
    }

    //自助机首页
    @RequestMapping("/linkToHomePage")
    @ResponseBody
    public ModelAndView linkToHomePage(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/homePage");
        return result;
    }

    //自助机商品列表
    @RequestMapping("/linkToChoiceOfGoods")
    @ResponseBody
    public ModelAndView linkToChoiceOfGoods(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/ChoiceOfGoods");
        Integer uid = 0;
        if(KSHLUtils.isNotEmpty(request.getParameter("uid"))){
            uid = Integer.parseInt(request.getParameter("uid"));
        }
        String phone = "";
        if(KSHLUtils.isNotEmpty(request.getParameter("phone"))){
            phone = String.valueOf(request.getParameter("phone"));
        }
        Integer classifyId = 0;
        if(KSHLUtils.isNotEmpty(request.getParameter("classifyId"))){
            classifyId = Integer.parseInt(request.getParameter("classifyId"));
        }
        result.getModel().put("uid",uid);
        result.getModel().put("phone",phone);
        result.getModel().put("classifyId",classifyId);
        return result;
    }

    //自助机详情
    @RequestMapping("/linkToShopMinute")
    @ResponseBody
    public ModelAndView linkToShopMinute(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/shopMinute");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        result.getModel().put("goodsId",Integer.parseInt(request.getParameter("goodsId")));
        return result;
    }

    //自助机购物车
    @RequestMapping("/linkToShoppingCar")
    @ResponseBody
    public ModelAndView linkToShoppingCar(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/shoppingCar");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        return result;
    }

    //自助机订单
    @RequestMapping("/linkToMyStoreSelfHelp")
    @ResponseBody
    public ModelAndView linkToMyStoreSelfHelp(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/MyStore");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        return result;
    }

    //跳转到扫码支付
    @RequestMapping("/linkToCheckout")
    @ResponseBody
    public ModelAndView linkToCheckout(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/Settlement");
        result.getModel().put("navType",Integer.parseInt(request.getParameter("navType")));
        result.getModel().put("money",String.valueOf(request.getParameter("money")));
        result.getModel().put("orderNumber",String.valueOf(request.getParameter("orderNumber")));
        result.getModel().put("itemId",String.valueOf(request.getParameter("itemId")));
        result.getModel().put("orderCode",String.valueOf(request.getParameter("orderCode")));
        return result;
    }

    //跳转生活缴费
    @RequestMapping("/linkToLivingPayment")
    @ResponseBody
    public ModelAndView linkToLivingPayment(){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/livingPayment");
        return result;
    }

    //跳转水煤查询缴费单
    @RequestMapping("/LinkToQueryPaymentList")
    @ResponseBody
    public ModelAndView LinkToQueryPaymentList(HttpServletRequest request,
                                               HttpServletResponse response)throws IOException {

        String institutionName = request.getParameter("iName");
        institutionName = URLDecoder.decode(institutionName,"UTF-8");

        String retPrvcinvNameParam = request.getParameter("retNameParam");
        retPrvcinvNameParam = URLDecoder.decode(retPrvcinvNameParam,"UTF-8");

        String retCityinvNameParam = request.getParameter("retCNameParam");
        retCityinvNameParam = URLDecoder.decode(retCityinvNameParam,"UTF-8");

        String retBrandvIdParam = request.getParameter("retBrandvIdParam");
        String type = request.getParameter("type");
        String retCIdParam = request.getParameter("retCIdParam");
        String retCityinvIdParam = request.getParameter("retCityinvIdParam");
        String retItemIdParam = request.getParameter("retItemIdParam");
        String retPrvcinvIdParam = request.getParameter("retPrvcinvIdParam");
        String retSpecialvIdParam = request.getParameter("retSpecialvIdParam");

        ModelAndView result = new ModelAndView("/frontPages/selfservice/paymentList");
        result.getModel().put("institutionName",institutionName);
        result.getModel().put("retPrvcinvNameParam",retPrvcinvNameParam);
        result.getModel().put("type",type);
        result.getModel().put("retBrandvIdParam",retBrandvIdParam);
        result.getModel().put("retCIdParam",retCIdParam);
        result.getModel().put("retCityinvIdParam",retCityinvIdParam);
        result.getModel().put("retCityinvNameParam",retCityinvNameParam);
        result.getModel().put("retItemIdParam",retItemIdParam);
        result.getModel().put("retPrvcinvIdParam",retPrvcinvIdParam);
        result.getModel().put("retSpecialvIdParam",retSpecialvIdParam);
        return result;
    }

    //跳转电费缴费单
    @RequestMapping("/LinkToQueryElectricityFees")
    @ResponseBody
    public ModelAndView LinkToQueryElectricityFees(HttpServletRequest request,
                                               HttpServletResponse response)throws IOException {

        String institutionName = request.getParameter("iName");
        institutionName = URLDecoder.decode(institutionName,"UTF-8");

        String retPrvcinvNameParam = request.getParameter("retNameParam");
        retPrvcinvNameParam = URLDecoder.decode(retPrvcinvNameParam,"UTF-8");

        String retCityinvNameParam = request.getParameter("retCNameParam");
        retCityinvNameParam = URLDecoder.decode(retCityinvNameParam,"UTF-8");

        String retBrandvIdParam = request.getParameter("retBrandvIdParam");
        String type = request.getParameter("type");
        String retCIdParam = request.getParameter("retCIdParam");
        String retCityinvIdParam = request.getParameter("retCityinvIdParam");
        String retItemIdParam = request.getParameter("retItemIdParam");
        String retPrvcinvIdParam = request.getParameter("retPrvcinvIdParam");
        String retSpecialvIdParam = request.getParameter("retSpecialvIdParam");

        ModelAndView result = new ModelAndView("/frontPages/selfservice/ElectricityFees");
        result.getModel().put("institutionName",institutionName);
        result.getModel().put("retPrvcinvNameParam",retPrvcinvNameParam);
        result.getModel().put("type",type);
        result.getModel().put("retBrandvIdParam",retBrandvIdParam);
        result.getModel().put("retCIdParam",retCIdParam);
        result.getModel().put("retCityinvIdParam",retCityinvIdParam);
        result.getModel().put("retCityinvNameParam",retCityinvNameParam);
        result.getModel().put("retItemIdParam",retItemIdParam);
        result.getModel().put("retPrvcinvIdParam",retPrvcinvIdParam);
        result.getModel().put("retSpecialvIdParam",retSpecialvIdParam);
        return result;
    }

}
