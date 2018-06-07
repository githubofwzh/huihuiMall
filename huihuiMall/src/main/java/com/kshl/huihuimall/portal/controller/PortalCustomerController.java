package com.kshl.huihuimall.portal.controller;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.Customer;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.CSErrorCode;
import com.kshl.huihuimall.console.service.account.ShopKeeperService;
import com.kshl.huihuimall.portal.controller.request.CustomerRequest;
import com.kshl.huihuimall.portal.service.customer.CustomerService;
import com.kshl.util.PayUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@EnableAutoConfiguration
@RequestMapping("/Portalcustomer")
public class PortalCustomerController {
    private static Logger logger = LoggerFactory.getLogger(PortalCustomerController.class);
    @Autowired
    private CustomerService customerService;
    @Autowired
    private ShopKeeperService shopKeeperService;

    // 验证码登陆
    @RequestMapping(value = "/SelectCustomer", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse SelectCustomer(CustomerRequest customerRequest, HttpServletRequest request, String code) {
        logger.debug("SelectCustomer start");
        BaseResponse response = new BaseResponse();
        HttpSession session = request.getSession(false);
        Customer custome = customerService.selectbyPhone(customerRequest.getPhoneNumber());
        UserInfo userInfo= new UserInfo();
        if(custome!=null){
            userInfo.setPhoneNumber(custome.getPhoneNumber());
            userInfo.setUserId(custome.getId());
            userInfo.setCode(custome.getIdentifyCode());
            userInfo.setOpenId(custome.getOpenId());
            request.getSession().setAttribute("userInfo", userInfo);
            // 更新openid
            custome.setOpenId(customerRequest.getOpenId());
            int count = customerService.updateOpenid(custome);
            if(count==0){
                response = ResponseBuilder.buildBaseResponse(CSErrorCode.INVALID_PARAM);
            }
            long a=custome.getExpiretime();
            long b =System.currentTimeMillis();

            if (customerRequest.getNumber().equals(custome.getIdentifyCode())) {
                if (a > b) {
                    response.setRetCode(Long.valueOf(1));
                    response.setData(custome);
                }else {
                    response.setRetCode(Long.valueOf(3));
                }


            } else {
                response.setRetCode(Long.valueOf(2));
                response.setData(custome);
            }

        }else{
            response.setRetCode(Long.valueOf(4));
        }
        return response;
    }



    // 自助机登陆
    @RequestMapping(value = "/Selfhelp", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse Selfhelp(CustomerRequest customerRequest, HttpServletRequest request, String code) {
        logger.debug("SelectCustomer start");
        BaseResponse response = new BaseResponse();
        HttpSession session = request.getSession(false);
        Customer custome = customerService.selectbyPhone(customerRequest.getPhoneNumber());
        UserInfo userInfo= new UserInfo();
        if(custome!=null){
            userInfo.setPhoneNumber(custome.getPhoneNumber());
            userInfo.setUserId(custome.getId());
            userInfo.setCode(custome.getIdentifyCode());
            userInfo.setOpenId(custome.getOpenId());
            request.getSession().setAttribute("userInfo", userInfo);
            // 更新openid
            custome.setOpenId(customerRequest.getOpenId());
            int count = customerService.updateOpenid(custome);
            if(count==0){
                response = ResponseBuilder.buildBaseResponse(CSErrorCode.INVALID_PARAM);
            }
            long a=custome.getExpiretime();
            long b =System.currentTimeMillis();

            if (customerRequest.getNumber().equals(custome.getIdentifyCode())) {
                if (a > b) {
                    response.setRetCode(Long.valueOf(1));
                    response.setData(custome);
                }else {
                    response.setRetCode(Long.valueOf(3));
                }


            } else {
                response.setRetCode(Long.valueOf(2));
                response.setData(custome);
            }

        }else{
            response.setRetCode(Long.valueOf(4));
        }


        return response;
    }



    // 用户授权界面
    @RequestMapping("/customerWeChatAuth")
    @ResponseBody
    public ModelAndView customerWeChatAuth(){
        ModelAndView result = new ModelAndView("/frontPages/terminal/wxCustomerAuthorization");
        return result;
    }

    // 我的门店授权界面
    @RequestMapping("/storeWeChatAuth")
    public ModelAndView storeWeChatAuth(){
        ModelAndView result = new ModelAndView("/frontPages/terminal/wxAuthorization");
        return result;
    }

    // 申请开店授权界面
    @RequestMapping("/ApplyStoreAuth")
    public ModelAndView ApplyStoreAuth(){
        ModelAndView result = new ModelAndView("/frontPages/terminal/wxApplyStore");
        return result;
    }

    // 申请开店授权认定
    @RequestMapping(value = "/IsApplyStoreAuth", method = {RequestMethod.GET})
    public String IsWxApplyStoreAuth(HttpServletRequest request) {
        logger.debug("IsApplyStoreAuth start");
        // 用户同意授权后，能获取到code
        String code = request.getParameter("code");
        String opendid = DateFormatUtil.getOrderIdByUUId();//本地用测试openid
        if (code != null && code.length() != 0) {
            Map<String, Object> accessMap = PayUtil.accessToken(code);
            if (accessMap != null && accessMap.get("openid") != null) {
                opendid = accessMap.get("openid").toString();
                HttpSession session = request.getSession();
                session.setAttribute("openid", opendid);
                Object userInfo = session.getAttribute("userInfo");
                if (KSStringUtils.isEmpty(userInfo)) {
                    Shopkeeper sus = shopKeeperService.getOpenId(opendid);
                    if(!KSStringUtils.isEmpty(sus)) {
                        UserInfo user = new UserInfo();
                        user.setUserId(sus.getId());
                        user.setPhoneNumber(sus.getPhoneNumber());
                        request.getSession().setAttribute("userInfo",user);
                    }
                }
            }
        }
        return "redirect:/Portalcustomer/ApplyStoreAuth?opendid="+ opendid;
    }

    // 我的门店授权认定
    @RequestMapping(value = "/IsStoreWeChatAuth", method = {RequestMethod.GET})
    public String IsStoreWeChatAuth(HttpServletRequest request) {
        logger.debug("IsStoreWeChatAuth start");
        // 用户同意授权后，能获取到code
        String code = request.getParameter("code");
        String opendid = DateFormatUtil.getOrderIdByUUId();//本地用测试openid
        if (code != null && code.length() != 0) {
            Map<String, Object> accessMap = PayUtil.accessToken(code);
            if (accessMap != null && accessMap.get("openid") != null) {
                opendid = accessMap.get("openid").toString();
                HttpSession session = request.getSession();
                session.setAttribute("openid", opendid);
                Object userInfo = session.getAttribute("userInfo");
                if (KSStringUtils.isEmpty(userInfo)) {
                    Shopkeeper sus = shopKeeperService.getOpenId(opendid);
                    if(!KSStringUtils.isEmpty(sus)) {
                        UserInfo user = new UserInfo();
                        user.setUserId(sus.getId());
                        user.setPhoneNumber(sus.getPhoneNumber());
                        request.getSession().setAttribute("userInfo",user);
                    }
                }
            }
        }
        return "redirect:/Portalcustomer/storeWeChatAuth?opendid="+ opendid;
    }

    // 用户授权认定
    @RequestMapping(value = "/IsCustomerWeChatAuth", method = {RequestMethod.GET})
    public String IsCustomerWeChatAuth(HttpServletRequest request, Model model) {
        logger.debug("IsCustomerWeChatAuth start");
        // 用户同意授权后，能获取到code
        String code = request.getParameter("code");
        String opendid = DateFormatUtil.getOrderIdByUUId();//本地用测试openid
        if (code != null && code.length() != 0) {
            Map<String, Object> accessMap = PayUtil.accessToken(code);
            if (accessMap != null && accessMap.get("openid") != null) {
                opendid = accessMap.get("openid").toString();
                HttpSession session = request.getSession();
                session.setAttribute("openid", opendid);
                Object userInfo = session.getAttribute("userInfo");
                if (KSStringUtils.isEmpty(userInfo)) {
                    // 根据openid查一遍
                    Customer cus = customerService.selectbyOpenId(opendid);
                    if(!KSStringUtils.isEmpty(cus)) {
                        UserInfo user = new UserInfo();
                        user.setUserId(cus.getId());
                        user.setPhoneNumber(cus.getPhoneNumber());
                        request.getSession().setAttribute("userInfo", user);
                    }
                }
            }
        }
        return "redirect:/Portalcustomer/customerWeChatAuth?opendid="+ opendid;
    }

    // 授权登陆
    @RequestMapping(value = "/WeChatAuthLand", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse WeChatAuthLand(String openid, HttpServletRequest request) {
        logger.debug("WeChatAuthLand start");
        BaseResponse response = new BaseResponse();
        if (!KSStringUtils.isEmpty(openid)) {
            Customer cus = customerService.selectbyOpenId(openid);
            if(cus !=null){
                UserInfo user = new UserInfo();
                user.setUserId(cus.getId());
                user.setPhoneNumber(cus.getPhoneNumber());
                request.getSession().setAttribute("userInfo", user);
                response.setData(cus);
                response.setRetCode(Long.valueOf(1));
                response.setRetMsg("授权登陆成功");
                return response;
            } else{
                response.setRetCode(Long.valueOf(2));
                response.setRetMsg("验证码登陆");
                return response;
            }
        }else{
            response.setRetCode(Long.valueOf(3));
            response.setRetMsg("授权失败");
            return response;
        }
    }
}