package com.kshl.huihuimall.console.service.role;

import com.kshl.huihuimall.base.dal.entity.KsRole;

import java.util.List;

public interface RoleService {

    List<KsRole> getAllRolesByPage(Integer pageNum, Integer pageSize, String name, String entCode);

    List<KsRole> getAllRoles(String entCode);

    int addRole(KsRole factory);

    int updateRole(KsRole factory);

    int deleteRole(int id);

    KsRole getById(int id);

    List<KsRole> getByName(String name, String entCode);

    void addHospitalAccountRole(String entCode);
}
