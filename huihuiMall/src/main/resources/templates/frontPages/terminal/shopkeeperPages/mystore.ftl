<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>主页</title>

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/mystore.css" rel="stylesheet" type="text/css"/>
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
        <div class="col-lg-12 col-sm-12 col-xs-12 header">
            <div class="text-center shopname"></div>
            <div class="text-center name"><img src="${bath}/images/frontpages/common/men.png" /><span></span></div>
            <div class="text-center address"><img src="${bath}/images/frontpages/common/position.png" /><span></span></div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row footer">
        <div class="clearfix padding">
            <div class="col-lg-6 col-sm-6 col-xs-6 six_padding">
                <div class="col-lg-12 col-sm-12 col-xs-12 goodsreceipt" onclick="linkToGoodsReceipt();">
                    <img class="center-block" src="${bath}/images/frontpages/common/goodsreceipt.png" />
                    <span class="center-block text-center">收货</span>
                </div>
            </div>
            <div class="col-lg-6 col-sm-6 col-xs-6 six_padding">
                <div class="col-lg-12 col-sm-12 col-xs-12 pickup" onclick="linkToPickUp();">
                    <img class="center-block" src="${bath}/images/frontpages/common/pickup.png" />
                    <span class="center-block text-center">取货</span>
                </div>
            </div>
        </div>
        <div class="clearfix padding_plus col-lg-12 col-sm-12 col-xs-12">
            <div class="col-lg-12 col-sm-12 col-xs-12 Shopinformation" onclick="linkToBasic();">
                <img src="${bath}/images/frontpages/common/Shopinformation.png" />
                <span class="text-center">门店信息</span>
            </div>
        </div>
        <div class="clearfix padding">
            <div class="col-lg-6 col-sm-6 col-xs-6 six_padding">
                <div class="col-lg-12 col-sm-12 col-xs-12 goodsreceipt" onclick="linkToRetreatChange();">
                    <img class="center-block" src="${bath}/images/frontpages/common/exchangeofgoods.png" />
                    <span class="center-block text-center">退/换货</span>
                </div>
            </div>
            <div class="col-lg-6 col-sm-6 col-xs-6 six_padding">
                <div class="col-lg-12 col-sm-12 col-xs-12 pickup" onclick="linkToOrderRecords();">
                    <img class="center-block" src="${bath}/images/frontpages/common/OrderRecord.png" />
                    <span class="center-block text-center">订单记录</span>
                </div>
            </div>
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
        var id = ${id!""};
        PickUpInformation(id);
    });

    //获取门店信息
    function PickUpInformation(id) {
        console.log(id);
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/frontstore/getFrontStoreDetail', //目标地址
            data : {
                id : id
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
                console.log(retData);
               var retStore = retData.store;
                var retShopKeeper = retData.shopkeeper;
                $(".shopname").text(retStore.storeName);
                $(".name span").text(retShopKeeper.name);
                $(".address span").text(retStore.storeAddress);
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

    //收货
    function linkToGoodsReceipt(){
        var url = "${bath}/portalLink/linkToGoodsReceipt?id="+${id!""};
        window.open(url,"_self");
    }

    //取货
    function linkToPickUp(){
        var url = "${bath}/portalLink/linkToPickUp?id="+${id!""};
        window.open(url,"_self");
    }

    //门店基本信息
    function linkToBasic(){
        var url = "${bath}/portalLink/linkToBasic?id="+${id!""};
        window.open(url,"_self");
    }

    //退换货
    function linkToRetreatChange(){
        var url = "${bath}/portalLink/linkToRetreatChange?storeId="+${id!""};
        window.open(url,"_self");
    }

    //订单记录
    function linkToOrderRecords(){
        var url = "${bath}/portalLink/linkToOrderRecords?storeId="+${id!""};
        window.open(url,"_self");
    }
</script>