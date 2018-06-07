package com.kshl.huihuimall.portal.dal.dao;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.Customer;
import com.kshl.huihuimall.base.dal.entity.Device;

import java.util.List;

public interface CustomerDao {
    Customer selectbyPhone(String phoneNumber);

    int selectCount(String phoneNumber);

    int insert(Customer record);

    int updateByPrimaryKey(Customer customer);

    int updateCode(Customer customer);

    Customer selectbyOpenId(String openId);

    int updateOpenid(Customer custome);

    Device getDevicecode(String deviceCode);
}
