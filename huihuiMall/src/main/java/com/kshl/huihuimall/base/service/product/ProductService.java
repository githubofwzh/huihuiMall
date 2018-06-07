package com.kshl.huihuimall.base.service.product;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.console.controller.product.request.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by ethan on 2018/2/6.
 */
public interface ProductService {

    BasePageResponse getAllCategoryOne(CategoryOneRequest request);

    BasePageResponse getAllCategoryTwo(CategoryTwoRequest request);

    BasePageResponse getAllBrand(BrandRequest brandRequest);

    BasePageResponse getAllProduct(ProductRequest productRequest);

    BasePageResponse getAllProductReview(ProductReviewRequest productReviewRequest);

    BasePageResponse getAllCategoryTwoToBrand(Integer brandId, HttpSession session);

    BaseResponse addCategoryOne(CategoryOneRequest request);

    BaseResponse addCategoryTwo(CategoryTwoRequest request);

    BaseResponse addBrand(BrandRequest request, HttpSession session);

    BaseResponse addProduct(ProductRequest request);

    BaseResponse addCategoryTwoToBrand(String categorytwoname, Integer categorytwoid, HttpSession session);

    BaseResponse updateCategoryOne(CategoryOneRequest request);

    BaseResponse updateCategoryTwo(CategoryTwoRequest request);

    BaseResponse updateBrand(BrandRequest request, HttpSession session);

    BaseResponse updateProduct(ProductRequest request);

    BaseResponse deleteCategoryOne(CategoryOneRequest request);

    BaseResponse deleteCategoryTwo(CategoryTwoRequest request);

    BaseResponse deleteBrand(BrandRequest request);

    BaseResponse deleteProduct(ProductRequest request);

    BaseResponse deleteCategoryTwoToBrand(String categorytwoname, Integer categorytwoid, HttpSession session);

    BaseResponse passProductReview(ProductReviewRequest request);

    BaseResponse unPassProductReview(ProductReviewRequest request);

    BaseResponse putOnTheShelfSelf(ProductRequest request);

    BaseResponse putOnTheShelfThird(ProductRequest request);

    BaseResponse putOffTheShelf(ProductRequest request);

}
