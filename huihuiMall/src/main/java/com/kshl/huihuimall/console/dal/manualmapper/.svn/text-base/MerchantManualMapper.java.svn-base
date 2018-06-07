package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.KsRole;
import com.kshl.huihuimall.base.dal.entity.Merchant;

import java.util.List;
import java.util.Map;

/**
 * 商家
 */

public interface MerchantManualMapper {

    Merchant queryMerchantCode(Integer id);

    Merchant queryMerchantIdByentCode(String entCode);

    int updateReviewStatus(Merchant merchant);

    List<Map<String,Object>> queryMerchantReview(Map<String, Object> map);

    int queryMerchantReviewCount(Map<String, Object> map);

    int queryMerchantMgCount(Map<String, Object> map);

    List<Map<String,Object>> queryMerchantMg(Map<String, Object> map);

    int closeMerchant(Map<String, Object> map);

    List<Map<String,Object>> queryShelvesReviewMg(Map<String, Object> map);

    int queryShelvesReviewMgCount(Map<String, Object> map);

    Merchant getProductReviewDetail(Map<String, Object> map);

    KsRole queryRoleIdByEntcode(String entCode);

    KsAccount queryAccountIdByEntcode(String entCode);

    KsAccount getAccountCode(Integer id);
}

