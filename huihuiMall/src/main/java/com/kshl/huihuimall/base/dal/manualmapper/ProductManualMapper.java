package com.kshl.huihuimall.base.dal.manualmapper;

import java.util.List;
import java.util.Map;

/**
 * Created by Ethan on 2018/2/7.
 */
public interface ProductManualMapper {

    List<Map<String, Object>> getAllProduct(Map<String, Object> map);

    int getAllProductCount(Map<String, Object> map);

    List<Map<String, Object>> getAllProductReview(Map<String, Object> map);

    int getAllProductReviewCount(Map<String, Object> map);

}
