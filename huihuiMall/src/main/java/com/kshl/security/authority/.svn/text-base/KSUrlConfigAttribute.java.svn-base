package com.kshl.security.authority;

import org.springframework.security.access.ConfigAttribute;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by xufengfeng on 2017/5/24.
 */
public class KSUrlConfigAttribute implements ConfigAttribute {

    private static final long serialVersionUID = -5738342373743986826L;

    private final HttpServletRequest httpServletRequest;

    public KSUrlConfigAttribute(HttpServletRequest httpServletRequest) {
        this.httpServletRequest = httpServletRequest;
    }

    @Override
    public String getAttribute() {
        return null;
    }

    public HttpServletRequest getHttpServletRequest() {
        return httpServletRequest;
    }

}
