package com.kshl.huihuimall.console.service.account.impl;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.dao.Account.AccountRoleDao;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.console.controller.account.request.AccountRoleRequest;
import com.kshl.huihuimall.console.service.account.AccountRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class AccountRoleServiceImpl implements AccountRoleService {


//    private static final Logger logger = LoggerFactory.getLogger(AccountRoleServiceImpl.class);

    @Autowired
    private AccountRoleDao accountRoleDao;


    @Override
    public List<KsAccountToRole> getAllAccounts(Integer pageNum, Integer pageSize, String roleName) {
        return accountRoleDao.getAllAccountRole(pageNum,pageSize,roleName);
    }

    @Override
    public BaseResponse deleteAccountRole(AccountRoleRequest request) {
        BaseResponse response;
        int delete = accountRoleDao.deleteAccountRole(request.getRoleId());
        if (delete > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public int addAcountRole(KsAccountToRole ksAccountToRole) {
        return accountRoleDao.addAccountRole(ksAccountToRole);
    }

    @Override
    public int updateAcountRole(KsAccountToRole ksAccountToRole) {
        return accountRoleDao.updateAccountRole(ksAccountToRole);
    }


}
