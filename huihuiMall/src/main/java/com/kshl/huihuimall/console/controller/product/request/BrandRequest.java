package com.kshl.huihuimall.console.controller.product.request;

import com.kshl.base.reqeust.BasePageRequest;

import javax.validation.constraints.NotNull;

/**
 * Created by Ethan on 2017/5/4.
 */
public class BrandRequest extends BasePageRequest {

    @NotNull(message = "id should not be null")
    private Integer id;

//    @NotNull(message = "categoryTwoIds should not be null")
//    private String categoryTwoIds;//1,2,3

    @NotNull(message = "parentId should not be null")
    private Integer parentId;

    @NotNull(message = "name should not be null")
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    public String getCategoryTwoIds() {
//        return categoryTwoIds;
//    }
//
//    public void setCategoryTwoIds(String categoryTwoIds) {
//        this.categoryTwoIds = categoryTwoIds;
//    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
