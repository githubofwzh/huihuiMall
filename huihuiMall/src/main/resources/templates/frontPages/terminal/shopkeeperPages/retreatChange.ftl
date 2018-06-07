<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>退/换货</title>

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>


    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/retreatChange.css" rel="stylesheet" type="text/css"/>
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
        <ul class="col-lg-12 col-sm-12 col-xs-12 text-center ul_main" role="tablist">
            <li href="#home" aria-controls="home" role="tab" data-toggle="tab" role="presentation"
                class="col-lg-6 col-sm-6 col-xs-6 tab_title active" id="Liactive" onclick="ReturnGoods();">退货单
            </li>
            <li href="#profile" aria-controls="profile" role="tab" data-toggle="tab" role="presentation"
                class="col-lg-6 col-sm-6 col-xs-6 tab_title" onclick="ExchangeGoods();">换货单
            </li>
        </ul>
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
    </div>

    <div class="tab-content row">
        <div role="tabpanel" class="tab-pane active clearfix" id="home">


        </div>


        <div role="tabpanel" class="tab-pane clearfix" id="profile">


        </div>
    </div>

</div>
</body>

</html>

<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };
    
    $(document).ready(function () {
        $(".ul_main li").click(function () {
            $(this).siblings("li").removeAttr("id","Liactive");
            $(this).attr("id","Liactive");
        })
        ReturnGoods();
    })


    function ReturnGoods() {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalallOrder/selfServiceReturnStatus', //目标地址
            data : {
                storeId : ${storeId!""},
                type : 0
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
                $("#home").empty();
                for (var i = 0; i < retDataLength; i++){
                    var retOrderNumber = retData[i].order_number;
                    var retTime = retData[i].order_time;
                    var retStoreTime = retTime.substring(0,10);
                    var retReurnStatus = retData[i].return_status;
                    var retPhoneNumber = retData[i].phone_number;
                    var retTypeData = "";
                    var retButtom = "";
                    if (retReurnStatus == 0){
                        retTypeData = "退货中";
                        retButtom = "确定收到退货";
                    }else if (retReurnStatus == 1){
                        retTypeData = "退货中";
                        retButtom = "确定取走退货";
                    }else if (retReurnStatus == 2){
                        retTypeData = "已完成";
                    }
                    var ReturnGoodsHtml = "<div class='col-lg-12 col-sm-12 col-xs-12 main_order' style='padding: 0; margin-top: 10px' name='"+retReurnStatus+"'>";
                    ReturnGoodsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 number'>";
                    ReturnGoodsHtml += "<span>退单号："+retOrderNumber+"</span>";
                    ReturnGoodsHtml += "<button class='navbar-right button btn_num"+retOrderNumber+"' onclick='ObtainGoods("+retOrderNumber+","+retReurnStatus+");'>"+retButtom+"</button>";
                    ReturnGoodsHtml += "</div>";
                    ReturnGoodsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 time'>";
                    ReturnGoodsHtml += "<span>下单人："+retPhoneNumber+"</span>";
                    ReturnGoodsHtml += "<span>日期："+retStoreTime+"</span>";
                    ReturnGoodsHtml += "<a class='Goods_receipt'>"+retTypeData+"</a>";
                    ReturnGoodsHtml += "</div>";
                    ReturnGoodsHtml += "</div>";
                    $("#home").append(ReturnGoodsHtml);

                    var aText = $(".btn_num"+retOrderNumber).parents(".main_order").find(".Goods_receipt").text();
                    if (aText == "已完成"){
                        $(".btn_num"+retOrderNumber).css("display","none");
                    }

                }

            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("操作失败！");
                return false;
            }
        });
    }


    function ExchangeGoods() {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalallOrder/selfServiceReturnStatus', //目标地址
            data : {
                storeId : ${storeId!""},
                type : 1
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
                $("#profile").empty();
                for (var i = 0; i < retDataLength; i++){
                    var retOrderNumber = retData[i].order_number;
                    var retTime = retData[i].order_time;
                    var retStoreTime = retTime.substring(0,10);
                    var retType = retData[i].exchange_status;
                    var retPhoneNumber = retData[i].phone_number;
                    var retTypeData = "";
                    var retButtom = "";
                    if (retType == 0){
                        retTypeData = "换货中";
                        retButtom = "确定收到换货";
                    }else if (retType == 1){
                        retTypeData = "换货中";
                        retButtom = "确定收货";
                    }else if (retType == 2){
                        retTypeData = "已到店";
                        retButtom = "确定取货";
                    }else if (retType == 3){
                        retTypeData = "已完成";
                    }
                    var ReturnGoodsHtml = "<div class='col-lg-12 col-sm-12 col-xs-12 main_order' style='padding: 0; margin-top: 10px' name='"+retType+"'>";
                    ReturnGoodsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 number'>";
                    ReturnGoodsHtml += "<span>换单号："+retOrderNumber+"</span>";
                    ReturnGoodsHtml += "<button class='navbar-right button btn_num"+retOrderNumber+"' onclick='exchangeGoods("+retOrderNumber+","+retType+");'>"+retButtom+"</button>";
                    ReturnGoodsHtml += "</div>";
                    ReturnGoodsHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 time'>";
                    ReturnGoodsHtml += "<span>下单人："+retPhoneNumber+"</span>";
                    ReturnGoodsHtml += "<span>日期："+retStoreTime+"</span>";
                    ReturnGoodsHtml += "<a class='Goods_receipt'>"+retTypeData+"</a>";
                    ReturnGoodsHtml += "</div>";
                    ReturnGoodsHtml += "</div>";

                    $("#profile").append(ReturnGoodsHtml);

                    var aText = $(".btn_num"+retOrderNumber).parents(".main_order").find(".Goods_receipt").text();
                    if (aText == "已完成"){
                        $(".btn_num"+retOrderNumber).css("display","none");
                    }

                }
            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("操作失败！");
                return false;
            }
        });
    }

    
    
    function ObtainGoods(retOrderNumber,type) {

        var tpyeAdd = type+1;
        console.log(tpyeAdd);
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalallOrder/UserReStatus', //目标地址
            data : {
                orderNumber : retOrderNumber,
                returnStatus : tpyeAdd
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                if (retInfo.retCode == 0){
                    toastr.success("取货成功！");
                    location.reload();
                }else {
                    toastr.error("操作失败！");
                };


            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("操作失败！");
                return false;
            }
        });
    }



    function exchangeGoods(retOrderNumber,type) {

        var tpyeAdd = type+1;
        console.log(tpyeAdd);
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalallOrder/UserReStatus', //目标地址
            data : {
                orderNumber : retOrderNumber,
                exchangeStatus : tpyeAdd
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                if (retInfo.retCode == 0){
                    toastr.success("取货成功！");
                    location.reload();
                }else {
                    toastr.error("操作失败！");
                };


            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("操作失败！");
                return false;
            }
        });
    }


</script>