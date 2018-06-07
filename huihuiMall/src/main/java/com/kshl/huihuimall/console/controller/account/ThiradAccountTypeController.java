package com.kshl.huihuimall.console.controller.account;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.ThiradAccountType;
import com.kshl.huihuimall.console.controller.account.request.ThiradAccountTypeRequest;
import com.kshl.huihuimall.console.service.account.ThiradAccountTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Controller
@EnableAutoConfiguration
@RequestMapping("/thriadAccoundType")
public class ThiradAccountTypeController {
    private static Logger logger = LoggerFactory.getLogger(ThiradAccountTypeController.class);
    @Autowired
    private ThiradAccountTypeService thiradAccountTypeService;


    /**
     * 第三方商家账户分页查询
     * @param request
     * @return
     */
    @RequestMapping(value = "/queryThiradAccount", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public BasePageResponse queryThiradAccount(ThiradAccountTypeRequest request){
        logger.debug("queryThiradAccount start");
        //只查询未删除的账户
        request.setIsDeleted(0);
        //第三方查询账户为2的
        request.setType(2);
        return thiradAccountTypeService.queryThiradAccount(request);
    }

    /**
     * 第三方账号的启用禁用
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateThiradAccount", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateThiradAccount(ThiradAccountTypeRequest request) {
        logger.debug("updateThiradAccount start");
        BaseResponse response;
        if (request.getId() == null) {
            logger.warn("[ThiradAccountTypeRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = thiradAccountTypeService.updateThiradAccount(request);
        }
        return response;
    }








    /*@RequestMapping(value = "/thiradAccountType", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public BasePageResponse getThiradAccountType(ThiradAccountTypeRequest request){
        List<ThiradAccountType> thiradAccountTypes = thiradAccountTypeService.getThiradAccountType(request.getPageNum(),request.getPageSize(),request.getThirad_account(),request.getThirad_name(),request.getThirad_state());
        BasePageResponse<List<ThiradAccountType>> response = ResponseBuilder.buildBasePageResponse(SUCCESS);
        response.setData(thiradAccountTypes);
        return  response;
    }

    @RequestMapping(value = "/addthiradAccountType", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public BaseResponse addthiradAccountType(ThiradAccountTypeRequest request,BindingResult bindingResult){
        BaseResponse response;
        ThiradAccountType thiradAccountType = new ThiradAccountType();
        BeanUtils.copyProperties(request,thiradAccountType);
        if (bindingResult.hasErrors()){
            logger.warn("[ThiradAccountTypeRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else {
            boolean isSuccess = thiradAccountTypeService.addThiradAccountType(thiradAccountType) > 0;
            response = ResponseBuilder.buildBaseResponse(isSuccess ? SUCCESS :INVALID_PARAM);
        }
        return response;
    }

    @RequestMapping(value = "/deleateThiradAccountType",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public  BaseResponse deleteThiradAccountType(Integer id){
        BaseResponse response;
        if (id != null){
            boolean iSSuccess = thiradAccountTypeService.deleteThiradAccount(id) > 0;
            response  = ResponseBuilder.buildBaseResponse(iSSuccess ? SUCCESS :INVALID_PARAM);
        }else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @RequestMapping(value = "/updateThiradAccountType", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public  BaseResponse updateThiradAccountType(ThiradAccountTypeRequest request,BindingResult bindingResult){
        BaseResponse response;
        ThiradAccountType thiradAccountType = new ThiradAccountType();
        BeanUtils.copyProperties(request,thiradAccountType);
        if (bindingResult.hasErrors()){
            logger.warn("[ThiradAccountTypeRequest] param error = {}",bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else {
            boolean isSuccess = thiradAccountTypeService.updateThiradAccount(thiradAccountType) > 0;
            response = ResponseBuilder.buildBaseResponse(isSuccess ? SUCCESS : INVALID_PARAM);
        }
        return  response;
    }*/


}
