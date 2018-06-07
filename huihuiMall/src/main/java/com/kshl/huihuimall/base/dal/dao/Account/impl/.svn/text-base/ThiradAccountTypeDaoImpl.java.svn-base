package com.kshl.huihuimall.base.dal.dao.Account.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.dao.Account.ThiradAccountTypeDao;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.manualmapper.KsAccountManualMapper;
import com.kshl.huihuimall.base.dal.mapper.KsAccountMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ThiradAccountTypeDaoImpl implements ThiradAccountTypeDao {


    private static final Logger logger = LoggerFactory.getLogger(ThiradAccountTypeDaoImpl.class);

    @Autowired
    KsAccountManualMapper ksAccountManualMapper;

    @Autowired
    KsAccountMapper ksAccountMapper;

    /**
     * 分页查询第三方账户
     * @param pageSize
     * @param pageNum
     * @param enable
     * @param merchantname
     * @return
     */
    @Override
    public List<Map<String, Object>> queryThiradAccount(Integer pageSize, Integer pageNum, Integer enable, String merchantname,Integer isDeleted,Integer type) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(merchantname)){
            map.put("merchantname", merchantname);
        }
        if(enable!=null){
            map.put("enable", enable);
        }
        if(isDeleted!=null){
            map.put("isDeleted", isDeleted);
        }
        if(type!=null){
            map.put("type", type);
        }

        return ksAccountManualMapper.queryThiradAccount(map);
    }

    /**
     * 查询第三方账户数量
     * @param enable
     * @param merchantname
     * @return
     */
    @Override
    public int queryThiradAccountCount(Integer enable, String merchantname,Integer isDeleted,Integer type) {
        Map<String, Object> map = new HashMap<>();

        if(!KSStringUtils.isEmpty(merchantname)){
            map.put("merchantname", merchantname);
        }
        if(enable!=null){
            map.put("enable", enable);
        }
        if(isDeleted!=null){
            map.put("isDeleted", isDeleted);
        }
        if(type!=null){
            map.put("type", type);
        }

        return ksAccountManualMapper.queryThiradAccountCount(map);
    }

    /**
     * 第三方账号的启用禁用
     * @param ksAccount
     * @return
     */
    @Override
    public int updateThiradAccount(KsAccount ksAccount) {
        return ksAccountMapper.updateByPrimaryKeySelective(ksAccount);
    }

   /* @Override
    public List<ThiradAccountType> getThiradAccountType(Integer pageNum, Integer pageSize, Integer thirad_account, String thirad_name, Integer thirad_state) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        ThiradAccountTypeExample thiradAccountTypeExample = new ThiradAccountTypeExample();
        if (thirad_account != null && !thirad_account.equals("")){
           thiradAccountTypeExample.createCriteria().andThiradAccountEqualTo(thirad_account);
        }
        if (thirad_name != null && !thirad_name.equals("")){
            thiradAccountTypeExample.createCriteria().andThiradNameLike("%" + thirad_name + "%");
        }
        if (thirad_state !=null && !thirad_state.equals("")){
            thiradAccountTypeExample.createCriteria().andThiradStateEqualTo(thirad_state);
        }
        List<ThiradAccountType> thiradAccountTypes = thiradAccountTypeMapper.selectByExample(thiradAccountTypeExample);
        return thiradAccountTypes;

    }

    @Override
    public int addThiradAccountType(ThiradAccountType thiradAccountType) {
        return thiradAccountTypeMapper.insert(thiradAccountType);
    }

    @Override
    public int deleteThiradAccount(Integer id) {
        return thiradAccountTypeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateThiradAccount(ThiradAccountType thiradAccountType) {
        return thiradAccountTypeMapper.updateByPrimaryKeySelective(thiradAccountType);
    }*/
}
