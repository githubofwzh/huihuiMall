package com.kshl.huihuimall.portal.controller;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.console.controller.account.ShopKeeperController;
import com.kshl.huihuimall.console.controller.account.request.ShopKeeperRequest;
import com.kshl.huihuimall.console.service.account.ShopKeeperService;
import com.kshl.huihuimall.console.service.store.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@EnableAutoConfiguration
@RequestMapping("/Portalshopkeeper")

public class PortalController {
    private static final Logger logger = LoggerFactory.getLogger(ShopKeeperController.class);

    @Autowired
    private ShopKeeperService shopKeeperService;

    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/getOpenId", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse getOpenId(ShopKeeperRequest shopKeeperRequest) {
        logger.debug("queryAllShopKeeper start");
        BaseResponse baseResponse = new BaseResponse();
        Shopkeeper shopkeeper = shopKeeperService.getOpenId(shopKeeperRequest.getOpenId());
        if (shopkeeper != null) {
            baseResponse.setData(shopkeeper.getStoreId());
            baseResponse.setRetCode(Long.valueOf(0));
        } else {
            baseResponse.setRetCode(Long.valueOf(1));
            baseResponse.setData(shopKeeperRequest.getOpenId());
        }
        return baseResponse;
    }

    //申请门店更新反馈信息
    @RequestMapping(value = "/feedBackStore", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse feedBackStore(ShopKeeperRequest shopKeeperRequest) {
        logger.debug("feedBackStore start");
        BaseResponse baseResponse = new BaseResponse();
        Shopkeeper shopkeeper = shopKeeperService.getOpenId(shopKeeperRequest.getOpenId());
        if (shopkeeper != null) {
            Map<String,Object> hashMap = new HashMap<>();
            hashMap.put("shopkeeper",shopkeeper);
            Store store = storeService.getStorebyShopkeeperId(shopkeeper.getId());
            hashMap.put("store",store);
            baseResponse.setData(hashMap);
            baseResponse.setRetCode(Long.valueOf(0));
        } else {
            baseResponse.setData(shopKeeperRequest.getOpenId());
            baseResponse.setRetCode(Long.valueOf(1));
        }
        return baseResponse;
    }


    @RequestMapping(value = "/isExitStore", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse isExitStore(ShopKeeperRequest shopKeeperRequest) {
        logger.debug("queryAllShopKeeper start");
        BaseResponse baseResponse = new BaseResponse();
        Shopkeeper keeper = shopKeeperService.getphnoe(shopKeeperRequest.getPhoneNumber());
        if(keeper!=null){
            if(shopKeeperRequest.getNumber().equals(keeper.getIdentifyCode())){
                if(keeper.getExpiretime() >System.currentTimeMillis()){
                    Shopkeeper shopkeeper = shopKeeperService.getOpenId(shopKeeperRequest.getOpenId());
                    if(shopkeeper == null){
                        if (keeper != null) {
                            Store store = shopKeeperService.getAuditstatusBystore(keeper.getStoreId());
                            if(store !=null) {
                                keeper.setOpenId(shopKeeperRequest.getOpenId());
                                if(1 == store.getAuditStatus()){
                                    shopKeeperService.updateOpenId(keeper);
                                }
                                baseResponse.setRetCode(Long.valueOf(0));
                                baseResponse.setData(store);
                            }else{
                                baseResponse.setRetCode(Long.valueOf(1));
                                //门店为空删除手机号
                                shopKeeperService.deletePhone(shopKeeperRequest.getPhoneNumber());
                            }
                        }
                    }
                }else{
                    baseResponse.setRetCode(Long.valueOf(3));
                    baseResponse.setRetMsg("验证码超时");
                }
            }else{
                baseResponse.setRetCode(Long.valueOf(2));
                baseResponse.setRetMsg("验证码不正确");
            }

        }else{
            baseResponse.setRetCode(Long.valueOf(4));
            baseResponse.setRetMsg("请核对手机号");
        }

        return baseResponse;
    }


}
