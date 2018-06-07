package com.kshl.security.services;

import com.kshl.security.model.KSMenuResourceModel;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * Created by xufengfeng on 2017/5/17.
 */
public interface KSUserDetailService {

    UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException;

    KSMenuResourceModel getMenuResourceModelByRoleId(Integer roleId)
            throws IllegalArgumentException;

    KSMenuResourceModel getSystemMenuResourceModel()
            throws IllegalArgumentException;
}
