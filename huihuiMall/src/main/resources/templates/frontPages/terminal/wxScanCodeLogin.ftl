<!DOCTYPE html>
    <html lang="en">
    <head>
    <#assign bath=request.getContextPath()>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="format-detection" content="telephone=no, email=no"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp"/>
        <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
        <title>惠惠商城微信扫码登录</title>
        <style type="text/css">
            body {
                background-color: gray;
                text-align: center;
            }

            .main {
                width: 370px;
                height: 460px;
                background-color: white;
                top: 50%;
                left: 50%;
                text-align: center;
                position: absolute;
                border-radius: 4px;
                margin-left: -185px;
                margin-top: -230px;
            }

            .title {
                padding: 20px;
                font-size: 20px;
            }
        </style>
    </head>

<body>
<div class="main" style="display: none">
    <div class="title" style="display: none">
        <img id="qrcode" alt="" src="">
    </div>
    <div id="result" class="title" style="display: none"></div>
</div>
<div class="title">
    <img style="width: 70px; height: 70px;" src="${bath}/images/frontpages/common/adopt.png">
</div>
<div class="title" style="font-size: 20px">扫码成功</div>
</body>
<script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
<script type="application/javascript">
    $(function(){
        $.post("${bath}/wxScanCodeLogin/weixin",function(data){
            var ma = data.shorturl;
            var srcMa = "http://qr.topscan.com/api.php?text="+ma;
            //将生成的二维码放到div里
            $("#qrcode").attr("src", srcMa);
            $("#result").html("使用手机扫描二维码");
        });
        //置初始值
        $.post("${bath}/wxScanCodeLogin/type",{"a":0});
        panduan();
    })
    //微信扫码是否成功的判断
    var test = 0;
    function panduan(){
        $.post("${bath}/wxScanCodeLogin/successDL",function(data){
            if(data.type==1){
                $.ajax({
                    type : "POST", //用POST方式请求
                    url : '${bath}/Portalcustomer/WeChatAuthLand', //目标地址
                    data : {
                        openid : data.openId
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
                            var navTypeParam = 0;
                            var url ="${bath}/portalLink/linkToSignin?navType="+navTypeParam;
                            window.open(url,"_self");
                        }else{
                            toastr.error("授权失败！");
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
                toastr.error('登录码已失效，请刷新页面更新验证码！！');
                $.post("${bath}/wxScanCodeLogin/type",{"a":5});
            }
        });
    }
</script>

</html>
