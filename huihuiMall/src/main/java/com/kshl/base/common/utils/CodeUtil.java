package com.kshl.base.common.utils;



import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * Created by Administrator on 2017/5/22.
 */
public class CodeUtil {
    /*
     * 生成企业代码
     */
    public static String getEntCode(){
        long randomNum = System.currentTimeMillis();
        return Long.toString(randomNum);
    }


    /*
     *生成验证码
     */
    public static BufferedImage checkCode(String number) {
		/*
		 * 一,绘图
		 */
        //step1,内存映像对象(画布)
        BufferedImage image = new BufferedImage(100,35, BufferedImage.TYPE_INT_RGB);
        //step2,获得画笔
        Graphics g = image.getGraphics();
        //step3,给画笔设置颜色
        g.setColor(new Color(255,255,255));
        //step4,给画布设置背景颜色
        g.fillRect(0, 0, 100, 35);
        //step5,重新给笔设置颜色
        Random r = new Random();
        g.setColor(new Color(r.nextInt(255), r.nextInt(255),r.nextInt(255)));
        g.setFont(new Font(null,Font.ITALIC,25));
        //step6,生成一个随机数(验证码)
        //将验证码转换成图片
        g.drawString(number, 2, 25);
        //step7,加一些干扰线
        for(int i = 0; i < 8; i ++){
            g.setColor(new Color(r.nextInt(255), r.nextInt(255),r.nextInt(255)));
            g.drawLine(r.nextInt(100), r.nextInt(35), r.nextInt(100), r.nextInt(35));
        }
        return  image;
    }

    //长度为5个字符的验证码(这些字符要求从
    //"A~Z,0~9"中选取,排除0,o,1,i)
    public static String getNumber() {
        String number = "";
        String chars = "abcdefghjklmnpqrstwvuxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789";
        Random r = new Random();
        for(int i = 0; i < 5; i ++){
            number += chars.charAt(r.nextInt(chars.length()));
        }
        return number;
    }




}
