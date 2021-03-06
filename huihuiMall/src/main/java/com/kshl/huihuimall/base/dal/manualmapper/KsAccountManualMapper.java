package com.kshl.huihuimall.base.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.console.controller.account.pojo.SimpleAccount;

import java.util.List;
import java.util.Map;

/**
 * ks账户和第三方账户
 */

public interface KsAccountManualMapper {

    //ksAccount分页
    List<Map<String,Object>> queryAccounts(Map<String, Object> map);
    //ksAccount数量
    int queryAccountsCount(Map<String, Object> map);
    //第三方账户
    List<Map<String,Object>> queryThiradAccount(Map<String, Object> map);
    //第三方账户数量
    int queryThiradAccountCount(Map<String, Object> map);
    //修改角色信息
    int updateKsAccountToRole(KsAccountToRole ksAccountToRole);

    List<SimpleAccount> queryAccountByRoleNameAndName(Map<String, Object> map);
}
