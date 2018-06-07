package com.kshl.huihuimall.console.base.pojo;

import java.io.Serializable;


public class CategoryToBrandPojo implements Serializable {
    //二级分类id
    private Integer categoryTwoId;
    //品牌id
    private Integer brandId;
    //品牌名称
    private String name;

    public Integer getCategoryTwoId() {
        return categoryTwoId;
    }

    public void setCategoryTwoId(Integer categoryTwoId) {
        this.categoryTwoId = categoryTwoId;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CategoryToBrandPojo{" +
                "categoryTwoId=" + categoryTwoId +
                ", brandId=" + brandId +
                ", name='" + name + '\'' +
                '}';
    }
}

