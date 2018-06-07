package com.kshl.huihuimall.console.service.account.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.base.dal.mapper.ShopkeeperMapper;
import com.kshl.huihuimall.console.controller.account.request.ShopKeeperRequest;
import com.kshl.huihuimall.console.dal.dao.ShopKeeperDao;
import com.kshl.huihuimall.console.service.account.ShopKeeperService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class ShopKeeperServiceImpl implements ShopKeeperService {


    @Autowired
    private ShopKeeperDao shopKeeperDao;
    @Autowired
    private ShopkeeperMapper shopkeeperMapper;


    /**
     * 分页查询店主账户
     * @param shopKeeperRequest
     * @return
     */
    @Override
    public BasePageResponse queryAllShopKeeper(ShopKeeperRequest shopKeeperRequest) {
        List<Map<String, Object>> result = shopKeeperDao.getAllShopKeeper(shopKeeperRequest.getPageSize(), shopKeeperRequest.getPageNum(),shopKeeperRequest.getStoreName(),shopKeeperRequest.getStatus());
        int total = shopKeeperDao.getAllShopKeeperCount(shopKeeperRequest.getStoreName(),shopKeeperRequest.getStatus());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (shopKeeperRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (shopKeeperRequest.getPageSize() * shopKeeperRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / shopKeeperRequest.getPageSize();
        pageResponse.setPages(total % shopKeeperRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    /**
     * 店主账户的启用禁用
     * @param shopKeeperRequest
     * @return
     */
    @Override
    public BaseResponse updateShopKeeper(ShopKeeperRequest shopKeeperRequest) {
        BaseResponse response;
        Shopkeeper shopkeeper = new Shopkeeper();
        BeanUtils.copyProperties(shopKeeperRequest, shopkeeper);
        int update = shopKeeperDao.updateShopKeeper(shopkeeper);
        if (update > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public Shopkeeper getOpenId(String openId) {
        return shopKeeperDao.getOpenId(openId);
    }

    @Override
    public Store getAuditstatusBystore(Integer storeId) {
        return shopKeeperDao.getAuditstatusBystore(storeId);
    }

    @Override
    public int updateOpenId(Shopkeeper shopkeeper) {
        return shopkeeperMapper.updateByPrimaryKeySelective(shopkeeper);
    }

    @Override
    public Shopkeeper getphnoe(String phoneNumber) {
        return shopKeeperDao.getphnoe(phoneNumber);
    }

    @Override
    public int insertPhone(Shopkeeper keeper) {
        return shopkeeperMapper.insertSelective(keeper);
    }

    @Override
    public int deletePhone(String phoneNumber) {
        return shopKeeperDao.deletePhone(phoneNumber);
    }

}
