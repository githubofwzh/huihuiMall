<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>我的订单</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/MyStore.css" rel="stylesheet" type="text/css"/>
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
</head>
<body>
<#include "nav.ftl">
<div class="container-fluid minute">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="col-lg-12 col-sm-12 col-xs-12 padding_zero store_title">
                <span>我的订单</span>
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 store_main">


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

    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function () {

        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var footerHeight = $(".footer").height();
        var goodsHeight = screenHeight - navPanelHeight - footerHeight + 110  + "px";

        $(".minute").css("height",goodsHeight);


        var id = $.cookie("userId");
        ObtainList(id);
    });

    //查看订单
    function ObtainList(id) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalallOrder/getAllOrder', //目标地址
            data : {
                userId : id
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                $(".store_main").empty();
                var retData = retInfo.data.list;
                var retDataLength = retData.length;
                for (var i = 0; i < retDataLength; i++){
                    var retOderNumber = retData[i].order_number;
                    var retOrdeRstatus = retData[i].orderstatus;
                    var retStartTime = retData[i].start_time;
                    var retDataTime = retStartTime.substring(0,10);
                    var retStoreName = retData[i].storename;
                    var retTotal = retData[i].ordertotal;
                    var retType = retData[i].type;
                    var retZt = "";
                    var retYy = "";
                    if (retType == 1){
                        retYy = "第三方商家"
                    }else {
                        retYy = "慧慧自营"
                    }
                    if (retOrdeRstatus == 1){
                        retZt = "未支付"
                    }else if (retOrdeRstatus == 2){
                        retZt = "已取消"
                    }else if (retOrdeRstatus == 3){
                        retZt = "已支付"
                    }else if (retOrdeRstatus == 4){
                        retZt = "已出库"
                    }else if (retOrdeRstatus == 5){
                        retZt = "已到店"
                    }else if (retOrdeRstatus == 6){
                        retZt = "已完成"
                    }else {
                        retZt = "已分配"
                    }
                    var firstClassifyHtml = "<div class='col-lg-12 col-sm-12 col-xs-12 padding_zero store_for'>";
                    firstClassifyHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 padding_zero' style='padding: 0 20px'>";
                    firstClassifyHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 padding_zero store_data'>";
                    firstClassifyHtml += "<p><label><img src='${bath}/images/frontpages/common/OrderNumber_zz.png' /> 订单号：</label><span>"+retOderNumber+"</span></p>";
                    firstClassifyHtml += "<p><label><img src='${bath}/images/frontpages/common/OrderStatus.png' /> 订单状态：</label><span>"+retZt+"</span></p>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 padding_zero store_data' style='border-right: 1px solid #dcdcdc'>";
                    firstClassifyHtml += "<p><label><img src='${bath}/images/frontpages/common/Date_zz.png' /> 日期：</label><span>"+retDataTime+"</span></p>";
                    firstClassifyHtml += "<p><label><img src='${bath}/images/frontpages/common/stor_zz.png' /> 门店：</label><span>"+retStoreName+"</span></p>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 padding_zero store_more text-right'>";
                    firstClassifyHtml += "<span>总价：<i class='fa fa-yen'></i><span class='store_money'>"+retTotal+"</span><span></span></span>";
                    firstClassifyHtml += "<a class='a"+retOderNumber+"' onclick='viewMore("+retOderNumber+");'>查看详情</a>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div style='display: none;' class='col-lg-12 col-md-12 col-xs-12 more-detail xiangqing' id='Hided1"+retOderNumber+"'>";

                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    $(".store_main").append(firstClassifyHtml);
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

    //查看详情
    function viewMore(id) {
        console.log(id);
        if ($("#Hided1"+id).css("display") == "none"){
            $("#Hided1"+id).show();
            $(".a"+id).text("关闭详情");
            $.ajax({
                type : "POST", //用POST方式请求
                url : '${bath}/PortalallOrder/getDetail', //目标地址
                data : {
                    orderNumber : id
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
                    $(".xiangqing").empty();
                    for (var i = 0; i < retDataLength; i++ ){
                        var retImg = retData[i].main_image_path;
                        var retName = retData[i].name;
                        var retNumber = retData[i].number;
                        var retTotal = retData[i].total;
                        var firstClassifyHtml = "<div class='col-lg-12 col-sm-12 col-xs-12 padding_zero view_main'>";
                        firstClassifyHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 padding_zero view_left'>";
                        firstClassifyHtml += "<img class='col-lg-5 col-sm-5 col-xs-5 padding_zero' src='${bath}"+retImg+"'>";
                        firstClassifyHtml += "<p class='col-lg-7 col-sm-7 col-xs-7 padding_zero'>"+retName+"</p>";
                        firstClassifyHtml += "</div>";
                        firstClassifyHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 padding_zero view_center'>";
                        firstClassifyHtml += "<span>数量："+retNumber+"</span>";
                        firstClassifyHtml += "</div>";
                        firstClassifyHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 padding_zero view_right'>";
                        firstClassifyHtml += "<span>小计：<i class='fa fa-yen'></i>"+retTotal+"</span>";
                        firstClassifyHtml += "</div>";
                        firstClassifyHtml += "</div>";
                        $(".xiangqing").append(firstClassifyHtml);
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
        }else{
            $("#Hided1"+id).hide();
            $(".a"+id).text("展开详情");
        }
    }
</script>
