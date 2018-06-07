package com.kshl.huihuimall.console.service.merchant;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.console.controller.inventory.request.*;
import com.kshl.huihuimall.console.controller.merchant.request.MerchantMgRequest;
import com.kshl.huihuimall.console.controller.merchant.request.MerchantRequest;

public interface MerchantService {

    BasePageResponse queryMerchantReview(MerchantRequest request);

    BaseResponse passMerchantReview(MerchantRequest request);

    BaseResponse getMerchantReviewDetail(MerchantRequest request);

    BasePageResponse queryMerchantMg(MerchantMgRequest request);

    BaseResponse updateMerchant(Merchant request);

    BaseResponse closeMerchant(MerchantRequest request);

    BasePageResponse queryShelvesReviewMg(MerchantRequest request);

    BaseResponse productpassMerchantReview(Integer id);

    BaseResponse productunpassMerchantReview(Integer id);

    BaseResponse getProductReviewDetail(MerchantRequest request);

    int insert(Merchant record);

    int deleteByPrimaryKey(Integer id);

    Merchant selectByPrimaryKey(Integer id);

    int insertKsAccount(KsAccount record);
    int updateByPrimaryKeySelective(KsAccount record);
    int insertKsRole(KsRole record);
    int insertKsAccountToRole(KsAccountToRole record);
    int insertKsRoleToResource(KsRoleToResource record);

    KsRole queryRoleIdByEntcode(String entCode);
    KsAccount queryAccountIdByEntcode(String entCode);
    Merchant queryMerchantCode(Integer id);
    Merchant queryMerchantIdByentCode(String entCode);
    KsAccount getAccountCode(Integer id);
}
