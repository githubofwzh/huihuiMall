<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>自助机登录</title>
    <style>

    </style>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/Signin.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/keyboard/mynumkb.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/keyboard/mynumkb.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 col-sm-3 col-xs-3"></div>
        <div class="main col-lg-6 col-sm-6 col-xs-6 text-center">

            <div class="col-lg-12 col-sm-12 col-xs-12 title">
                <span>惠惠网店</span>
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 DXlogin" style="padding: 0;">
                <div class="col-lg-12 col-sm-12 col-xs-12 phone_number">
                    <span><img class="img-responsive" src="${bath}/images/frontpages/common/Phone_zz.png" /></span>
                    <input maxlength="11" class="col-lg-12 col-sm-12 col-xs-12" id="phoneNum" type="text" placeholder="请输入手机号"/>
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 phone_code">
                    <span><img class="img-responsive" src="${bath}/images/frontpages/common/VerificationCode_zz.png" /></span>
                    <input class="col-lg-12 col-sm-12 col-xs-12" id="phone_Verification" type="text" placeholder="请输入验证码"/>
                    <input id="sendVerifyCode" type="button" value="发送验证码" class="a-verifycode"/>
                </div>
                <button class="col-lg-12 col-sm-12 col-xs-12 login" onclick="linkToIndex();">登录</button>
            </div>
            <!--微信扫码登录-->
            <div class="col-lg-12 col-sm-12 col-xs-12 WXmain">
                <div class="col-lg-12 col-sm-12 col-xs-12 WXImg" id="WXLoginImg">
                    <img id="qrcode" alt="" src="${bath}/images/common/loading.gif">
                    <div id="result" class="col-lg-12 col-sm-12 col-xs-12 WXtitle text-center">微信扫描二维码</div>
                </div>
                <div class="col-lg-7 col-sm-7 col-xs-7 WXBDlogin" style="padding: 0;">
                    <div class="col-lg-12 col-sm-12 col-xs-12 WXBDtitle">
                        <span>首次使用惠惠网店，请绑定手机号</span>

                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 phone_number">
                        <span><img class="img-responsive" src="${bath}/images/frontpages/common/Phone_zz.png" /></span>
                        <input maxlength="11" class="col-lg-12 col-sm-12 col-xs-12" id="WXphoneNum" type="text" placeholder="请输入手机号"/>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 phone_code">
                        <span><img class="img-responsive" src="${bath}/images/frontpages/common/VerificationCode_zz.png" /></span>
                        <input class="col-lg-12 col-sm-12 col-xs-12" id="WXphone_Verification" type="text" placeholder="请输入验证码"/>
                        <input id="WXsendVerifyCode" type="button" value="发送验证码" class="a-verifycode"/>
                    </div>
                    <button class="col-lg-12 col-sm-12 col-xs-12 login" onclick="WXlinkToIndex();">登录</button>
                </div>

            </div>
            <!--微信扫码登录-->
            <div class="col-lg-12 col-sm-12 col-xs-12 wxLogin">
                <a onclick="WXclick();"><i class="fa fa-qrcode"></i>微信扫码登录</a>
            </div>
        </div>
        <div class="col-lg-3 col-sm-3 col-xs-3"></div>
        <!---->
        <div class="panel-body">
            <div class="modal fade" id="identifier" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="chooseStoreModalLabel">
                                请输入设备号
                            </h4>
                        </div>
                        <div class="modal-body text-center">
                            <input class="input" type="text" id="deviceCode" placeholder="请输入设备号"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default confirm-btn localStorage" style="margin-top: 0px" id="payModal" data-loading-text="保存中..." autocomplete="off">
                                确定
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
    </div>
</div>
</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var InterValObj; //timer变量，控制时间
    var count = 60; //间隔函数，1秒执行
    var curCount; //当前剩余秒数
    var dataNumber = "";
    var wxOpenId = "";
    var allowDemoRun = true;

    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    var test = 0;
    var storage=window.localStorage;

    $(document).ready(function() {

        $("#phoneNum").mynumkb();
        $("#phone_Verification").mynumkb();
        $("#deviceCode").mynumkb();
        $("#WXphoneNum").mynumkb();
        $("#WXphone_Verification").mynumkb();


        if (storage == null || storage == "" || storage.length == 0) {
            $('#identifier').modal('show');
        }

        $(".localStorage").click(function () {
            if ($("#deviceCode").val() == ""){
                toastr.error("请输入设备号！");
            }else {
                var localStorageData = $("#deviceCode").val();
                localStorage.setItem("equipment_Number", localStorageData);
                toastr.success("设备号输入成功！");
                $('#identifier').modal('hide');
            }
        });

        var screenHeight = $(window).height();
        $(".container-fluid").height(screenHeight);
        //点击发送验证码
        $("#sendVerifyCode").click(function(){
            var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
            var userPhoneNumber = $("#phoneNum").val();
            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            if(!phoneReg.test($("#phoneNum").val())){
                toastr.error("请输入正确的手机号!");
                return false;
            }else{
                curCount = count;
                //设置button效果，开始计时
                $("#sendVerifyCode").attr("disabled", "true");
                InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                //向后台发送处理数据
                jQuery.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/SmsController/CustomersmsCode', //目标地址
                    data : {
                        mobile : userPhoneNumber
                    },
                    dataType : "json", //数据格式:JSON
                    success : function(reInfo) {
                        console.log(reInfo);
                        var Code=reInfo.retCode;
                        var retData = reInfo.data;
                        if(Code==0){
                            toastr.success("验证码发送成功!");
                        }
                        else{
                            toastr.error("验证码发送失败!");
                        }
                        dataNumber = retData;
                        return dataNumber;
                    }
                });
            }
        });


        //点击发送验证码
        $("#WXsendVerifyCode").click(function(){
            var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
            var userPhoneNumber = $("#WXphoneNum").val();
            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            if(!phoneReg.test($("#WXphoneNum").val())){
                toastr.error("请输入正确的手机号!");
                return false;
            }else{
                curCount = count;
                //设置button效果，开始计时
                $("#WXsendVerifyCode").attr("disabled", "true");
                InterValObj = window.setInterval(WXsetRemainTime, 1000); //启动计时器，1秒执行一次
                //向后台发送处理数据
                jQuery.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/SmsController/CustomersmsCode', //目标地址
                    data : {
                        mobile : userPhoneNumber
                    },
                    dataType : "json", //数据格式:JSON
                    success : function(reInfo) {
                        console.log(reInfo);
                        var Code=reInfo.retCode;
                        var retData = reInfo.data;
                        if(Code==0){
                            toastr.success("验证码发送成功!");
                        }
                        else{
                            toastr.error("验证码发送失败!");
                        }
                        dataNumber = retData;
                        return dataNumber;
                    }
                });
            }
        });


        $('#identifier').on('hide.bs.modal', function () {
            $("#mykeyboard3").css("display","none");
        });
    });


    //微信扫码登录
    function WXclick() {
        test = 0;
        $("#mykeyboard1").css("display","none");
        $("#mykeyboard2").css("display","none");
        $("#mykeyboard3").css("display","none");
        $("#mykeyboard4").css("display","none");
        $("#mykeyboard5").css("display","none");

        $("#phoneNum").val("");
        $("#phone_Verification").val("");

        allowDemoRun = true;
        $(".WXmain").css("display","block");
        $(".DXlogin").css("display","none");
        $(".wxLogin").html("<a onclick='goLogin();'><i class='fa fa-mobile'></i>手机验证码登录</a>");
        $.post("${bath}/wxScanCodeLogin/weixin",function(data){
            var ma = data.shorturl;
            var srcMa = "http://qr.topscan.com/api.php?text="+ma;
            //将生成的二维码放到div里
            $("#qrcode").attr("src", srcMa);
        });
        //置初始值
        $.post("${bath}/wxScanCodeLogin/type",{"a":0});
        panduan();
    }
    //回到短信登录
    function goLogin() {
        $("#WXphoneNum").val("");
        $("#WXphone_Verification").val("");
        $("#mykeyboard4").css("display","none");
        $("#mykeyboard5").css("display","none");
        $(".WXmain").css("display","none");
        $(".WXBDlogin").css("display","none");
        $(".DXlogin").css("display","block");
        $("#WXLoginImg").removeClass();
        $("#qrcode").attr("src", "${bath}/images/common/loading.gif");
        $("#WXLoginImg").addClass("col-lg-12 col-sm-12 col-xs-12 WXImg");
        $(".wxLogin").html("<a onclick='WXclick();'><i class='fa fa-mobile'></i>微信扫码登录</a>");
        allowDemoRun = false;
    }

    //微信扫码是否成功的判断
    function panduan(){
        if (allowDemoRun == true){
            $.post("${bath}/wxScanCodeLogin/successDL",function(data){
                var openId = data.openId;
                if(data.type==1){
                    $.ajax({
                        type : "POST", //用POST方式请求
                        url : '${bath}/wxScanCodeLogin/WeChatAuthLand', //目标地址
                        data : {
                            openid : openId,
                            deviceCode : localStorage.getItem("equipment_Number")
                        },
                        dataType : "json", //数据格式:JSON
                        success : function(retInfo) {
                            console.log(retInfo);
                            var retCode = retInfo.retCode;
                            if(retCode == 1){
                                var retData = retInfo.data;
                                var uid = retData.id;
                                var phoneParam = retData.phoneNumber;

                                // 扫码成功，进入自助机商城
                                var navTypeParam = 1;
                                var url ="${bath}/portalLink/linkToHomePage?navType="+navTypeParam+"&uid="+uid+"&phone="+phoneParam;
                                window.open(url,"_self");
                            }else if(retCode == 2){
                                //扫码成功，用户未注册验证码登陆
                                toastr.options = {
                                    "positionClass": "toast-tip-center-center", //弹出窗的位置
                                    "timeOut": "1000" //展现时间
                                };
                                $("#WXLoginImg").removeClass();
                                $("#WXLoginImg").addClass("col-lg-5 col-sm-5 col-xs-5 WXImg");
                                setTimeout(function(){
                                    $(".WXBDlogin").fadeIn(500);

                                },2000)

                                wxOpenId = openId;
                                return wxOpenId;
                            }else if(retCode == 3){
                                toastr.error("授权失败！");
                            }else if(retCode == 4){
                                toastr.error('设备号不存在，请联系店主绑定设备号！');
                                localStorage.removeItem("equipment_Number");
                                setTimeout(function () {
                                    location.reload();
                                },2000)
                            }else if(retCode == 5){
                                toastr.error('设备号未绑定，请联系店主重绑设备号！');
                                localStorage.removeItem("equipment_Number");
                                setTimeout(function () {
                                    location.reload();
                                },2000)
                            }
                        },
                        error:function(XMLHttpRequest, textStatus){
                            //请求失败
                            console.log(XMLHttpRequest);
                            console.log(textStatus);
                            toastr.error("授权失败！");
                        }
                    });
                }else if(data.type==0 && test!=300){
                    //没扫码成功，将test+1,达到三百次（150秒），就不扫了。
                    test = test+1;
                    panduan();
                }else if(test==300){
                    toastr.error('登录码已失效，请重新扫码！');
                    WXclick();
                    $.post("${bath}/wxScanCodeLogin/type",{"a":5});
                }
            });
        }
    }

    //跳转主页
    function linkToIndex(){
        callBack();
        $("#mykeyboard1").css("display","none");
        $("#mykeyboard2").css("display","none");
        $("#mykeyboard3").css("display","none");

        console.log($("#phoneNum").val());
        console.log($("#phone_Verification").val());
        var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
        var navTypeParam = 1;
        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };
        //判断验证码不能为空
        var testVal = $("#phone_Verification").val();
        if(!phoneReg.test($("#phoneNum").val()) && testVal.length>=6){
            toastr.error('请把信息填写正确！');
        }else {
            //不为空执行ajax
            $.ajax({
                type : "POST", //用POST方式请求
                url : '${bath}/Portalcustomer/Selfhelp', //目标地址
                data : {
                    phoneNumber : $("#phoneNum").val(),
                    number : $("#phone_Verification").val(),//需要传递的两个参数  手机号和 验证码
                    type : 0,
                    openId : wxOpenId,
                    deviceCode : localStorage.getItem("equipment_Number")
                },
                beforeSend: function (jqXHR) {
                    if (undefined != header) {
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                    console.log(retInfo);
                    var retData = retInfo.data;
                    if (retInfo.retCode==1){
                        //判断为1时登陆成功 跳转到登录界面  带过去用户的ID和用户的手机号
                        var id = retData.id;
                        var phone = retData.phoneNumber;
                        $.cookie("userId",id);
                        $.cookie("phone",phone);
                        var navTypeParam = 1;
                        var url ="${bath}/portalLink/linkToHomePage?navType="+navTypeParam+"&uid="+id+"&phone="+phone;
                        window.open(url,"_self");
                    }else if (retInfo.retCode==2){
                        //验证码不对
                        toastr.error('验证码错误！');
                    }else if (retInfo.retCode==3){
                        //验证码不对
                        toastr.error('登陆超时！');
                    }else if (retInfo.retCode==null){
                        //验证码不对
                        toastr.error('验证码错误！');
                    }else if (retInfo.retCode==5){
                        toastr.error('设备号不存在，请再次确认！');
                        localStorage.removeItem("equipment_Number");
                        setTimeout(function () {
                            location.reload();
                        },2000)
                    }else if (retInfo.retCode==6){
                        toastr.error('设备未绑定，请联系店主重绑设备！');
                        localStorage.removeItem("equipment_Number");
                        setTimeout(function () {
                            location.reload();
                        },2000)
                    }
                },
                error:function(XMLHttpRequest, textStatus){
                    //请求失败
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $("#loading").css("display","none");
                    toastr.error('查询失败！');
                    return false;
                }
            });
        }
    }

    //callback
    function callBack() {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalLivingPay/callback', //目标地址
            data : {

            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        });
    }

    //timer处理函数
    function SetRemainTime() {
        if (curCount == 0) {
            window.clearInterval(InterValObj); //停止计时器
            $("#sendVerifyCode").removeAttr("disabled"); //启用按钮
            $("#sendVerifyCode").val("重新发送验证码");
        } else {
            curCount--;
            $("#sendVerifyCode").val(" "+ curCount + "秒后可重新获取");
        }
    }

    //timer处理函数
    function WXsetRemainTime() {
        if (curCount == 0) {
            window.clearInterval(InterValObj); //停止计时器
            $("#WXsendVerifyCode").removeAttr("disabled"); //启用按钮
            $("#WXsendVerifyCode").val("重新发送验证码");
        } else {
            curCount--;
            $("#WXsendVerifyCode").val(" "+ curCount + "秒后可重新获取");
        }
    }



    //跳转主页
    function WXlinkToIndex(){
        callBack();
        $("#mykeyboard1").css("display","none");
        $("#mykeyboard2").css("display","none");
        $("#mykeyboard3").css("display","none");
        $("#mykeyboard4").css("display","none");
        $("#mykeyboard5").css("display","none");
        console.log($("#WXphoneNum").val());
        console.log($("#WXphone_Verification").val());
        var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
        var navTypeParam = 1;
        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };
        //判断验证码不能为空
        var testVal = $("#WXphone_Verification").val();
        if(!phoneReg.test($("#WXphoneNum").val()) && testVal.length>=6){
            toastr.error('请把信息填写正确！');
        }else {
            //不为空执行ajax
            $.ajax({
                type : "POST", //用POST方式请求
                url : '${bath}/Portalcustomer/Selfhelp', //目标地址
                data : {
                    phoneNumber : $("#WXphoneNum").val(),
                    number : $("#WXphone_Verification").val(),//需要传递的两个参数  手机号和 验证码
                    type : 0,
                    openId : wxOpenId,
                    deviceCode : localStorage.getItem("equipment_Number")
                },
                beforeSend: function (jqXHR) {
                    if (undefined != header) {
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                    console.log(retInfo);
                    var retData = retInfo.data;
                    if (retInfo.retCode==1){
                        //判断为1时登陆成功 跳转到登录界面  带过去用户的ID和用户的手机号
                        var id = retData.id;
                        var phone = retData.phoneNumber;
                        $.cookie("userId",id);
                        $.cookie("phone",phone);
                        var navTypeParam = 1;
                        var url ="${bath}/portalLink/linkToHomePage?navType="+navTypeParam+"&uid="+id+"&phone="+phone;
                        window.open(url,"_self");
                    }else if (retInfo.retCode==2){
                        //验证码不对
                        toastr.error('验证码错误！');
                    }else if (retInfo.retCode==3){
                        //验证码不对
                        toastr.error('登陆超时！');
                    }else if (retInfo.retCode==null){
                        //验证码不对
                        toastr.error('验证码错误！');
                    }else if (retInfo.retCode==5){
                        toastr.error('设备号不存在，请再次确认！');
                        localStorage.removeItem("equipment_Number");
                        setTimeout(function () {
                            location.reload();
                        },2000)
                    }else if (retInfo.retCode==6){
                        toastr.error('设备未绑定，请联系店主重绑设备！');
                        localStorage.removeItem("equipment_Number");
                        setTimeout(function () {
                            location.reload();
                        },2000)
                    }
                },
                error:function(XMLHttpRequest, textStatus){
                    //请求失败
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $("#loading").css("display","none");
                    toastr.error('查询失败！');
                    return false;
                }
            });
        }
    }
</script>