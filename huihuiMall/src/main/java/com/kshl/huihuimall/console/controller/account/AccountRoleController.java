package com.kshl.huihuimall.console.controller.account;

import com.kshl.base.reqeust.BasePageRequest;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.base.dal.entity.extendsEntity.KsAccountAndRole;
import com.kshl.huihuimall.base.request.AccountMgmtRequest;
import com.kshl.huihuimall.console.controller.account.request.AccountRoleRequest;
import com.kshl.huihuimall.console.service.account.AccountRoleService;
import com.kshl.huihuimall.console.service.account.AccountRoleTypeService;
import com.kshl.huihuimall.console.service.account.AccountService;
import com.kshl.security.model.KSUserDetailHelper;
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
@RequestMapping("/accountRole")
public class AccountRoleController {
    private static Logger logger = LoggerFactory.getLogger(AccountRoleController.class);

    @Autowired
    private AccountRoleTypeService accountRoleTypeService;

    @RequestMapping(value = "/queryAccountRole", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse getAccounts(AccountRoleRequest request) {
        List<KsAccountToRole> accounts = accountRoleTypeService.getAllAccounts(request.getPageNum(), request.getPageSize(),request.getRoleName());
        BasePageResponse<List<KsAccountToRole>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(accounts);
        return pageResponse;
    }

    @RequestMapping(value = "/queryAddAccountRole", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addAccountRole(AccountRoleRequest accountRoleRequest,BindingResult bindingResult) {
        BaseResponse response;
        KsAccountToRole ksAccountToRole = new KsAccountToRole();
        BeanUtils.copyProperties(accountRoleRequest,ksAccountToRole);
        if (bindingResult.hasErrors()){
            logger.warn("[KsAccountRoleRequest] param error = {}",bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else {
            boolean isSuccess = accountRoleTypeService.addAcountRole(ksAccountToRole) > 0;
            response = ResponseBuilder.buildBaseResponse(isSuccess ? SUCCESS :INVALID_PARAM);
        }
        return  response;

    }
    @RequestMapping(value = "/queryDeleteAccountRole", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse deleteAccountRole(Integer id){
        BaseResponse response;
        if (id == null){
            logger.warn("[ProductRequest] param error roleId can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else {
            boolean isSuccess = accountRoleTypeService.deleteAccountRole(id) > 0;
            response = ResponseBuilder.buildBaseResponse(isSuccess ? SUCCESS :INVALID_PARAM);
        }
        return response;
    }
    @RequestMapping(value = "/queryUpdateAccountRole", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateAccountRole(AccountRoleRequest accountRoleRequest,BindingResult bindingResult) {
        BaseResponse response;
        KsAccountToRole ksAccountToRole = new KsAccountToRole();
        BeanUtils.copyProperties(accountRoleRequest,ksAccountToRole);
        if (bindingResult.hasErrors()){
            logger.warn("[KsAccountRoleRequest] param error = {}",bindingResult.getAllErrors());
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }else {
            boolean isSuccess = accountRoleTypeService.updateAcountRole(ksAccountToRole) > 0;
            response = ResponseBuilder.buildBaseResponse(isSuccess ? SUCCESS :INVALID_PARAM);
        }
        return  response;

    }













}
