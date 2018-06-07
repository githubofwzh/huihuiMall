package com.kshl.huihuimall.console.base.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 门店总利润pojo
 */
public class StoreProfitPojo implements Serializable {

    //推荐总收益
    private BigDecimal totalRecommend;
    //分润总收益
    private BigDecimal totalConsumption;

    public BigDecimal getTotalRecommend() {
        return totalRecommend;
    }

    public void setTotalRecommend(BigDecimal totalRecommend) {
        this.totalRecommend = totalRecommend;
    }

    public BigDecimal getTotalConsumption() {
        return totalConsumption;
    }

    public void setTotalConsumption(BigDecimal totalConsumption) {
        this.totalConsumption = totalConsumption;
    }

    @Override
    public String toString() {
        return "StoreProfitPojo{" +
                "totalRecommend=" + totalRecommend +
                ", totalConsumption=" + totalConsumption +
                '}';
    }
}