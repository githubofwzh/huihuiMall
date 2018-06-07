package com.kshl.huihuimall.console.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.OrderDetail;
import com.kshl.huihuimall.base.dal.entity.OrderDetailExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDetailManualMapper {

    List<OrderDetail> getProductListbyCode(String code);


}