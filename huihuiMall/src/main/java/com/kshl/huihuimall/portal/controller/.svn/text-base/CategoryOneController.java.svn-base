package com.kshl.huihuimall.portal.controller;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.portal.controller.request.CategoryRequest;
import com.kshl.huihuimall.portal.service.categoryone.CategoryOneService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

@RestController
@EnableAutoConfiguration
@RequestMapping("/PortalCategoryOne")
public class CategoryOneController {
    private static Logger logger = LoggerFactory.getLogger(CategoryOneController.class);
    @Autowired
    private CategoryOneService categoryOneService;

    @RequestMapping(value = "/getAll", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getAll(HttpServletRequest request, HttpServletResponse response){
        logger.debug("getAll start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<CategoryOne> list=categoryOneService.selectByExample(null);
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        return baseResponse;
    }

    @RequestMapping(value = "/getOneAndTwo", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getOneAndTwo(CategoryRequest categoryRequest,HttpServletRequest request){
        logger.debug("getOneAndTwo start");
        BaseResponse baseResponse=new BaseResponse();
        if (categoryRequest.getId() == null) {
            logger.warn("[CategoryRequest] param error id can not be null");
            baseResponse = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            Map<String,Object> map= new HashMap<>();
            UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
            List<CategoryOne> list=categoryOneService.selectByOneAndTwo(categoryRequest.getId());
            map.put("list",list);
            map.put("userInfo",userInfo);
            baseResponse.setData(map);
        }
        return baseResponse;
    }
    @RequestMapping(value = "/getProductByTwoid", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public  BaseResponse getProductByCategory(CategoryRequest ca,HttpServletRequest request){
        logger.debug("getProductByCategory start");
        BaseResponse baseResponse=new BaseResponse();
        if (ca.getTwoId()==null){
            logger.warn("[CategoryRequest] param error twoid can not be null");
            baseResponse = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else{
            Map<String,Object> map= new HashMap<>();
            UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
            List<CategoryTwo> list=categoryOneService.selectCategoryTwoByproduct(ca.getTwoId(),ca.getName(),ca.getBrId());
            Merchant merchant=categoryOneService.getmerchantById(ca.getProductId());
            map.put("list",list);
            map.put("userInfo",userInfo);
            map.put("merchant",merchant);
            baseResponse.setData(map);
        }

        return baseResponse;
    }

    @RequestMapping(value = "/getProduct", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public  BaseResponse getProduct(CategoryRequest cr,HttpServletRequest request){
        logger.debug("getProduct start");
        BaseResponse baseResponse=new BaseResponse();
        if (cr.getProductId()==null){
            logger.warn("[CategoryRequest] param error ProductId can not be null");
            baseResponse = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else{
            Map<String,Object> map= new HashMap<>();
            List<Product> list=categoryOneService.selectByproduct(cr.getProductId(),cr.getName(),cr.getBrId());
            Merchant merchant=categoryOneService.getmerchantById(cr.getProductId());
            UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
            map.put("list",list);
            map.put("userInfo",userInfo);
            map.put("merchant",merchant);
            baseResponse.setData(map);
        }

        return baseResponse;
    }

    //pinpai

    @RequestMapping(value = "/getAllBrand", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getAllBrand(CategoryRequest categoryRequest,HttpServletRequest request){
        logger.debug("getAllBrand start");
        BaseResponse baseResponse=new BaseResponse();
        if (categoryRequest.getBrId() == null) {
            logger.warn("[CategoryRequest] param error id can not be null");
            baseResponse = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            Map<String,Object> map= new HashMap<>();
            UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
            List<Brand> list=categoryOneService.getAllBrand(categoryRequest.getBrId());
            map.put("list",list);
            map.put("userInfo",userInfo);
            baseResponse.setData(map);
        }
        return baseResponse;
    }


    @RequestMapping(value = "/getBrandList", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getBrandList(CategoryRequest categoryRequest,HttpServletRequest request){
        logger.debug("getAllBrand start");
        BaseResponse baseResponse=new BaseResponse();
            List<Brand> list=categoryOneService.getBrandList();
            baseResponse.setData(list);
            baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

    @RequestMapping(value = "/getStoreId", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getStoreId(CategoryRequest categoryRequest,HttpServletRequest request){
        logger.debug("getAllBrand start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        List<Map<String, Object>> list=categoryOneService.getStoreId(categoryRequest.getDeviceCode());
        baseResponse.setData(list);
        baseResponse.setRetCode(Long.valueOf(0));
        return baseResponse;
    }

}
