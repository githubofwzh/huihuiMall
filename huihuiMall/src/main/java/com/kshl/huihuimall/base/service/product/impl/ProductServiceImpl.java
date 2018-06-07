package com.kshl.huihuimall.base.service.product.impl;

import com.kshl.base.response.BasePageResponse;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.huihuimall.base.constants.Constants;
import com.kshl.huihuimall.base.dal.dao.ProductDao;
import com.kshl.huihuimall.base.dal.entity.CategoryOne;
import com.kshl.huihuimall.base.dal.entity.CategoryTwo;
import com.kshl.huihuimall.base.dal.entity.Product;
import com.kshl.huihuimall.base.dal.entity.ProductReview;
import com.kshl.huihuimall.base.service.product.ProductService;
import com.kshl.huihuimall.console.controller.product.request.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.*;

import static com.kshl.huihuimall.console.CSErrorCode.INVALID_PARAM;
import static com.kshl.huihuimall.console.CSErrorCode.SUCCESS;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    private static final String keyCategoryTwoToBrandList = "categoryTwoToBrandList";

    @Override
    public BasePageResponse getAllCategoryOne(CategoryOneRequest request) {
        List<CategoryOne> result = productDao.getAllCategoryOne(request.getPageSize(), request.getPageNum(), request.getName());
        BasePageResponse response = ResponseBuilder.buildBasePageResponse(SUCCESS);
        response.setData(result);
        return response;
    }

    @Override
    public BasePageResponse getAllCategoryTwo(CategoryTwoRequest request) {
        List<CategoryTwo> result = productDao.getAllCategoryTwo(request.getPageSize(), request.getPageNum(), request.getName(), request.getParentId());
        BasePageResponse response = ResponseBuilder.buildBasePageResponse(SUCCESS);
        response.setData(result);
        return response;
    }

    @Override
    public BasePageResponse getAllBrand(BrandRequest brandRequest) {
        List<Map<String, Object>> result = productDao.getAllBrand(brandRequest.getPageSize(), brandRequest.getPageNum(), brandRequest.getName(), brandRequest.getParentId());
        int total = productDao.getAllBrandCount(brandRequest.getName(), brandRequest.getParentId());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (brandRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (brandRequest.getPageSize() * brandRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / brandRequest.getPageSize();
        pageResponse.setPages(total % brandRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    @Override
    public BasePageResponse getAllProduct(ProductRequest productRequest) {
        List<Map<String, Object>> result = productDao.getAllProduct(productRequest.getPageSize(), productRequest.getPageNum(), productRequest.getName(), productRequest.getBrandId(), productRequest.getCategoryoneId(), productRequest.getCategorytwoId(), productRequest.getShelvesStatus(), productRequest.getMerchantType(), productRequest.getMerchantId());
        int total = productDao.getAllProductCount(productRequest.getName(), productRequest.getBrandId(), productRequest.getCategoryoneId(), productRequest.getCategorytwoId(), productRequest.getShelvesStatus(), productRequest.getMerchantType(), productRequest.getMerchantId());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (productRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (productRequest.getPageSize() * productRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / productRequest.getPageSize();
        pageResponse.setPages(total % productRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    @Override
    public BasePageResponse getAllProductReview(ProductReviewRequest productReviewRequest) {
        List<Map<String, Object>> result = productDao.getAllProductReview(productReviewRequest.getPageSize(), productReviewRequest.getPageNum(), productReviewRequest.getName());
        int total = productDao.getAllProductReviewCount(productReviewRequest.getName());
        BasePageResponse<List<Map<String, Object>>> pageResponse = ResponseBuilder.buildBasePageResponse(SUCCESS);
        pageResponse.setData(result);
        pageResponse.setTotal(total);
        if (productReviewRequest.getPageNum() > 1) {
            pageResponse.setHasPreviousPage(true);
        }
        if (productReviewRequest.getPageSize() * productReviewRequest.getPageNum() >= total) {
            pageResponse.setHasNextPage(false);
        } else {
            pageResponse.setHasNextPage(true);
        }
        int count = total / productReviewRequest.getPageSize();
        pageResponse.setPages(total % productReviewRequest.getPageSize() == 0 ? count : count + 1);
        return pageResponse;
    }

    @Override
    public BasePageResponse getAllCategoryTwoToBrand(Integer brandId, HttpSession session) {
        List<Map<String, Object>> result = productDao.getAllCategoryTwoToBrand(brandId);
        session.setAttribute(keyCategoryTwoToBrandList, result);
        BasePageResponse response = ResponseBuilder.buildBasePageResponse(SUCCESS);
        response.setData(result);
        return response;
    }

    @Override
    public BaseResponse addCategoryOne(CategoryOneRequest request) {
        BaseResponse response;
        CategoryOne record = new CategoryOne();
        record.setName(request.getName());
        int add = productDao.addCategoryOne(record);
        if(add > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse addCategoryTwo(CategoryTwoRequest request) {
        BaseResponse response;
        CategoryTwo record = new CategoryTwo();
        record.setName(request.getName());
        record.setParentId(request.getParentId());
        int add = productDao.addCategoryTwo(record);
        if(add > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse addBrand(BrandRequest request, HttpSession session) {
        BaseResponse response;
//        String parentIds = request.getCategoryTwoIds();
//
//        List<Integer> categoryTwoIds = new ArrayList<Integer>();
//        try{
//            String[] splits = parentIds.split(",");
//            for (String id : splits) {
//                categoryTwoIds.add(Integer.parseInt(id));
//            }
//        }catch (Exception e){
//            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
//            return response;
//        }

        List<Map<String, Object>> categoryTwoToBrandList = (List<Map<String, Object>>) session.getAttribute(keyCategoryTwoToBrandList);
        if(categoryTwoToBrandList == null){
            categoryTwoToBrandList = new ArrayList<Map<String, Object>>();
        }
        List<Integer> categoryTwoIds = new ArrayList<Integer>();
        for (Map<String, Object> map : categoryTwoToBrandList) {
            categoryTwoIds.add((Integer) map.get("categorytwoid"));
        }

        int add = productDao.addBrand(categoryTwoIds, request.getName());
        if(add > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse addProduct(ProductRequest request) {
        BaseResponse response;
        Product record = new Product();
        BeanUtils.copyProperties(request, record);
        int add = productDao.addProduct(record);
        if(add > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse addCategoryTwoToBrand(String categorytwoname, Integer categorytwoid, HttpSession session) {
        List<Map<String, Object>> list = (List<Map<String, Object>>) session.getAttribute(keyCategoryTwoToBrandList);
        if(list == null){
            list = new ArrayList<Map<String, Object>>();
        }
        addFilterCategoryTwoToBrand(list, categorytwoname, categorytwoid);
        session.setAttribute(keyCategoryTwoToBrandList, list);
        return ResponseBuilder.buildBaseResponse(SUCCESS);
    }

    private void addFilterCategoryTwoToBrand(List<Map<String, Object>> list, String categorytwoname, Integer categorytwoid){
        boolean isFilter = false;
        for (Map<String, Object> map : list) {
            if(categorytwoname.equals((String)map.get("categorytwoname")) && categorytwoid == (Integer) map.get("categorytwoid")){
                isFilter = true;
                return;
            }
        }
        if(!isFilter){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("categorytwoname", categorytwoname);
            map.put("categorytwoid", categorytwoid);
            list.add(map);
        }
    }

    @Override
    public BaseResponse updateCategoryOne(CategoryOneRequest request) {
        BaseResponse response;
        CategoryOne record = new CategoryOne();
        record.setId(request.getId());
        record.setName(request.getName());
        int update = productDao.updateCategoryOne(record);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse updateCategoryTwo(CategoryTwoRequest request) {
        BaseResponse response;
        CategoryTwo record = new CategoryTwo();
        record.setId(request.getId());
        record.setName(request.getName());
        record.setParentId(request.getParentId());
        int update = productDao.updateCategoryTwo(record);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse updateBrand(BrandRequest request, HttpSession session) {
        BaseResponse response;
//        String parentIds = request.getCategoryTwoIds();
//
//        List<Integer> categoryTwoIds = new ArrayList<Integer>();
//        try{
//            String[] splits = parentIds.split(",");
//            for (String id : splits) {
//                categoryTwoIds.add(Integer.parseInt(id));
//            }
//        }catch (Exception e){
//            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
//            return response;
//        }
        List<Map<String, Object>> categoryTwoToBrandList = (List<Map<String, Object>>) session.getAttribute(keyCategoryTwoToBrandList);
        if(categoryTwoToBrandList == null){
            categoryTwoToBrandList = new ArrayList<Map<String, Object>>();
        }
        List<Integer> categoryTwoIds = new ArrayList<Integer>();
        for (Map<String, Object> map : categoryTwoToBrandList) {
            categoryTwoIds.add((Integer) map.get("categorytwoid"));
        }

        int update = productDao.updateBrand(categoryTwoIds, request.getName(), request.getId());
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse updateProduct(ProductRequest request) {
        BaseResponse response;
        Product record = new Product();
        BeanUtils.copyProperties(request, record);
        int update = productDao.updateProduct(record);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse deleteCategoryOne(CategoryOneRequest request) {
        BaseResponse response;
        int delete = productDao.deleteCategoryOne(request.getId());
        if(delete > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse deleteCategoryTwo(CategoryTwoRequest request) {
        BaseResponse response;
        int delete = productDao.deleteCategoryTwo(request.getId());
        if(delete > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse deleteBrand(BrandRequest request) {
        BaseResponse response;
        int delete = productDao.deleteBrand(request.getId());
        if(delete > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse deleteProduct(ProductRequest request) {
        BaseResponse response;
        int delete = productDao.deleteProduct(request.getId());
        if(delete > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse deleteCategoryTwoToBrand(String categorytwoname, Integer categorytwoid, HttpSession session) {
        List<Map<String, Object>> list = (List<Map<String, Object>>) session.getAttribute(keyCategoryTwoToBrandList);
        if(list == null){
            list = new ArrayList<Map<String, Object>>();
        }

        Iterator<Map<String, Object>> it = list.iterator();
        while(it.hasNext()){
            Map<String, Object> map = it.next();
            if(categorytwoid == (Integer) map.get("categorytwoid")){
                it.remove();
                break;
            }
        }

        session.setAttribute(keyCategoryTwoToBrandList, list);
        return ResponseBuilder.buildBaseResponse(SUCCESS);
    }

    @Override
    public BaseResponse passProductReview(ProductReviewRequest request) {
        BaseResponse response;
        int delete = productDao.deleteProductReview(request.getId());
        if(delete > 0){
            Product record = new Product();
            record.setId(request.getProductId());
            record.setShelvesStatus(Constants.SHELVES_STATUS_TYPE.ON_THE_SHELF);
            record.setReviewStatus(Constants.REVIEW_STATUS_TYPE.PASS_REVIEW);
            int update = productDao.updateProduct(record);
            if(update > 0){
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
            }else{
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse unPassProductReview(ProductReviewRequest request) {
        BaseResponse response;
        int delete = productDao.deleteProductReview(request.getId());
        if(delete > 0){
            Product record = new Product();
            record.setId(request.getProductId());
            record.setShelvesStatus(Constants.SHELVES_STATUS_TYPE.NOT_ON_THE_SHELF);
            record.setReviewStatus(Constants.REVIEW_STATUS_TYPE.UNPASS_REVIEW);
            int update = productDao.updateProduct(record);
            if(update > 0){
                response = ResponseBuilder.buildBaseResponse(SUCCESS);
            }else{
                response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
            }
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse putOnTheShelfSelf(ProductRequest request) {
        BaseResponse response;
        Product record = new Product();
        record.setId(request.getId());
        record.setShelvesStatus(Constants.SHELVES_STATUS_TYPE.ON_THE_SHELF);
        int update = productDao.updateProduct(record);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse putOnTheShelfThird(ProductRequest request) {
        BaseResponse response;
        ProductReview record = new ProductReview();
        record.setProductId(request.getId());
        record.setTime(new Date());
        int add = productDao.addProductReview(record);
        if(add > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

    @Override
    public BaseResponse putOffTheShelf(ProductRequest request) {
        BaseResponse response;
        Product record = new Product();
        record.setId(request.getId());
        record.setShelvesStatus(Constants.SHELVES_STATUS_TYPE.OFF_THE_SHELF);
        int update = productDao.updateProduct(record);
        if(update > 0){
            response = ResponseBuilder.buildBaseResponse(SUCCESS);
        }else{
            response = ResponseBuilder.buildBaseResponse(INVALID_PARAM);
        }
        return response;
    }

}
