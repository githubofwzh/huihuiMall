package com.kshl.security.authority;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;

import java.util.Collection;

/**
 * Created by xufengfeng on 2017/5/24.
 */
public class KSUrlAccessDecisionManager implements AccessDecisionManager {

    private KSUrlAccessDecisionVoter accessDecisionVoter;

    public KSUrlAccessDecisionManager(KSUrlAccessDecisionVoter accessDecisionVoter) {
        this.accessDecisionVoter = accessDecisionVoter;
    }

    public void decide(Authentication authentication, Object object,
                Collection<ConfigAttribute> configAttributes) throws AccessDeniedException,
            InsufficientAuthenticationException
    {


        int result = accessDecisionVoter.vote(authentication, object, configAttributes);

        if (result ==  AccessDecisionVoter.ACCESS_DENIED){
            throw new AccessDeniedException("Access is denied");
        }

    }

    public boolean supports(ConfigAttribute attribute)
    {
        return accessDecisionVoter.supports(attribute);
    }

    public boolean supports(Class<?> clazz){
        return accessDecisionVoter.supports(clazz);
    }
}
