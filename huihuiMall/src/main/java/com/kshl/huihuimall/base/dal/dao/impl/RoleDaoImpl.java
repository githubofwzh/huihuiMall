package com.kshl.huihuimall.base.dal.dao.impl;

import com.github.pagehelper.PageHelper;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.dao.RoleDao;
import com.kshl.huihuimall.base.dal.entity.KsRole;
import com.kshl.huihuimall.base.dal.entity.KsRoleExample;
import com.kshl.huihuimall.base.dal.mapper.KsRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RoleDaoImpl implements RoleDao {
    @Autowired
    private KsRoleMapper roleMapper;


    @Override
    public List<KsRole> getAllRoles(Integer pageNum, Integer pageSize, String name, String entCode) {
        if (pageNum != null && pageSize != null) {
            PageHelper.startPage(pageNum, pageSize);
        }

        KsRoleExample KsRoleExample = new KsRoleExample();
        com.kshl.huihuimall.base.dal.entity.KsRoleExample.Criteria criteria = KsRoleExample.createCriteria();
        if(name != null && !name.isEmpty()) {
            criteria.andNameLike("%" + name + "%");
        }
        if(entCode != null && !entCode.isEmpty()) {
            criteria.andEntcodeEqualTo(entCode);
        }
        return roleMapper.selectByExample(KsRoleExample);
    }

    @Override
    public List<KsRole> getAllRoles(String entCode) {
        KsRoleExample KsRoleExample = new KsRoleExample();
        KsRoleExample.createCriteria().andEntcodeEqualTo(entCode).andEnableEqualTo(Constants.ROLE_STATUS.ROLE_ENABLE).andTypeEqualTo(Constants.ACCOUNT_TYPE.GENERAL_ACCOUNT);
        return roleMapper.selectByExample(KsRoleExample);
    }

    @Override
    public int addRole(KsRole role) {
        return roleMapper.insert(role);
    }

    @Override
    public int updateRole(KsRole role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public int deleteRole(int id) {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public KsRole getById(int id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<KsRole> getByName(String name, String entCode) {
        KsRoleExample KsRoleExample = new KsRoleExample();
        KsRoleExample.createCriteria().andNameEqualTo(name).andEntcodeEqualTo(entCode);
        List<KsRole> roles = roleMapper.selectByExample(KsRoleExample);
        return roles;
    }

    @Override
    public int getRoleIdByEntCode(String entCode, int businessAccount) {
        KsRoleExample KsRoleExample = new KsRoleExample();
        KsRoleExample.createCriteria().andEntcodeEqualTo(entCode).andTypeEqualTo(businessAccount);
        return roleMapper.selectByExample(KsRoleExample).get(0).getId();
    }
}
