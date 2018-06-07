package com.kshl.huihuimall.base.constants;

/**
 * Created by Administrator on 2017/5/21.
 */
public class Constants {

    public class ACCOUNT_TYPE {
        public static final int GENERAL_ACCOUNT = 1;//普通账户
        public static final int BUSINESS_ACCOUNT = 2;//企业账户
        public static final int SYSTEM_ACCOUNT = 3;//系统账户
    }

    public class COMPANY_AUDIT_STATUS {
        public static final int AUDITING = 0;//审核中
        public static final int AUDIT_PASS = 1;//通过审核
        public static final int AUDIT_NOTPASS = 2;//审核不通过
    }

    public class ACCOUNT_STATUS {
        public static final int ACCOUNT_ENABLE = 0;//账户启用
        public static final int ACCOUNT_NOENABLE = 1;//账户禁用
    }

    public class ROLE_STATUS {
        public static final byte ROLE_ENABLE = 0;//角色启用
        public static final byte ROLE_NOENABLE = 1;//角色禁用
    }

    public static final String SYSTEM_ACCOUNT = "ksAdmin";//系统管理员账号

    public static final String SYSTEM_ENTCODE = "00000";

    public class MENU {
        public static final int MENU_ROOT = 1;
        public static final int MENU_ENT_INFO = 5;
        public static final int MENU_ENT_CHECK = 6;
        public static final int MENU_APPLY_DIC = 9;
        public static final int MENU_APPLY_MANAGE = 33;
        public static final int MENU_APPLY_DOWNLOAD = 35;
        public static final int MENU_APPLY_RECORD = 36;
        public static final int MENU_ENT_ORDERS = 37;
        public static final int MENU_PURCHASE_RECORDS = 38;
        public static final int MENU_HOSPITAL_INFO = 39;
        public static final int MENU_HOSPITAL_ORDERS = 41;
    }

    public class REGISTER_TYPE {
        public static final int ENT_ACCOUNT = 1;//企业账号注册
        public static final int HOSPITAL_ACCOUNT = 2;//中医院账号注册
    }

    public static class PAY_STATUS {
        public static final int NOT_PAY = 0;//未支付
        public static final int PAY = 1;//已支付
        public static final int REFUND = 2;//已退款
    }

    public static class PAY_TYPE {
        public static final int ALIPAY = 1;//支付宝支付
        public static final int WECHAT_PAY = 2;//微信支付
    }

    public static final String URL_SCAN_CODE = "http://121.42.176.174:8080/baseproject/code/scan?code=";

    public static class SHELVES_STATUS_TYPE {
        public static final int NOT_ON_THE_SHELF = 0;//未上架
        public static final int ON_THE_SHELF = 1;//已上架
        public static final int OFF_THE_SHELF = 2;//已下架
    }

    public static class REVIEW_STATUS_TYPE {
        public static final int NOT_REVIEW = 0;//未审核
        public static final int REVIEWING = 1;//审核中
        public static final int PASS_REVIEW = 2;//审核成功
        public static final int UNPASS_REVIEW = 3;//审核失败
    }

}
