package com.kshl.security.authentication;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by xufengfeng on 2017/5/17.
 */
public class KSWebAuthenticationDetails extends WebAuthenticationDetails {

    private static final long serialVersionUID = 8059602112264058516L;

    private static final String entCodeKey = "entCode";

    private String entCode = "";


    KSWebAuthenticationDetails(HttpServletRequest request) {
        super(request);
        this.entCode = request.getParameter(entCodeKey);
    }


    public String getEntCode() {
        return entCode;
    }


    @Override
    public boolean equals(Object obj) {
        return EqualsBuilder.reflectionEquals(this, obj);
    }

    @Override
    public int hashCode() {
        return HashCodeBuilder.reflectionHashCode(this);
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
