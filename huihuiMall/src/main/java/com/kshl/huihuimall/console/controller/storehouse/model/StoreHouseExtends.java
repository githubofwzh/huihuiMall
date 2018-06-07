package com.kshl.huihuimall.console.controller.storehouse.model;

import com.kshl.huihuimall.base.dal.entity.Storehouse;

/**
 * Created by 40513 on 2018/3/21.
 */
public class StoreHouseExtends extends Storehouse {

    private String managerName;

    private String phone;

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
