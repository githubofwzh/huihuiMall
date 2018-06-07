<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>门店基本信息</title>


<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/basic.css" rel="stylesheet" type="text/css"/>
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
            <section class="col-lg-12 col-md-12 col-xs-12 basic">
                <section class="col-lg-12 col-md-12 col-xs-12 shopname">
                    <span class="black"><img src="${bath}/images/frontpages/common/store.png" />门店名称 :</span>
                    <span class="gray" id="shopName"></span>
                </section>
                <section class="col-lg-12 col-md-12 col-xs-12 name">
                    <span class="black"><img src="${bath}/images/frontpages/common/Shopkeeper.png" />店主姓名 :</span>
                    <span class="gray" id="masterName"></span>
                </section>
                <section class="col-lg-12 col-md-12 col-xs-12 address">
                    <span class="black"><img src="${bath}/images/frontpages/common/position_orange.png" />门店地址 :</span>
                    <span class="gray" id="detailedAddress"></span>
                </section>
                <section class="col-lg-12 col-md-12 col-xs-12 equipment">
                    <span class="black"><img src="${bath}/images/frontpages/common/terminal.png" />终端设备 :</span>
                    <span class="gray EquipmentNumber"></span>
                    <a class="setup" data-toggle="modal" data-target="#myModal">
                        <img src="${bath}/images/frontpages/common/setup.png" />
                        <span>设置</span>
                    </a>
                </section>
            </section>
        </div>
    </div>

    <div class="gap_big"></div>

    <div class="gray_bg">
        <div class="container-fluid profit">
            <div class="row">
                <section class="col-lg-12 col-md-12 col-xs-12 time clearfix">
                    <span class="left">本月收益</span>
                    <span class="right time_YM"></span>
                </section>
                <section class="col-lg-12 col-md-12 col-xs-12 detailed">
                    <p class="clearfix">
                        <span class="left">推荐收益</span>
                        <b class="right company_gray"> 元</b>
                        <span class="right recommend_income"> </span>
                    </p>
                    <p class="border clearfix">
                        <span class="left">销售收益</span>
                        <b class="right company_gray"> 元</b>
                        <span class="right sales_revenue"> </span>
                    </p>
                </section>
                <section class="col-lg-12 col-md-12 col-xs-12 total clearfix">
                    <span class="left">总计</span>
                    <b class="right company"> 元</b>
                    <span class="right total_income"> </span>
                </section>
            </div>
        </div>
    </div>
    <div class="container-fluid footer">
        <div class="row center-block">
            <div class=" footer_content text-center" onclick="linkToStoreFinanceDetail();">
                查看门店销售纪录<img src="${bath}/images/frontpages/common/seeinformation.png">
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                    设置终端设备
                </div>
                <div class="modal-body text-center">
                    <input type="text" placeholder="请输入设备号"  id="deviceCode"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default equipment_Number" data-dismiss="modal" onclick="saveDeviceCode();">保存</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var storeId = ${id!""}; //门店id

    $(document).ready(function () {

        //获取门店基本信息
        BasicInformation(storeId);

        //获取系统时间
        var systemDate = new Date();
        var year = systemDate.getFullYear();
        var month = systemDate.getMonth() + 1;

        if(month >= 13){
            month = 1;
        }

        var currentDateYear = year + "年";
        var currentDateMonth = month + "月";
        $(".time_YM").html(currentDateYear + currentDateMonth);

        var currentDate = year + "-" + month;
        console.log(currentDate);

        //获取门店分润信息
        getStoreFinance(storeId,currentDate);

    });

    //获取门店基本信息
    function BasicInformation(sId) {

        var storeIdParam = sId;

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/frontstore/getFrontStoreDetail', //目标地址
            data : {
                id : storeIdParam
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

                var retStore = retData.store;
                $("#shopName").text(retStore.storeName);
                $("#detailedAddress").text(retStore.storeAddress);

                var retShopKeeper = retData.shopkeeper;
                $("#masterName").text(retShopKeeper.name);

                var retDevice = retData.device;
                if(retDevice == null || retDevice == ""){
                    $(".EquipmentNumber").text("");
                }else{
                    var deviceCodeparam = retDevice.deviceCode;
                    if(deviceCodeparam == null || deviceCodeparam == ""){
                        $(".EquipmentNumber").text("");
                    }else{
                        $(".EquipmentNumber").text(deviceCodeparam);
                    }
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

    //保存设备号
    function saveDeviceCode() {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var deviceCodeParam = $("#deviceCode").val();
        if(deviceCodeParam == "") {
            toastr.error("请输入设备号！");
            return false;
        }

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/frontstore/updateDevice', //目标地址
            data : {
                storeId : ${id!""},
                deviceCode : deviceCodeParam //设备号
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
                if(retCode != 0){
                    retData = retInfo.data;
                    if(retData == null || retData == ""){
                        toastr.error("绑定失败！");
                        setTimeout(function () {
                            location.reload();
                        }, 2000);
                        return false;
                    }else{
                        toastr.error("该设备号已被绑定！");
                        setTimeout(function () {
                            location.reload();
                        }, 2000);
                        return false;
                    }
                }else{
                    toastr.success("绑定成功！");
                    setTimeout(function () {
                        location.reload();
                    }, 2000);
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('操作失败！');
                return false;
            }
        });
    }

    //获取门店分润信息
    function getStoreFinance(storeId,currentDate){

        var storeIdParam = storeId;
        var currentDateParam = currentDate;

        console.log(storeIdParam);
        console.log(currentDateParam);

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/ProtalStoreOrder/getTotalOrderProfit', //目标地址
            data : {
                storeId : storeIdParam,
                date : currentDateParam
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
                var totalConsumption = retData.totalConsumption;
                var totalRecommend = retData.totalRecommend;
                var totalIncome = Number(totalConsumption) + Number(totalRecommend);
                var totalIncomeParam = totalIncome.toFixed(2);

                $(".recommend_income").html(totalRecommend);
                $(".sales_revenue").html(totalConsumption);
                $(".total_income").html(totalIncomeParam);
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

    //跳转门店分润详情
    function linkToStoreFinanceDetail(){
        var storeIdParam = storeId;
        var url = "${bath}/portalLink/linkToStoreFinanceDetail?storeId="+storeIdParam;
        window.open(url,"_self");
    }

</script>