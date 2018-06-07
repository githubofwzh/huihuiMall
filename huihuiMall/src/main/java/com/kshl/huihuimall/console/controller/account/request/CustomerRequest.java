package com.kshl.huihuimall.console.controller.account.request;

import com.kshl.base.reqeust.BasePageRequest;
import com.kshl.base.reqeust.BaseRequest;

import java.util.Date;

/**
 * 用户账户请求
 */
public class CustomerRequest extends BasePageRequest {
    //id
    private Integer id;
    //门店id
    private Integer storeId;
   //推荐人id
    private Integer recommendPersonId;
   //电话
    private String phoneNumber;
   //微信id
    private String openId;
    //最后登录时间
    private Date lastLogin;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getRecommendPersonId() {
        return recommendPersonId;
    }

    public void setRecommendPersonId(Integer recommendPersonId) {
        this.recommendPersonId = recommendPersonId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }
}
