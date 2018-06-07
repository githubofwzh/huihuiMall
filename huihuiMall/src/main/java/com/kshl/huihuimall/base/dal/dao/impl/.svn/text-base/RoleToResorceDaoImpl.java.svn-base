package com.kshl.huihuimall.base.dal.dao.impl;

import com.kshl.huihuimall.base.dal.dao.RoleToResorceDao;
import com.kshl.huihuimall.base.dal.entity.KsRoleToResource;
import com.kshl.huihuimall.base.dal.entity.KsRoleToResourceExample;
import com.kshl.huihuimall.base.dal.mapper.KsRoleToResourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
@Repository
public class RoleToResorceDaoImpl implements RoleToResorceDao {
    @Autowired
    private KsRoleToResourceMapper roleToResourceMapper;

    @Override
    public void addRoleToResource(KsRoleToResource roleToResource) {
        roleToResourceMapper.insert(roleToResource);
    }

    @Override
    public List<KsRoleToResource> getRoleToResources(Integer roleId) {
        KsRoleToResourceExample roleToResourceExample = new KsRoleToResourceExample();
        if(roleId != null){
            roleToResourceExample.createCriteria().andRoleIdEqualTo(roleId);
        }
        return roleToResourceMapper.selectByExample(roleToResourceExample);
    }

    @Override
    public void deleteRoleToResource(Integer roleId) {
        KsRoleToResourceExample roleToResourceExample = new KsRoleToResourceExample();
        if(roleId != null){
            roleToResourceExample.createCriteria().andRoleIdEqualTo(roleId);
        }
        roleToResourceMapper.deleteByExample(roleToResourceExample);
    }

}
