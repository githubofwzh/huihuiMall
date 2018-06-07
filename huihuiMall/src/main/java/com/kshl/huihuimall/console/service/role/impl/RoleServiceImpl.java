package com.kshl.huihuimall.console.service.role.impl;

import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.dao.Account.AccountDao;
import com.kshl.huihuimall.base.dal.dao.AccountToRoleDao;
import com.kshl.huihuimall.base.dal.dao.RoleDao;
import com.kshl.huihuimall.base.dal.dao.RoleToResorceDao;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.base.dal.entity.KsRole;
import com.kshl.huihuimall.base.dal.entity.KsRoleToResource;
import com.kshl.huihuimall.console.service.role.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private RoleToResorceDao roleToResorceDao;

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private AccountToRoleDao accountToRoleDao;


    @Override
    public List<KsRole> getAllRolesByPage(Integer pageNum, Integer pageSize, String name, String entCode) {
        List<KsRole> roles = roleDao.getAllRoles(pageNum, pageSize, name, entCode);
        return roles;
    }

    @Override
    public List<KsRole> getAllRoles(String entCode) {
        List<KsRole> roles = roleDao.getAllRoles(entCode);
        return roles;
    }

    @Override
    public int addRole(KsRole role) {
        role.setType(Constants.ACCOUNT_TYPE.GENERAL_ACCOUNT);
        return roleDao.addRole(role);
    }

    @Override
    public int updateRole(KsRole role) {
        return roleDao.updateRole(role);
    }

    @Override
    public int deleteRole(int id) {
        return roleDao.deleteRole(id);
    }

    @Override
    public KsRole getById(int id) {
        return roleDao.getById(id);
    }

    @Override
    public List<KsRole> getByName(String name, String entCode) {
        return roleDao.getByName(name,entCode);
    }

    @Override
    public void addHospitalAccountRole(String entCode) {
        KsRole role = new KsRole();
        role.setDescription("医院管理员");
        role.setEnable(Constants.ROLE_STATUS.ROLE_ENABLE);
        role.setEntcode(entCode);
        role.setName("医院管理员");
        role.setType(Constants.ACCOUNT_TYPE.BUSINESS_ACCOUNT);
        int count = roleDao.addRole(role);
        int roleId = roleDao.getRoleIdByEntCode(entCode, Constants.ACCOUNT_TYPE.BUSINESS_ACCOUNT);
        KsRoleToResource roleToResource = new KsRoleToResource();
        roleToResource.setRoleId(roleId);
        roleToResource.setResourceId(Constants.MENU.MENU_ROOT);
        roleToResorceDao.addRoleToResource(roleToResource);
        roleToResource.setResourceId(Constants.MENU.MENU_HOSPITAL_INFO);
        roleToResorceDao.addRoleToResource(roleToResource);
        roleToResource.setResourceId(Constants.MENU.MENU_HOSPITAL_ORDERS);
        roleToResorceDao.addRoleToResource(roleToResource);

        Integer userId = accountDao.getUserIdByEntCode(entCode, Constants.ACCOUNT_TYPE.BUSINESS_ACCOUNT);
        KsAccountToRole accountToRole = new KsAccountToRole();
        accountToRole.setRoleId(roleId);
        accountToRole.setAccountId(userId);
        accountToRoleDao.addAccountToRole(accountToRole);
    }
}
