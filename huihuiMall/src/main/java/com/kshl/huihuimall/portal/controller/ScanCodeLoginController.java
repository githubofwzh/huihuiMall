package com.kshl.huihuimall.portal.controller;

import com.kshl.base.common.utils.KSStringUtils;
import com.kshl.base.response.BaseResponse;
import com.kshl.huihuimall.base.dal.entity.Customer;
import com.kshl.huihuimall.base.dal.entity.Device;
import com.kshl.huihuimall.portal.service.customer.CustomerService;
import com.kshl.util.PayUtil;
import com.kshl.util.common.WeiXinUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@EnableAutoConfiguration
@RequestMapping("/wxScanCodeLogin")
public class ScanCodeLoginController {
    @Autowired
    private CustomerService customerService;

    //返回微信二维码，可供扫描登录
    @RequestMapping(value = "weixin", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> weixin(HttpServletRequest request) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        WeiXinUtil wxU = new WeiXinUtil();
        String url = "https://open.weixin.qq.com/connect/oauth2/authorize?" +
                "appid=" + wxU.appid + "&" +
                "redirect_uri=http://www.hhwd.com.cn/huihuimall/wxScanCodeLogin/WeiXinTest&" +
                "response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
        //将url转换成短链接，提高扫码速度跟成功率
        String shorturl = wxU.shortURL(url, wxU.appid, wxU.appSecret);
        map.put("shorturl", shorturl);
        return map;
    }

    int type = 0;
    String openId = "";
    //判断用户是否扫码登录成功，以便于前台页面跳转
    @RequestMapping(value = "successDL", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> successDL(String a, HttpServletRequest req) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            synchronized (this) {
                map.put("type", type);
                map.put("openId", openId);
                type = 0;
            }
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        return map;
    }

    @RequestMapping(value = "type", method = {RequestMethod.POST})
    public void type(int a) {
        type = a;
    }

    //微信获取用户信息
    @RequestMapping(value = "WeiXinTest", method = {RequestMethod.GET})
    public ModelAndView WeiXinTest(HttpServletRequest request) {
        ModelAndView result = new ModelAndView("/frontPages/terminal/wxScanCodeLogin");
        String code = request.getParameter("code");
        Map<String, Object> accessMap = PayUtil.accessToken(code);
        if (accessMap != null && accessMap.get("openid") != null) {
            type = 1;
            openId = accessMap.get("openid").toString();
        }
        return result;
    }

    // 扫码授权登陆
    @RequestMapping(value = "/WeChatAuthLand", method = {RequestMethod.POST})
    @ResponseBody
    public BaseResponse WeChatAuthLand(String openid, String deviceCode, HttpServletRequest request) {
        BaseResponse response = new BaseResponse();
        if(!KSStringUtils.isEmpty(deviceCode)) {
            Device device = customerService.getDevicecode(deviceCode);
            if (device == null) {
                response.setRetCode(Long.valueOf(4));
                response.setRetMsg("设备号不存在");
                return response;
            } else if(device.getBindingStatus().equals(0)){
                response.setRetCode(Long.valueOf(5));
                response.setRetMsg("设备号未被绑定");
                return response;
            }
        }else{
            response.setRetCode(Long.valueOf(4));
            response.setRetMsg("设备号不存在");
            return response;
        }
        if (!KSStringUtils.isEmpty(openid)) {
            Customer cus = customerService.selectbyOpenId(openid);
            if(cus !=null){
                UserInfo user = new UserInfo();
                user.setUserId(cus.getId());
                user.setPhoneNumber(cus.getPhoneNumber());
                request.getSession().setAttribute("userInfo", user);
                response.setData(cus);
                response.setRetCode(Long.valueOf(1));
                response.setRetMsg("授权登陆成功");
                return response;
            } else{
                response.setRetCode(Long.valueOf(2));
                response.setRetMsg("验证码登陆");
                return response;
            }
        }else{
            response.setRetCode(Long.valueOf(3));
            response.setRetMsg("授权失败");
            return response;
        }
    }
}