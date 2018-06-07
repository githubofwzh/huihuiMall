package com.kshl.huihuimall.portal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@EnableAutoConfiguration
public class IndexController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    //自助机首页
    @RequestMapping("/")
    @ResponseBody
    public ModelAndView linkToSignin(HttpServletRequest request, HttpServletResponse response){
        ModelAndView result = new ModelAndView("/frontPages/selfservice/homePage");
        return result;
    }
}
