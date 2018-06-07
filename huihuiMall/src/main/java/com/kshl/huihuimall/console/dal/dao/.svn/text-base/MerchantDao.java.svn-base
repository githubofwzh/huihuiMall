package com.kshl.huihuimall.console.dal.dao;

import com.kshl.huihuimall.base.dal.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MerchantDao {


    int updateReviewStatus(Merchant merchant);

    List<Map<String,Object>> queryMerchantReview(Integer pageSize, Integer pageNum, String name);

    int queryMerchantReviewCount(String name);

    Merchant getMerchantReviewDetail(Merchant merchant);

    List<Map<String,Object>> queryMerchantMg(Integer pageSize, Integer pageNum, Integer accountId,Integer provinceId, Integer district, Integer town, Integer street, String name);

    int queryMerchantMgCount(Integer provinceId, Integer district, Integer town, Integer street, String name,Integer accountId);

    int updateMerchant(Merchant record);

    int insert(Merchant record);

    int deleteByPrimaryKey(Integer id);

    Merchant selectByPrimaryKey(Integer id);

    int closeMerchant(Merchant merchant);

    //添加用户
    int insert(KsAccount record);
    int updateByPrimaryKeySelective(KsAccount record);
    int insert(KsRole record);
    int insert(KsAccountToRole record);
    int insert(KsRoleToResource record);

    KsRole queryRoleIdByEntcode(String entCode);
    KsAccount queryAccountIdByEntcode(String entCode);
    Merchant queryMerchantCode(Integer id);
    Merchant queryMerchantIdByentCode(String entCode);
    KsAccount getAccountCode(Integer id);
}
