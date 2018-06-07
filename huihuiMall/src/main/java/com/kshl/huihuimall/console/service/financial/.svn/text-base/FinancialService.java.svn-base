package com.kshl.huihuimall.console.service.financial;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.console.controller.financial.request.StandardRequest;
import com.kshl.huihuimall.console.controller.financial.request.TradeRequest;

/**
 * 财务service接口
 */
public interface FinancialService {
    //分页查询交易对账记录
    BasePageResponse queryAllPayInfo(TradeRequest tradeRequest);

    BaseResponse addPayInfo(TradeRequest tradeRequest);

    BaseResponse updatePayInfo(TradeRequest tradeRequest);

    BaseResponse deletePayInfo(TradeRequest tradeRequest);
    //更新标准配置管理
    BaseResponse updateStandard(StandardRequest standardRequest);

    BaseResponse getStandard();
}
