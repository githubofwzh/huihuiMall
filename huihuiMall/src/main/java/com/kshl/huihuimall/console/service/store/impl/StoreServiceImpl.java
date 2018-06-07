package com.kshl.huihuimall.console.service.store.impl;

        import com.kshl.base.response.BasePageResponse;
        import com.kshl.base.response.BaseResponse;
        import com.kshl.base.response.ResponseBuilder;
        import com.kshl.huihuimall.base.constants.Constants;
        import com.kshl.huihuimall.base.dal.entity.*;
        import com.kshl.huihuimall.console.base.pojo.StoreDetailPojo;
        import com.kshl.huihuimall.console.controller.store.request.StoreMgRequest;
        import com.kshl.huihuimall.console.controller.store.request.StoreRequest;
        import com.kshl.huihuimall.console.controller.store.request.UpdateStoreRequest;
        import com.kshl.huihuimall.console.dal.dao.StoreDao;
        import com.kshl.huihuimall.console.service.store.StoreService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;

        import java.util.List;
        import java.util.Map;

        import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
        import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreDao storeDao;


    @Override
    public BasePageResponse queryStoreCheck(StoreRequest request) {
        List<Map<String, Object>> result = storeDao.queryStoreCheck(request.getPageSize(), request.getPageNum(),
                request.getShopName(),request.getShopKeeper());

        int total = storeDao.queryStoreCheckCount(request.getShopName(),request.getShopKeeper());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);

        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    @Override
    public BaseResponse queryStoreDetail(StoreDetailPojo request) {

        BaseResponse response;
        StoreDetailPojo detail = storeDao.queryStoreDetail(request.getId());
        if (detail!=null) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            response.setData(detail);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse passCheckStatus(StoreRequest request) {

        BaseResponse response;
        Store store = new Store();
        store.setId(request.getStore_Id());
        store.setAuditStatus(Constants.COMPANY_AUDIT_STATUS.AUDIT_PASS);
        int update = storeDao.updateCheckStatus(store);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }


    @Override
    public BaseResponse unPassCheckStatus(StoreRequest request) {

        BaseResponse response;
        Store store = new Store();
        store.setId(request.getStore_Id());
        store.setAuditStatus(Constants.COMPANY_AUDIT_STATUS.AUDIT_NOTPASS);
        int update = storeDao.updateCheckStatus(store);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BasePageResponse queryStore(StoreMgRequest request) {
        List<Map<String, Object>> result = storeDao.queryStore(request.getPageSize(), request.getPageNum(),request.getDistrict(),request.getProvinceId(),request.getTown()
                ,request.getStreet(),request.getStoreName());

        int total = storeDao.queryStoreCount(request.getDistrict(),request.getProvinceId(),request.getTown()
                ,request.getStreet(),request.getStoreName());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);

        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    @Override
    public BaseResponse updateStore(UpdateStoreRequest request) {
        BaseResponse response;
        int update = storeDao.updateStore(request.getShopName(),request.getKeeperId(),request.getDeviceId(),request.getStorehouseId(),
                request.getAddress(),request.getRemark(),request.getTel());
        if (update > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse recommendClientList(Integer id) {
        BaseResponse response;
        List<String> client = storeDao.recommendClientList(id);
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        response.setData(client);
        return response;
    }

    @Override
    public BaseResponse storeprofit(Integer id) {
        BaseResponse response;
        List<StoreOrder> client = storeDao.storeprofit(id);
        if (client.size() > 0) {
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BasePageResponse querystoreprofit(StoreRequest request) {
        List<Map<String, Object>> result = storeDao.querystoreprofit(request.getPageSize(), request.getPageNum(),request.getShopName());

        int total = storeDao.querystoreprofitCount(request.getShopName());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);

        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (request.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (request.getPageSize() * request.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / request.getPageSize();
        pageResponse.setPages(total % request.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    @Override
    public int updateCheckStatus(Integer id) {
        return storeDao.updateCheckStatus(id);
    }

    @Override
    public int updateStatusPass(Integer id,Integer shopkeeperid) {
        return storeDao.updateStatusPass(id,shopkeeperid);
    }

    @Override
    public int updateshopStart(Integer id) {
        return storeDao.updateshopStart(id);
    }

    @Override
    public int storeOpen(Integer id) {
        return storeDao.storeOpen(id);
    }

    @Override
    public int storeOff(Integer id) {
        return storeDao.storeOff(id);
    }

    @Override
    public int shopkeepOpen(Integer id) {
        return storeDao.shopkeepOpen(id);
    }

    @Override
    public int shopkeepOff(Integer id) {
        return storeDao.shopkeepOff(id);
    }

    @Override
    public Shopkeeper selectshopkeeperID(Integer id) {
        return storeDao.selectshopkeeperID(id);
    }

    @Override
    public int updateStorebyid(Store store) {
        return storeDao.updateStorebyid(store);
    }

    @Override
    public List<Storehouse> selectStroehouse() {
        return storeDao.selectStroehouse();
    }

    @Override
    public List<Map<String, Object>> getStoreDetail(Store store) {
        return storeDao.getStoreDetail(store.getId());
    }

    @Override
    public List<Map<String, Object>> getStoreMgDetail(Store store) {
        return storeDao.getStoreMgDetail(store.getId());
    }

    @Override
    public Store getStorebyShopkeeperId(Integer shopkeeperId) {
        return storeDao.getStorebyShopkeeperId(shopkeeperId);
    }

}
