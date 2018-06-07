package com.kshl.huihuimall.console.dal.dao;

import com.kshl.huihuimall.base.dal.entity.Device;

import java.util.List;
import java.util.Map;

public interface DeviceDao {


    List<Map<String,Object>> getAllDevice(Integer pageSize, Integer pageNum, String deviceCode, String name, Integer bindingStatus);

    int getAllDeviceCount(String deviceCode, String name, Integer bindingStatus);

    int addDevice(Device device);

    Device findDeviceById(Integer id);

    int deleteDevice(Integer id);

    int updateDevice(Device device);
    //根据社备code查询社备
    Device getDeviceByCode(String deviceCode);
}
