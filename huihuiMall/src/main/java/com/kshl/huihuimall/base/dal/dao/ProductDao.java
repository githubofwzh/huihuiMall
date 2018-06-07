package com.kshl.huihuimall.base.dal.dao;

import com.kshl.huihuimall.base.dal.entity.CategoryOne;
import com.kshl.huihuimall.base.dal.entity.CategoryTwo;
import com.kshl.huihuimall.base.dal.entity.Product;
import com.kshl.huihuimall.base.dal.entity.ProductReview;

import java.util.List;
import java.util.Map;

public interface ProductDao {

    List<CategoryOne> getAllCategoryOne(Integer pageSize, Integer pageNum, String name);

    List<CategoryTwo> getAllCategoryTwo(Integer pageSize, Integer pageNum, String name, Integer parentId);

    List<Map<String, Object>> getAllBrand(Integer pageSize, Integer pageNum, String name, Integer parentId);

    List<Map<String, Object>> getAllProduct(Integer pageSize, Integer pageNum, String name, Integer brandId, Integer categoryOneId, Integer categoryTwoId, Integer shelvesStatus, Integer merchantType, Integer merchantId);

    List<Map<String, Object>> getAllProductReview(Integer pageSize, Integer pageNum, String name);

    List<Map<String, Object>> getAllCategoryTwoToBrand(Integer brandId);

    int getAllBrandCount(String name, Integer parentId);

    int getAllProductCount(String name, Integer brandId, Integer categoryOneId, Integer categoryTwoId, Integer shelvesStatus, Integer merchantType, Integer merchantId);

    int getAllProductReviewCount(String name);

    int addCategoryOne(CategoryOne record);

    int addCategoryTwo(CategoryTwo record);

    int addBrand(List<Integer> categoryTwoIds, String name);

    int addProduct(Product record);

    int addProductReview(ProductReview record);

    int updateCategoryOne(CategoryOne record);

    int updateCategoryTwo(CategoryTwo record);

    int updateBrand(List<Integer> categoryTwoIds, String name, Integer id);

    int updateProduct(Product record);

    int deleteCategoryOne(Integer id);

    int deleteCategoryTwo(Integer id);

    int deleteBrand(Integer id);

    int deleteProduct(Integer id);

    int deleteProductReview(Integer id);

}
