package com.kshl.security.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * Created by xufengfeng on 2017/5/16.
 */
public class KSUserDetail extends User {

    private static final long serialVersionUID = -8630569278421130316L;

    private String entCode;

    private KSMenuResourceModel rootMenu;


    public KSUserDetail(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        this(username,
                password,
                true,
                true,
                true,
                true,
                authorities,
                null);
    }

    public KSUserDetail(String username,
                        String password,
                        boolean enabled,
                        boolean accountNonExpired,
                        boolean credentialsNonExpired,
                        boolean accountNonLocked,
                        Collection<? extends GrantedAuthority> authorities) {
        this(username,
                password,
                enabled,
                accountNonExpired,
                credentialsNonExpired,
                accountNonLocked,
                authorities,
                null);
    }

    public KSUserDetail(String username,
                        String password,
                        boolean enabled,
                        boolean accountNonExpired,
                        boolean credentialsNonExpired,
                        boolean accountNonLocked,
                        Collection<? extends GrantedAuthority> authorities,
                        String entCode) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.entCode = entCode;
    }



    public String getEntCode() {
        return entCode;
    }

    public void setEntCode(String entCode) {
        this.entCode = entCode;
    }

    public KSMenuResourceModel getRootMenu() {
        return rootMenu;
    }

    public void setRootMenu(KSMenuResourceModel rootMenu) {
        this.rootMenu = rootMenu;
    }
}
