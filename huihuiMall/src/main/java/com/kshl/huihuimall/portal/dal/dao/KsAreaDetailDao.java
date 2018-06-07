package com.kshl.huihuimall.portal.dal.dao;

import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.KsAreaExample;
import com.kshl.huihuimall.portal.controller.request.KsAreaDetailRequest;

import java.util.List;
import java.util.Map;

public interface KsAreaDetailDao {
    List<KsArea> SelectProvince(KsAreaExample ksAreaExample);

    List<Map<String,Object>> SelectCity(Integer prId);

    List<Map<String,Object>> SelectRaion(Integer prId,Integer ciId);

    List<Map<String,Object>> SelectStreet(Integer prId, Integer ciId,Integer raId);

    List<Map<String,Object>> SelectStore(Integer prId, Integer ciId,Integer raId,Integer stId);
}
