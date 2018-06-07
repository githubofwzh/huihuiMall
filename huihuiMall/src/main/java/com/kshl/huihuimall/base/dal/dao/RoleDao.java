package com.kshl.huihuimall.base.dal.dao;

import com.kshl.huihuimall.base.dal.entity.KsRole;

import java.util.List;

public interface RoleDao {

   List<KsRole> getAllRoles(Integer pageNum, Integer pageSize, String name, String entCode);

   List<KsRole> getAllRoles(String entCode);

   int addRole(KsRole factory);

   int updateRole(KsRole factory);

   int deleteRole(int id);

   KsRole getById(int id);

   List<KsRole> getByName(String name, String entCode);

   int getRoleIdByEntCode(String entCode, int businessAccount);
}
