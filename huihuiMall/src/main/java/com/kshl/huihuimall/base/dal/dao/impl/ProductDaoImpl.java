package com.kshl.huihuimall.base.dal.dao.impl;

import com.github.pagehelper.PageHelper;
import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.huihuimall.base.dal.dao.ProductDao;
import com.kshl.huihuimall.base.dal.entity.*;
import com.kshl.huihuimall.base.dal.manualmapper.CategoryManualMapper;
import com.kshl.huihuimall.base.dal.manualmapper.ProductManualMapper;
import com.kshl.huihuimall.base.dal.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private CategoryOneMapper categoryOneMapper;

    @Autowired
    private CategoryTwoMapper categoryTwoMapper;

    @Autowired
    private CategoryManualMapper categoryManualMapper;

    @Autowired
    private BrandMapper brandMapper;

    @Autowired
    private CategoryToBrandMapper categoryToBrandMapper;

    @Autowired
    private ProductManualMapper productManualMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ProductReviewMapper productReviewMapper;

    @Override
    public List<CategoryOne> getAllCategoryOne(Integer pageSize, Integer pageNum, String name) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        CategoryOneExample example = new CategoryOneExample();
        CategoryOneExample.Criteria criteria = example.createCriteria();
        if(!KSStringUtils.isEmpty(name)){
            criteria.andNameLike("%" + name + "%");
        }
        return categoryOneMapper.selectByExample(example);
    }

    @Override
    public List<CategoryTwo> getAllCategoryTwo(Integer pageSize, Integer pageNum, String name, Integer parentId) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        CategoryTwoExample example = new CategoryTwoExample();
        CategoryTwoExample.Criteria criteria = example.createCriteria();

        if(parentId != null){
            criteria.andParentIdEqualTo(parentId);
        }

        if(!KSStringUtils.isEmpty(name)){
            criteria.andNameLike("%" + name + "%");
        }
        return categoryTwoMapper.selectByExample(example);
    }

    @Override
    public List<Map<String, Object>> getAllBrand(Integer pageSize, Integer pageNum, String name, Integer parentId) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }
        if(parentId != null){
            map.put("categorytwoid", parentId);
        }
        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }

        return categoryManualMapper.getAllBrand(map);
    }

    @Override
    public List<Map<String, Object>> getAllProduct(Integer pageSize, Integer pageNum, String name, Integer brandId, Integer categoryOneId, Integer categoryTwoId, Integer shelvesStatus, Integer merchantType, Integer merchantId) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }

        if(brandId != null){
            map.put("brandid", brandId);
        }

        if(categoryOneId != null){
            map.put("categoryoneid", categoryOneId);
        }

        if(categoryTwoId != null){
            map.put("categorytwoid", categoryTwoId);
        }

        if(shelvesStatus != null){
            map.put("shelvesstatus", shelvesStatus);
        }

        if(merchantType != null){
            map.put("merchanttype", merchantType);
        }

        if(merchantId != null){
            map.put("merchantid", merchantId);
        }

        return productManualMapper.getAllProduct(map);
    }

    @Override
    public List<Map<String, Object>> getAllProductReview(Integer pageSize, Integer pageNum, String name) {
        Map<String, Object> map = new HashMap<>();
        if (pageNum != null && pageSize != null) {
            Integer startPage = (pageNum - 1) * pageSize;
            map.put("startPage", startPage);
            map.put("pageSize", pageSize);
        }

        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }

        return productManualMapper.getAllProductReview(map);
    }

    @Override
    public List<Map<String, Object>> getAllCategoryTwoToBrand(Integer brandId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("brandid", brandId);
        return categoryManualMapper.getAllCategoryTwoToBrand(map);
    }

    @Override
    public int getAllBrandCount(String name, Integer parentId) {
        Map<String, Object> map = new HashMap<>();
        if(parentId != null){
            map.put("categorytwoid", parentId);
        }
        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }
        return categoryManualMapper.getAllBrandCount(map);
    }

    @Override
    public int getAllProductCount(String name, Integer brandId, Integer categoryOneId, Integer categoryTwoId, Integer shelvesStatus, Integer merchantType, Integer merchantId) {
        Map<String, Object> map = new HashMap<>();

        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }

        if(brandId != null){
            map.put("brandid", brandId);
        }

        if(categoryOneId != null){
            map.put("categoryoneid", categoryOneId);
        }

        if(categoryTwoId != null){
            map.put("categorytwoid", categoryTwoId);
        }

        if(shelvesStatus != null){
            map.put("shelvesstatus", shelvesStatus);
        }

        if(merchantType != null){
            map.put("merchanttype", merchantType);
        }

        if(merchantId != null){
            map.put("merchantid", merchantId);
        }

        return productManualMapper.getAllProductCount(map);
    }

    @Override
    public int getAllProductReviewCount(String name) {
        Map<String, Object> map = new HashMap<>();

        if(!KSStringUtils.isEmpty(name)){
            map.put("name", name);
        }

        return productManualMapper.getAllProductReviewCount(map);
    }

    @Override
    public int addCategoryOne(CategoryOne record) {
        return categoryOneMapper.insert(record);
    }

    @Override
    public int addCategoryTwo(CategoryTwo record) {
        return categoryTwoMapper.insert(record);
    }

    @Override
    public int addBrand(List<Integer> categoryTwoIds, String name) {
        Brand record = new Brand();
        record.setName(name);
        int insert = brandMapper.insert(record);
        if(insert > 0 && categoryTwoIds != null){
            int brandId = record.getId();
            for (Integer categoryTwoId : categoryTwoIds) {
                CategoryToBrand ctb = new CategoryToBrand();
                ctb.setBrandId(brandId);
                ctb.setCategoryTwoId(categoryTwoId);
                categoryToBrandMapper.insert(ctb);
            }
        }
        return insert;
    }

    @Override
    public int addProduct(Product record) {
        return productMapper.insert(record);
    }

    @Override
    public int addProductReview(ProductReview record) {
        return productReviewMapper.insert(record);
    }

    @Override
    public int updateCategoryOne(CategoryOne record) {
        return categoryOneMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateCategoryTwo(CategoryTwo record) {
        return categoryTwoMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateBrand(List<Integer> categoryTwoIds, String name, Integer id) {
        Brand record = new Brand();
        record.setName(name);
        record.setId(id);
        int update = brandMapper.updateByPrimaryKey(record);
        if(update > 0 && categoryTwoIds != null){
            int brandId = record.getId();
            CategoryToBrandExample example = new CategoryToBrandExample();
            CategoryToBrandExample.Criteria criteria = example.createCriteria();
            criteria.andBrandIdEqualTo(id);
            categoryToBrandMapper.deleteByExample(example);
            for (Integer categoryTwoId : categoryTwoIds) {
                CategoryToBrand ctb = new CategoryToBrand();
                ctb.setBrandId(brandId);
                ctb.setCategoryTwoId(categoryTwoId);
                categoryToBrandMapper.insert(ctb);
            }
        }
        return update;
    }

    @Override
    public int updateProduct(Product record) {
        return productMapper.updateByPrimaryKey(record);
    }

    /*
    * 删除一级分类 连带删除其分类下的所有二级分类
    */
    @Override
    public int deleteCategoryOne(Integer id) {
        int delete = categoryOneMapper.deleteByPrimaryKey(id);
        if(delete > 0){
            CategoryTwoExample example = new CategoryTwoExample();
            CategoryTwoExample.Criteria criteria = example.createCriteria();
            criteria.andParentIdEqualTo(id);
            categoryTwoMapper.deleteByExample(example);
        }
        return delete;
    }

    /*
    * 删除二级分类 连带删除其分类下的和品牌的所有的关系数据
    */
    @Override
    public int deleteCategoryTwo(Integer id) {
        int delete = categoryTwoMapper.deleteByPrimaryKey(id);
        if(delete > 0){
            CategoryToBrandExample example = new CategoryToBrandExample();
            CategoryToBrandExample.Criteria criteria = example.createCriteria();
            criteria.andCategoryTwoIdEqualTo(id);
            categoryToBrandMapper.deleteByExample(example);
        }
        return delete;
    }

    /*
    * 删除品牌 连带删除其与二级分类的所有的关系数据
    */
    @Override
    public int deleteBrand(Integer id) {
        int delete = brandMapper.deleteByPrimaryKey(id);
        if(delete > 0){
            CategoryToBrandExample example = new CategoryToBrandExample();
            CategoryToBrandExample.Criteria criteria = example.createCriteria();
            criteria.andBrandIdEqualTo(id);
            categoryToBrandMapper.deleteByExample(example);
        }
        return delete;
    }

    @Override
    public int deleteProduct(Integer id) {
        return productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteProductReview(Integer id) {
        return productReviewMapper.deleteByPrimaryKey(id);
    }
}
