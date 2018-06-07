package com.kshl.huihuimall.console.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Controller
@EnableAutoConfiguration
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "login", method=RequestMethod.GET)
    public String login(Model model){
        return "/backstagePages/login";
    }

    @RequestMapping(value = "welcome", method=RequestMethod.GET)
    public String welcome(Model model){
        return "/backstagePages/welcome";
    }

    /**
     * 页面中转
     * @param name
     * @return
     */
    @RequestMapping(value = "base/transfer", method=RequestMethod.GET)
    public ModelAndView transfer(HttpServletRequest request, ModelAndView modelAndView){
        Enumeration<String> enumeration =  request.getParameterNames();
        Map<String,Object> map = new HashMap<>();
       while (enumeration.hasMoreElements()){
           String key = enumeration.nextElement();
           String value = request.getParameter(key);
           if("destination".equals(key.toLowerCase())){
               modelAndView.setViewName(value);
           }
           map.put(key,value);
       }
        modelAndView.addObject("map",map);
        return modelAndView;
    }
}
