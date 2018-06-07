<!DOCTYPE html>
<html>
<head>
    <#assign bath=request.getContextPath()>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <#if _csrf??>
        <meta name="_csrf" content="${_csrf.token}"/>
        <!-- default header name is X-CSRF-TOKEN -->
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
    </#if>

    <title>登录</title>
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${bath}/css/login.css"/>
    <!-- Custom Fonts -->
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/checkBox_radio_select.css" rel="stylesheet" type="text/css" />

    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css" />

    <!-- jQuery -->
    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>

</head>
<body>
    <!--页面开始-->
    <div class="container">
        <div class="col-lg-12 main">
            <div class=" mainbody">
                <!--头部-->
                <div class="col-lg-12 col-md-12 header">
                    <div class="logo">
                        <#--<img src="${bath}/images/common/login_logo.png"/>-->
                    </div>
                    <p style="text-align: center"><b>惠惠网店后台管理系统</b></p>
                </div>
                <!--主体-->
                <div class="login_body col-lg-12 col-md-12">
                    <ul class="col-lg-12 col-md-12 _padding">
                        <li class="col-lg-12 col-md-12 _padding">
                            <input type="text" name="" id="userName" class="col-lg-12 col-md-12 username clear" value="" placeholder="用户名"/>
                            <img src="${bath}/images/common/my.png"/>
                        </li>
                        <li class="col-lg-12 col-md-12 _padding">
                            <input type="password" name="" id="passWord" class="col-lg-12 col-md-12 password clear" value="" placeholder="密码"/>
                            <img src="${bath}/images/common/key.png"/>
                        </li>
                        <li class="col-lg-12 col-md-12 _padding _bottom">
                            <input type="checkbox" name="" id="haspassword" value="" style="vertical-align: middle;" />
                            <label for="haspassword" style="cursor: pointer;">记住密码</label>
                        </li>
                        <li class="col-lg-12 col-md-12 _padding">
                            <button type="button" class="btn loginbtn" data-loading-text="登录中...">登录</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script>

    $(document).ready(function() {

        var screenHeight = $(window).height() + "px";
        $(".container").css("height",screenHeight);

        //载入cookie
        if ($.cookie("rmbUser") == "true") {
            $("#haspassword").attr("checked", true);
            $("#userName").val($.cookie("username"));
            $("#passWord").val($.cookie("password"));
        }

        $(".loginbtn").click(function () {
            toastr.options = {
                "positionClass": "toast-login-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };
            var userName = $("#userName").val();
            if(userName == ""){
                toastr.error('请输入用户名！');
                return false;
            }
            var passWord = $("#passWord").val();
            if(passWord == ""){
                toastr.error('请输入密码！');
                return false;
            }

            $(".loginbtn").button('loading');

            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            $.ajax({
                type: "POST", //用POST方式传输
                url: '${bath}/account/login', //目标地址
                data: {
                    username : userName,
                    password : passWord
                },
                beforeSend: function (jqXHR) {
                    if (undefined != header) {
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType: "json", //数据格式:JSON
                success: function (retInfo) {
                    console.log(retInfo);
                    $(".loginbtn").button('reset');
                    if (retInfo.response.retCode == 0){
                        var accountData = retInfo.response.data;
                        var accountDataId = accountData.id;
                        var account = accountData.loginAccount;
                        sessionStorage.setItem("userId",accountDataId);
                        Save();
                        var url="${bath}/account/loginSuccess?username="+account;
                        window.open(url,"_self");
                    }else if (retInfo.response.retCode == 10005){
                        toastr.error('账号被禁用！');
                        return false;
                    }else if (retInfo.response.retCode == 10001){
                        toastr.error('用户名或密码错误！');
                        return false;
                    }
                },
                error:function(XMLHttpRequest, textStatus){
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $(".loginbtn").button('reset');
                    toastr.error('登录失败！');
                    return false;
                }
            });

        })
    });

    //记住用户名密码
    function Save() {
        if ($("#haspassword").is(':checked')) {
            var strUserName = $("#userName").val();
            var strPassWord = $("#passWord").val();
            $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
            $.cookie("username", strUserName, { expires: 7 });
            $.cookie("password", strPassWord, { expires: 7 });
        }
        else {
            $.cookie("rmbUser", "false", { expire: -1 });
            $.cookie("username", "", { expires: -1 });
            $.cookie("password", "", { expires: -1 });
        }
    }
</script>

