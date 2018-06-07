package com.kshl.huihuimall.portal.dal.dao.impl;

import com.kshl.huihuimall.base.dal.entity.Customer;
import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.base.dal.mapper.CustomerMapper;
import com.kshl.huihuimall.portal.dal.dao.CustomerDao;
import com.kshl.huihuimall.portal.dal.manualmapper.CustomerManuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    private CustomerManuMapper customerMapper;
    @Autowired
    private CustomerMapper Mapper;

    @Override
    public Customer selectbyPhone(String phoneNumber) {
        return customerMapper.selectbyPhone(phoneNumber);
    }

    @Override
    public int selectCount(String phoneNumber) {
        return customerMapper.selectCount(phoneNumber);
    }

    @Override
    public int insert(Customer record) {
        return Mapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKey(Customer customer) {
        return customerMapper.updateByPrimaryKey(customer);
    }

    @Override
    public int updateCode(Customer customer) {
        return customerMapper.updateCode(customer);
    }

    @Override
    public Customer selectbyOpenId(String openId) {
        return customerMapper.selectByOpenId(openId);
    }

    @Override
    public int updateOpenid(Customer custome) {
        return customerMapper.updateByPrimaryKeySelective(custome);
    }

    @Override
    public Device getDevicecode(String deviceCode) {
        return customerMapper.getDevicecode(deviceCode);
    }
}
