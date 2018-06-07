package com.kshl.huihuimall.base.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2017/5/25.
 */
public class DateFormatUtil {
    public static String getNextDay(String startDate){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(startDate);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(calendar.DAY_OF_MONTH,1);
            date = calendar.getTime();
            return sdf.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getSevenDay(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(calendar.DAY_OF_MONTH,-6);
            Date date = calendar.getTime();
            return sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public static int getDays(String startDate,String endDate){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int days = 0;
        try {
            days = (int)(sdf.parse(DateFormatUtil.getNextDay(endDate)).getTime()-sdf.parse(startDate).getTime())/(1000*3600*24);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return days;
    }
}
