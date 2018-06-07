<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>售后服务</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/saleservice.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>


<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
<container>
    <section>
        <div class="container-fluid top-panel">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 saleservice-panel">









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
    $(document).ready(function() {
        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var goodsHeight = screenHeight - navPanelHeight + "px";
        $(".saleservice-panel").css("height",goodsHeight);

        AfteService();
    });



    function AfteService() {
        var UserId = $.cookie("uesrId");
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalallOrder/getReturnStatus', //目标地址
            data : {
                userId : UserId
            },
            async: true,
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
                    var retOrderNumber = retData[i].order_number;
                    var retName = retData[i].product_name;
                    var retMoney = retData[i].price;
                    var retTime = retData[i].order_time;
                    var retDataTime = retTime.substring(0,10);
                    var retImg = retData[i].main_image_path;
                    var retProductId= retData[i].product_id;
                    var retType = retData[i].merchant_type;
                    var retAuditStatus = retData[i].audit_status;
                    var retExchangeStatus = retData[i].exchange_status;
                    var retReturnStatus = retData[i].return_status;
                    //var retOutTradeNumber = retData[i].outTradeNumber;
                    var retStatus = "";
                    var retTy = "";
                    if(retType == 1){
                        retTy = "第三方商家"
                    }else {
                        retTy = "惠惠自营"
                    }
                    var AfteServiceHtml = "<div class='col-lg-12 col-md-12 col-xs-12 orders-panel'>";
                    AfteServiceHtml += "<div class='col-lg-12 col-md-12 col-xs-12 order-number-status'>";
                    AfteServiceHtml += "<span>订单号：</span>";
                    AfteServiceHtml += "<span class='orderNumber'>"+retOrderNumber+"</span>";
                    AfteServiceHtml += "<span class='goods-type'>"+retTy+"</span>";

                    if(retAuditStatus == 0){
                        AfteServiceHtml += "<span class='order-status'>审核中</span>";
                    }else if(retAuditStatus == 1){

                        retAuditStatus = "审核通过";
                        if (retReturnStatus == 0 && retExchangeStatus == 888){
                            retStatus = "退货中";
                            AfteServiceHtml += "<span class='order-status'>"+retStatus+"</span>";
                        }else if (retReturnStatus == 2 && retExchangeStatus == 888){
                            retStatus = "已完成";
                            AfteServiceHtml += "<span class='order-status'>"+retStatus+"</span>";
                            /*if(){
                                WXrefund(retOrderNumber);
                            }else {
                                ZFBrefund(retOrderNumber,retMoney,retOutTradeNumber);
                            }*/
                        }else if (retReturnStatus == 888 && retExchangeStatus == 0){
                            retStatus = "换货中";
                            AfteServiceHtml += "<span class='order-status'>"+retStatus+"</span>";
                        }else if (retReturnStatus == 888 && retExchangeStatus == 1){
                            retStatus = "换货中";
                            AfteServiceHtml += "<span class='order-status'>"+retStatus+"</span>";
                        }else if (retReturnStatus == 888 && retExchangeStatus == 2){
                            retStatus = "已到店";
                            AfteServiceHtml += "<span class='order-status'>"+retStatus+"</span>";
                        }else if (retReturnStatus == 888 && retExchangeStatus == 3){
                            retStatus = "已完成";
                            AfteServiceHtml += "<span class='order-status'>"+retStatus+"</span>";
                        };

                    }else if(retAuditStatus == 2){
                        AfteServiceHtml += "<span class='order-status'>审核未通过</span>";
                    }

                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "<div class='col-lg-12 col-md-12 col-xs-12 order-detail-panel'>";
                    AfteServiceHtml += "<div class='col-lg-2 col-md-2 col-xs-2 order-goods-img'>";
                    AfteServiceHtml += "<img src='${bath}"+retImg+"' class='img-responsive' alt='' />";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "<div class='col-lg-10 col-md-10 col-xs-10 order-info'>";
                    AfteServiceHtml += "<div class='col-lg-12 col-md-12 col-xs-12 date-name'>";
                    AfteServiceHtml += "<div class='col-lg-8 col-md-8 col-xs-8 name'>";
                    AfteServiceHtml += "<span>"+retName+"</span>";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "<div class='col-lg-4 col-md-4 col-xs-4 date'>";
                    AfteServiceHtml += "<span>"+retDataTime+"</span>";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "<div class='col-lg-12 col-md-12 col-xs-12 sum-price-viewmore'>";
                    AfteServiceHtml += "<div class='col-lg-8 col-md-8 col-xs-8 sum-price'>";
                    AfteServiceHtml += "<span>价格：<i class='fa fa-cny fa-fw'></i></span>";
                    AfteServiceHtml += "<span>"+retMoney+"</span>";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "<div class='col-lg-4 col-md-4 col-xs-4 viewmore'>";
                    AfteServiceHtml += "<a href='javascript:void(0);' class='goReturn"+retProductId+"' onclick='viewMore("+retProductId+","+retOrderNumber+");'>查看详情</a>";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "</div>";
                    AfteServiceHtml += "</div>";
                    $(".saleservice-panel").prepend(AfteServiceHtml);
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

    //退换货跳转
    function viewMore(retProductId,retOrderNumber){
        var navTypeParam = 4;
        var url = "${bath}/portalLink/linkToSaleServiceDetail?navType="+navTypeParam+"&orderNumber="+retOrderNumber+"&retProductId="+retProductId;
        window.open(url,"_self");
    }
    
    //微信退款
   /* function WXrefund(retOrderNumber) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/weChatRefund', //目标地址
            data : {
                appID : "wx7d1abedddbfe625f",
                mchID : "1502025021",
                mchKey : "764D15C57EB8A66CA8EC830A726AE090",
                outTradeNo : retOrderNumber
            },
            async: true,
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retData = retInfo.data;
                var retCode = retInfo.retCode;
                var retDataReturnCode = retData.return_code;
                var retDataResultCode = retData.result_code;
                if (retCode == 0){
                    if (retDataReturnCode == "SUCCESS" && retDataResultCode == "SUCCESS"){
                        toastr.success('退款成功！');
                    }
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
    }*/

    //支付宝退款
    /*function ZFBrefund(retOrderNumber,retMoney,retOutTradeNumber) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/aliRefund', //目标地址
            data : {
                tradeNo : retOrderNumber,//订单号
                outTradeNo : retOutTradeNumber,//订单号
                refundAmount : retMoney,//金额
                refundReason : "退款"
            },
            async: true,
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);

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
    }*/
</script>