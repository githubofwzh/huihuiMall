<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>售后服务详情</title>




<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/saleservicedetail.css" rel="stylesheet" type="text/css"/>
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
                <div class="Customer_service clearfix">
                    <section class="col-lg-12 col-md-12 col-xs-12 Customer_number">
                        <span>单号：</span><span class="orderNumber"></span>
                    </section>
                    <section class="col-lg-12 col-md-12 col-xs-12 Customer_time">
                        <span>日期：</span><span class="retTime"></span>
                    </section>
                    <section class="col-lg-12 col-md-12 col-xs-12 goods-info-panel">
                            <div class="col-lg-2 col-md-2 col-xs-2 goods-intro-img">
                                <img src="" alt="" class="img-responsive retImg"/>
                            </div>
                            <div class="col-lg-9 col-md-9 col-xs-9 goods-intro">
                                <div class="col-lg-12 col-md-12 col-xs-12 goods-name">
                                    <span class="retName"></span>
                                </div>
                                <div class="col-lg-12 col-md-12 col-xs-12 goods-count">
                                    <span class="retNumber"></span>
                                </div>
                                <div class="col-lg-12 col-md-12 col-xs-12 goods-price">
                                    <span><i class="fa fa-cny fa-fw"></i><label class="retMoney"></label></span>
                                </div>
                            </div>
                    </section>
                </div>
            </div>
        </div>
        <div class="container-fluid reason_sm">
            <div class="row">
                    <section class="col-lg-12 col-md-12 col-xs-12 reason_smly">
                        <img src="${bath}/images/frontpages/common/Detailedlist.png"/>理由说明
                    </section>
                    <section class="col-lg-12 col-md-12 col-xs-12">
                        <div class="col-lg-12 col-md-12 col-xs-12 reason_type">
                            <span>服务类型：</span>
                            <p class="retType"></p>
                        </div>
                    </section>
                    <section class="col-lg-12 col-md-12 col-xs-12">
                        <div class="col-lg-12 col-md-12 col-xs-12 reason_ly">
                            <span>理由：</span>
                            <p class="retReason">
                                <img src="" />
                            </p>
                        </div>
                    </section>
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
        ReturnDetails();
    });


    //详情
    function ReturnDetails() {
        var orderNumber = ${orderNumber!""};
        var productId = ${retProductId!""};
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalallOrder/getReturnDetail', //目标地址
            data : {
                orderNumber : orderNumber,
                prId : productId
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
                var retData = retInfo.data.list[0];
                var retOrderNumber = retData.order_number;
                var retTime = retData.order_time;
                var retDataTime = retTime.substring(0,10);
                var retName = retData.product_name;
                var retNumber = retData.count;
                var retMoney = retData.price;
                var retImg = retData.main_image_path;
                var retType = retData.type;
                var retReason = retData.reason;
                var retTy = "";
                if(retType == 0){
                    retTy = "退货"
                }else {
                    retTy = "换货"
                }
                $(".orderNumber").text(retOrderNumber);
                $(".retTime").text(retDataTime);
                $(".retImg").attr("src","${bath}"+retImg+"");
                $(".retName").text(retName);
                $(".retNumber").text("数量:"+retNumber);
                $(".retMoney").text(retMoney);
                $(".retType").text(retTy);
                $(".retReason").text(retReason);
                $(".retReason img").attr("src","${bath}"+retImg+"");


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
</script>