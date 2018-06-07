package com.kshl.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 拦截器
 * Created by Administrator on 2017/5/26.
 */
@Aspect
@Component
public class LoggerInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
//
    @Before("within(com.kshl.baseproject..*)")
    public void controllerMethodPointcut(JoinPoint joinPoint){
//        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//        HttpServletRequest request = requestAttributes.getRequest();
//        //打印请求内容
//        logger.info("===============请求内容===============");
//
//        logger.info("url = {}",request.getRequestURL().toString());
//        logger.info("requestMode = {}",request.getMethod());
//        logger.info("requestClassMethod = {}",joinPoint.getSignature());
//        logger.info("requestClassMethodName = {}",joinPoint.getSignature().getName());
//        logger.info("requestClassArgs = {}", Arrays.toString(joinPoint.getArgs()));
    }

    //异常日志
    @AfterThrowing(throwing="ex", pointcut="within(com.kshl.baseproject..*)")
    public void log(Exception ex){
        logger.info("Exception = {}",ex.getStackTrace());
    }
}
