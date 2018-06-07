package com.kshl.security.authority;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by xufengfeng on 2017/5/24.
 */
public class KSUrlGrantedAuthority implements GrantedAuthority {

    private final String url;

    public KSUrlGrantedAuthority(String url) {
        this.url = url;
    }

    @Override
    public String getAuthority() {
        return this.url;
    }

    public String getUrl() {
        return url;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        KSUrlGrantedAuthority target = (KSUrlGrantedAuthority) o;
        return url.equals(target.getUrl());

    }

    @Override
    public int hashCode() {
        return url != null ? url.hashCode() : 0;
    }
}
