<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>换货单详情</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/exchangegoods.css" rel="stylesheet" type="text/css"/>
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
        <section class="col-lg-12 col-md-12 col-xs-12 gap"></section>
        <section class="col-lg-12 col-md-12 col-xs-12 padding number">
            <span class="black">换货单编号：</span><span class="gray">1752301245789966</span>
        </section>
        <section class="col-lg-12 col-md-12 col-xs-12 padding name">
            <span class="black">换  &nbsp;&nbsp;&nbsp;货  &nbsp;&nbsp;人：</span><span class="gray">13852639874</span>
        </section>
        <section class="col-lg-12 col-md-12 col-xs-12 padding firstTime">
            <span class="black">换 货 日 期：</span><span class="gray">2018-1-15</span>
        </section>

        <section class="col-lg-12 col-md-12 col-xs-12 gap"></section>
        <section class="col-lg-12 col-md-12 col-xs-12 footer">
            <img class="col-lg-2 col-md-2 col-xs-2" src="${bath}/images/common/commodity.png" />
            <div class="col-lg-6 col-md-6 col-xs-6">
                <p class="Yahei_28">福临门葵花籽原香食用调和油5L</p>
                <p class="Yahei_24">数量：1</p>
                <p class="Yahei_28">&yen;168.00</p>
            </div>
        </section>
    </div>
</div>
</body>
</html>
<script>
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };
</script>
