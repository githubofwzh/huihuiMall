<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>验证手机号</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<label id="openId" style="display: none">${openId!""}</label>
<container>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 login-panel">
                    <div class="col-lg-12 col-md-12 col-xs-12 login-title">
                        <span>验证手机号</span>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12 login-input-group">
                        <div class="col-lg-10 col-md-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-xs-offset-1 input-group login-input">
                                <span class="input-group-addon">
                                    <img src="${bath}/images/frontpages/common/phone-icon.png" alt="" />
                                </span>
                            <input type="text" maxlength="11" class="form-control required phone-code-input" placeholder="请输入您的手机号" id="phoneNum">
                        </div>
                        <div class="col-lg-10 col-md-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-xs-offset-1 input-group login-input">
                                <span class="input-group-addon">
                                    <img src="${bath}/images/frontpages/common/verifycode-icon.png" alt="" />
                                </span>
                            <input type="text" class="form-control required phone-code-input" placeholder="请输入短信验证码" id="phone_Verification">
                        <#--<a href="#" class="a-code" id="verifyCode">获取验证码</a>-->
                            <input id="sendVerifyCode" type="button" value="发送验证码" class="a-verifycode"/>

                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12 login-btn">
                        <button class="btn btn-primary login-confirm-btn" onclick="linkToIndex();">确认</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</container>
</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var InterValObj; //timer变量，控制时间
    var count = 60; //间隔函数，1秒执行
    var curCount; //当前剩余秒数
    var dataNumber = "";

    $(document).ready(function() {

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
                    url : '${bath}/SmsController/smsCode', //目标地址
                    data : {
                        mobile : userPhoneNumber
                    },
                    dataType : "json", //数据格式:JSON
                    success : function(reInfo) {
                        console.log(reInfo);
                        var retData = reInfo.data;
                        var Code=reInfo.retCode;
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
    });

    //跳转主页
    function linkToIndex(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        /*var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;*/
        /*var testVal = $("#phone_Verification").val();*/
        /*if(!phoneReg.test($("#phoneNum").val())||testVal.length>4){
            toastr.error('验证码输入错误！');
        }*/
        var phoneNumberParam = $("#phoneNum").val();
        if(phoneNumberParam == ""){
            toastr.error("请输入手机号！");
            return false;
        }
        var phoneVerificationParam = $("#phone_Verification").val();
        if(phoneVerificationParam == "" || phoneVerificationParam.length > 6){
            toastr.error("验证码输入错误！");
            return false;
        }

        var openIdParam = $("#openId").text();
        var openIdReplaceParam = openIdParam.replace(/\,/g,'');

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/Portalshopkeeper/isExitStore', //目标地址
            data : {
                phoneNumber : phoneNumberParam,
                number : phoneVerificationParam,
                OpenId : openIdReplaceParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode == 0){
                    var retData = retInfo.data;
                    var status = retData.auditStatus;
                    var storeId = retData.id;
                    if(status == 1){
                        var url ="${bath}/portalLink/linkToMyStore?id="+storeId;
                        window.open(url,"_self");
                    }else{
                        toastr.error("门店正在审核中！");
                    }
                }else if(retInfo.retCode==1){
                    toastr.error("请先完成申请门店！");
                    setTimeout(function(){
                        var url = "${bath}/portalLink/linkToApply";
                        window.open(url,"_self");
                    },2000);
                 }else if(retInfo.retCode==2){
                       toastr.error("验证码不正确，请重新输入！");
                 }else if(retInfo.retCode==3){
                     toastr.error("验证码超时，请重新发送！");
               }else if(retInfo.retCode==4){
                     toastr.error("请核对手机号！");
                     }
            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("操作失败！");
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

</script>