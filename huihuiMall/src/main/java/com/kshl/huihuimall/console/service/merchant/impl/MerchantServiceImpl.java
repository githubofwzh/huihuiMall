package com.kshl.huihuimall.console.service.merchant.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.dao.Account.AccountDao;
import com.kshl.huihuimall.base.dal.dao.ProductDao;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.base.pojo.ProductDetailPojo;
import com.kshl.huihuimall.console.controller.merchant.request.MerchantMgRequest;
import com.kshl.huihuimall.console.controller.merchant.request.MerchantRequest;
import com.kshl.huihuimall.console.dal.dao.MerchantDao;
import com.kshl.huihuimall.console.service.merchant.MerchantService;
import com.kshl.security.authentication.KSPasswordEncoder;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class MerchantServiceImpl implements MerchantService{


    @Autowired
    private MerchantDao merchantDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private KSPasswordEncoder passwordEncoder;

    @Override
    public BasePageResponse queryMerchantReview(MerchantRequest request) {
        List<Map<String, Object>> result = merchantDao.queryMerchantReview(request.getPageSize(), request.getPageNum(),
                request.getName());
        int total = merchantDao.queryMerchantReviewCount(request.getName());
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
    public BaseResponse passMerchantReview(MerchantRequest request) {
        BaseResponse response;
            Merchant merchant = new Merchant();
            merchant.setId(request.getId());
            merchant.setAuditStatus(request.getAuditStatus());
            int update = merchantDao.updateReviewStatus(merchant);
            if(update > 0){
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
            }else{
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }

        return response;
    }


    @Override
    public BaseResponse getMerchantReviewDetail(MerchantRequest request) {
        BaseResponse response;
        Merchant merchant = new Merchant();
        merchant.setId(request.getId());
        Merchant getList = merchantDao.getMerchantReviewDetail(merchant);
        if(getList!=null){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        response.setData(getList);
        return response;
    }

    @Override
    public BasePageResponse queryMerchantMg(MerchantMgRequest request) {
        List<Map<String, Object>> result = merchantDao.queryMerchantMg(request.getPageSize(), request.getPageNum(),request.getAccountId(),
                request.getProvinceId(),request.getDistrict(),request.getTown(),request.getStreet(),
                request.getName());
        int total = merchantDao.queryMerchantMgCount(request.getProvinceId(),request.getDistrict(),request.getTown(),request.getStreet(),
                request.getName(),request.getAccountId());
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
    public BaseResponse updateMerchant(Merchant request) {
        BaseResponse response;
        Merchant record = new Merchant();
        BeanUtils.copyProperties(request, record);
        int update = merchantDao.updateMerchant(record);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse closeMerchant(MerchantRequest request) {
        BaseResponse response;
            Merchant merchant = new Merchant();
            merchant.setId(request.getId());
            merchant.setEnableStatus(request.getEnableStatus());
            int update = merchantDao.closeMerchant(merchant);
            if(update > 0){
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
            }else{
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        return response;
    }

    @Override
    public BasePageResponse queryShelvesReviewMg(MerchantRequest request) {
        List<Map<String, Object>> result = productDao.queryShelvesReviewMg(request.getPageSize(), request.getPageNum(),
                request.getName());
        int total = productDao.queryShelvesReviewMgCount(request.getName());
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
    public BaseResponse productpassMerchantReview(Integer id) {
        BaseResponse response;
        Product product=new Product();
        product.setId(id);
        product.setShelvesStatus(Constants.SHELVES_STATUS_TYPE.ON_THE_SHELF);
        int update = productDao.productMerchantReview(product);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse productunpassMerchantReview(Integer id) {
        BaseResponse response;
        Product product=new Product();
        product.setId(id);
        product.setShelvesStatus(Constants.SHELVES_STATUS_TYPE.ON_THE_SHELF);
        int update = productDao.productMerchantReview(product);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse getProductReviewDetail(MerchantRequest request) {
        BaseResponse response;
        ProductDetailPojo detail = productDao.getProductReviewDetail(request.getProductid());
        if(detail!=null){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public int insert(Merchant record) {
        return merchantDao.insert(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return merchantDao.deleteByPrimaryKey(id);
    }

    @Override
    public Merchant selectByPrimaryKey(Integer id) {
        return merchantDao.selectByPrimaryKey(id);
    }

    @Override
    public int insertKsAccount(KsAccount record) {
        return merchantDao.insert(record);

    }

    @Override
    public int updateByPrimaryKeySelective(KsAccount record) {
        return merchantDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insertKsRole(KsRole record) {
        return merchantDao.insert(record);
    }

    @Override
    public int insertKsAccountToRole(KsAccountToRole record) {
        return merchantDao.insert(record);
    }

    @Override
    public int insertKsRoleToResource(KsRoleToResource record) {
        return merchantDao.insert(record);
    }

    @Override
    public KsRole queryRoleIdByEntcode(String entCode) {
        return merchantDao.queryRoleIdByEntcode(entCode);
    }

    @Override
    public KsAccount queryAccountIdByEntcode(String entCode) {
        return merchantDao.queryAccountIdByEntcode(entCode);
    }

    @Override
    public Merchant queryMerchantCode(Integer id) {
        return merchantDao.queryMerchantCode(id);
    }

    @Override
    public Merchant queryMerchantIdByentCode(String entCode) {
        return merchantDao.queryMerchantIdByentCode(entCode);
    }

    @Override
    public KsAccount getAccountCode(Integer id) {
        return merchantDao.getAccountCode(id);
    }
}
