package com.kshl.huihuimall.console.dal.dao.impl;


import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.dal.manualmapper.ProductManualMapper;
import com.kshl.huihuimall.base.dal.mapper.*;
import com.kshl.huihuimall.console.dal.dao.MerchantDao;
import com.kshl.huihuimall.console.dal.manualmapper.MerchantManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MerchantDaoImpl implements MerchantDao {
    @Autowired
    private MerchantMapper merchantMapper;
    @Autowired
    private MerchantManualMapper merchantManualMapper;
    @Autowired
    private KsAccountMapper ksAccountMapper;
    @Autowired
    private KsRoleToResourceMapper ksRoleToResourceMapper;
    @Autowired
    private KsRoleMapper ksRoleMapper;
    @Autowired
    private KsAccountToRoleMapper ksAccountToRoleMapper;

    @Override
    public int updateReviewStatus(Merchant merchant) {
        return  merchantManualMapper.updateReviewStatus(merchant);
    }

    @Override
    public List<Map<String, Object>> queryMerchantReview(Integer pageSize, Integer pageNum, String name) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }
        return merchantManualMapper.queryMerchantReview(map);
    }

    @Override
    public int queryMerchantReviewCount(String name) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }
        return merchantManualMapper.queryMerchantReviewCount(map);

    }

    @Override
    public Merchant getMerchantReviewDetail(Merchant merchant) {
        return merchantMapper.selectByPrimaryKey(merchant.getId());
    }

    @Override
    public List<Map<String, Object>> queryMerchantMg(Integer pageSize, Integer pageNum, Integer accountId,Integer provinceId, Integer district, Integer town, Integer street, String name) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(provinceId!=null){
            map.put("provinceId",provinceId);
        }
        if(district!=null){
            map.put("district",district);
        }
        if(town!=null){
            map.put("town",town);
        }
        if(street!=null){
            map.put("street",street);
        }
        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }
        if(!KSStringUtils.isEmpty(accountId)){
            map.put("accountId", accountId);
        }
        return merchantManualMapper.queryMerchantMg(map);

    }

    @Override
    public int queryMerchantMgCount(Integer provinceId, Integer district, Integer town, Integer street, String name,Integer accountId) {
        Map<String, Object> map = new HashMap<>();
        if(provinceId!=null){
            map.put("provinceId",provinceId);
        }
        if(district!=null){
            map.put("district",district);
        }
        if(town!=null){
            map.put("town",town);
        }
        if(street!=null){
            map.put("street",street);
        }
        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }
        if(!KSStringUtils.isEmpty(accountId)){
            map.put("accountId", accountId);
        }
        return merchantManualMapper.queryMerchantMgCount(map);
    }

    @Override
    public int updateMerchant(Merchant record) {
        return merchantMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insert(Merchant record) {
        return merchantMapper.insert(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return merchantMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Merchant selectByPrimaryKey(Integer id) {
        return merchantMapper.selectByPrimaryKey(id);
    }


    @Override
    public int closeMerchant(Merchant merchant) {
        Map<String, Object> map = new HashMap<>();
        if(merchant.getId()!=null){
            map.put("id",merchant.getId());
        }
        if(merchant.getEnableStatus()!=null){
            map.put("enableStatus",merchant.getEnableStatus());
        }
        return merchantManualMapper.closeMerchant(map);
    }

    @Override
    public int insert(KsAccount record) {
        return ksAccountMapper.insert(record);
    }

    @Override
    public int updateByPrimaryKeySelective(KsAccount record) {
        return ksAccountMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insert(KsRole record) {
        return ksRoleMapper.insert(record);
    }

    @Override
    public int insert(KsAccountToRole record) {
        return ksAccountToRoleMapper.insert(record);
    }

    @Override
    public int insert(KsRoleToResource record) {
        return ksRoleToResourceMapper.insert(record);
    }

    @Override
    public KsRole queryRoleIdByEntcode(String entCode) {
        return merchantManualMapper.queryRoleIdByEntcode(entCode);
    }

    @Override
    public KsAccount queryAccountIdByEntcode(String entCode) {
        return merchantManualMapper.queryAccountIdByEntcode(entCode);
    }

    @Override
    public Merchant queryMerchantCode(Integer id) {
        return merchantManualMapper.queryMerchantCode(id);
    }

    @Override
    public Merchant queryMerchantIdByentCode(String entCode) {
        return merchantManualMapper.queryMerchantIdByentCode(entCode);
    }

    @Override
    public KsAccount getAccountCode(Integer id) {
        return merchantManualMapper.getAccountCode(id);
    }


}
