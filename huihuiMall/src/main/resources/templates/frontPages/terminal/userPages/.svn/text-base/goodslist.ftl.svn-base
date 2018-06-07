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
    <link href="${bath}/css/frontpages/terminal/userPagesCss/goodslist.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/swiper/swiper.min.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/swiper/swiper.min.js" type="text/javascript"></script>
    <style>
        .swiper-button-prev{
            background-image: url("${bath}/images/frontpages/common/left-arrow-icon.png") !important;
            background-size: 100% 100%;
        }
        .swiper-button-next{
            background-image: url("${bath}/images/frontpages/common/right-arrow-icon.png") !important;
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<label id="classifyIdParam" style="display: none">${classifyId!""}</label>
<container>
    <section>
        <div class="container-fluid top-panel">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 search-panel">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-search fa-fw"></i></span>
                        <input type="text" class="form-control Search" placeholder="请输入关键字">
                        <button onclick="VagueSearch();">搜索</button>
                    </div>
                </div>

                <div class="col-lg-12 col-md-12 col-xs-12 brand-panel">
                    <div class="col-lg-1 col-md-1 col-xs-1 brand-title">
                        <span>品牌</span>
                    </div>
                    <div class="col-lg-11 col-md-11 col-xs-11" style="padding: 0">
                        <div class="col-lg-2 col-md-2 col-xs-2">
                            <div class="swiper-button-prev"></div>
                        </div>
                        <div class="col-lg-8 col-md-8 col-xs-8" style="padding: 0px">
                            <div class="swiper-container" id="sidebar">
                                <ul class="swiper-wrapper" id="liappend">

                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-xs-2">
                            <div class="swiper-button-next"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 goods-list-panel">

                </div>
            </div>
        </div>

        <#--<#include "nav.ftl">-->
    </section>
</container>
</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var twoLevel = '${classifyId!""}';
    $(document).ready(function() {

        var screenHeight = $(window).height();
        var topPanelHeight = $(".top-panel").height();
        var navPanelHeight = $(".nav-panel").height();
        var twoId = $("#classifyIdParam").text();
        var goodsNavHeight = screenHeight - (topPanelHeight + navPanelHeight) - 5 + "px";

        ListAjax(twoId);
        BrandAjax(twoId);

    });

    //跳转商品详情
    function linkToGoodsDetail(goodsId){
        var goodsIdParam = goodsId;
        var navTypeParam = 1;
        var url = "${bath}/portalLink/linkToGoodsDetail?goodsId="+goodsIdParam+"&navType="+navTypeParam;
        window.open(url,"_self");
    }

    //列表ajax
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
                var retData = retInfo.data.list;
                var retDataLength = retData.length;

                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id;
                    var retprId = retData[i].prId;
                    var retImg = retData[i].main_image_path;
                    var retName = retData[i].pr_name;
                    var retMoney = retData[i].price;
                    var retType = retData[i].merchant_type;
                    var retYy = "";
                    if (retType == 1){
                        retYy = "第三方商家"
                    }else {
                        retYy = "惠惠自营"
                    }
                    var firstClassifyHtml = "<div class='col-lg-12 col-md-12 col-xs-12 goods-list' onclick='linkToGoodsDetail("+retprId+")'>";
                    firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 goods-intro-img'>";
                    firstClassifyHtml += "<img src='${bath}/"+retImg+"' alt='' class='img-responsive' />";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 goods-intro'>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-name'>";
                    firstClassifyHtml += "<span>"+retName+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-type'>";
                    firstClassifyHtml += "<span>"+retYy+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-price'>"
                    firstClassifyHtml += "<span>"+"<i class='fa fa-cny fa-fw'></i>"+"<label>"+retMoney+"</label></span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";

                    $(".goods-list-panel").append(firstClassifyHtml);
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

    //商品品牌搜索ajax
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
                var retData = retInfo.data.list;
                var retDataLength = retData.length;
                for (var i = 0; i < retDataLength; i++){
                    var retName = retData[i].name;
                    var retId = retData[i].id;
                    var BrandHtml = "<li class='swiper-slide brand-item' onclick='BrandSearch("+retId+","+twoId+");'><span>"+retName+"</span></li>";
                    $("#liappend").append(BrandHtml);
                }

                //品牌滚动、选中
                var swiper = new Swiper('.swiper-container', {
                    nextButton: '.swiper-button-next',
                    prevButton: '.swiper-button-prev',
                    paginationClickable: true,
                    slidesPerView: 3,
                    spaceBetween: 10
                });

                $("#sidebar ul li").click(function(){
                    $(this).addClass('active').siblings('li').removeClass('active');
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
                $(".goods-list-panel").empty();
                var retData = retInfo.data.list;
                var retDataLength = retData.length;

                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id;
                    var retprId = retData[i].prId;
                    var retImg = retData[i].main_image_path;
                    var retName = retData[i].pr_name;
                    var retMoney = retData[i].price;
                    var retType = retData[i].merchant_type;
                    var retYy = "";
                    if (retType == 1){
                        retYy = "第三方商家"
                    }else {
                        retYy = "惠惠自营"
                    }
                    var firstClassifyHtml = "<div class='col-lg-12 col-md-12 col-xs-12 goods-list' onclick='linkToGoodsDetail("+retprId+")'>";
                    firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 goods-intro-img'>";
                    firstClassifyHtml += "<img src='${bath}/"+retImg+"' alt='' class='img-responsive' />";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 goods-intro'>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-name'>";
                    firstClassifyHtml += "<span>"+retName+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-type'>";
                    firstClassifyHtml += "<span>"+retYy+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-price'>";
                    firstClassifyHtml += "<span>"+"<i class='fa fa-cny fa-fw'></i>"+"<label>"+retMoney+"</label></span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";

                    $(".goods-list-panel").append(firstClassifyHtml);
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

    //模糊搜索
    function VagueSearch() {
        var SearchVal = $(".Search").val();
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getProductByTwoid', //目标地址
            data : {
                twoId : twoLevel,
                name : SearchVal
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                $(".goods-list-panel").empty();
                var retData = retInfo.data.list;
                var retDataLength = retData.length;

                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id;
                    var retprId = retData[i].prId;
                    var retImg = retData[i].main_image_path;
                    var retName = retData[i].pr_name;
                    var retMoney = retData[i].price;
                    var retType = retData[i].merchant_type;
                    var retYy = "";
                    if (retType == 1){
                        retYy = "第三方商家"
                    }else {
                        retYy = "惠惠自营"
                    }
                    var firstClassifyHtml = "<div class='col-lg-12 col-md-12 col-xs-12 goods-list' onclick='linkToGoodsDetail("+retprId+")'>";
                    firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 goods-intro-img'>";
                    firstClassifyHtml += "<img src='${bath}/"+retImg+"' alt='' class='img-responsive' />";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 goods-intro'>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-name'>";
                    firstClassifyHtml += "<span>"+retName+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-type'>";
                    firstClassifyHtml += "<span>"+retYy+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-price'>"
                    firstClassifyHtml += "<span>"+"<i class='fa fa-cny fa-fw'></i>"+"<label>"+retMoney+"</label></span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";

                    $(".goods-list-panel").append(firstClassifyHtml);
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