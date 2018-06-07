package com.kshl.huihuimall.console.controller.product.request;

import com.kshl.base.reqeust.BasePageRequest;
import com.kshl.base.reqeust.BaseRequest;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

/**
 * Created by Ethan on 2017/5/4.
 */
public class CategoryOneRequest extends BasePageRequest {

    @NotNull(message = "id should not be null")
    private Integer id;

    @NotNull(message = "name should not be null")
    private String name;

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
}
