package com.kshl.huihuimall.console.controller.account;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.console.controller.account.request.AccountLoginRequest;
import com.kshl.huihuimall.console.service.account.AccountService;
import com.kshl.huihuimall.console.service.account.model.AccountServiceModel;
import com.kshl.huihuimall.console.service.role.RoleService;
import com.kshl.security.model.KSUserDetailHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Enumeration;

import static com.kshl.huihuimall.console.CSErrorCode.*;

/**
 * Created by xufengfeng on 17/5/4.
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    AccountService accountService;

    @Autowired
    RoleService roleService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap login(@Valid AccountLoginRequest request,
                 BindingResult bindingResult){
        logger.info("[login] request = {}", request.toString());

        BaseResponse response;
        ModelMap model = new ModelMap();
        if (bindingResult.hasErrors()) {
            logger.warn("[AccountLoginRequest] param error = {}", bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {

            AccountServiceModel accountServiceModel = accountService.login(request.getUsername(),
                    request.getPassword());

            if (accountServiceModel == null) {
                response = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_USERNAME);
            }else if(!accountServiceModel.getEntCode().equals(request.getEntCode())){
                response = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_ENTCODE);
            }else if (accountServiceModel.getEnable().equals(Constants.ACCOUNT_STATUS.ACCOUNT_NOENABLE)){
                response = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_ENABLE);
            }else {
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
                model.put("response", response);
                model.put("data",accountServiceModel);
                return model;
            }
        }
        model.put("response", response);
        return model;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){
        ModelAndView result = new ModelAndView("/backstagePages/login");
        Enumeration em = session.getAttributeNames();
        while(em.hasMoreElements()){
            session.removeAttribute(em.nextElement().toString());
        }
        return result;
    }

    @GetMapping(value = "/login")
    String loginIndex(){
        return "/backstagePages/login";
    }


//    @PostMapping(value = "/logout")
//    String logout(HttpSession session) {
//        return "/BackStage/login";
//    }

    @RequestMapping("/regist")
    public ModelAndView linkToRegist(HttpServletRequest request ){
        Integer type = Integer.parseInt(request.getParameter("type"));
        ModelAndView result = new ModelAndView();
        if(type.equals(Constants.REGISTER_TYPE.ENT_ACCOUNT)){
            result.setViewName("/backstagePages/register");
        }
        result.getModel().put("type",type);
        return result;
    }

    /**
     * 添加商户管理员
     * @param request
     * @param username
     * @param password
     * @param checkcode
     * @return
     */
    @RequestMapping("/addAcount")
    @ResponseBody
    public BaseResponse addAcount(HttpServletRequest request,String username,String password,String checkcode){
        String code = (String) request.getSession().getAttribute("number");
        BaseResponse response = null;
        if(!checkcode.equalsIgnoreCase(code)){
            response = ResponseBuilder.buildBaseResponse(REGIST_FAILED_WRONG_CHECKCODE);
            return response;
        }
        if(accountService.checkAccount(username)) {
            response = ResponseBuilder.buildBaseResponse(REGIST_FAILED_ALREADY_EXIST);
            return response;
        }
        String entCode = accountService.addAcount(username,password);
        if(entCode == null){
            response = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_USERNAME_EXITS);
            return response;
        }
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(entCode);
        return response;
    }

    @RequestMapping("/perfectInfo")
    public ModelAndView linkToCompanyMgmt(){
        ModelAndView result = new ModelAndView("/backstagePages/perfectInfo");
        return result;
    }

    @RequestMapping("/loginSuccess")
    public ModelAndView linkToIndex(HttpServletRequest request){
        ModelAndView result = new ModelAndView();
        if(KSUserDetailHelper.getUserEntCode() == null){
            result.setViewName("/backstagePages/login");
            return result;
        }
        result.setViewName("/backstagePages/index");
        result.getModel().put("username",request.getParameter("username"));
        return result;
    }

    @RequestMapping("/linkPersonalCenter")
    @ResponseBody
    public ModelAndView linkPersonalCenter(){
        ModelAndView result = new ModelAndView("/backstagePages/personalCenter");
        return result;
    }

    @RequestMapping(value = "/updateAccount", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateAccount(String loginAccount,String oldPassword,String newPassword) {
        String entCode = KSUserDetailHelper.getUserEntCode();
        if (Constants.SYSTEM_ACCOUNT.equals(loginAccount)){
            entCode = Constants.SYSTEM_ENTCODE;
        }
        BaseResponse response = accountService.updateAccountPassword(loginAccount,entCode,oldPassword,newPassword);
        return response;
    }

}


