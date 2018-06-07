<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>订单记录</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/orderrecord.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 search">
            <div class="col-lg-10 col-sm-10 col-xs-10" style="padding:0px">
                <input type="text" class="search_email col-xs-12" id="orderNumKey" placeholder="请输入订单号" />
            </div>
            <div class="col-lg-2 col-sm-2 col-xs-2" style="padding:0px 0px 0px 10px">
                <button class="btn btn-primary search-confirm-btn" onclick="searchByOrderNum();">
                    <span>搜索</span>
                </button>
            </div>
        </div>

        <div class="col-lg-12 col-sm-12 col-xs-12 finishedOrderPanel">

        </div>
    </div>

</div>
</body>
</html>

<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function () {

        var storeId = ${storeId!""}
        getAllFinishedOrderInfo(storeId);

    });

    //获取订单详情
    function getAllFinishedOrderInfo(storeId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storeIdParam = storeId;
        var orderNumKeyParam = $("#orderNumKey").val();
        console.log(orderNumKeyParam);

        $.ajax({
            type : "POST", //用GET方式请求
            url : '${bath}/frontorder/getOrderByStoreId', //目标地址
            data : {
                storeId : storeIdParam,
                orderNumber : orderNumKeyParam,
                orderstatus : 6
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
                var retDataLength = retData.length;

                $(".finishedOrderPanel").empty();

                for(var i = 0; i < retDataLength; i++){

                    var orderNumber = retData[i].order_number;
                    var phoneNumber = retData[i].phone_number;
                    var startTime = retData[i].start_time;
                    var shouHuoTime = retData[i].receive_time;
                    var endTime = retData[i].end_time;

                    var orderRecordsHtml = "<div class='col-lg-12 col-sm-12 col-xs-12 finishedOrder'>";
                    orderRecordsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 black'></div>";
                    orderRecordsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 number'>";
                    orderRecordsHtml += "<span>订单号："+orderNumber+"</span>";
                    orderRecordsHtml += "<b class='green text-right'>已完成</b>";
                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 time'>";
                    orderRecordsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12' style='padding:5px 0px'>";
                    orderRecordsHtml += "<div class='col-lg-6 col-sm-6 col-xs-6' style='border-right: 1px solid #444444'>";
                    orderRecordsHtml += "<span>下单人："+phoneNumber+"</span>";
                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "<div class='col-lg-6 col-sm-6 col-xs-6'>";
                    if(startTime == null || startTime == ""){
                        orderRecordsHtml += "<span>下单日期：</span>";
                    }else{
                        var subStartTime = startTime.substring(0,10);
                        orderRecordsHtml += "<span>下单日期："+subStartTime+"</span>";
                    }
                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12' style='padding:5px 0px'>";
                    orderRecordsHtml += "<div class='col-lg-6 col-sm-6 col-xs-6' style='border-right: 1px solid #444444'>";
                    if(shouHuoTime == null || shouHuoTime == ""){
                        orderRecordsHtml += "<span>收货日期：</span>";
                    }else{
                        var subShouHuoTime = shouHuoTime.substring(0,10);
                        orderRecordsHtml += "<span>收货日期："+subShouHuoTime+"</span>";
                    }

                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "<div class='col-lg-6 col-sm-6 col-xs-6'>";
                    if(endTime == null || endTime == ""){
                        orderRecordsHtml += "<span>取货日期：</span>";
                    }else{
                        var subEndTime = endTime.substring(0,10);
                        orderRecordsHtml += "<span>取货日期："+subEndTime+"</span>";
                    }

                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 more'>";
                    orderRecordsHtml += "<a href='javascript:void(0);' onclick='linkToOrderDetail(\""+orderNumber+"\");'>查看详情<img src='${bath}/images/frontPages/common/More.png' /></a>";
                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "</div>";
                    orderRecordsHtml += "</div>";

                    $(".finishedOrderPanel").append(orderRecordsHtml);
                }

                $("#orderNumKey").val("");

            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("查询失败！");
                return false;
            }
        });

    }

    //跳转订单详情
    function linkToOrderDetail(orderNum){
        var orderNumParam = orderNum;
        console.log(orderNumParam);
        var url = "${bath}/portalLink/linkToOrderDetail?orderNum="+orderNumParam;
        window.open(url,"_self");
    }

    //搜索
    function searchByOrderNum(){
        getAllFinishedOrderInfo();
    }
</script>