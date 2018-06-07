package com.kshl.huihuimall.console.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.base.dal.mapper.DeviceMapper;
import com.kshl.huihuimall.console.dal.dao.DeviceDao;
import com.kshl.huihuimall.console.dal.manualmapper.DeviceManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class DeviceDaoImpl implements DeviceDao {


    @Autowired
    private DeviceManualMapper deviceManualMapper;

    @Autowired
    private DeviceMapper deviceMapper;

    @Override
    public List<Map<String, Object>> getAllDevice(Integer pageSize, Integer pageNum, String deviceCode, String name, Integer bindingStatus) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(deviceCode)){
            map.put("deviceCode", deviceCode);
        }

        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }
        if (bindingStatus!=null){
            map.put("bindingStatus", bindingStatus);
        }

        return deviceManualMapper.getAllDevice(map);

    }

    @Override
    public int getAllDeviceCount(String deviceCode, String name, Integer bindingStatus) {
        Map<String, Object> map = new HashMap<>();

        if(!KSStringUtils.isEmpty(deviceCode)){
            map.put("deviceCode", deviceCode);
        }

        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }
        if (bindingStatus!=null){
            map.put("bindingStatus", bindingStatus);
        }

        return deviceManualMapper.getAllDeviceCount(map);

    }

    @Override
    public int addDevice(Device device) {
        return deviceMapper.insertSelective(device);
    }


    @Override
    public Device findDeviceById(Integer id) {
        return deviceMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteDevice(Integer id) {
        return deviceMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateDevice(Device device) {
        return deviceMapper.updateByPrimaryKey(device);
    }

    @Override
    public Device getDeviceByCode(String deviceCode) {
        return deviceManualMapper.getDeviceByCode(deviceCode);
    }
}
