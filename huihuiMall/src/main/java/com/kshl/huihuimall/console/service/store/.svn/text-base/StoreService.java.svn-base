package com.kshl.huihuimall.console.service.store;
import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.Shopkeeper;
import com.kshl.huihuimall.base.dal.entity.Store;
import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.console.base.pojo.StoreDetailPojo;
import com.kshl.huihuimall.console.controller.store.request.StoreMgRequest;
import com.kshl.huihuimall.console.controller.store.request.StoreRequest;
import com.kshl.huihuimall.console.controller.store.request.UpdateStoreRequest;

import java.util.List;
import java.util.Map;

/**
 * 订单表service接口
 */
public interface StoreService {

    BasePageResponse queryStoreCheck(StoreRequest request);

    BaseResponse queryStoreDetail(StoreDetailPojo request);

    BasePageResponse queryStore(StoreMgRequest request);

    BaseResponse updateStore(UpdateStoreRequest request);

    BaseResponse recommendClientList(Integer id);

    BaseResponse storeprofit(Integer id);

    BasePageResponse querystoreprofit(StoreRequest request);

    BaseResponse unPassCheckStatus(StoreRequest request);

    BaseResponse passCheckStatus(StoreRequest request);

    int updateCheckStatus(Integer id);

    int updateStatusPass(Integer id,Integer shopkeeperid);

    int updateshopStart(Integer id);

    int storeOpen(Integer id);
    int storeOff(Integer id);
    int shopkeepOpen(Integer id);
    int shopkeepOff(Integer id);

    Shopkeeper selectshopkeeperID(Integer shopkeeperId);

    int updateStorebyid(Store store);
    List<Storehouse> selectStroehouse();
    List<Map<String, Object>> getStoreDetail(Store store);
    List<Map<String, Object>> getStoreMgDetail(Store store);

    Store getStorebyShopkeeperId(Integer id);
}
