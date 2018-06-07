package com.kshl.security.services.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.dao.Account.AccountDao;
import com.kshl.huihuimall.base.dal.dao.RoleDao;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.KsAccountToRole;
import com.kshl.huihuimall.base.dal.entity.KsMenuResource;
import com.kshl.huihuimall.base.dal.entity.KsRoleToResource;
import com.kshl.huihuimall.console.service.account.enums.MenuResourceTypeEnum;
import com.kshl.security.authority.KSUrlGrantedAuthority;
import com.kshl.security.exception.AccountIsNotEnableException;
import com.kshl.security.model.KSMenuResourceModel;
import com.kshl.security.model.KSUserDetail;
import com.kshl.security.services.KSUserDetailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.*;

import static java.util.stream.Collectors.toList;


/**
 * Created by xufengfeng on 2017/5/16.
 */
@Service
public class KSUserDetailServiceImpl implements KSUserDetailService {

    private static final Logger logger = LoggerFactory.getLogger(KSUserDetailServiceImpl.class);

    @Value("${ks.security.menu.root}")
    private String menuRoot = "root";

    @Autowired
    private AccountDao accountDao;
    @Autowired
    private RoleDao roleDao;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {

        logger.info("[loadUserByUsername] username = {}", username);

        if (KSStringUtils.isEmpty(username)) {
            throw new UsernameNotFoundException("username is null");
        }

        KsAccount account = null;
        if (Constants.SYSTEM_ACCOUNT.equals(username)){
            account = accountDao.queryAccountByUserName(username);
            account.setMerchantCode(Constants.SYSTEM_ENTCODE);
        }else {
            account = accountDao.queryAccountByUserName(username);
        }
        if (account == null) {
            throw new UsernameNotFoundException("username is not exist");
        }
        if (account.getEnable().equals(Constants.ACCOUNT_STATUS.ACCOUNT_NOENABLE)){
            throw new AccountIsNotEnableException("account is not enable");
        }

        return buildUserDetail(account);

    }



    public KSMenuResourceModel getMenuResourceModelByRoleId(Integer roleId)
            throws IllegalArgumentException {
        logger.info("[getMenuResourceModelByRoleId] roleId = {}", roleId);

        if (roleId == null){
            throw new IllegalArgumentException(" roleId is null");
        }

        return buildMenuResourceModelByRoleId(roleId);
    }

    public KSMenuResourceModel getSystemMenuResourceModel()
            throws IllegalArgumentException {
        logger.info("[getSystemMenuResourceModel]");
        return buildSystemMenuResourceModel();
    }


    private KSUserDetail buildUserDetail(KsAccount account) {

        Set<String> resources = null;
        if(Constants.SYSTEM_ACCOUNT.equals(account.getLoginAccount())){
            resources = allResource();
        }else {
            resources = allResourceByAccountId(account.getId());
        }
        List<KSUrlGrantedAuthority> authorities = new ArrayList<>();
        for (String resource : resources){
            authorities.add(new KSUrlGrantedAuthority(resource));
        }

        KSUserDetail userDetail = new KSUserDetail(account.getLoginAccount(),
                account.getLoginPassword(),
                authorities);

        //菜单资源
        userDetail.setRootMenu(buildMenuResourceModelByAccountId(account.getId()));
        if(Constants.SYSTEM_ACCOUNT.equals(account.getLoginAccount()) && !Constants.SYSTEM_ENTCODE.equals(account.getMerchantCode()) ){
            int roleId = roleDao.getRoleIdByEntCode(account.getMerchantCode(),Constants.ACCOUNT_TYPE.BUSINESS_ACCOUNT);
            KSMenuResourceModel model = getMenuResourceModelByRoleId(roleId);
            userDetail.getRootMenu().getChildren().addAll(model.getChildren());
        }

        //企业代码
        userDetail.setEntCode(account.getMerchantCode());


        return userDetail;
    }

    private List<Integer> allResourceIdByAccountId(Integer accountId) {
        // 获取角色id
        List<KsAccountToRole> accountToRoles =  accountDao.queryAccountToRoleByAccountId(accountId);
        List<Integer> roleIds =  new ArrayList<>();
        for (KsAccountToRole accountToRole : accountToRoles) {
            roleIds.add(accountToRole.getRoleId());
        }

        // 获取资源id
        List<Integer> resourceIds = new ArrayList<>();
        if (!roleIds.isEmpty()) {
            List<KsRoleToResource> roleToResources = accountDao.queryRoleToResourceByRoleIds(roleIds);

            for (KsRoleToResource roleToResource : roleToResources) {
                resourceIds.add(roleToResource.getResourceId());
            }
        }

        return resourceIds;
    }


    private Set<String> allResourceByAccountId(Integer accountId) {

        Set<String> resources = new HashSet<>();

        List<Integer> resourceIds = allResourceIdByAccountId(accountId);

        // 活动所有资源
        if (!resourceIds.isEmpty()){

            List<KsMenuResource> menuResources = accountDao.queryMenuResourceByResourceIds(resourceIds);

            for (KsMenuResource menuResource : menuResources) {
                if (menuResource.getType() == MenuResourceTypeEnum.MENU_RESOURCE_TYPE_MENU.getType()) {
                    resources.add(menuResource.getResourceUrl());
                }
            }
        }

        return resources;

    }
    private Set<String> allResource() {
        Set<String> resources = new HashSet<>();
        // 活动所有资源
            List<KsMenuResource> menuResources = accountDao.queryAllMenuResource();
            for (KsMenuResource menuResource : menuResources) {
                if (menuResource.getType() == MenuResourceTypeEnum.MENU_RESOURCE_TYPE_MENU.getType()) {
                    resources.add(menuResource.getResourceUrl());
                }
            }
        return resources;
    }

    private KSMenuResourceModel buildSystemMenuResourceModel() {
        List<KsMenuResource> menuResources = accountDao.queryAllMenuResource();

        KSMenuResourceModel rootMenu = new KSMenuResourceModel();
        rootMenu  = getRoodMenuResource(menuResources);
        getChildrenResource(rootMenu, menuResources);

        return rootMenu;
    }

    private KSMenuResourceModel buildMenuResourceModelByRoleId(Integer roleId) {
        List<KsRoleToResource> roleToResources = accountDao.queryRoleToResourceByRoleId(roleId);
//        List<Integer> resourceIds = (List<Integer>) CollectionUtils.collect(roleToResources,
//                new BeanToPropertyValueTransformer("resourceId"));

        List<Integer> resourceIds = roleToResources.stream().map(KsRoleToResource::getResourceId).collect(toList());
        return buildMenuResourceModel(resourceIds);
    }

    private KSMenuResourceModel buildMenuResourceModelByAccountId(Integer accountId) {
        List<Integer> resourceIds = allResourceIdByAccountId(accountId);
        return buildMenuResourceModel(resourceIds);
    }

    private KSMenuResourceModel buildMenuResourceModel(List<Integer> resourceIds) {
        KSMenuResourceModel rootMenu = new KSMenuResourceModel();
        if (!resourceIds.isEmpty()){
            List<KsMenuResource> menuResources = accountDao.queryMenuResourceByResourceIds(resourceIds);

            rootMenu  = getRoodMenuResource(menuResources);
            getChildrenResource(rootMenu, menuResources);
        }


        return rootMenu;
    }


    private KSMenuResourceModel getRoodMenuResource(List<KsMenuResource> menuResources){
        KSMenuResourceModel menuResourceModel = null;
        for (KsMenuResource menuResource : menuResources){
            if (menuResource.getType() == MenuResourceTypeEnum.MENU_RESOURCE_TYPE_DIC.getType() &&
                    menuResource.getResourceUrl().equals(menuRoot)) {
                menuResourceModel = buildMenuResourceFromEntity(menuResource);
            }
        }

        return menuResourceModel;
    }

    // 效率低，下次改进
    private void getChildrenResource(KSMenuResourceModel pResource,
                                                          List<KsMenuResource> menuResources) {

        SortedSet<KSMenuResourceModel> children = new TreeSet<>(new Comparator<KSMenuResourceModel>() {
            @Override
            public int compare(KSMenuResourceModel o1, KSMenuResourceModel o2) {
                return o1.getOrder() - o2.getOrder();
            }
        });

        for (KsMenuResource menuResource : menuResources){
            if (menuResource.getParentId().equals(pResource.getId())){
                KSMenuResourceModel menuResourceModel = buildMenuResourceFromEntity(menuResource);
                children.add(menuResourceModel);

                // 文件夹
                if (menuResource.getType() == MenuResourceTypeEnum.MENU_RESOURCE_TYPE_DIC.getType()) {
                    getChildrenResource(menuResourceModel, menuResources);
                }
            }
        }

        if (children.size() > 0) {
            pResource.setChildren(new ArrayList<>(children));
        }
    }

    private KSMenuResourceModel buildMenuResourceFromEntity(KsMenuResource menuResource) {

        Assert.notNull(menuResource, "menuResource should not be null");

        KSMenuResourceModel menuResourceModel = new  KSMenuResourceModel();
        menuResourceModel.setId(menuResource.getId());
        menuResourceModel.setPid(menuResource.getParentId());
        menuResourceModel.setName(menuResource.getName());
        menuResourceModel.setOrder(menuResource.getOrderNo());
        menuResourceModel.setResourceUrl(menuResource.getResourceUrl());

        return menuResourceModel;
    }
}
