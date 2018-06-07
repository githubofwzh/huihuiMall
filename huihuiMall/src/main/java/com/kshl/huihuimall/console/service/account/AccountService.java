package com.kshl.huihuimall.console.service.account;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.extendsEntity.KsAccountAndRole;
import com.kshl.huihuimall.console.service.account.model.AccountServiceModel;

import java.util.List;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public interface AccountService {

    AccountServiceModel login(String userName, String password) throws IllegalArgumentException;

    List<KsAccountAndRole> getAllAccounts(Integer pageNum, Integer pageSize, String entCode, String account, String name, String phone);

    int addAcount(KsAccount account);

    String addAcount(String username,String password);

    int updateAccount(KsAccount account);

    KsAccountAndRole getById(int id);

    List<KsAccount> getByAccount(String account, String entCode);

    boolean checkAccount(String account);

    BaseResponse updateAccountPassword(String loginAccount, String entCode, String oldPassword, String newPassword);
}
