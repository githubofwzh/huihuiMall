<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>取货</title>

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/pickup.css" rel="stylesheet" type="text/css"/>
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

        <div class="col-lg-12 col-sm-12 col-xs-12" id="order_more" style="padding:0px">

        </div>
    </div>

</div>
</body>
</html>


<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var phoneNumber = "";
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function () {
        getOrderAll();
    });

    function getOrderAll() {

        var orderNumKeyParam = $("#orderNumKey").val();
        console.log(orderNumKeyParam);

        $.ajax({
            type : "POST", //用GET方式请求
            url : '${bath}/frontorder/getOrderByStoreId', //目标地址
            data : {
                storeId : ${id!""},
                orderstatus : 5,
                orderNumber : orderNumKeyParam
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
                var retDataPhoneNumber = retData.phone_number;
                $("#order_more").empty();

                for(var i = 0;i < retDataLength; i++){
                    var retDataNumber = retData[i].order_number;
                    var retDataMan = retData[i].phone_number;
                    var retDataTime = retData[i].start_time;
                    var storeaddress= retData[i].storeaddress;
                    var subRetTime = retDataTime.substring(0,10);
                    var orderHtml = "<div class='col-lg-12 col-sm-12 col-xs-12 order-panel'>";
                    orderHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 black'></div>";
                    orderHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 number clearfix'>";
                    orderHtml += "<span>订单号："+retDataNumber+"</span><button class='navbar-right button' onclick='DetermineGoods(\""+retDataNumber+"\",\""+retDataMan+"\" ,\""+storeaddress+"\")'>确认取货</button>";
                    orderHtml += "</div>";
                    orderHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 time'>";
                    orderHtml += "<span>下单人："+retDataMan+"</span>|<span>下单日期："+subRetTime+"<span><a href='javascript:void(0);' onclick='linkToOrderDetail(\""+retDataNumber+"\");'>查看详情<img src='${bath}/images/frontpages/common/More.png' /></a>";
                    orderHtml += "</div>";
                    orderHtml += "</div>";
                    $("#order_more").append(orderHtml);
                }
                phoneNumber = retDataPhoneNumber;
                return phoneNumber;
                $("#orderNumKey").val("");

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

    function DetermineGoods(retDataNumber,retDataMan,storeaddress) {
        var OrderNumber = [];
        OrderNumber.push(retDataNumber);
        var jsonData = JSON.stringify(OrderNumber);
        $.ajax({
            type : "POST", //用GET方式请求
            url : '${bath}/frontorder/updateFrontOrder', //目标地址
            data : {
                orderStatus : 6,
                data : jsonData,
                phoneNumber : retDataMan,
                storeaddress : storeaddress
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                location.reload();
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

    //搜索
    function searchByOrderNum(){
        getOrderAll();
    }

    //跳转订单详情
    function linkToOrderDetail(orderNum){
        var orderNumParam = orderNum;
        console.log(orderNumParam);
        var url = "${bath}/portalLink/linkToOrderDetail?orderNum="+orderNumParam;
        window.open(url,"_self");
    }
</script>