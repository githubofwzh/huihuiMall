package com.kshl.huihuimall.portal.service.frontstore;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.console.controller.account.request.ShopKeeperRequest;
import com.kshl.huihuimall.console.controller.device.request.DeviceRequest;
import com.kshl.huihuimall.console.controller.order.request.OrderRequest;
import com.kshl.huihuimall.portal.controller.request.StoreApplyRequest;

import javax.servlet.http.HttpServletRequest;

/**
 * 前台门店service接口
 */
public interface FrontStoreService {

    BaseResponse getFrontStoreDetail(Integer id);

    BaseResponse updateDevice(DeviceRequest deviceRequest);

    Boolean isDevice(String deviceCode);

    BasePageResponse queryAllRecord(OrderRequest orderRequest);
    //开店申请接口
    BaseResponse addStoreApply(StoreApplyRequest storeApplyRequest, HttpServletRequest request);
   //通过账户得门店id
    BaseResponse getStoreId(ShopKeeperRequest shopKeeperRequest);
}
