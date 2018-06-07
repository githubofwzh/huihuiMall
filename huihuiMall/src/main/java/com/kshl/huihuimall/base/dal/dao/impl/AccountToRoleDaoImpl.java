package com.kshl.huihuimall.base.dal.dao.impl;

import com.kshl.huihuimall.base.dal.dao.AccountToRoleDao;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.base.dal.mapper.KsAccountToRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/6/2.
 */
@Repository
public class AccountToRoleDaoImpl implements AccountToRoleDao {

    @Autowired
    private KsAccountToRoleMapper accountToRoleMapper;

    @Override
    public void addAccountToRole(KsAccountToRole accountToRole) {
        accountToRoleMapper.insert(accountToRole);
    }
}
