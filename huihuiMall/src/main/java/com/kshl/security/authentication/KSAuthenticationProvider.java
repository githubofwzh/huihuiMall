package com.kshl.security.authentication;

import com.kshl.security.authentication.KSWebAuthenticationDetails;
import com.kshl.security.services.KSUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * Created by xufengfeng on 2017/5/16.
 */
public class KSAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private KSUserDetailService userDetailsService;

    @Autowired
    private KSPasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication)
            throws AuthenticationException {
        String username = authentication.getName();
        String password = (String) authentication.getCredentials();
        KSWebAuthenticationDetails details  = (KSWebAuthenticationDetails) authentication.getDetails();
        String entCode = details.getEntCode();

        UserDetails user = userDetailsService.loadUserByUsername(username);

        if (user == null) {
            throw new BadCredentialsException("Username not found.");
        }

        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new BadCredentialsException("Wrong password.");
        }

        Collection<? extends GrantedAuthority> authorities = user.getAuthorities();

        return new UsernamePasswordAuthenticationToken(user, password, authorities);
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
