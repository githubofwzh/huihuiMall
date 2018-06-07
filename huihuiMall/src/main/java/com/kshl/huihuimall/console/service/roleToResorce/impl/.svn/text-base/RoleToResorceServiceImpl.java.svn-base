package com.kshl.huihuimall.console.service.roleToResorce.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.kshl.huihuimall.base.dal.dao.RoleToResorceDao;
import com.kshl.huihuimall.base.dal.entity.KsRoleToResource;
import com.kshl.huihuimall.console.service.roleToResorce.RoleToResorceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/6/2.
 */
@Service
public class RoleToResorceServiceImpl implements RoleToResorceService {
    @Autowired
    private RoleToResorceDao roleToResorceDao;

    @Override
    public List<KsRoleToResource> getRoleToResources(Integer roleId) {
        return roleToResorceDao.getRoleToResources(roleId);
    }

    @Override
    public void installAuth(Integer roleId, String resource) {
        roleToResorceDao.deleteRoleToResource(roleId);
        KsRoleToResource roleToResource = new KsRoleToResource();
        roleToResource.setRoleId(roleId);
        JSONArray resourceIds = JSON.parseArray(resource);
        for (int i=0;i<resourceIds.size();i++){
            roleToResource.setResourceId(Integer.parseInt((String) resourceIds.get(i)));
            roleToResorceDao.addRoleToResource(roleToResource);
        }
    }
}
