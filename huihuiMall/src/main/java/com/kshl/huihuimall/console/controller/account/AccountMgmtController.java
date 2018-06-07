package com.kshl.huihuimall.console.controller.account;

import com.kshl.huihuimall.base.request.AccountMgmtRequest;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.extendsEntity.KsAccountAndRole;
import com.kshl.huihuimall.console.service.account.AccountService;
import com.kshl.security.model.KSUserDetailHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

import static com.kshl.huihuimall.console.CSErrorCode.*;
@Controller
@EnableAutoConfiguration
@RequestMapping("/accountMgmt")
public class AccountMgmtController {

    private static Logger logger = LoggerFactory.getLogger(AccountMgmtController.class);
    @Autowired
    private AccountService accountService;

    @RequestMapping
    public ModelAndView linkToAccountMgmt() {
        ModelAndView result = new ModelAndView("/backstagePages/userMgmt");
        return result;
    }

    @RequestMapping(value = "/queryAccounts", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse getAccounts(AccountMgmtRequest request) {
        String entCode = KSUserDetailHelper.getUserEntCode();
        List<KsAccountAndRole> accounts = accountService.getAllAccounts(request.getPageNum(), request.getPageSize(),
                entCode, request.getAccount(), request.getName(), request.getPhone());
        BasePageResponse<List<KsAccountAndRole>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(accounts);
        return pageResponse;
    }

    @RequestMapping(value = "/addAccount", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse addAccount(KsAccountAndRole account) {
        String entCode = KSUserDetailHelper.getUserEntCode();
        account.setMerchantCode(entCode);
        account.setCreateTime(new Date());
        boolean isSuccess = accountService.addAcount(account) > 0;
        BaseResponse response = ResponseBuilder.buildBaseResponse(isSuccess ? SUCCESS : INVALID_PARAM);
        return response;
    }

    @RequestMapping(value = "/updateAccount", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateAccount(KsAccountAndRole account) {
        String entCode = KSUserDetailHelper.getUserEntCode();
        account.setMerchantCode(entCode);
        account.setModifyTime(new Date());
        int count = accountService.updateAccount(account);
        BaseResponse response = ResponseBuilder.buildBaseResponse(count > 0 ? SUCCESS : INVALID_PARAM);
        return response;
    }

    @RequestMapping(value = "/view")
    @ResponseBody
    public ModelMap view(Integer id) {
        ModelMap result = new ModelMap();
        KsAccountAndRole account = accountService.getById(id);
        result.put("data", account);
        return result;
    }

    @RequestMapping(value = "/accountIsExits")
    @ResponseBody
    public ModelMap getByAccount(String loginAccount) {
        String entCode = KSUserDetailHelper.getUserEntCode();
        List<KsAccount> ksAccount = accountService.getByAccount(loginAccount,entCode);
        ModelMap result = new ModelMap();
        result.put("data", ksAccount);
        return result;
    }


}
