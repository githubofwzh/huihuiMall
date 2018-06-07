package com.kshl.huihuimall.portal.dal.dao.impl;

import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.KsAreaExample;
import com.kshl.huihuimall.portal.controller.request.KsAreaDetailRequest;
import com.kshl.huihuimall.portal.dal.dao.KsAreaDetailDao;
import com.kshl.huihuimall.portal.dal.manualmapper.KsAreaDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class KsAreaDetailDaoImpl  implements KsAreaDetailDao{


    @Autowired
    private KsAreaDetailMapper ksAreaDetailMapper;

    @Override
    public List<KsArea> SelectProvince(KsAreaExample ksAreaExample) {

        return ksAreaDetailMapper.getProvince(null);
    }

    @Override
    public  List<Map<String,Object>> SelectCity(Integer prId) {
        Map<String, Object> map = new HashMap<>();
        map.put("prId",prId);
        return ksAreaDetailMapper.getCity(map);
    }

    @Override
    public  List<Map<String,Object>> SelectRaion(Integer prId, Integer ciId) {
        Map<String, Object> map = new HashMap<>();
        map.put("prId",prId);
        map.put("ciId",ciId);
        return ksAreaDetailMapper.getRaion(map);
    }


    public  List<Map<String,Object>> SelectStreet(Integer prId, Integer ciId,Integer raId) {
        Map<String, Object> map = new HashMap<>();
        map.put("prId",prId);
        map.put("ciId",ciId);
        map.put("raId",raId);
        return ksAreaDetailMapper.getStreet(map);
    }

    @Override
    public  List<Map<String,Object>> SelectStore(Integer prId, Integer ciId,Integer raId,Integer stId) {
        Map<String, Object> map = new HashMap<>();
        map.put("prId",prId);
        map.put("ciId",ciId);
        map.put("raId",raId);
        map.put("stId",stId);
        return ksAreaDetailMapper.getStore(map);
    }
}
