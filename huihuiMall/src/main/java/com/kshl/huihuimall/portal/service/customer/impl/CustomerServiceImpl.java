package com.kshl.huihuimall.portal.service.customer.impl;

import com.kshl.huihuimall.base.dal.entity.Customer;
import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.portal.dal.dao.CustomerDao;
import com.kshl.huihuimall.portal.service.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService{
    @Autowired
    private CustomerDao customerDao;

    @Override
    public Customer selectbyPhone(String phoneNumber) {
        Customer customer=customerDao.selectbyPhone(phoneNumber);
        return customer;
    }

    @Override
    public Customer selectbyOpenId(String openId) {
        Customer customer=customerDao.selectbyOpenId(openId);
        return customer;
    }

    @Override
    public int updateOpenid(Customer custome) {
        return customerDao.updateOpenid(custome);
    }

    @Override
    public Device getDevicecode(String deviceCode) {
        return customerDao.getDevicecode(deviceCode);
    }

    @Override
    public int insertPhone(Customer record) {
        return customerDao.insert(record);
    }

    @Override
    public int getCount(String phoneNumber) {
        return customerDao.selectCount(phoneNumber);
    }

    @Override
    public int updateByPrimaryKey(Customer customer) {
        return customerDao.updateByPrimaryKey(customer);
    }

    @Override
    public int updateCode(Customer customer) {
        return customerDao.updateCode(customer);
    }

}
