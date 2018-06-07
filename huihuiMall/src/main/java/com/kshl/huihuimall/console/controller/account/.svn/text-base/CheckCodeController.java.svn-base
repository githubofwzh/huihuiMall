package com.kshl.huihuimall.console.controller.account;

import com.kshl.base.common.utils.CodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by Administrator on 2017/5/22.
 */
@Controller
@RequestMapping("/checkcode")
public class CheckCodeController {

    @RequestMapping
    @ResponseBody
    public void getCheckCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String  number = CodeUtil.getNumber();
        BufferedImage image = CodeUtil.checkCode(number);
        HttpSession session = request.getSession();
        session.setAttribute("number", number);
        response.setContentType("image/jpeg");
        //获得字节输出流
        OutputStream ops = response.getOutputStream();
        //压缩图片并输出
        javax.imageio.ImageIO.write(image, "jpeg", ops);
        ops.close();
    }
}
