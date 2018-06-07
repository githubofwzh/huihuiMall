package com.kshl.security.authentication;

import org.springframework.security.authentication.AuthenticationDetailsSource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by xufengfeng on 2017/5/17.
 */
public class KSWebAuthenticationDetailsSource implements AuthenticationDetailsSource<HttpServletRequest, KSWebAuthenticationDetails> {

    @Override
    public KSWebAuthenticationDetails buildDetails(HttpServletRequest context) {
        return new KSWebAuthenticationDetails(context);
    }
}
