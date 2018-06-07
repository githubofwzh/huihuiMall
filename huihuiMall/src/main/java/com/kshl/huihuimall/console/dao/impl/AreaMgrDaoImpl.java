package com.kshl.huihuimall.console.dao.impl;

import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.KsAreaExample;
import com.kshl.huihuimall.console.dao.AreaMgrDao;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 40513 on 2018/2/7.
 */
@Repository
public class AreaMgrDaoImpl implements AreaMgrDao {

    @Override
    public List<KsArea> getAllCities() {
        KsAreaExample ksAreaExample = new KsAreaExample();
        ksAreaExample.createCriteria().andLevelEqualTo(Short.valueOf("1"));
        return null;
    }
}
