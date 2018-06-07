package com.kshl.huihuimall.console.service.account.impl;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.dao.Account.AccountRoleDao;
import com.kshl.huihuimall.base.dal.dao.AccountToRoleDao;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.console.controller.account.request.AccountRoleRequest;
import com.kshl.huihuimall.console.service.account.AccountRoleService;
import com.kshl.huihuimall.console.service.account.AccountRoleTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

import java.util.List;

@Service
public class AccountRoleServiceTypeImpl implements AccountRoleTypeService {


    private static final Logger logger = LoggerFactory.getLogger(AccountRoleServiceTypeImpl.class);

    @Autowired
    private AccountToRoleDao accountToRoleDao;


    @Override
    public List<KsAccountToRole> getAllAccounts(Integer pageNum, Integer pageSize, String roleName) {
        return accountToRoleDao.getAllAccountRole(pageNum,pageSize,roleName);
    }



    @Override
    public int addAcountRole(KsAccountToRole ksAccountToRole) {
        return accountToRoleDao.addAccountRole(ksAccountToRole);
    }

    @Override
    public int deleteAccountRole(Integer id) {
        return accountToRoleDao.deleteAccountRole(id);
    }

    @Override
    public int updateAcountRole(KsAccountToRole ksAccountToRole) {
        return accountToRoleDao.updateAccountRole(ksAccountToRole);
    }


}
