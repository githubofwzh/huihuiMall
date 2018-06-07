package com.kshl.huihuimall.portal.controller;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.portal.controller.request.KsAreaDetailRequest;
import com.kshl.huihuimall.portal.service.KsArea.KsAreaService;
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

@RestController
@EnableAutoConfiguration
@RequestMapping("/PortalksArea")
public class KsAreaDetailController {
    private static Logger logger = LoggerFactory.getLogger(CategoryOneController.class);
    @Autowired
    private KsAreaService ksAreaService;

    @RequestMapping(value = "/getProvince", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getksArea(HttpServletRequest request, HttpServletResponse response){
        logger.debug("getksArea start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<KsArea> list=ksAreaService.SelectProvince(null);
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        return baseResponse;
    }

    @RequestMapping(value = "/getkscity", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getkscity(KsAreaDetailRequest ksAreaDetailRequest,HttpServletRequest request){
        logger.debug("getkscity start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<Map<String, Object>> list=ksAreaService.SelectCity(ksAreaDetailRequest);
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        return baseResponse;
    }

    @RequestMapping(value = "/getksrain", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getksrain(KsAreaDetailRequest ksAreaDetailRequest,HttpServletRequest request){
        logger.debug("getkscity start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<Map<String, Object>>list=ksAreaService.SelectRaion(ksAreaDetailRequest);
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        return baseResponse;
    }

    @RequestMapping(value = "/getkstreet", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getkstreet(KsAreaDetailRequest ksAreaDetailRequest,HttpServletRequest request){
        logger.debug("getkscity start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<Map<String, Object>> list=ksAreaService.SelectStreet(ksAreaDetailRequest);
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        return baseResponse;
    }


    @RequestMapping(value = "/getkstrore", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse getkstrore(KsAreaDetailRequest ksAreaDetailRequest,HttpServletRequest request){
        logger.debug("getkscity start");
        BaseResponse baseResponse=new BaseResponse();
        Map<String,Object> map= new HashMap<>();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        List<Map<String, Object>> list=ksAreaService.SelectStore(ksAreaDetailRequest);
        map.put("list",list);
        map.put("userInfo",userInfo);
        baseResponse.setData(map);
        return baseResponse;
    }


}
