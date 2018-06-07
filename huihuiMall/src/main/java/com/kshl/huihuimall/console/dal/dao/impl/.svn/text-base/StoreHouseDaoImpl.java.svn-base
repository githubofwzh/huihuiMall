package com.kshl.huihuimall.console.dal.dao.impl;

import com.github.pagehelper.PageHelper;
import com.kshl.base.common.utils.KSHLUtils;
import com.kshl.huihuimall.base.dal.entity.KsAccount;
import com.kshl.huihuimall.base.dal.entity.Storehouse;
import com.kshl.huihuimall.base.dal.entity.StorehouseExample;
import com.kshl.huihuimall.base.dal.manualmapper.KsAccountMMapper;
import com.kshl.huihuimall.base.dal.mapper.StorehouseMapper;
import com.kshl.huihuimall.console.controller.storehouse.model.StoreHouseExtends;
import com.kshl.huihuimall.console.dal.dao.StoreHouseDao;
import com.kshl.huihuimall.console.dal.manualmapper.KsAreaManuaMapper;
import com.kshl.huihuimall.console.dal.manualmapper.StoreHouseManuaMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class StoreHouseDaoImpl implements StoreHouseDao{
    
    @Autowired
    public StorehouseMapper storehouseMapper;
    
    @Autowired
    public StoreHouseManuaMapper storeHouseManuaMapper;
    
    @Autowired
    public KsAreaManuaMapper ksAreaManuaMapper;

    @Autowired
    public KsAccountMMapper ksAccountMMapper;

    @Override
    public List<Storehouse> getAllStoreHouse(Integer pageSize, Integer pageNum, Integer areaId,
            String storeHouseName) {
        if (pageNum != null && pageSize != null) {
            PageHelper.startPage(pageNum, pageSize);
        }
        StorehouseExample storehouseExample = new StorehouseExample();
        com.kshl.huihuimall.base.dal.entity.StorehouseExample.Criteria criteria = storehouseExample.createCriteria();
        if(areaId != null) {
            criteria.andAreaIdEqualTo(areaId);
        }
        if(KSHLUtils.isNotEmpty(storeHouseName)) {
            criteria.andStorehouseNameEqualTo(storeHouseName);
        }
        return storehouseMapper.selectByExample(storehouseExample);
    }

    @Override
    public int addStoreHouse(String storeHouseName, Integer areaId, String areaName, Double space, String address) {
        Storehouse record = new Storehouse();
        record.setStorehouseName(storeHouseName);
        record.setAreaId(areaId);
        record.setAreaName(areaName);
        record.setSpace(space);
        record.setAddress(address);
        return storehouseMapper.insertSelective(record);
    }

    @Override
    public int updateStoreHouse(Integer id, String storeHouseName, Integer areaId, String areaName, Double space, String address) {
        Storehouse storehouse = new Storehouse();
        storehouse.setId(id);
        storehouse.setStorehouseName(storeHouseName);
        storehouse.setAreaId(areaId);
        storehouse.setAreaName(areaName);
        storehouse.setSpace(space);
        storehouse.setAddress(address);
        return storehouseMapper.updateByPrimaryKeySelective(storehouse);
    }

    @Override
    public int deleteStoreHouse(Integer id) {
        return storehouseMapper.deleteByPrimaryKey(id);
    }
    
    @Override
    public List<Map<String, Object>> getAllLevelOneArea(){
        return ksAreaManuaMapper.getAllLevelOneArea();
    }

    @Override
    public StoreHouseExtends getStoreHouseById(Integer id) {
        Storehouse storehouse = storehouseMapper.selectByPrimaryKey(id);
        Integer managerId = storehouse.getManagerId();

        StoreHouseExtends storeHouseExtends = new StoreHouseExtends();
        BeanUtils.copyProperties(storehouse, storeHouseExtends);
        if(managerId != null && managerId > 0) {
            KsAccount ksAccount = ksAccountMMapper.getAccountById(managerId);
            storeHouseExtends.setManagerName(ksAccount.getName());
            storeHouseExtends.setPhone(ksAccount.getPhone());
        }
        return storeHouseExtends;
    }

    @Override
    public Storehouse getStoreHousebyManageId(Integer accountId) {
        return storeHouseManuaMapper.getStoreHousebyManageId(accountId);
    }

    @Override
    public List<Storehouse> getStorehouseList() {
        return storeHouseManuaMapper.getStorehouseList();
    }

    /**
     * 根据库房id查询库房
     * @param id
     * @return
     */
    @Override
    public Storehouse findStoreHouseById(Integer id) {
        return storeHouseManuaMapper.getStoreHousebyManageId(id);
    }

    /**
     * 更新库房管理员
     * @param house
     * @return
     */
    @Override
    public int updateManager(Storehouse house) {
        return storehouseMapper.updateByPrimaryKeySelective(house);
    }

}
