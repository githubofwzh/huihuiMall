package com.kshl.huihuimall.console.controller.product.request;

import com.kshl.base.reqeust.BasePageRequest;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * Created by Ethan on 2017/5/4.
 */
public class ProductReviewRequest extends BasePageRequest {

    @NotNull(message = "id should not be null")
    private Integer id;

    @NotNull(message = "productId should not be null")
    private Integer productId;

    private String name;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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
}
