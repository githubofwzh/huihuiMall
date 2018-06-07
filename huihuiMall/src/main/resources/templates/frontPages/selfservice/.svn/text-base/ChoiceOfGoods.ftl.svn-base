<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>商品列表</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/ChoiceOfGoods.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/swiper/swiper.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/footer.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/swiper/swiper.min.js" type="text/javascript"></script>
    <style>
        .swiper-button-prev{
            background-image: url("${bath}/images/frontpages/common/left_orange.png");
            background-size: 100%;
            margin-top: -16px;
        }
        .swiper-button-next{
            background-image: url("${bath}/images/frontpages/common/right_orange.png");
            background-size: 100%;
            margin-top: -16px;
        }
        .brand-item{
            height:40px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
    <#include "nav.ftl">

        <div class="col-lg-12 col-xs-12 col-sm-12 theme">
            <div class="col-lg-12 col-md-12 col-xs-12 theme_title">
                <div class="col-lg-1 col-md-1 col-xs-1 brand-title">
                    <span>品牌</span>
                </div>
                <div class="col-lg-11 col-md-11 col-xs-11 search">
                    <div class="col-lg-1 col-md-1 col-xs-1">
                        <div class="swiper-button-prev"></div>
                    </div>
                    <div class="col-lg-10 col-md-10 col-xs-10" style="padding: 0px">
                        <div class="swiper-container" id="sidebar">
                            <ul class="swiper-wrapper" id="liappend">


                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-1 col-md-1 col-xs-1">
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-xs-12 brand-panel">
                <div class="col-lg-12 col-xs-12 col-sm-12 CommodityDetails">

                </div>

            </div>
        </div>
    </div>
</div>
</body>
<#include "footer.ftl">
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var twoId = '${classifyId!""}';

    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function () {
        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var footerHeight = $(".footer").height();
        var themeHeight = screenHeight - navPanelHeight - footerHeight + 110 + "px";
        var brandPanelHeight = screenHeight - 320 + "px";
        $(".theme").css("height",themeHeight);
        $(".brand-panel").css("height",brandPanelHeight);
        ListAjax(twoId);
        BrandAjax(twoId);
    });
    //跳转商品详情
    function linkToGoodsDetail(goodsId){
        var goodsIdParam = goodsId;
        var navTypeParam = 4;
        var url = "${bath}/portalLink/linkToShopMinute?goodsId="+goodsIdParam+"&navType="+navTypeParam;
        window.open(url,"_self");
    }
    //列表AJAX
    function ListAjax(twoId) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getProductByTwoid', //目标地址
            data : {
                twoId : twoId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                $(".CommodityDetails").empty();
                var retData = retInfo.data.list;
                var retDataLength = retData.length;
                for (var i = 0; i < retDataLength; i++){
                    var retImg = retData[i].main_image_path;
                    var retName = retData[i].pr_name;
                    var retType = retData[i].merchant_type;
                    var retMoney = retData[i].price;
                    var retprId = retData[i].prId;
                    var retYy = "";
                    if (retType == 1){
                        retYy = "第三方商家"
                    }else {
                        retYy = "惠惠自营"
                    }
                    var firstListHtml = "<div class='col-lg-2 col-xs-2 col-sm-2 paddingZero shop_main' onclick='linkToGoodsDetail("+retprId+")'>";
                    firstListHtml += "<div class='col-lg-12 col-xs-12 col-sm-12 shopImg'><img src='${bath}/"+retImg+"' /></div>";
                    firstListHtml += "<div class='col-lg-12 col-xs-12 col-sm-12 paddingZero shopDetails'>";
                    firstListHtml += "<p class='shop_money'><i class='fa fa-yen'></i>"+retMoney+"<span><span>";
                    firstListHtml += "<p class='shop_name'>"+retName+"</p>";
                    firstListHtml += "<div class='type_sp'>"+retYy+"</div>";
                    firstListHtml += "</div>";
                    firstListHtml += "</div>";
                    $(".CommodityDetails").append(firstListHtml);
                }
                var retUser = retInfo.data.userInfo;
                if(retUser != null){
                    var retPhoneNumber = retUser.phoneNumber;
                    $(".hellowPhone").text("欢迎您，"+retPhoneNumber);
                }else{
                    $(".hellowPhone").css("display","none");
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
    //品牌AJAX
    function BrandAjax(twoId) {
        console.log(twoId);
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getAllBrand', //目标地址
            data : {
                brId : twoId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                $("#liappend").empty();
                $("#liappend").prepend("<li class='swiper-slide brand-item active' onclick='ListAjax("+twoId+");'><span>全部</span></li>");
                var retData = retInfo.data.list;
                var retDataLength = retData.length;
                for (var i = 0; i < retDataLength; i++){
                    var retName = retData[i].name;
                    var retId = retData[i].id;
                    var BrandHtml = "<li class='swiper-slide brand-item' onclick='BrandSearch("+retId+","+twoId+");'><span>"+retName+"</span></li>";
                    $("#liappend").append(BrandHtml);
                }
                $("#sidebar ul li").click(function(){
                    $(this).addClass('active').siblings('li').removeClass('active');
                });


                var swiper = new Swiper('.swiper-container', {
                    nextButton: '.swiper-button-next',
                    prevButton: '.swiper-button-prev',
                    paginationClickable: true,
                    slidesPerView: 8,
                    spaceBetween: 18
                });


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
    //品牌搜索
    function BrandSearch(retId,twoId) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getProductByTwoid', //目标地址
            data : {
                twoId : twoId,
                brId : retId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                $(".CommodityDetails").empty();
                var retData = retInfo.data.list;
                var retDataLength = retData.length;
                for (var i = 0; i < retDataLength; i++){
                    var retImg = retData[i].main_image_path;
                    var retName = retData[i].pr_name;
                    var retType = retData[i].merchant_type;
                    var retMoney = retData[i].price;
                    var retprId = retData[i].prId;
                    var retYy = "";
                    if (retType == 1){
                        retYy = "第三方商家"
                    }else {
                        retYy = "惠惠自营"
                    }
                    var firstListHtml = "<div class='col-lg-2 col-xs-2 col-sm-2 paddingZero shop_main' onclick='linkToGoodsDetail("+retprId+")'>";
                    firstListHtml += "<div class='col-lg-12 col-xs-12 col-sm-12 shopImg'><img src='${bath}/"+retImg+"' /></div>";
                    firstListHtml += "<div class='col-lg-12 col-xs-12 col-sm-12 paddingZero shopDetails'>";
                    firstListHtml += "<p class='shop_money'><i class='fa fa-yen'></i>"+retMoney+"<span><span>";
                    firstListHtml += "<p class='shop_name'>"+retName+"</p>";
                    firstListHtml += "<div class='type_sp'>"+retYy+"</div>";
                    firstListHtml += "</div>";
                    firstListHtml += "</div>";
                    $(".CommodityDetails").append(firstListHtml);
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

</script>
