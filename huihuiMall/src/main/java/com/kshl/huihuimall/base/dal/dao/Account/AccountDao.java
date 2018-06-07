package com.kshl.huihuimall.base.dal.dao.Account;

import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.base.dal.entity.KsMenuResource;
import com.kshl.huihuimall.base.dal.entity.KsRoleToResource;
import com.kshl.huihuimall.base.dal.entity.extendsEntity.KsAccountAndRole;

import java.util.List;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public interface AccountDao {

    KsAccount queryAccountByUserName(String userName);

    KsAccountAndRole queryAccountByID(Integer id);

    int addAcount(KsAccount account);

    int updateAcount(KsAccount account);

    KsAccount getAcount(int businessAccount, String entCode);

    List<KsAccountAndRole> getAllAccounts(Integer pageNum, Integer pageSize, String entCode, String name, String account, String phone);


    /**
     * 通过用户名和企业code，获得账户信息
     * @param username
     * @param entCode
     * @return
     */
    KsAccount queryAccountByUsernameAndEntCode(String username, String entCode);

    /**
     * 通过账户id，获得相关角色id
     * @param accountID
     * @return
     */
    List<KsAccountToRole> queryAccountToRoleByAccountId(Integer accountID);


    /**
     * 通过角色id，获得相关资源的id
     * @param roleIds
     * @return
     */
    List<KsRoleToResource> queryRoleToResourceByRoleIds(List<Integer> roleIds);

    /**
     * 通过角色id，获得相关资源的id
     * @param roleId
     * @return
     */
    List<KsRoleToResource> queryRoleToResourceByRoleId(Integer roleId);


    /**
     * 通过资源ID，获得相关资源的信息
     * @param resourceIds
     * @return
     */
    List<KsMenuResource> queryMenuResourceByResourceIds(List<Integer> resourceIds);

    /**
     * 获取所有的菜单资源信息
     * @return
     */
    List<KsMenuResource> queryAllMenuResource();

    List<KsAccount> getByAccount(String account, String entCode);

    boolean checkAccount(String account);

    Integer getUserIdByEntCode(String entCode, int businessAccount);


}
