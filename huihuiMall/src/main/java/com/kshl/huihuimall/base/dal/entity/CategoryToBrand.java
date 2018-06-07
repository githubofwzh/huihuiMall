package com.kshl.huihuimall.base.dal.entity;

import java.io.Serializable;

public class CategoryToBrand implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column category_to_brand.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column category_to_brand.category_two_id
     *
     * @mbg.generated
     */
    private Integer categoryTwoId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column category_to_brand.brand_id
     *
     * @mbg.generated
     */
    private Integer brandId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table category_to_brand
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column category_to_brand.id
     *
     * @return the value of category_to_brand.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column category_to_brand.id
     *
     * @param id the value for category_to_brand.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column category_to_brand.category_two_id
     *
     * @return the value of category_to_brand.category_two_id
     *
     * @mbg.generated
     */
    public Integer getCategoryTwoId() {
        return categoryTwoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column category_to_brand.category_two_id
     *
     * @param categoryTwoId the value for category_to_brand.category_two_id
     *
     * @mbg.generated
     */
    public void setCategoryTwoId(Integer categoryTwoId) {
        this.categoryTwoId = categoryTwoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column category_to_brand.brand_id
     *
     * @return the value of category_to_brand.brand_id
     *
     * @mbg.generated
     */
    public Integer getBrandId() {
        return brandId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column category_to_brand.brand_id
     *
     * @param brandId the value for category_to_brand.brand_id
     *
     * @mbg.generated
     */
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table category_to_brand
     *
     * @mbg.generated
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", categoryTwoId=").append(categoryTwoId);
        sb.append(", brandId=").append(brandId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}