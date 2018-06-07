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
    <link href="${bath}/css/frontpages/terminal/userPagesCss/mineorders.css" rel="stylesheet" type="text/css"/>
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
<container>
    <section>
        <div class="container-fluid top-panel">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 mine-orders-panel">



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
        $(".mine-orders-panel").css("height",goodsHeight);

        //调取我的订单数据
        MyStore();

    });

    //调取我的订单数据
    function MyStore() {
        var uesrId = $.cookie("uesrId");
        $.ajax({
            type : "POST", //用GET方式请求
            url : '${bath}/PortalallOrder/getAllOrder', //目标地址
            data : {
                userId : uesrId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                $(".mine-orders-panel").empty();
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
                        retYy = "惠惠自营"
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
                        retZt = "已完成";
                    }else {
                        retZt = "已分配"
                    }
                    var firstClassifyHtml = "<div class='col-lg-12 col-md-12 col-xs-12 orders-panel'>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 order-number-status'>";
                    firstClassifyHtml += "<span>订单号：</span><span class='orderNumber'>"+retOderNumber+"</span><span class='goods-type'>"+retYy+"</span><span class='order-status'>"+retZt+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 order-detail-panel'>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 date-price'>"
                    firstClassifyHtml += "<div class='col-lg-6 col-md-6 col-xs-6 date'>";
                    firstClassifyHtml += "<span>日期："+retDataTime+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-6 col-md-6 col-xs-6 sum-price'>";
                    firstClassifyHtml += "<span>价格：<i class='fa fa-cny fa-fw'></i>"+retTotal+"</span>"
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 store-viewmore'>"
                    firstClassifyHtml += "<div class='col-lg-6 col-md-6 col-xs-6 store'>";
                    firstClassifyHtml += "<span>门店："+retStoreName+"</span>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-6 col-md-6 col-xs-6 viewmore'>";
                    firstClassifyHtml += "<a href='javascript:void(0);' class='toggle"+retOderNumber+"' onclick='viewMore("+retOderNumber+");'>展开详情</a>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 more-detail' id='Hided1"+retOderNumber+"'>";

                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    firstClassifyHtml += "</div>";
                    $(".mine-orders-panel").append(firstClassifyHtml);
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


    //退换货跳转
    function exchange(retId,orderNum){
        var retOrderNumber = orderNum;
        var navTypeParam = 4;
        var url = "${bath}/portalLink/linkToCommitSaleService?navType="+navTypeParam+"&orderNumber="+retOrderNumber+"&retId="+retId;
        window.open(url,"_self");
    }

    //展开收起
    function viewMore(id) {
        console.log(id);
        if ($("#Hided1"+id).css("display") == "none"){
            $("#Hided1"+id).show();
            $(".toggle"+id).text("关闭详情");
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
                    $("#Hided1"+id).empty();
                    var retData = retInfo.data.list;
                    var retDataLength = retData.length;
                    var retOrder = retInfo.data.returnExchangeOrder;
                    var retOrderLength = retOrder.length;
                    if (retOrderLength == 0){
                        for (var i = 0; i < retDataLength; i++){
                            var retMainImagePath = retData[i].main_image_path;
                            var retName = retData[i].name;
                            var retNumber = retData[i].number;
                            var retTotal = retData[i].total;
                            var retId = retData[i].id;
                            var firstClassifyHtml = "<div class='col-lg-12 col-md-12 col-xs-12 goods-list-panel' name='"+retId+"'>";
                            firstClassifyHtml += "<div class='col-lg-2 col-md-2 col-xs-2 goods-img'>";
                            firstClassifyHtml += "<img src='${bath}/"+retMainImagePath+"' style='width:58px;height:58px' alt='' class='img-responsive' />";
                            firstClassifyHtml += "</div>";
                            firstClassifyHtml += "<div class='col-lg-10 col-md-10 col-xs-10 goods-info-panel'>";
                            firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-name-price'>";
                            firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 name'>";
                            firstClassifyHtml += "<span>"+retName+"</span>";
                            firstClassifyHtml += "</div>";
                            firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 price'>";
                            firstClassifyHtml += "<span><i class='fa fa-cny fa-fw'></i><label>"+retTotal+"</label></span>";
                            firstClassifyHtml += "</div>";
                            firstClassifyHtml += "</div>";
                            firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-count-exchange'>";
                            firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 count'>";
                            firstClassifyHtml += "<span>数量："+retNumber+"</span>";
                            firstClassifyHtml += "</div>";
                            firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 exchange'>";
                            firstClassifyHtml += "<div class='exchange-btn exchange"+id+"' onclick='exchange(\""+retId+"\",\""+id+"\");'>退/换货</div>";
                            firstClassifyHtml += "</div>";
                            firstClassifyHtml += "</div>";
                            firstClassifyHtml += "</div>";
                            firstClassifyHtml += "</div>";
                            $("#Hided1"+id).append(firstClassifyHtml);

                        };
                    }else if (retOrderLength != 0){
                            for (var i = 0; i < retDataLength; i++){
                                for(var j = 0; j < retOrderLength; j++){
                                    var retMainImagePath = retData[i].main_image_path;
                                    var retName = retData[i].name;
                                    var retNumber = retData[i].number;
                                    var retTotal = retData[i].total;
                                    var retId = retData[i].id;
                                    var retExchangeStatus = retOrder[j].exchangeStatus;
                                    var retProductId = retOrder[j].productId;
                                    var retReturnStatus = retOrder[j].returnStatus;
                                    var retAudit = retOrder[j].auditStatus;
                                    var retStatus = "";
                                    var retAuditStatus ="";
                                    if(retId == retProductId){
                                        var firstClassifyHtml = "<div class='col-lg-12 col-md-12 col-xs-12 goods-list-panel' name='"+retId+"'>";
                                        firstClassifyHtml += "<div class='col-lg-2 col-md-2 col-xs-2 goods-img'>";
                                        firstClassifyHtml += "<img src='${bath}/"+retMainImagePath+"' style='width:58px;height:58px' alt='' class='img-responsive' />";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "<div class='col-lg-10 col-md-10 col-xs-10 goods-info-panel'>";
                                        firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-name-price'>";
                                        firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 name'>";
                                        firstClassifyHtml += "<span>"+retName+"</span>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 price'>";
                                        firstClassifyHtml += "<span><i class='fa fa-cny fa-fw'></i><label>"+retTotal+"</label></span>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-count-exchange'>";
                                        firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 count'>";
                                        firstClassifyHtml += "<span>数量："+retNumber+"</span>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 exchange'>";
                                        if (retAudit == 0){
                                            retAuditStatus = "审核中";
                                            firstClassifyHtml += "<div class='exchange-btn exchange"+id+"'>"+retAuditStatus+"</div>";
                                        }else if (retAudit == 1){
                                            retAuditStatus = "审核通过";
                                            if (retReturnStatus == 0 && retExchangeStatus == 888){
                                                retStatus = "退货中";
                                                firstClassifyHtml += "<div class='exchange-btn exchange"+id+"'>"+retStatus+"</div>";
                                            }else if (retReturnStatus == 2 && retExchangeStatus == 888){
                                                retStatus = "已完成";
                                                firstClassifyHtml += "<div class='exchange-btn exchange"+id+"'>"+retStatus+"</div>";
                                            }else if (retReturnStatus == 888 && retExchangeStatus == 0){
                                                retStatus = "换货中";
                                                firstClassifyHtml += "<div class='exchange-btn exchange"+id+"'>"+retStatus+"</div>";
                                            }else if (retReturnStatus == 888 && retExchangeStatus == 1){
                                                retStatus = "换货中";
                                                firstClassifyHtml += "<div class='exchange-btn exchange"+id+"'>"+retStatus+"</div>";
                                            }else if (retReturnStatus == 888 && retExchangeStatus == 2){
                                                retStatus = "已到店";
                                                firstClassifyHtml += "<div class='exchange-btn exchange"+id+"'>"+retStatus+"</div>";
                                            }else if (retReturnStatus == 888 && retExchangeStatus == 3){
                                                retStatus = "已完成";
                                                firstClassifyHtml += "<div class='exchange-btn exchange"+id+"' onclick='exchange(\""+retId+"\",\""+id+"\");'>退/换货</div>";
                                            }
                                        }else if (retAudit == 2){
                                            retAuditStatus = "审核不通过";
                                            firstClassifyHtml += "<div class='exchange-btn exchange"+id+"' onclick='exchange(\""+retId+"\",\""+id+"\");'>退/换货</div>";
                                        }

                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "</div>";
                                        $("#Hided1"+id).append(firstClassifyHtml);
                                        break;
                                    }else if (retId != retProductId || retExchangeStatus == undefined || retReturnStatus == undefined){
                                        var firstClassifyHtml = "<div class='col-lg-12 col-md-12 col-xs-12 goods-list-panel' name='"+retId+"'>";
                                        firstClassifyHtml += "<div class='col-lg-2 col-md-2 col-xs-2 goods-img'>";
                                        firstClassifyHtml += "<img src='${bath}/"+retMainImagePath+"' style='width:58px;height:58px' alt='' class='img-responsive' />";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "<div class='col-lg-10 col-md-10 col-xs-10 goods-info-panel'>";
                                        firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-name-price'>";
                                        firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 name'>";
                                        firstClassifyHtml += "<span>"+retName+"</span>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 price'>";
                                        firstClassifyHtml += "<span><i class='fa fa-cny fa-fw'></i><label>"+retTotal+"</label></span>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-count-exchange'>";
                                        firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 count'>";
                                        firstClassifyHtml += "<span>数量："+retNumber+"</span>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 exchange'>";
                                        firstClassifyHtml += "<div class='exchange-btn exchange"+id+"' onclick='exchange(\""+retId+"\",\""+id+"\");'>退/换货</div>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "</div>";
                                        firstClassifyHtml += "</div>";
                                        $("#Hided1"+id).append(firstClassifyHtml);
                                        break;
                                    }
                                }

                            }
                    }
                    var exchangeText = $(".exchange"+id).parents(".orders-panel").find(".order-status").text();
                    if (exchangeText == "已完成"){
                        $(".exchange"+id).css("display","block");
                    };
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
            $(".toggle"+id).text("展开详情")
        }
    }
</script>