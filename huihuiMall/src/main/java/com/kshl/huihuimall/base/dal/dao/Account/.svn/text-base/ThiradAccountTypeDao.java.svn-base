package com.kshl.huihuimall.base.dal.dao.Account;

import com.kshl.huihuimall.base.dal.entity.KsAccount;

import java.util.List;
import java.util.Map;

public interface ThiradAccountTypeDao {
    //查询第三方账户
    List<Map<String,Object>> queryThiradAccount(Integer pageSize, Integer pageNum, Integer enable, String merchantname,Integer isDeleted,Integer type);
    //查询第三方账户数量
    int queryThiradAccountCount(Integer enable, String merchantname,Integer isDeleted,Integer type);
    //第三方账号的启用禁用
    int updateThiradAccount(KsAccount ksAccount);



   /* List<ThiradAccountType> getThiradAccountType(Integer pageNum, Integer pageSize, Integer thirad_account, String thirad_name, Integer thirad_state);

    int addThiradAccountType(ThiradAccountType thiradAccountType);

    int deleteThiradAccount(Integer id);

    int updateThiradAccount(ThiradAccountType thiradAccountType);*/
}
