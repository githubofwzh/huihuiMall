package com.kshl.huihuimall.console.dal.dao.impl;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.entity.FinancialConfigure;
import com.kshl.huihuimall.base.dal.entity.Payinfo;
import com.kshl.huihuimall.base.dal.mapper.FinancialConfigureMapper;
import com.kshl.huihuimall.base.dal.mapper.PayinfoMapper;
import com.kshl.huihuimall.console.dal.dao.FinancialDao;
import com.kshl.huihuimall.console.dal.manualmapper.FinancialManualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FinancialDaoImpl implements FinancialDao {


    @Autowired
    private FinancialManualMapper financialManualMapper;

    @Autowired
    private PayinfoMapper payinfoMapper;

    @Autowired
    private FinancialConfigureMapper financialConfigureMapper;


    /**
     * 查询所有交易记录
     *
     * @param pageSize
     * @param pageNum
     * @param type
     * @param outTradeNo
     * @param paytype
     * @param startTime
     * @param endTime
     * @return
     */
    @Override
    public List<Map<String, Object>> queryAllPayInfo(Integer pageSize, Integer pageNum, String type, String outTradeNo, Integer paytype, Integer payStatus, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if (!KSStringUtils.isEmpty(payStatus)) {
            map.put("payStatus", payStatus);
        }

        if (!KSStringUtils.isEmpty(type)) {
            map.put("type", type);
        }

        if (!KSStringUtils.isEmpty(outTradeNo)) {
            map.put("outTradeNo", outTradeNo);
        }
        if (paytype != null) {
            map.put("paytype", paytype);
        }

        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }

        return financialManualMapper.queryAllPayInfo(map);
    }

    /**
     * 查询交易对账记录条数
     *
     * @param type
     * @param outTradeNo
     * @param paytype
     * @param startTime
     * @param endTime
     * @return
     */
    @Override
    public int getPayInfoCount(String type, String outTradeNo, Integer paytype, Integer payStatus, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();

        if (!KSStringUtils.isEmpty(type)) {
            map.put("type", type);
        }

        if (!KSStringUtils.isEmpty(payStatus)) {
            map.put("payStatus", payStatus);
        }

        if (!KSStringUtils.isEmpty(outTradeNo)) {
            map.put("outTradeNo", outTradeNo);
        }
        if (paytype != null) {
            map.put("paytype", paytype);
        }
        if(KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",endTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && KSStringUtils.isEmpty(endTime)){
            map.put("endTime",startTime);
            map.put("startTime",startTime);
        }
        if(!KSStringUtils.isEmpty(startTime) && !KSStringUtils.isEmpty(endTime)){
            map.put("endTime",endTime);
            map.put("startTime",startTime);
        }

        return financialManualMapper.getPayInfoCount(map);
    }

    /**
     * 新增一条交易对账记录
     *
     * @param payinfo
     * @return
     */
    @Override
    public int addPayInfo(Payinfo payinfo) {
        return payinfoMapper.insert(payinfo);
    }

    /**
     * 更新一条交易对账记录
     *
     * @param payinfo
     * @return
     */
    @Override
    public int updatePayInfo(Payinfo payinfo) {
        return payinfoMapper.updateByPrimaryKeySelective(payinfo);
    }


    /**
     * 删除一条交易对账记录
     *
     * @param id
     * @return
     */
    @Override
    public int deleteOrder(Integer id) {
        return payinfoMapper.deleteByPrimaryKey(id);
    }

    /**
     * 更新标准配置管理
     * @param financialConfigure
     * @return
     */
    @Override
    public int updateStandard(FinancialConfigure financialConfigure) {
        return financialConfigureMapper.updateByPrimaryKeySelective(financialConfigure);
    }

    /**
     * 查出配置
     * @return
     */
    @Override
    public List<FinancialConfigure> getStandard() {
        return financialManualMapper.getStandard();
    }


}
