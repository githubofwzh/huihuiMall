package com.kshl.huihuimall.portal.service.KsArea.impl;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.dal.entity.CategoryOne;
import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.KsAreaExample;
import com.kshl.huihuimall.portal.controller.request.KsAreaDetailRequest;
import com.kshl.huihuimall.portal.dal.dao.KsAreaDetailDao;
import com.kshl.huihuimall.portal.service.KsArea.KsAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class KsAreaServiceImpl implements KsAreaService {
    @Autowired
    private KsAreaDetailDao ksAreaDetailDao;

    @Override
    public List<KsArea> SelectProvince(KsAreaExample ksAreaExample) {
        List<KsArea> list= ksAreaDetailDao.SelectProvince(null);
        return list;
    }

    @Override
    public List<Map<String, Object>> SelectCity(KsAreaDetailRequest ksAreaDetailRequest) {
        List<Map<String, Object>> list= ksAreaDetailDao.SelectCity(ksAreaDetailRequest.getPrId());
        return list;
    }

    @Override
    public List<Map<String, Object>> SelectRaion(KsAreaDetailRequest ksAreaDetailRequest) {
        List<Map<String, Object>> list= ksAreaDetailDao.SelectRaion(ksAreaDetailRequest.getPrId(),ksAreaDetailRequest.getCiId());
        return list;
    }

    @Override
    public List<Map<String, Object>> SelectStreet(KsAreaDetailRequest ks) {
        List<Map<String, Object>> list=ksAreaDetailDao.SelectStreet(ks.getPrId(),ks.getCiId(),ks.getRaId());
        return list;
    }

    @Override
    public List<Map<String, Object>> SelectStore(KsAreaDetailRequest ks) {
        List<Map<String, Object>> list=ksAreaDetailDao.SelectStore(ks.getPrId(),ks.getCiId(),ks.getRaId(),ks.getStId());
        return list;
    }
}
