<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title></title>
</head>
<body>
<div class="nav-panel">
    <div class="container-fluid">
        <div class="row">
            <div class="title col-lg-12 col-xs-12 col-sm-12">
                <img class="col-lg-3 col-xs-3 col-sm-3 img-responsive" style="padding: 0" src="${bath}/images/frontpages/common/logo.png" />
                <div class="col-lg-9 col-xs-9 col-sm-9 user text-right right" style="padding: 0">
                    <span class="hellowPhone"></span>
                    <button onclick="linkToShoppingCar();" class="shoppingCar"><img src="${bath}/images/frontpages/common/ShopCar.png" />我的购物车<span class="buy-count"></span></button>
                    <button onclick="linkToMyStoreSelfHelp();" class="Mystore"><img src="${bath}/images/frontpages/common/Order_zz.png" />我的订单</button>
                    <button onclick="linkToLivingPayment();" class="Mystore"><i class="fa fa-rmb fa-fw"></i>生活缴费</button>
                    <button onclick="SignOut();" class="return"><img src="${bath}/images/frontpages/common/SignOut.png" /><span class="loginType"></span></button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    var userId = $.cookie("userId");
    $(document).ready(function() {
        if(userId != undefined){
            $(".loginType").text("退出");
            $(".hellowPhone").text("欢迎您，"+$.cookie("phone"));
        }else{
            $(".loginType").text("登录");
            $(".hellowPhone").css("display","none");
        }

        cookieNumber();

    });
    function cookieNumber() {
        if ($.cookie("commodity") == null || $.cookie("commodity") == "") {
            $(".buy-count").css("display","none");
        }else {
            var jsonObj = eval('(' + $.cookie("commodity") + ')');
            var cookieJsonData = jsonObj.length;
            var goodsNumber = 0;
            for (var i = 0; i < cookieJsonData; i++){
                var commodityNumber = jsonObj[i].commodity_number;
                goodsNumber += parseInt(commodityNumber);
            }
            $(".buy-count").css("display","block");
            $(".buy-count").text(goodsNumber);
        }
    }

    //跳转结算页
    function linkToShoppingCar(){
        var navTypeParam = 6;
        var url = "${bath}/portalLink/linkToShoppingCar?navType="+navTypeParam;
        window.open(url,"_self");
    }

    //跳转我的订单页
    function linkToMyStoreSelfHelp(){
        var navTypeParam = 7;
        var url = "${bath}/portalLink/linkToMyStoreSelfHelp?navType="+navTypeParam;
        window.open(url,"_self");
    }

    function SignOut() {
        if($(".loginType").text() == "退出"){
            $.cookie("commodity",null,{expires: -1});
            $.cookie("phone",null,{expires: -1});
            $.cookie("userId",null,{expires: -1});
            var navTypeParam = 1;
            var url ="${bath}/portalLink/logout?navType="+navTypeParam;
            window.open(url,"_self");
        }else if($(".loginType").text() == "登录"){
            var navTypeParam = 0;
            var url ="${bath}/portalLink/linkToSignin?navType="+navTypeParam;
            window.open(url,"_self");
        }
    }

    //跳转生活缴费
    function linkToLivingPayment() {
        var url = "${bath}/portalLink/linkToLivingPayment";
        window.open(url,"_self");
    }

</script>