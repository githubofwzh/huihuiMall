package com.kshl.huihuimall.portal.dal.dao.impl;

import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.dal.mapper.CategoryOneMapper;
import com.kshl.huihuimall.portal.dal.dao.CategoryOneDao;
import com.kshl.huihuimall.portal.dal.manualmapper.CategoryAndProductMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CategoryOneDaoImpl implements CategoryOneDao {
    @Autowired
    private CategoryAndProductMapper categoryOneMapper;

    @Override
    public List<CategoryOne> selectByExample(CategoryOneExample example) {
        return categoryOneMapper.selectAll(null);
    }

    @Override
    public List<CategoryOne> getCategoryOneAndTwo(Integer id) {
        return categoryOneMapper.getCategoryOneAndTwo(id);
    }

    @Override
    public List<CategoryTwo> getCategoryproduct(@Param("twoId")Integer twoId, @Param("name")String name,@Param("brId")Integer brId) {
        return categoryOneMapper.getCategoryproduct(twoId,name,brId);
    }

    @Override
    public List<Product> getproductById(@Param("id")Integer id, @Param("name")String name,@Param("brId")Integer brId) {

        return categoryOneMapper.getproductById(id,name,brId);
    }

    @Override
    public List<Brand> getAllBrand(Integer id) {
        return categoryOneMapper.getAllBrand(id);
    }

    @Override
    public List<Brand> getBrandList() {
        return categoryOneMapper.getBrandList();
    }

    @Override
    public Merchant getmerchantById(Integer id) {
        return categoryOneMapper.getmerchantById(id);
    }

    @Override
    public List<Map<String, Object>> getStoreId(String deviceCode) {
        Map<String,Object> map=new HashMap<>();
        map.put("deviceCode",deviceCode);
        return categoryOneMapper.getStoreId(map);
    }

}
