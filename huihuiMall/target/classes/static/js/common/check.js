//校验用户名
function checkUserName(str){
    toastr.options = {
        "positionClass": "toast-nav-center-center", //弹出窗的位置
        "timeOut": "1000", //展现时间
    };
    var re = /^[a-zA-z]\w{3,15}$/;
    if(re.test(str)){

    }else{
        toastr.error("用户名格式错误");
        return false;
    }
}

//校验密码
function checkPassword(str){
    toastr.options = {
        "positionClass": "toast-nav-center-center", //弹出窗的位置
        "timeOut": "1000", //展现时间
    };
    var pwdReg = /^[\da-z]{6,12}$/i;//6到12位数字与字母组合
    if(pwdReg.test(str)){

    }else{
        toastr.error("密码格式不正确");
        return false;
    }
}

//校验手机号
function checkMobile(str) {
    toastr.options = {
        "positionClass": "toast-nav-center-center", //弹出窗的位置
        "timeOut": "1000", //展现时间
    };
    var re = /^1\d{10}$/
    if (re.test(str)) {

    } else {
        toastr.error("手机号格式不正确");
        return false;
    }
}

//校验电话号码
/*验证电话号码
验证规则：区号+号码，区号以0开头，3位或4位
号码由7位或8位数字组成
区号与号码之间可以无连接符，也可以“-”连接
如01088888888,010-88888888,0955-7777777*/
function checkPhone(str){
    toastr.options = {
        "positionClass": "toast-nav-center-center", //弹出窗的位置
        "timeOut": "1000", //展现时间
    };
    var re = /^0\d{2,3}-?\d{7,8}$/;
    if(re.test(str)){

    }else{
        toastr.error("电话号码格式不正确");
        return false;
    }
}

//校验身份证
function isCardNo(str) {
    toastr.options = {
        "positionClass": "toast-nav-center-center", //弹出窗的位置
        "timeOut": "1000", //展现时间
    };
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if(reg.test(str))
    {

    }else{
        toastr.error("身份证输入不合法");
        return false;
    }
}

/*
证邮箱
验证规则：姑且把邮箱地址分成“第一部分@第二部分”这样
第一部分：由字母、数字、下划线、短线“-”、点号“.”组成，
第二部分：为一个域名，域名由字母、数字、短线“-”、域名后缀组成，
而域名后缀一般为.xxx或.xxx.xx，一区的域名后缀一般为2-4位，如cn,com,net，现在域名有的也会大于4位*/
function checkEmail(str){
    toastr.options = {
        "positionClass": "toast-nav-center-center", //弹出窗的位置
        "timeOut": "1000", //展现时间
    };
    var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
    if(re.test(str)){

    }else{
        toastr.error("邮箱格式错误");
        return false;
    }
}
