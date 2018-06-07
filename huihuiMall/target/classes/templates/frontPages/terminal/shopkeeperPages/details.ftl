<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>订单详情</title>

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/details.css" rel="stylesheet" type="text/css"/>
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
        <div class="col-lg-12 col-sm-12 col-xs-12 gap"></div>
        <div class="col-lg-12 col-sm-12 col-xs-12 padding number">
            <span class="black">订单编号：</span><span class="gray" id="orderNum"></span>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 padding name">
            <span class="black">下 &nbsp;单 &nbsp;人：</span><span class="gray" id="orderUser"></span>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 padding firstTime">
            <span class="black">下单日期：</span><span class="gray" id="orderStartTime"></span>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 padding centerTime">
            <span class="black">收货日期：</span><span class="gray" id="orderGoodsReceiptTime"></span>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 padding lastTime">
            <span class="black">取货日期：</span><span class="gray" id="orderPickUpTime"></span>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 gap"></div>
        <div class="col-lg-12 col-sm-12 col-xs-12 Detailedlist">
            <span class="black"><img src="${bath}/images/frontPages/common/Detailedlist.png"/> 商品清单</span>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 footer">

        </div>
    </div>
</div>
</body>
</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function () {

        var orderNumParam = ${orderNum!""};
        console.log(orderNumParam);
        getOrderDetailInfo(orderNumParam);

    });

    //获取订单详情
    function getOrderDetailInfo(orderNumber){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var orderNumberParam = orderNumber;

        $.ajax({
            type : "POST", //用GET方式请求
            url : '${bath}/frontorder/getFrontOrderDetail', //目标地址
            data : {
                orderNumber : orderNumberParam
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
                var orderData = retData.orderCustomer;

                var orderNum = orderData.orderNumber;
                var orderUser = orderData.phoneNumber;
                var orderStartTime = orderData.startTime;
                var orderGoodsReceiptTime = orderData.receiveTime;
                var orderPickUpTime = orderData.endTime;

                $("#orderNum").html(orderNum);
                $("#orderUser").html(orderUser);

                if(orderStartTime == null || orderStartTime == ""){
                    $("#orderStartTime").html("");
                }else{
                    var subOrderStartTime = orderStartTime.substring(0,10);
                    $("#orderStartTime").html(subOrderStartTime);
                }

                if(orderGoodsReceiptTime == null || orderGoodsReceiptTime == ""){
                    $("#orderGoodsReceiptTime").html("");
                }else{
                    var subOrderGoodsReceiptTime = orderGoodsReceiptTime.substring(0,10);
                    $("#orderGoodsReceiptTime").html(subOrderGoodsReceiptTime);
                }

                if(orderPickUpTime == null || orderPickUpTime == ""){
                    $("#orderPickUpTime").html("");
                }else{
                    var subOrderPickUpTime = orderPickUpTime.substring(0,10);
                    $("#orderPickUpTime").html(subOrderPickUpTime);
                }

                var goodsListsData = retData.list;
                var goodsListsDataLength = goodsListsData.length;

                $(".footer").empty();

                for(var i = 0; i < goodsListsDataLength; i++){

                    var goodsName = goodsListsData[i].name;
                    var goodsNumber = goodsListsData[i].number;
                    var goodsMainImagePath = goodsListsData[i].mainImagePath;

                    var goodsListHtml = "<div class='col-lg-12 col-sm-12 col-xs-12 goodsList'>";
                    goodsListHtml += "<img class='col-lg-3 col-sm-3 col-xs-3' src='${bath}/"+goodsMainImagePath+"' style='padding:0px' >";
                    goodsListHtml += "<div class='col-lg-7 col-sm-8 col-xs-7' style='padding:0px'>";
                    goodsListHtml += "<p class='Yahei_28'>"+goodsName+"</p>";
                    goodsListHtml += "<p class='Yahei_24'>数量："+goodsNumber+"</p>";
                    goodsListHtml += "</div>";
                    goodsListHtml += "</div>";

                    $(".footer").append(goodsListHtml);
                }

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
</script>