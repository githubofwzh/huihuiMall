package com.kshl.huihuimall.base.dal.dao.Account.impl;

import com.github.pagehelper.PageHelper;
import com.kshl.huihuimall.base.dal.dao.Account.AccountRoleDao;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRoleExample;
import com.kshl.huihuimall.base.dal.mapper.KsAccountToRoleMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AccountRoleDaoImpl implements AccountRoleDao {
    private static final Logger logger = LoggerFactory.getLogger(AccountRoleDaoImpl.class);

    @Autowired
    KsAccountToRoleMapper ksAccountToRoleMapper;

    @Override
    public List<KsAccountToRole> getAllAccountRole(Integer pageNum, Integer pageSize, String roleName) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        com.kshl.huihuimall.base.dal.entity.KsAccountToRoleExample ksAccountToRoleExample = new KsAccountToRoleExample();
        KsAccountToRoleExample.Criteria criteria = ksAccountToRoleExample.createCriteria();
        if (roleName != null && !roleName.isEmpty()){
            criteria.andRoleNameLike("%"+ roleName + "%");
        }
        return ksAccountToRoleMapper.selectByExample(ksAccountToRoleExample);
    }

    @Override
    public int deleteAccountRole(Integer roleId) {
        return ksAccountToRoleMapper.deleteByPrimaryKey(roleId);
    }

    @Override
    public int addAccountRole(KsAccountToRole ksAccountToRole) {
        return ksAccountToRoleMapper.insert(ksAccountToRole);
    }

    @Override
    public int updateAccountRole(KsAccountToRole ksAccountToRole) {
        return ksAccountToRoleMapper.updateByPrimaryKeySelective(ksAccountToRole);
    }


}
