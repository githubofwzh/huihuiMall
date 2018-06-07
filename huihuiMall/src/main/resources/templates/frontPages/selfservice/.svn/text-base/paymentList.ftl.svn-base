<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>生活缴费</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/livingPayment.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/footer.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/table/table.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/js/keyboard/mynumkb.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/keyboard/mynumkb.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
<#include "nav.ftl">
<label class="institutionName" style="display: none">${institutionName!""}</label><!--缴费机构名字-->
<label class="retPrvcinvNameParam" style="display: none">${retPrvcinvNameParam!""}</label><!--省名称-->
<label class="typeParam" style="display: none">${type!""}</label><!--缴费类型   水   电  煤-->
<label class="retBrandvIdParam" style="display: none">${retBrandvIdParam!""}</label><!--缴费机构ID-->
<label class="retCIdParam" style="display: none">${retCIdParam!""}</label><!--缴费类型-->
<label class="retCityinvIdParam" style="display: none">${retCityinvIdParam!""}</label><!--城市ID-->
<label class="retCityinvNameParam" style="display: none">${retCityinvNameParam!""}</label><!--城市名称-->
<label class="retItemIdParam" style="display: none">${retItemIdParam!""}</label><!--商品编号-->
<label class="retPrvcinvIdParam" style="display: none">${retPrvcinvIdParam!""}</label><!--省ID-->
<label class="retSpecialvIdParam" style="display: none">${retSpecialvIdParam!""}</label><!--缴费方式编号-->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-xs-12 col-sm-12 paymentList-panel">
            <div class="col-lg-5 col-xs-5 col-sm-5">
                <div class="col-lg-12 col-xs-12 col-sm-12 paymentList-panel-title">
                    <span>当前所选缴费机构：${institutionName!""}</span>
                </div>
                <div class="col-lg-12 col-xs-12 col-sm-12 userCode-panel">
                    <div class="col-lg-12 col-xs-12 col-sm-12 userCode-title">
                        <span>用户编号：</span>
                    </div>
                </div>
                <div class="col-lg-12 col-xs-12 col-sm-12 userCode-panel">
                    <div class="col-lg-12 col-xs-12 col-sm-12 userCode-input">
                        <div class="col-lg-9 col-xs-9 col-sm-9 input-panel">
                            <input type="text" id="userCodeNum">
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-xs-12 col-sm-12 userCode-panel">
                    <div class="col-lg-12 col-xs-12 col-sm-12 search-panel">
                        <button onclick="queryPayOrder();" class="btn btn-default searchBtn right">
                            <i class="fa fa-search fa-fw"></i> 查询</button>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 col-xs-7 col-sm-7">
                <div class="col-lg-12 col-xs-12 col-sm-12 payOrder-panel">
                    <div class="col-lg-12 col-xs-12 col-sm-12 table-panel" id="table">
                        <table class="table table-bordered table-hover table-responsive" style="margin-top: 20px;">
                            <tbody id="Tbody">
                                <tr>
                                    <th width="200">
                                        用户编号
                                    </th>
                                    <td id="userNumber"></td>
                                </tr>
                                <tr>
                                    <th width="200">
                                        缴费机构
                                    </th>
                                    <td>${institutionName!""}</td>
                                </tr>
                                <tr>
                                    <th width="200">
                                        缴费金额
                                    </th>
                                    <td id="uesrMoney"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-12 col-xs-12 col-sm-12 fee-btn-panel">
                        <div class="col-lg-12 col-xs-12 col-sm-12 fee-btn">
                            <button onclick="Pay();" class="btn btn-default feeBtn pull-right">
                                <i class="fa fa-rmb fa-fw"></i> 缴费</button>
                        </div>
                    </div>
                </div>
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
    var UserMoney = "";
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function () {
        $("#userCodeNum").mynumkb();

        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var footerHeight = $(".footer").height();
        var paymentListHeight = screenHeight - navPanelHeight - footerHeight + 110 + "px";
        $(".paymentList-panel").css("height",paymentListHeight);

        var linkType = $(".typeParam").text();//c2670-水费，c2680-电费，c2681-煤气费

        if(linkType == "c2670"){
            $("#userCodeNum").attr("placeholder","9位编号，请查看账单/短信");
        }else if(linkType == "c2680"){
            $("#userCodeNum").attr("placeholder","10位用户编号，请查看账单/短信");
        }else if(linkType == "c2681"){
            $("#userCodeNum").attr("placeholder","请输入10-11位用户编号");
        }

    });

    //查询点击
    function queryPayOrder(){

        $("#mykeyboard1").css("display","none");
        var orderCode = $("#userCodeNum").val();
        $("#userNumber").text(orderCode);
        if (orderCode != ""){
            $.ajax({
                type : "POST", //用POST方式请求
                url : '${bath}/PortalLivingPay/getOrderInfo', //目标地址
                data : {
                    BRANDvid : $(".retBrandvIdParam").text(),
                    BRANDvname : $(".institutionName").text(),
                    PRVCINvid : $(".retPrvcinvIdParam").text(),
                    PRVCINvname : $(".retPrvcinvNameParam").text(),
                    CITYINvid : $(".retCityinvIdParam").text(),
                    CITYINvname : $(".retCityinvNameParam").text(),
                    SPECIALvid : $(".retSpecialvIdParam").text(),
                    cid : $(".retCIdParam").text(),
                    itemId : $(".retItemIdParam").text(),
                    account : orderCode
                },
                beforeSend: function (jqXHR) {
                    if (undefined != header) {
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                    console.log(retInfo);
                    var retCode = retInfo.retCode;
                    var retData = retInfo.data;
                    if (retCode == 0){
                        var retMessage = retData.message;
                        var retStatus = retData.status;
                        if (retStatus == 0){
                            toastr.error(retMessage);
                        }else if (retStatus == 1){
                            toastr.success(retMessage);
                            $(".payOrder-panel").css("display","block");
                            var retPayAmount = retData.payAmount;
                            $("#userMoney").text(retPayAmount);
                            UserMoney = retPayAmount;
                            return UserMoney;
                        }
                    }else{
                        $("#userCodeNum").val("");
                        $("#userCodeNum").attr("placeholder","9位编号，请查看账单/短信");
                        toastr.error('查询失败,请检查订单号再次输入！');
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
        }else {
            toastr.error('请输入户号！');
            return false;
        }
    }

    //支付缴费
    function Pay() {
        var orderCode = $("#userCodeNum").val();
        var productType = "";
        if ($(".typeParam").text()  == "c2670"){
            productType = 1;
        }else if ($(".typeParam").text() == "c2680"){
            productType = 2;
        }else if ($(".typeParam").text() == "c2681"){
            productType = 3;
        }
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalLivingPay/insertPay', //目标地址
            data : {
                payAmount : UserMoney,//支付金额   暂时没有数据
                productType : productType,//水电煤类型
                payType : 4,//支付方式  微信 支付宝  银行卡
                payStatus : 0,//支付状态
                userAccount : $(".hellowPhone").text(),//用户编号
                serialNumber : orderCode
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if (retCode != 0){
                    toastr.error('调起支付失败！');
                    return false;
                }else {
                    var retData = retInfo.data;
                    toastr.success('调起支付成功！');
                    var itemId = $(".retItemIdParam").text();
                    setTimeout(function () {
                        var money = UserMoney;
                        var navTypeParam = 11;
                        var url = "${bath}/portalLink/linkToCheckout?navType="+navTypeParam+"&money="+money+"&orderNumber="+retData+"&itemId="+itemId+"&orderCode="+orderCode;
                        window.open(url,"_self");
                    },2000)
                }


            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('跳转支付页面失败！');
                return false;
            }
        });
    }
</script>
