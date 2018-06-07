package com.kshl.security.authentication;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kshl.base.response.BaseResponse;
import com.kshl.base.response.ResponseBuilder;
import com.kshl.security.exception.AccountIsNotEnableException;
import com.kshl.security.exception.EntCodeIsNotExistException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
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
public class KSAuthenticationFailureHandler implements AuthenticationFailureHandler {

    private static final Logger logger = LoggerFactory.getLogger(KSAuthenticationFailureHandler.class);

    public void onAuthenticationFailure(HttpServletRequest request,
                                 HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {

        logger.info("KSAuthenticationFailureHandler request = {}", request);

        BaseResponse ret = null;

        if (exception instanceof UsernameNotFoundException) {
            ret = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_USERNAME);
        } else if (exception instanceof BadCredentialsException) {
            ret = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_USERNAME);
        }else if(exception instanceof AccountIsNotEnableException){
            ret = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_ENABLE);
        }else if(exception instanceof EntCodeIsNotExistException){
            ret = ResponseBuilder.buildBaseResponse(LOGIN_FAILED_WRONG_ENTCODE);
        }

        HashMap<String, BaseResponse> retMap = new HashMap();
        retMap.put("response", ret);

        ObjectMapper mapper = new ObjectMapper();
        String retJson = mapper.writeValueAsString(retMap);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(retJson);

    }

}
