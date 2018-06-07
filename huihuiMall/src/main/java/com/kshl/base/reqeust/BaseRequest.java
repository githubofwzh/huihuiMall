package com.kshl.base.reqeust;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public class BaseRequest {

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
