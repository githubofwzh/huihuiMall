package com.kshl.huihuimall.console.base.pojo;

import com.kshl.huihuimall.base.dal.entity.CategoryOne;
import com.kshl.huihuimall.base.dal.entity.CategoryTwo;

import java.io.Serializable;

/**
 * 二级分类信息，一级分类信息
 */
public class CategoryPojo implements Serializable {
    //一级分类信息
     private CategoryOne categoryOne;
     //二级分类信息
     private CategoryTwo categoryTwo;

    public CategoryOne getCategoryOne() {
        return categoryOne;
    }

    public void setCategoryOne(CategoryOne categoryOne) {
        this.categoryOne = categoryOne;
    }

    public CategoryTwo getCategoryTwo() {
        return categoryTwo;
    }

    public void setCategoryTwo(CategoryTwo categoryTwo) {
        this.categoryTwo = categoryTwo;
    }

    @Override
    public String toString() {
        return "CategoryPojo{" +
                "categoryOne=" + categoryOne +
                ", categoryTwo=" + categoryTwo +
                '}';
    }
}