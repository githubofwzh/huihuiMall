package com.kshl.huihuimall.console.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.console.dal.dao.ColCustomerDao;
import com.kshl.huihuimall.console.dal.manualmapper.CustomerManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ColCustomerDaoImpl implements ColCustomerDao {


    @Autowired
    private CustomerManualMapper customerManualMapper;


    @Override
    public List<Map<String, Object>> getAllCustomer(Integer pageSize, Integer pageNum, String phoneNumber) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(phoneNumber)){
            map.put("phoneNumber", phoneNumber);
        }
        return customerManualMapper.getAllCustomer(map);
    }

    @Override
    public int getAllCustomerCount(String phoneNumber) {
        Map<String, Object> map = new HashMap<>();
        if(!KSStringUtils.isEmpty(phoneNumber)){
            map.put("phoneNumber", phoneNumber);
        }

        return customerManualMapper.getAllCustomerCount(map);
    }



}
