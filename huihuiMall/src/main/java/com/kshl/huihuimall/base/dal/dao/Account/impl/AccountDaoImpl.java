package com.kshl.huihuimall.base.dal.dao.Account.impl;

import com.github.pagehelper.PageHelper;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.dao.Account.AccountDao;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.dal.entity.extendsEntity.KsAccountAndRole;
import com.kshl.huihuimall.base.dal.manualmapper.KsAccountMMapper;
import com.kshl.huihuimall.base.dal.mapper.KsAccountMapper;
import com.kshl.huihuimall.base.dal.mapper.KsAccountToRoleMapper;
import com.kshl.huihuimall.base.dal.mapper.KsMenuResourceMapper;
import com.kshl.huihuimall.base.dal.mapper.KsRoleToResourceMapper;
import com.kshl.huihuimall.base.dal.mapper.KsRoleMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by xufengfeng on 2017/5/4.
 */
@Repository
public class AccountDaoImpl implements AccountDao {

    private static final Logger logger = LoggerFactory.getLogger(AccountDaoImpl.class);

    @Autowired
    KsAccountMapper ksAccountMapper;

    @Autowired
    KsAccountMMapper ksAccountMMapper;

    @Autowired
    KsAccountToRoleMapper ksAccountToRoleMapper;

    @Autowired
    KsRoleToResourceMapper ksRoleToResourceMapper;

    @Autowired
    KsRoleMapper ksRoleMapper;


    @Autowired
    KsMenuResourceMapper ksMenuResourceMapper;

    public KsAccount queryAccountByUserName(String userName) {
        Assert.notNull(userName, "userName should not be null");

        KsAccountExample example = new KsAccountExample();
        example.createCriteria().andLoginAccountEqualTo(userName);

        List<KsAccount> list = ksAccountMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(list)) {
            return list.get(0);
        }
        return null;
    }


    public KsAccountAndRole queryAccountByID(Integer id) {
        Assert.notNull(id, "id should not be null");
        logger.info("queryAccountByID id = {}", id);

        KsAccount account = ksAccountMapper.selectByPrimaryKey(id);
        KsAccountAndRole ksAccountAndRole = new KsAccountAndRole();
        BeanUtils.copyProperties(account, ksAccountAndRole);
        KsAccountToRoleExample ksAccountToRoleExample = new KsAccountToRoleExample();
        ksAccountToRoleExample.createCriteria().andAccountIdEqualTo(id);
        List<KsAccountToRole> accountToRoles = ksAccountToRoleMapper.selectByExample(ksAccountToRoleExample);
        if (accountToRoles != null && accountToRoles.size() > 0) {
            KsAccountToRole ksAccountToRole = accountToRoles.get(0);
            ksAccountAndRole.setRoleId(ksAccountToRole.getRoleId());
            KsRole role = ksRoleMapper.selectByPrimaryKey(ksAccountToRole.getRoleId());
            if(role != null) {
                ksAccountAndRole.setRoleName(role.getName());
            }
        }
        return ksAccountAndRole;
    }

    @Override
    public int addAcount(KsAccount account) {
        int count = ksAccountMapper.insert(account);
        if (account.getType() == Constants.ACCOUNT_TYPE.GENERAL_ACCOUNT) {
            if (account instanceof KsAccountAndRole) {
                KsAccountToRole ksAccountToRole = new KsAccountToRole();
                ksAccountToRole.setAccountId(account.getId());
                ksAccountToRole.setRoleId(((KsAccountAndRole) account).getRoleId());
                ksAccountToRoleMapper.insert(ksAccountToRole);
            }
        }
        return count;
    }

    @Override
    public int updateAcount(KsAccount account) {
        if(account instanceof KsAccountAndRole) {
            KsAccountAndRole ksAccountAndRole = (KsAccountAndRole)account;
            int roleid = ksAccountAndRole.getRoleId() == null?0:ksAccountAndRole.getRoleId();
            if(roleid > 0) {
                KsAccountToRole ksAccountToRole = new KsAccountToRole();
                ksAccountToRole.setAccountId(ksAccountAndRole.getId());
                ksAccountToRole.setRoleId(roleid);
                KsAccountToRoleExample ksAccountToRoleExample = new KsAccountToRoleExample();
                ksAccountToRoleExample.createCriteria().andAccountIdEqualTo(ksAccountAndRole.getId());
                ksAccountToRoleMapper.updateByExampleSelective(ksAccountToRole, ksAccountToRoleExample);
            }
        }return  ksAccountMapper.updateByPrimaryKeySelective(account);
    }

    @Override
    public KsAccount getAcount(int businessAccount, String entCode) {
        KsAccountExample example = new KsAccountExample();
        example.createCriteria().andTypeEqualTo(businessAccount).andMerchantCodeEqualTo(entCode);
        return ksAccountMapper.selectByExample(example).get(0);
    }

    @Override
    public List<KsAccountAndRole> getAllAccounts(Integer pageNum, Integer pageSize, String entCode, String name, String account, String phone) {
        if (pageNum != null && pageSize != null) {
            PageHelper.startPage(pageNum, pageSize);
        }

        KsAccountExample KsAccountExample = new KsAccountExample();
        com.kshl.huihuimall.base.dal.entity.KsAccountExample.Criteria criteria = KsAccountExample.createCriteria();
        if (entCode != null && !entCode.isEmpty()) {
            criteria.andMerchantCodeEqualTo(entCode);
        }
        if (name != null && !name.isEmpty()) {
            criteria.andNameLike("%" + name + "%");
        }
        if (account != null && !account.isEmpty()) {
            criteria.andLoginAccountLike("%" + account + "%");
        }
        if (phone != null && !phone.isEmpty()) {
            criteria.andPhoneLike("%" + phone + "%");
        }
        List<KsAccount> accounts = ksAccountMapper.selectByExample(KsAccountExample);
        List<KsAccountAndRole> accountAndRoles = new ArrayList<KsAccountAndRole>();
        for (KsAccount account1 : accounts) {
            KsAccountToRoleExample ksAccountToRoleExample = new KsAccountToRoleExample();
            ksAccountToRoleExample.createCriteria().andAccountIdEqualTo(account1.getId());
            List<KsAccountToRole> list = ksAccountToRoleMapper.selectByExample(ksAccountToRoleExample);
            KsAccountAndRole ksAccountAndRole = new KsAccountAndRole();
            BeanUtils.copyProperties(account1, ksAccountAndRole);
            if (list != null && list.size() > 0) {
                KsAccountToRole ksAccountToRole = list.get(0);
                ksAccountAndRole.setRoleId(ksAccountToRole.getRoleId());
                KsRole role = ksRoleMapper.selectByPrimaryKey(ksAccountToRole.getRoleId());
                if(role != null) {
                    ksAccountAndRole.setRoleName(role.getName());
                }
            }
            accountAndRoles.add(ksAccountAndRole);
        }
        return accountAndRoles;
    }


    public KsAccount queryAccountByUsernameAndEntCode(String username, String entCode) {
        Assert.notNull(username, "username should not be null");
        Assert.notNull(entCode, "entCode should not be null");

        KsAccountExample ksAccountExample = new KsAccountExample();
        ksAccountExample.createCriteria().andLoginAccountEqualTo(username)
                .andMerchantCodeEqualTo(entCode);

        List<KsAccount> accountList = ksAccountMapper.selectByExample(ksAccountExample);

        if (!CollectionUtils.isEmpty(accountList)){
            logger.info("[queryAccountByUsernameAndEntCode] accountList size = {}", accountList.size());
            return accountList.get(0);
        }
        return null;
    }


    public List<KsAccountToRole> queryAccountToRoleByAccountId(Integer accountID) {
        Assert.notNull(accountID, "accountID should not be null");

        KsAccountToRoleExample ksAccountToRoleExample = new KsAccountToRoleExample();
        ksAccountToRoleExample.createCriteria().
                andAccountIdEqualTo(accountID);

        return ksAccountToRoleMapper.selectByExample(ksAccountToRoleExample);
    }

    public List<KsRoleToResource> queryRoleToResourceByRoleIds(List<Integer> roleIds) {
        Assert.notEmpty(roleIds, "roleIds should not be Empty");

        KsRoleToResourceExample ksRoleToResourceExample = new KsRoleToResourceExample();
        ksRoleToResourceExample.createCriteria().
                andRoleIdIn(roleIds);
        return ksRoleToResourceMapper.selectByExample(ksRoleToResourceExample);
    }

    public List<KsRoleToResource> queryRoleToResourceByRoleId(Integer roleId) {
        Assert.notNull(roleId, "roleId should not be null");

        KsRoleToResourceExample ksRoleToResourceExample = new KsRoleToResourceExample();
        ksRoleToResourceExample.createCriteria().
                andRoleIdEqualTo(roleId);
        return ksRoleToResourceMapper.selectByExample(ksRoleToResourceExample);
    }


    public List<KsMenuResource> queryMenuResourceByResourceIds(List<Integer> resourceIds) {
        Assert.notEmpty(resourceIds, "resourceIds should not be Empty");

        KsMenuResourceExample ksMenuResourceExample = new KsMenuResourceExample();
        ksMenuResourceExample.createCriteria().andIdIn(resourceIds);

        return ksMenuResourceMapper.selectByExample(ksMenuResourceExample);
    }

    public List<KsMenuResource> queryAllMenuResource() {
        return ksMenuResourceMapper.selectByExample(null);
    }

    @Override
    public List<KsAccount> getByAccount(String account, String entCode) {
        KsAccountExample ksAccountExample = new KsAccountExample();
        ksAccountExample.createCriteria().andLoginAccountEqualTo(account).andMerchantCodeEqualTo(entCode);
        List<KsAccount> accounts = ksAccountMapper.selectByExample(ksAccountExample);
        return accounts;
    }

    @Override
    public boolean checkAccount(String account) {
        KsAccountExample ksAccountExample = new KsAccountExample();
        ksAccountExample.createCriteria().andLoginAccountEqualTo(account);
        long count = ksAccountMapper.countByExample(ksAccountExample);
        return count > 0 ? true : false;
    }

    @Override
    public Integer getUserIdByEntCode(String entCode, int businessAccount) {
        KsAccountExample ksAccountExample = new KsAccountExample();
        ksAccountExample.createCriteria().andMerchantCodeEqualTo(entCode).andTypeEqualTo(businessAccount);
        return ksAccountMapper.selectByExample(ksAccountExample).get(0).getId();
    }
}
