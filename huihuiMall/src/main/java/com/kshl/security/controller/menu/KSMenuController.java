package com.kshl.security.controller.menu;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.security.controller.menu.request.KSRoleMenuRequest;
import com.kshl.security.model.KSMenuResourceModel;
import com.kshl.security.model.KSUserDetailHelper;
import com.kshl.security.services.KSUserDetailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static com.kshl.huihuimall.console.CSErrorCode.*;

/**
 * Created by xufengfeng on 2017/6/5.
 */
@Controller
@RequestMapping("/menu")
public class KSMenuController {

    private static final Logger logger = LoggerFactory.getLogger(KSMenuController.class);

    @Autowired
    private KSUserDetailService userDetailService;

    @GetMapping(value = "/systemMenu")
    @ResponseBody
    public BaseResponse getSystemMenu() {

        logger.info("[getSystemMenu]");

        BaseResponse<KSMenuResourceModel> response;

        KSMenuResourceModel rootMenu = userDetailService.getSystemMenuResourceModel();
        if (rootMenu == null) {
            response = ResponseBuilder.buildBaseResponse(MENU_GET_SYSTEM_MENU_FAILED);
        }else {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(rootMenu);
        }

        return response;
    }

    @GetMapping(value = "/roleMenu")
    @ResponseBody
    public BaseResponse getRoleMenuByRoleId(KSRoleMenuRequest request,
                                            BindingResult bindingResult) {

        logger.info("[getRoleMenuByRoleId] request = {}", request);

        BaseResponse<KSMenuResourceModel> response;
        if (bindingResult.hasErrors()) {
            logger.warn("[getRoleMenuByRoleId] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            KSMenuResourceModel rootMenu = userDetailService.getMenuResourceModelByRoleId(request.getRoleId());
            if (rootMenu == null) {
                response = ResponseBuilder.buildBaseResponse(MENU_GET_ROLE_MENU_FAILED);
            }else {
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
                response.setData(rootMenu);
            }
        }

        return response;
    }

    @GetMapping(value = "/accountMenu")
    @ResponseBody
    public BaseResponse getCurrentAccountMenu() {
        KSMenuResourceModel rootMenu = KSUserDetailHelper.getUserDetail().getRootMenu();
        BaseResponse<KSMenuResourceModel> response;
        if (rootMenu == null) {
            response = ResponseBuilder.buildBaseResponse(MENU_GET_ACCOUNt_MENU_FAILED);
        }else {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(rootMenu);
        }
        return response;
    }

}

