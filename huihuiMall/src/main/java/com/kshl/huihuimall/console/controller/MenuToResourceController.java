package com.kshl.huihuimall.console.controller;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.security.model.KSMenuResourceModel;
import com.kshl.security.model.KSUserDetailHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static com.kshl.huihuimall.console.CSErrorCode.*;

/**
 * Created by Administrator on 2017/6/2.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/menuToResource")
public class MenuToResourceController {
    private static final Logger logger = LoggerFactory.getLogger(MenuToResourceController.class);

    @RequestMapping
    @ResponseBody
    public BaseResponse getMenuToResource(Integer roleId){
        KSMenuResourceModel model = KSUserDetailHelper.getUserDetail().getRootMenu();
        BaseResponse response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(model);
        return response;
    }


}
