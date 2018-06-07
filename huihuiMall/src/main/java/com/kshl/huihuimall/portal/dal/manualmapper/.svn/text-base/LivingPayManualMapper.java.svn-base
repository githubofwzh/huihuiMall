package com.kshl.huihuimall.portal.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.KsArea;
import com.kshl.huihuimall.base.dal.entity.LivingPay;
import com.kshl.huihuimall.base.dal.entity.LivingPayBill;
import com.kshl.huihuimall.base.dal.entity.Product;
import com.kshl.huihuimall.console.base.pojo.ProductDetailPojo;

import java.util.List;
import java.util.Map;

/**
 * Created by Ethan on 2018/2/7.
 */
public interface LivingPayManualMapper {

   int updatePayOrder(LivingPayBill livingPayBill);

    int updatepay(LivingPay livingPay);

    LivingPay getLivingPayPhone(String sordernumber);

    KsArea getLivingPrince(String pid);
    List<Map<String,Object>>getLivingBill(Map<String, Object> map);
    List<Map<String,Object>>getLivingPay(Map<String, Object> map);

}
