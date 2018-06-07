package com.kshl.huihuimall.console.service.account;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.base.dal.entity.extendsEntity.KsAccountAndRole;
import com.kshl.huihuimall.console.controller.account.request.AccountRoleRequest;

import java.util.List;

public interface AccountRoleService {

    List<KsAccountToRole> getAllAccounts(Integer pageNum, Integer pageSize, String roleName);

    BaseResponse deleteAccountRole(AccountRoleRequest request);

    int addAcountRole(KsAccountToRole ksAccountToRole);

    int updateAcountRole(KsAccountToRole ksAccountToRole);
}
