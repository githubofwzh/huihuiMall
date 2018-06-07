package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.Device;

import java.util.List;
import java.util.Map;

/**
 * 社备管理
 */

public interface DeviceManualMapper {


    List<Map<String,Object>> getAllDevice(Map<String, Object> map);

    int getAllDeviceCount(Map<String, Object> map);

    Device getDeviceByCode(String deviceCode);
}
