package com.kshl.huihuimall.portal.controller;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.Customer;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.console.controller.product.ProductMgmtController;
import com.kshl.huihuimall.console.service.account.ShopKeeperService;
import com.kshl.huihuimall.portal.service.customer.CustomerService;
import com.kshl.huihuimall.portal.service.sms.SmsService;
import com.kshl.huihuimall.portal.smsinterface.SmsResponse;
import com.kshl.huihuimall.portal.smsinterface.smsinterface;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;


@Controller
    @EnableAutoConfiguration
    @RequestMapping("/SmsController")
    public class SmsController {
        private static final Logger logger = LoggerFactory.getLogger(ProductMgmtController.class);
        @Autowired
        private SmsService smsService;
        @Autowired
        private ShopKeeperService shopKeeperService;
        @Autowired
        private CustomerService customerService;

        /*
          发送短信文本
         */
        @RequestMapping(value = "/smsContent", method = {RequestMethod.GET, RequestMethod.POST})
        @ResponseBody
        public BaseResponse smsContent(String content,String mobile) {
            logger.debug("smsContent start");
            BaseResponse response = null;
            if(mobile == null || mobile.trim().length() == 0){
                logger.warn("[mobile] param error id can not be null");
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }else{
                smsService.smsContent(mobile,content);
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
            }
            return response;
        }


        /*
         用户端短信验证码
        */
        @RequestMapping(value = "/CustomersmsCode", method = {RequestMethod.GET, RequestMethod.POST})
        @ResponseBody
        public BaseResponse CustomersmsCode(String  mobile) {
            logger.debug("smsCode start");
            BaseResponse response=new BaseResponse();
            if(mobile == null || mobile.trim().length() == 0){
                logger.warn("[mobile] param error id can not be null");
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                return response;
            }else{
                String code= getCaptchaCode();
                String  content ="【惠惠网店】"+"您好，您的验证码为："+ code;
                smsService.smsCode(mobile,content);
                Customer custome = customerService.selectbyPhone(mobile);
                if(custome!=null){
                    custome.setPhoneNumber(mobile);
                    custome.setIdentifyCode(code);
                    custome.setExpiretime(System.currentTimeMillis() + 1000 * 60 * 5);
                    customerService.updateCode(custome);
                }else if(custome==null){
                    Customer customer =new Customer();
                    customer.setPhoneNumber(mobile);
                    customer.setIdentifyCode(code);
                    customer.setExpiretime(System.currentTimeMillis() + 1000 * 60 * 5);
                    customerService.insertPhone(customer);
                }
                response.setData(code);
                response.setRetCode(Long.valueOf(0));
                return response;
            }
        }




    /*
          短信验证码
         */
        @RequestMapping(value = "/smsCode", method = {RequestMethod.GET, RequestMethod.POST})
        @ResponseBody
        public BaseResponse smsCode(String  mobile) {
            logger.debug("smsCode start");
            BaseResponse response=new BaseResponse();
            if(mobile == null || mobile.trim().length() == 0){
                logger.warn("[mobile] param error id can not be null");
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                return response;
            }else{
                String code= getCaptchaCode();
                String  content ="【惠惠网店】"+"您好，您的验证码为："+ code;
                smsService.smsCode(mobile,content);
                Shopkeeper shopkeeper = shopKeeperService.getphnoe(mobile);
                if(shopkeeper!=null){
                    shopkeeper.setPhoneNumber(mobile);
                    shopkeeper.setIdentifyCode(code);
                    shopkeeper.setExpiretime(System.currentTimeMillis() + 1000 * 60 * 5);
                    int num = shopKeeperService.updateOpenId(shopkeeper);
                    if(num==0){
                        response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                        return response;
                    }
                }else if(shopkeeper==null){
                    Shopkeeper keeper =new Shopkeeper();
                    keeper.setPhoneNumber(mobile);
                    keeper.setIdentifyCode(code);
                    keeper.setExpiretime(System.currentTimeMillis() + 1000 * 60 * 5);
                    int count = shopKeeperService.insertPhone(keeper);
                    if(count==0){
                        response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                        return response;
                    }
                }
                response.setData(code);
                response.setRetCode(Long.valueOf(0));
                return response;
            }
        }

        /*
          生成code
         */
        private String getCaptchaCode() {
            int max = 999999;
            int min = 100000;
            Random random = new Random();
            return (random.nextInt(max) % (max - min + 1) + min) + "";
        }

}

