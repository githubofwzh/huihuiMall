package com.kshl.huihuimall.console.service.account;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.console.controller.account.request.ShopKeeperRequest;

/**
 * 店主账户service接口
 */
public interface ShopKeeperService {

    BasePageResponse queryAllShopKeeper(ShopKeeperRequest shopKeeperRequest);
    //店主账户启用禁用
    BaseResponse updateShopKeeper(ShopKeeperRequest shopKeeperRequest);

    Shopkeeper getOpenId(String openId);

    Store getAuditstatusBystore(Integer storeId);

    int updateOpenId(Shopkeeper shopkeeper);

    Shopkeeper getphnoe(String phoneNumber);

    int insertPhone(Shopkeeper keeper);

    int deletePhone(String phoneNumber);

}
