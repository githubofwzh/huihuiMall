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

    <label id="navType" style="display: none;">${navType!''}</label>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12 nav-panel">
                <div class="col-lg-3 col-md-3 col-xs-3 nav" onclick="linkToIndex();">
                    <div class="col-lg-12 col-md-12 col-xs-12 nav-item mall">
                        <img src="${bath}/images/frontpages/nav/mall-icon-h.png" alt=""/>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12 nav-item mall">
                        <span>商城</span>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-xs-3 nav" onclick="linkToSettlement();">
                    <div class="col-lg-12 col-md-12 col-xs-12 nav-item shoppingcar">
                        <img src="${bath}/images/frontpages/nav/shoppingcar-icon-h.png" alt=""/>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12 nav-item shoppingcar">
                        <span>购物车</span>
                    </div>
                    <div class="buy-count">
                        <span></span>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-xs-3 nav" onclick="linkToMineOrders();">
                    <div class="col-lg-12 col-md-12 col-xs-12 nav-item mineorder">
                        <img src="${bath}/images/frontpages/nav/order-icon-h.png" alt=""/>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12 nav-item mineorder">
                        <span>我的订单</span>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-xs-3 nav" onclick="linkToSaleService();">
                    <div class="col-lg-12 col-md-12 col-xs-12 nav-item saleservice">
                        <img src="${bath}/images/frontpages/nav/saleservice-icon-h.png" alt=""/>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12 nav-item saleservice">
                        <span>售后服务</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script>

    $(document).ready(function() {
        var navTypeParam = $("#navType").text();
        console.log(navTypeParam);
        if(navTypeParam == 1){
            $(".mall img").attr("src","${bath}/images/frontpages/nav/mall-icon-l.png");
            $(".mall span").css("color","#c57030");
        }else if(navTypeParam == 2){
            $(".shoppingcar img").attr("src","${bath}/images/frontpages/nav/shoppingcar-icon-l.png");
            $(".shoppingcar span").css("color","#c57030");
        }else if(navTypeParam == 3){
            $(".mineorder img").attr("src","${bath}/images/frontpages/nav/order-icon-l.png");
            $(".mineorder span").css("color","#c57030");
        }else{
            $(".saleservice img").attr("src","${bath}/images/frontpages/nav/saleservice-icon-l.png");
            $(".saleservice span").css("color","#c57030");
        }
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
            $(".buy-count span").text(goodsNumber);
        }
    });


    //跳转结算页
    function linkToIndex(){
        var navTypeParam = 1;
        var url = "${bath}/portalLink/linkToUserTerminalIndex?navType="+navTypeParam;
        window.open(url,"_self");
    }

    //跳转结算页
    function linkToSettlement(){
        var navTypeParam = 2;
        var url = "${bath}/portalLink/linkToGoodsSettlement?navType="+navTypeParam;
        window.open(url,"_self");
    }

    //跳转我的订单页
    function linkToMineOrders(){
        var navTypeParam = 3;
        var url = "${bath}/portalLink/linkToMineOrders?navType="+navTypeParam;
        window.open(url,"_self");
    }

    //跳转售后服务页
    function linkToSaleService(){
        var navTypeParam = 4;
        var url = "${bath}/portalLink/linkToSaleService?navType="+navTypeParam;
        window.open(url,"_self");
    }
</script>