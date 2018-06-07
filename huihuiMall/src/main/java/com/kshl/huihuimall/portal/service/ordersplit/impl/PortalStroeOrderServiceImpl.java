package com.kshl.huihuimall.portal.service.ordersplit.impl;

import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.utils.DateFormatUtil;
import com.kshl.huihuimall.console.base.pojo.ProfitPojo;
import com.kshl.huihuimall.console.base.pojo.StoreProfitPojo;
import com.kshl.huihuimall.console.dal.dao.FinancialDao;
import com.kshl.huihuimall.console.dal.dao.OrderDao;
import com.kshl.huihuimall.portal.controller.request.ProfitRequest;
import com.kshl.huihuimall.portal.dal.dao.PortalStoreOrderDao;
import com.kshl.huihuimall.portal.service.ordersplit.PortalStroeOrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class PortalStroeOrderServiceImpl implements PortalStroeOrderService{
    @Autowired
    private PortalStoreOrderDao portalStoreOrderDao;

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private FinancialDao financialDao;

    @Override
    public int insertStore(StoreOrder record) {
        return portalStoreOrderDao.insertStore(record);
    }


    @Override
    public int insertDetail(OrderDetail record) {
        return portalStoreOrderDao.insertDetail(record);
    }

    @Override
    public int insert(InventoryOut record) {
        return portalStoreOrderDao.insert(record);
    }

    /**
     * 录入订单的分润
     * @param profitRequest
     * @return
     */
    @Override
    public BaseResponse insertOrderProfit(ProfitRequest profitRequest) {
        BaseResponse response;
        //查出财务配置（只会有一条数据）
        List<FinancialConfigure> standardList = financialDao.getStandard();
        FinancialConfigure financialConfigure=  standardList.get(0);
        //消费分润比例
        BigDecimal consumptionProfit =  financialConfigure.getConsumptionProfit();
        //推荐分润比例
        BigDecimal recommendProfit = financialConfigure.getRecommendProfit();
        //门店分润比例
        BigDecimal storeProfit = financialConfigure.getStoreProfit();
        //单条订单分润记录
        ProfitPojo  profitPojo = orderDao.getOrderProfit(profitRequest.getStoreId(),profitRequest.getOrderNumber());
        if (profitPojo != null) {
            BigDecimal bigDecimal = new BigDecimal("0");
            BigDecimal decimal = new BigDecimal("0.0001");
            //给个初始值为0；
            BigDecimal cProfit=bigDecimal;
            BigDecimal  rProfit=bigDecimal;
            if (profitPojo.getProfit().compareTo(bigDecimal)<0){
                profitPojo.setProfit(bigDecimal);
            }
            //消费分润
            cProfit = profitPojo.getProfit().multiply(consumptionProfit).multiply(storeProfit).multiply(decimal);
            cProfit = cProfit.setScale(2,BigDecimal.ROUND_UP);

            //推荐分润
            rProfit = profitPojo.getProfit().multiply(recommendProfit).multiply(storeProfit).multiply(decimal);
            rProfit = rProfit.setScale(2,BigDecimal.ROUND_UP);

            ProfitRecord recommend = new ProfitRecord();
            recommend.setOrderNumber(profitRequest.getOrderNumber());
            recommend.setProfit(rProfit);
            //推荐门店
            recommend.setStoreId(profitRequest.getReStoreId());
            recommend.setType(Constants.PROFIT_TYPE.RECOMMEND);
            int count = orderDao.insertProfitRecord(recommend);
            if (count < 0) {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                response.setRetMsg("插入推荐分润失败");
                return response;
            }

            ProfitRecord consumption = new ProfitRecord();
            consumption.setOrderNumber(profitRequest.getOrderNumber());
            consumption.setProfit(cProfit);
            consumption.setStoreId(profitRequest.getStoreId());
            consumption.setType(Constants.PROFIT_TYPE.CONSUMPTION);
            int num = orderDao.insertProfitRecord(consumption);
            if (num < 0) {
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
                response.setRetMsg("插入消费分润失败");
                return response;
            }
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
        response = ResponseBuilder.buildBaseResponse(SUCCESS);
        return response;
    }

    /**
     * 门店分润记录
     * @param profitRequest
     * @return
     */
    @Override
    public BaseResponse getOrderProfit(ProfitRequest profitRequest) {
        BaseResponse response;
        String startTime="";
        String endTime="";
        try {
            String firstLast= DateFormatUtil.getTime(profitRequest.getDate());
            String[] str1 = firstLast.split(",");
            startTime = str1[0];
            endTime = str1[1];
        } catch (ParseException e) {
            e.printStackTrace();
        }
        BigDecimal bigDecimal = new BigDecimal("0");
        BigDecimal totalConsumption=bigDecimal;
        BigDecimal  totalRecommend=bigDecimal;
        List<ProfitPojo> newList = new ArrayList<>();
        //推荐分润
        List<ProfitPojo> recommendList = orderDao.getOrderProfitList(profitRequest.getStoreId(),startTime,endTime,Constants.PROFIT_TYPE.RECOMMEND,Constants.PROFIT_STATUS.PAY);
        //销售分润
        List<ProfitPojo> consumptionList = orderDao.getOrderProfitList(profitRequest.getStoreId(),startTime,endTime,Constants.PROFIT_TYPE.CONSUMPTION,Constants.PROFIT_STATUS.PAY);
        //推荐分润都放到新数列newList里面
        for (ProfitPojo recommend : recommendList) {
            ProfitPojo profitPojo = new ProfitPojo();
            BeanUtils.copyProperties(recommend, profitPojo);
            profitPojo.setRecommend(recommend.getProfit());
            newList.add(profitPojo);
        }
        //销售分润都放到新数列newList里面
        for (ProfitPojo consumption : consumptionList) {
            ProfitPojo profitPojo = new ProfitPojo();
            BeanUtils.copyProperties(consumption, profitPojo);
            profitPojo.setConsumption(consumption.getProfit());
            newList.add(profitPojo);
        }
        //新数列判空
        if (newList != null && newList.size() >= 0) {
            //因为新数列放推荐分润, 销售分润可能为空
            for (ProfitPojo profitPojo : newList) {
                for (ProfitPojo consumption : consumptionList) {
                    if(consumption.getOrderNumber().equals(profitPojo.getOrderNumber())) {
                        profitPojo.setConsumption(consumption.getProfit());
                    }
                }
            }
            //因为新数列放销售分润, 推荐分润可能为空
            for (ProfitPojo profitPojo : newList) {
                for (ProfitPojo recommend : recommendList) {
                    if(recommend.getOrderNumber().equals(profitPojo.getOrderNumber())) {
                        profitPojo.setRecommend(recommend.getProfit());
                    }
                }
            }
            //新数列中POJO同时包含推荐和销售分润, 按订单号去重
            List<ProfitPojo> list = removeDuplicateProfit(newList);
            for (ProfitPojo profitPojo : list) {
                //推荐分润在别家店为null,判为0
                if(profitPojo.getRecommend()==null){
                    profitPojo.setRecommend(bigDecimal);
                }
                //销售分润在别家店为null,判为0
                if(profitPojo.getConsumption()==null){
                    profitPojo.setConsumption(bigDecimal);
                }
                //销售收益和
                totalConsumption = totalConsumption.add(profitPojo.getConsumption());
                //推荐收益和
                totalRecommend = totalRecommend.add(profitPojo.getRecommend());
            }
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            //利润和
            response.setRetNum(totalConsumption.add(totalRecommend));
            response.setData(list);
            return response;
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
    }

    /**
     * 门店总分润
     * @param profitRequest
     * @return
     */
    @Override
    public BaseResponse getTotalOrderProfit(ProfitRequest profitRequest) {
        BaseResponse response;
        String startTime="";
        String endTime="";
        try {
            String firstLast= DateFormatUtil.getTime(profitRequest.getDate());
            String[] str1 = firstLast.split(",");
            startTime = str1[0];
            endTime = str1[1];
        } catch (ParseException e) {
            e.printStackTrace();
        }
        BigDecimal bigDecimal = new BigDecimal("0");
        BigDecimal totalConsumption=bigDecimal;
        BigDecimal  totalRecommend=bigDecimal;
        List<ProfitPojo> newList = new ArrayList<>();
        //推荐分润
        List<ProfitPojo> recommendList = orderDao.getOrderProfitList(profitRequest.getStoreId(),startTime,endTime,Constants.PROFIT_TYPE.RECOMMEND,Constants.PROFIT_STATUS.PAY);
        //销售分润
        List<ProfitPojo> consumptionList = orderDao.getOrderProfitList(profitRequest.getStoreId(),startTime,endTime,Constants.PROFIT_TYPE.CONSUMPTION,Constants.PROFIT_STATUS.PAY);
        //推荐分润都放到新数列newList里面
        for (ProfitPojo recommend : recommendList) {
            ProfitPojo profitPojo = new ProfitPojo();
            BeanUtils.copyProperties(recommend, profitPojo);
            profitPojo.setRecommend(recommend.getProfit());
            newList.add(profitPojo);
        }
        //销售分润都放到新数列newList里面
        for (ProfitPojo consumption : consumptionList) {
            ProfitPojo profitPojo = new ProfitPojo();
            BeanUtils.copyProperties(consumption, profitPojo);
            profitPojo.setConsumption(consumption.getProfit());
            newList.add(profitPojo);
        }
        //新数列判空
        if (newList != null && newList.size() >= 0) {
            //因为新数列放推荐分润, 销售分润可能为空
            for (ProfitPojo profitPojo : newList) {
                for (ProfitPojo consumption : consumptionList) {
                    if(consumption.getOrderNumber().equals(profitPojo.getOrderNumber())) {
                        profitPojo.setConsumption(consumption.getProfit());
                    }
                }
            }
            //因为新数列放销售分润, 推荐分润可能为空
            for (ProfitPojo profitPojo : newList) {
                for (ProfitPojo recommend : recommendList) {
                    if(recommend.getOrderNumber().equals(profitPojo.getOrderNumber())) {
                        profitPojo.setRecommend(recommend.getProfit());
                    }
                }
            }
            //新数列中POJO同时包含推荐和销售分润, 按订单号去重
            List<ProfitPojo> list = removeDuplicateProfit(newList);
            for (ProfitPojo profitPojo : list) {
                //推荐分润在别家店为null,判为0
                if(profitPojo.getRecommend()==null){
                    profitPojo.setRecommend(bigDecimal);
                }
                //销售分润在别家店为null,判为0
                if(profitPojo.getConsumption()==null){
                    profitPojo.setConsumption(bigDecimal);
                }
                //门店销售收益和
                totalConsumption = totalConsumption.add(profitPojo.getConsumption());
                //门店推荐收益和
                totalRecommend = totalRecommend.add(profitPojo.getRecommend());
            }
            //门店利润pojo
            StoreProfitPojo storeProfitPojo =new StoreProfitPojo();
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
            storeProfitPojo.setTotalConsumption(totalConsumption);
            storeProfitPojo.setTotalRecommend(totalRecommend);
            response.setData(storeProfitPojo);
            return response;
        } else {
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            return response;
        }
    }

    @Override
    public int updateOrderProfit(ProfitRecord profitRecord) {
        return orderDao.updateOrderProfit(profitRecord);
    }

    // 去重方法
    private static ArrayList<ProfitPojo> removeDuplicateProfit(List<ProfitPojo> profitPojo) {
        Set<ProfitPojo> set = new TreeSet<ProfitPojo>(new Comparator<ProfitPojo>() {
            @Override
            public int compare(ProfitPojo o1, ProfitPojo o2) {
                //字符串,则按照asicc码升序排列
                return o1.getOrderNumber().compareTo(o2.getOrderNumber());
            }
        });
        set.addAll(profitPojo);
        return new ArrayList<ProfitPojo>(set);
    }
}
