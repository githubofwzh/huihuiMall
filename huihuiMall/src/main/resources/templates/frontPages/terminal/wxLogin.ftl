<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>惠惠网店公众号</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/wxLogin.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
<#--<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN &ndash;&gt;
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>-->
    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<container>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 wx-title">
                    <span>
                        <b>惠惠网店公众号</b>
                    </span>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 wx-button-panel">
                    <div class="col-lg-4 col-md-4 col-xs-4 wx-button">
                        <div class="btn-group dropup">
                            <button type="button" class="btn btn-default dropdown-toggle huihuiShopkeeperBtn" data-toggle="dropdown">惠惠店主</button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <li role="presentation">
                                    <a role="menuitem" tabindex="-1" href="#" onclick="linkToApply();">申请开店</a>
                                </li>
                                <li role="presentation" class="divider"></li>
                                <li role="presentation">
                                    <a role="menuitem" tabindex="-1" href="#" onclick="linkToMineShop();">我的门店</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-xs-4 wx-button">
                        <button type="button" class="btn btn-default huihuiBtn" onclick="linkToHuiHuiMall();">惠惠网店</button>
                    </div>
                    <div class="col-lg-4 col-md-4 col-xs-4 wx-button">
                        <button type="button" class="btn btn-default huihuiBtn">关于我们</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</container>
</body>
</html>
<script>

    //跳转申请开店
    function linkToApply(){
        var url = "${bath}/Portalcustomer/IsApplyStoreAuth";
        window.open(url, "_self");
    }

    //跳转我的门店
    function linkToMineShop(){
        var url = "${bath}/Portalcustomer/IsStoreWeChatAuth";
        window.open(url, "_self");

    }

    //跳转惠惠商城
    function linkToHuiHuiMall(){
        var url = "${bath}/Portalcustomer/IsCustomerWeChatAuth";
        window.open(url, "_self");
    }
</script>