package com.kshl.security.config;

import com.kshl.security.authentication.*;
import com.kshl.security.authority.KSUrlAccessDecisionManager;
import com.kshl.security.authority.KSUrlAccessDecisionVoter;
import com.kshl.security.authority.KSUrlFilterInvocationSecurityMetadataSource;
import com.kshl.security.authority.KSUrlFilterSecurityInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.vote.AffirmativeBased;
import org.springframework.security.access.vote.AuthenticatedVoter;
import org.springframework.security.access.vote.RoleVoter;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.expression.WebExpressionVoter;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;

import java.util.Arrays;
import java.util.List;

/**
 * Created by xufengfeng on 2017/5/15.
 */
@Configuration
@EnableWebSecurity
public class KSWebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Value("${ks.security.login-page:/login}")
    private String loginPage;

    @Autowired
    private KSUrlAccessDecisionVoter ksUrlAccessDecisionVoter;

    @Autowired
    private KSAuthenticationFailureHandler authenticationFailureHandler;

    @Autowired
    private KSAuthenticationSuccessHandler authenticationSuccessHandler;

    @Bean
    public KSUrlFilterInvocationSecurityMetadataSource ksUrlFilterInvocationSecurityMetadataSource() {
        return new KSUrlFilterInvocationSecurityMetadataSource();
    }

//    @Bean
//    public KSUrlFilterSecurityInterceptor ksUrlFilterSecurityInterceptor() {
//        KSUrlFilterSecurityInterceptor filterSecurityInterceptor = new KSUrlFilterSecurityInterceptor();
//        filterSecurityInterceptor.setAccessDecisionManager(accessDecisionManager());
//        filterSecurityInterceptor.setSecurityMetadataSource(ksUrlFilterInvocationSecurityMetadataSource());
//        return filterSecurityInterceptor;
//    }

    @Bean
    public KSUrlAccessDecisionManager accessDecisionManager() {

        return new KSUrlAccessDecisionManager(ksUrlAccessDecisionVoter);
    }

//    @Bean
//    public AccessDecisionManager accessDecisionManager() {
//        List<AccessDecisionVoter<?>> decisionVoters
//                = Arrays.asList(
//                new WebExpressionVoter(),
////                new RoleVoter(),
////                new AuthenticatedVoter(),
//                new KSUrlAccessDecisionVoter());
//
//        return new AffirmativeBased(decisionVoters);
//    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        return new KSAuthenticationProvider();
    }

    @Bean
    public KSWebAuthenticationDetailsSource ksWebAuthenticationDetailsSource() {
        return new KSWebAuthenticationDetailsSource();
    }

    @Autowired
    private KSPasswordEncoder passwordEncoder;



    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
//                .antMatchers("**/*.js","**/*.css","**/.*jpg","**/*.png")
//                    .permitAll()
                .anyRequest()
                    .authenticated()
                .withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {

                    public <O extends FilterSecurityInterceptor> O postProcess(O fsi) {
                        fsi.setAccessDecisionManager(accessDecisionManager());
                        fsi.setSecurityMetadataSource(ksUrlFilterInvocationSecurityMetadataSource());
                        return fsi;
                    }

                })
            .and()
                .headers()
                    .frameOptions()
                        .sameOrigin()
            .and()
                .formLogin()
                    .loginPage(loginPage)
                    .permitAll()
                    .failureHandler(authenticationFailureHandler)
                .successHandler(authenticationSuccessHandler)
            .authenticationDetailsSource(ksWebAuthenticationDetailsSource())
//            .and()
//                .addFilterBefore(ksUrlFilterSecurityInterceptor(), FilterSecurityInterceptor.class)

            ;
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
    }

    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }


}
