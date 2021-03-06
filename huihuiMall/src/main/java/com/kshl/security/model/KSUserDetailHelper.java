package com.kshl.security.model;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * Created by xufengfeng on 2017/6/1.
 */
public class KSUserDetailHelper {

    public static KSUserDetail getUserDetail() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        Object userDetail = auth != null ? auth.getPrincipal() : null;

        if (userDetail instanceof KSUserDetail) {
            return (KSUserDetail)userDetail;
        }
        return null;
    }

    public static String getUserEntCode() {

        KSUserDetail userDetail = getUserDetail();

        return userDetail != null ? userDetail.getEntCode() : null;
    }

}
