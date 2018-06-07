package com.kshl.security.authentication;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

import static com.kshl.huihuimall.console.CSErrorCode.*;

/**
 * Created by xufengfeng on 2017/5/31.
 */
@Component
public class KSAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    public void onAuthenticationSuccess(HttpServletRequest request,
                                 HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {

        BaseResponse ret = ResponseBuilder.buildBaseResponse(SUCCESS);

        HashMap<String, BaseResponse> retMap = new HashMap();
        retMap.put("response", ret);

        ObjectMapper mapper = new ObjectMapper();
        String retJson = mapper.writeValueAsString(retMap);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(retJson);
    }
}
