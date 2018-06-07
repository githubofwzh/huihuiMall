package com.kshl.huihuimall.portal.service.categoryone;

import com.kshl.huihuimall.base.dal.entity.*;

import java.util.List;
import java.util.Map;

public interface CategoryOneService {

    List<CategoryOne> selectByExample(CategoryOneExample example);

    List<CategoryOne> selectByOneAndTwo(Integer id);

    List<CategoryTwo> selectCategoryTwoByproduct(Integer twoId , String name, Integer brId);

    List<Product> selectByproduct(Integer id , String name, Integer brId);

    List<Brand> getAllBrand(Integer id);

    List<Brand> getBrandList();

    Merchant  getmerchantById(Integer id);

    List<Map<String, Object>> getStoreId(String deviceCode);
}
