package com.kshl.huihuimall.portal.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.Customer;
import com.kshl.huihuimall.base.dal.entity.Device;

public interface CustomerManuMapper {

    Customer selectbyPhone(String phoneNumber);

    int selectCount(String phoneNumber);

    int insert(Customer record);

    int updateByPrimaryKey(Customer customer);

    int updateByPrimaryKeySelective(Customer customer);

    int updateCode(Customer customer);

    Customer selectByOpenId(String openId);

    Device getDevicecode(String deviceCode);
}
