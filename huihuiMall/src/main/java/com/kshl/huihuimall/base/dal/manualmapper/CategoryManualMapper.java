package com.kshl.huihuimall.base.dal.manualmapper;

import com.kshl.huihuimall.base.dal.entity.KsAccount;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * Created by Ethan on 2018/2/7.
 */
public interface CategoryManualMapper {

    List<Map<String, Object>> getAllBrand(Map<String, Object> map);

    List<Map<String, Object>> getAllCategoryTwoToBrand(Map<String, Object> map);

    int getAllBrandCount(Map<String, Object> map);

}
