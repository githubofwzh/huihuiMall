package com.kshl.huihuimall.console.service.account.enums;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by xufengfeng on 2017/5/4.
 */
public enum AccountTypeEnum {
    ACCOUNT_TYPE_NORMAL(1),
    ACCOUNT_TYPE_COMPANY(2),
    ACCOUNT_TYPE_UNKNOWN(3),
    ;

    private int type;

    AccountTypeEnum(int type) {
        this.type = type;
    }

    public int getType() {
        return type;
    }

    private static Map<Integer, AccountTypeEnum> convertMap = new HashMap<Integer, AccountTypeEnum>();
    static {
        for (AccountTypeEnum type : AccountTypeEnum.values()) {
            convertMap.put(type.getType(), type);
        }
    }
    public static AccountTypeEnum getEnum(Integer type) {
        AccountTypeEnum typeEnum = convertMap.get(type);
        if (typeEnum == null) {
            return AccountTypeEnum.ACCOUNT_TYPE_UNKNOWN;
        }
        return typeEnum;
    }
}
