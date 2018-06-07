package com.kshl.security.authority;

import com.kshl.base.common.utils.KSStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by xufengfeng on 2017/5/24.
 */
@Component
public class KSUrlAccessDecisionVoter implements AccessDecisionVoter<Object> {


    @Value("#{'${ks.security.ignore-urls:/css/**/*;/js/**/*;/font*/**/*;/images/**/*}'.split(';')}")
    private List<String> ignoreUrls;

    @Value("#{'${ks.security.login-page:/login}'}")
    private String loginUrl;

    @Override
    public boolean supports(ConfigAttribute attribute) {
        return attribute instanceof KSUrlConfigAttribute;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }

    @Override
    public int vote(Authentication authentication, Object object, Collection<ConfigAttribute> attributes) {

        if(authentication == null) {
            return ACCESS_DENIED;
        }

        if (attributes.isEmpty()){
            return ACCESS_DENIED;
        }

        KSUrlConfigAttribute configAttribute = (KSUrlConfigAttribute)attributes.toArray()[0];

        // 1 登录的地址校验
//        AntPathRequestMatcher antPathRequestMatcher =
//                new AntPathRequestMatcher(loginUrl);
//        if (antPathRequestMatcher.matches(configAttribute.getHttpServletRequest())) {
//            return ACCESS_GRANTED;
//        }




        // 获得所有已有的权限
        // todo cache 的问题
        List<String> rightUrls = new ArrayList<>();

        // 1 登录的地址校验
        rightUrls.add(loginUrl);

        // 2 忽略的地址
        rightUrls.addAll(ignoreUrls);

        // 3 拥有的权限
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority authority : authorities) {
            if (!(authority instanceof KSUrlGrantedAuthority)) continue;
            KSUrlGrantedAuthority urlGrantedAuthority = (KSUrlGrantedAuthority)authority;
            if (KSStringUtils.isEmpty(urlGrantedAuthority.getAuthority())) continue;
            rightUrls.add(urlGrantedAuthority.getAuthority());
        }

        // 4 匹配url
        for (ConfigAttribute attribute : attributes) {
            if (!(attribute instanceof KSUrlConfigAttribute)) continue;
            KSUrlConfigAttribute kSUrlConfigAttribute = (KSUrlConfigAttribute) attribute;

            for (String url : rightUrls) {
                //用Spring已经实现的AntPathRequestMatcher进行匹配，这样我们数据库中的url也就支持ant风格的配置了（例如：/xxx/user/**）
                AntPathRequestMatcher mather =
                        new AntPathRequestMatcher(url);
                if (mather.matches(kSUrlConfigAttribute.getHttpServletRequest())) {
                    return ACCESS_GRANTED;
                }
            }

        }

        return ACCESS_DENIED;
    }

}
