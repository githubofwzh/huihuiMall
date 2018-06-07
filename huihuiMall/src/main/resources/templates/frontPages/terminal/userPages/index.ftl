<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>惠惠网店</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/index.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<label id="uid" style="display: none">${uid!""}</label>
    <container>
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-xs-12 top-panel">
                        <span><i class="fa fa-user fa-fw"></i> 您好！<span id="phone_number"></span></span>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-xs-12 goods-nav-panel" id="sidebar">
                        <ul class="col-lg-3 col-md-3 col-xs-3 goods-nav">

                        </ul>
                        <div class="col-lg-9 col-md-9 col-xs-9 goods-classify-panel" id="goodsClassify">



                        </div>
                    </div>
                </div>
            </div>
            <#include "nav.ftl">
        </section>
    </container>
</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var str='${phone!""}';
    var phone_replace = str.replace(/\,/g,'');
    $("#phone_number").text(phone_replace);

    $(document).ready(function() {
        var screenHeight = $(window).height();
        var topPanelHeight = $(".top-panel").height();
        var navPanelHeight = $(".nav-panel").height();

        var goodsNavHeight = screenHeight - (topPanelHeight + navPanelHeight) - 10 + "px";
        var goodsClassifyPanelHeight = screenHeight - (topPanelHeight + navPanelHeight) - 10 + "px";

        $(".goods-nav").css("height",goodsNavHeight);
        $(".goods-classify-panel").css("height",goodsClassifyPanelHeight);




        //一级列表
        getToOneList();

        //进首页调取默认列表样式
        getToDefaultList();


    });



    //一级列表
    function getToOneList() {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getAll', //目标地址
            data : {

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
                var retUser = retInfo.data.userInfo;
                var retDataLength = retData.length;

                retData.sort(function(a,b){
                    return a.sort - b.sort;
                })
                 for (var i = 0; i < retDataLength; i++){
                    var id = retData[i].id;  //列表ID
                    var navName = retData[i].name;  //列表名称
                    var sort =  retData[i].sort;  //列表序号
                    var firstClassifyHtml = "<li class='col-lg-12 col-md-12 col-xs-12 goods-nav-item' name='"+sort+"' id='"+id+"'>";
                            firstClassifyHtml += "<span>"+navName+"</span>";
                            firstClassifyHtml += "</li>";
                    $(".goods-nav").append(firstClassifyHtml);
                };



                $("#sidebar ul li").eq(0).addClass('active');
                $("#sidebar ul li").click(function() {
                    $(this).addClass('active').siblings('li').removeClass('active');
                    var classifyId = $(this).attr("id");
                    getSecondClassifyInfo(classifyId);
                });
                var ueserNameCookie = retUser.phoneNumber;
                var ueserIDCookie = retUser.userId;
                $.cookie("uesrName",ueserNameCookie);
                $.cookie("uesrId",ueserIDCookie);
                $("#phone_number").text(retUser.phoneNumber);
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        });
    }

    //进首页调取默认列表样式
    function getToDefaultList() {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getOneAndTwo', //目标地址
            data : {
                id : 1,
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                $("#goodsClassify").empty();
                var retData = retInfo.data.list;
                var retUserInfo = retInfo.data.userInfo;
                var retPhoneNumber = retUserInfo.phoneNumber;
                var retDataLength = retData.length;
                $("#phone_number").text(retPhoneNumber);
                retData.sort(function(a,b){
                    return a.twosort - b.twosort;
                });


                for (var i = 0; i < retDataLength; i++){
                    var id = retData[i].twoid;
                    var navName = retData[i].twoname;
                    var sort =  retData[i].twosort;
                    var retImg =  retData[i].image;
                    var firstClassifyHtml = "<div class='col-lg-4 col-md-4 col-xs-4 goods-item' name='"+sort+"' onclick='linkToClassify("+id+")'>";

                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods'>";
                    firstClassifyHtml += "<img src='${bath}"+retImg+"' alt=''/>";
                    firstClassifyHtml += "</div>";

                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods'>";
                    firstClassifyHtml += "<span>"+navName+"</span>";
                    firstClassifyHtml += "</div>";

                    firstClassifyHtml += "</div>";

                    $("#goodsClassify").append(firstClassifyHtml);


                }

            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        });
    }

    //跳转商品列表
    function linkToClassify(classifyId){
        var navTypeParam = 1;
        var classifyIdParam = classifyId;
        var uid = $("#uid").val();
        var phone_number=$("#phone_number").text();
        var url = "${bath}/portalLink/linkToGoodsList?navType="+navTypeParam+"&classifyId="+classifyIdParam+"&uid="+"${uid!""}"+"&phone="+phone_number;
        window.open(url,"_self");
    }

    //获取二级分类方法
    function getSecondClassifyInfo(erjiId) {
        var erjiIdParam = erjiId;

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getOneAndTwo', //目标地址
            data : {
                id : erjiIdParam,
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
                if (retData[0].twoid == null){
                    $("#goodsClassify").empty();
                }else {
                    retData.sort(function(a,b){
                        return a.twosort - b.twosort;
                    });


                    for (var i = 0; i < retDataLength; i++){
                        var id = retData[i].twoid;
                        var navName = retData[i].twoname;
                        var sort =  retData[i].twosort;
                        var retImg =  retData[i].image;
                        var firstClassifyHtml = "<div class='col-lg-4 col-md-4 col-xs-4 goods-item' name='"+sort+"' onclick='linkToClassify("+id+")'>";

                        firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods'>";
                        firstClassifyHtml += "<img src='${bath}"+retImg+"' alt=''/>";
                        firstClassifyHtml += "</div>";

                        firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods'>";
                        firstClassifyHtml += "<span>"+navName+"</span>";
                        firstClassifyHtml += "</div>";

                        firstClassifyHtml += "</div>";

                        $("#goodsClassify").append(firstClassifyHtml);


                    }

                }

            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        });

        $("#goodsClassify").empty();
    }

</script>