package com.kshl.huihuimall.portal.dal.dao;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CategoryOneDao {
    //查询所有一级
    List<CategoryOne> selectByExample(CategoryOneExample example);
    //根据一级查询二级
    List<CategoryOne> getCategoryOneAndTwo(Integer id);

   //根据二级id查找商品
    List<CategoryTwo> getCategoryproduct(@Param("twoId")Integer twoId, @Param("name")String name,@Param("brId")Integer brId);
   //根据商品i的查找商品信息
    List<Product> getproductById(@Param("id")Integer id, @Param("name")String name,@Param("brId")Integer brId);

    List<Brand> getAllBrand(Integer id);

    List<Brand> getBrandList();

    Merchant  getmerchantById(Integer id);

    List<Map<String,Object>> getStoreId(String deviceCode);
}
