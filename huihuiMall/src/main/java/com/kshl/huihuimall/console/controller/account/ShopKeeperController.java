package com.kshl.huihuimall.console.controller.account;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.Customer;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.console.controller.account.request.ShopKeeperRequest;
import com.kshl.huihuimall.console.controller.account.request.ThiradAccountTypeRequest;
import com.kshl.huihuimall.console.service.account.ShopKeeperService;
import com.kshl.huihuimall.portal.service.customer.CustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;

/**
 * 店主账户Controller
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/shopkeeper")
public class ShopKeeperController {

    private static final Logger logger = LoggerFactory.getLogger(ShopKeeperController.class);

    @Autowired
    private ShopKeeperService shopKeeperService;
    @Autowired
    private CustomerService customerService;

    /**
     * 分页查询店主账户
     * @param shopKeeperRequest
     * @return
     */
    @RequestMapping(value = "/queryAllShopKeeper", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BasePageResponse queryAllShopKeeper(ShopKeeperRequest shopKeeperRequest) {
        logger.debug("queryAllShopKeeper start");
        return shopKeeperService.queryAllShopKeeper(shopKeeperRequest);
    }

    /**
     * 店主账户启用禁用
     * @param shopKeeperRequest
     * @return
     */
    @RequestMapping(value = "/updateShopKeeper", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public BaseResponse updateShopKeeper(ShopKeeperRequest shopKeeperRequest) {
        logger.debug("updateShopKeeper start");
        BaseResponse response;
        if (shopKeeperRequest.getId() == null) {
            logger.warn("[ShopKeeperRequest] param error id can not be null");
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        } else {
            response = shopKeeperService.updateShopKeeper(shopKeeperRequest);
        }
        return response;
    }

}
