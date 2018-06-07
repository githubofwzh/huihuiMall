package com.kshl.base.response;

import com.kshl.base.common.enums.BaseErrorCode;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public class ResponseBuilder {

    public static <T> BaseResponse<T> buildBaseResponse(BaseErrorCode code) {
        BaseResponse<T> response = new BaseResponse<T>();
        response.setRetCode(code.getCode());
        response.setRetMsg(code.getMessage());

        return response;
    }

    public static <T> BasePageResponse<T> buildBasePageResponse(BaseErrorCode code) {
        BasePageResponse<T> response = new BasePageResponse<T>();
        response.setRetCode(code.getCode());
        response.setRetMsg(code.getMessage());

        return response;
    }

}
