package com.kshl.huihuimall.portal.service.KsArea;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.KsAreaExample;
import com.kshl.huihuimall.portal.controller.request.KsAreaDetailRequest;

import java.util.List;
import java.util.Map;

public interface KsAreaService {
    List<KsArea> SelectProvince(KsAreaExample ksAreaExample);

    List<Map<String, Object>> SelectCity(KsAreaDetailRequest ksAreaDetailRequest);

    List<Map<String, Object>> SelectRaion(KsAreaDetailRequest ksAreaDetailRequest);

    List<Map<String, Object>> SelectStreet(KsAreaDetailRequest ksAreaDetailRequest);

    List<Map<String, Object>> SelectStore(KsAreaDetailRequest ksAreaDetailRequest);
}
