package com.kshl.huihuimall.console.controller.product.request;

import com.kshl.base.reqeust.BasePageRequest;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * Created by Ethan on 2017/5/4.
 */
public class ProductRequest extends BasePageRequest {

    private Integer id;

    @NotNull(message = "name should not be null")
    private String name;

    @NotNull(message = "brandId should not be null")
    private Integer brandId;

    @NotNull(message = "categorytwoId should not be null")
    private Integer categorytwoId;

    @NotNull(message = "weight should not be null")
    private String weight;

    @NotNull(message = "placeOfOrigin should not be null")
    private String placeOfOrigin;

    @NotNull(message = "packing should not be null")
    private String packing;

    @NotNull(message = "specifications should not be null")
    private String specifications;

    @NotNull(message = "price should not be null")
    private BigDecimal price;

    @NotNull(message = "shareProfitPrice should not be null")
    private BigDecimal shareProfitPrice;

    @NotNull(message = "mainImagePath should not be null")
    private String mainImagePath;

    @NotNull(message = "merchantId should not be null")
    private Integer merchantId;

    @NotNull(message = "shelvesStatus should not be null")
    private Integer shelvesStatus;

    @NotNull(message = "reviewStatus should not be null")
    private Integer reviewStatus;

    @NotNull(message = "categoryoneId should not be null")
    private Integer categoryoneId;

    private String code;

    @NotNull(message = "detailImagePath should not be null")
    private String detailImagePath;

    @NotNull(message = "merchantType should not be null")
    private Integer merchantType;

    public Integer getMerchantType() {
        return merchantType;
    }

    public void setMerchantType(Integer merchantType) {
        this.merchantType = merchantType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getCategorytwoId() {
        return categorytwoId;
    }

    public void setCategorytwoId(Integer categorytwoId) {
        this.categorytwoId = categorytwoId;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getPlaceOfOrigin() {
        return placeOfOrigin;
    }

    public void setPlaceOfOrigin(String placeOfOrigin) {
        this.placeOfOrigin = placeOfOrigin;
    }

    public String getPacking() {
        return packing;
    }

    public void setPacking(String packing) {
        this.packing = packing;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getShareProfitPrice() {
        return shareProfitPrice;
    }

    public void setShareProfitPrice(BigDecimal shareProfitPrice) {
        this.shareProfitPrice = shareProfitPrice;
    }

    public String getMainImagePath() {
        return mainImagePath;
    }

    public void setMainImagePath(String mainImagePath) {
        this.mainImagePath = mainImagePath;
    }

    public Integer getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(Integer merchantId) {
        this.merchantId = merchantId;
    }

    public Integer getShelvesStatus() {
        return shelvesStatus;
    }

    public void setShelvesStatus(Integer shelvesStatus) {
        this.shelvesStatus = shelvesStatus;
    }

    public Integer getReviewStatus() {
        return reviewStatus;
    }

    public void setReviewStatus(Integer reviewStatus) {
        this.reviewStatus = reviewStatus;
    }

    public Integer getCategoryoneId() {
        return categoryoneId;
    }

    public void setCategoryoneId(Integer categoryoneId) {
        this.categoryoneId = categoryoneId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDetailImagePath() {
        return detailImagePath;
    }

    public void setDetailImagePath(String detailImagePath) {
        this.detailImagePath = detailImagePath;
    }
}
