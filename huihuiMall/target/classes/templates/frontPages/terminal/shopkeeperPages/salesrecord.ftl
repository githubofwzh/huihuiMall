<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>门店销售记录</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/salesrecord.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 YM-time-panel">
            <div class="col-lg-12 col-sm-12 col-xs-12 center-block YM_time">
                <div class="col-lg-6 col-sm-6 col-xs-6">
                    <select class="year" id="yearSelected">

                    </select>
                </div>
                <div class="col-lg-6 col-sm-6 col-xs-6">
                    <select class="month" id="monthSelected">
                        <option value="1">1月</option>
                        <option value="2">2月</option>
                        <option value="3">3月</option>
                        <option value="4">4月</option>
                        <option value="5">5月</option>
                        <option value="6">6月</option>
                        <option value="7">7月</option>
                        <option value="8">8月</option>
                        <option value="9">9月</option>
                        <option value="10">10月</option>
                        <option value="11">11月</option>
                        <option value="12">12月</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="col-lg-12 col-sm-12 col-xs-12 record-detail">

        </div>

        <div class="col-lg-12 col-sm-12 col-xs-12 footer text-center">
            <span>当月收益：</span><a id="sum"> </a><span> 元</span>
        </div>

    </div>
</div>
</body>
</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var storeId = ${storeId!""}; //门店id

    $(document).ready(function () {

        var screenHeight = $(window).height();
        var footerHeight = $(".footer").height();
        var YMTimeHeight = $(".YM_time").height();

        var recordDetailHeight = screenHeight - footerHeight*2 - YMTimeHeight*2 + "px";
        $(".YM-time-panel").css("margin-top",YMTimeHeight*2);
        $(".record-detail").css("height",recordDetailHeight);

        var systemDate = new Date();

        var startYear = systemDate.getFullYear() - 10;//起始年份
        var endYear = systemDate.getFullYear() + 50;//结束年份
        var obj = document.getElementById('yearSelected');
        for (var i = startYear;i <= endYear; i++)
        {
            obj.options.add(new Option(i,i));
        }
        obj.options[obj.options.length-51].selected = 1;

        var month = systemDate.getMonth() + 1;
        if(month >= 13){
            month = 1;
        }
        $("#monthSelected").val(month);

        var yearParam = $("#yearSelected").find("option:selected").val();
        var monthParam = $("#monthSelected").find("option:selected").val();
        var currentDate = yearParam + "-" + monthParam;
        console.log(currentDate);

        //年份变化搜索
        $("#yearSelected").change(function(){
            var yearParam = $(this).val();
            var monthParam = $("#monthSelected").find("option:selected").val();
            console.log(yearParam);
            console.log(monthParam);
            var currentDate = yearParam + "-" + monthParam;
            getStoreFinanceDetail(storeId,currentDate);
        });

        //月份变化搜索
        $("#monthSelected").change(function(){
            var yearParam = $("#yearSelected").find("option:selected").val();
            var monthParam = $(this).val();
            console.log(yearParam);
            console.log(monthParam);
            var currentDate = yearParam + "-" + monthParam;
            getStoreFinanceDetail(storeId,currentDate);
        });

        //获取门店分润详情信息
        getStoreFinanceDetail(storeId,currentDate);

    });

    //获取门店分润详情信息
    function getStoreFinanceDetail(storeId,currentDate){

        var storeIdParam = storeId;
        var currentDateParam = currentDate;

        console.log(storeIdParam);
        console.log(currentDateParam);

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $("#loading").css("display","block");

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/ProtalStoreOrder/getOrderProfit', //目标地址
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
                var retDataLength = retData.length;

                $(".record-detail").empty();

                if(retDataLength <= 0){
                    $("#loading").css("display","none");
                    toastr.error("无销售记录数据！");
                    return false;
                }else{

                    var sum = retInfo.retNum;
                    $("#sum").html(sum);

                    for(var i = 0; i < retDataLength; i++){

                        var orderNumber = retData[i].orderNumber;
                        var phoneNumber = retData[i].phoneNumber;
                        var startTime = retData[i].startTime;
                        var subStartTime = startTime.substring(0,10);
                        var total = retData[i].total;
                        var recommend = retData[i].recommend;
                        var consumption = retData[i].consumption;

                        var recordHtml = "<div class='col-lg-12 col-sm-12 col-xs-12 record-detail-info'>";
                        recordHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 gap'></div>";
                        recordHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 Oder_Number'>";
                        recordHtml += "<img src='${bath}/images/frontpages/common/odernumber.png' />";
                        recordHtml += "<span>订单编号：</span><span>"+orderNumber+"</span>";
                        recordHtml += "</div>";
                        recordHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 Oder_Time clearfix'>";
                        recordHtml += "<p>";
                        recordHtml += "<span>下单人：</span>";
                        recordHtml += "<span>"+phoneNumber+"</span>";
                        recordHtml += "</p>";
                        recordHtml += "<p>";
                        recordHtml += "<span>下单时间：</span>";
                        recordHtml += "<span>"+subStartTime+"</span>";
                        recordHtml += "</p>";
                        recordHtml += "</div>";
                        recordHtml += "<div class='col-lg-12 col-sm-12 col-xs-12 money'>";
                        recordHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 money_first'>";
                        recordHtml += "<span>订单金额</span>";
                        recordHtml += "<br />";
                        recordHtml += "<b class='b_333'>"+total+"</b>";
                        recordHtml += "</div>";
                        recordHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 text-center money_center'>";
                        recordHtml += "<span>推荐收益</span>";
                        recordHtml += "<br />";
                        recordHtml += "<b>"+recommend+"</b>";
                        recordHtml += "</div>";
                        recordHtml += "<div class='col-lg-4 col-sm-4 col-xs-4 text-center money_last'>";
                        recordHtml += "<span>销售收益</span>";
                        recordHtml += "<br />";
                        recordHtml += "<b>"+consumption+"</b>";
                        recordHtml += "</div>";
                        recordHtml += "</div>";
                        recordHtml += "</div>";

                        $(".record-detail").append(recordHtml);

                    }
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