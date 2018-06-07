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

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
<#include "nav.ftl">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-xs-12 col-sm-12 living-payment-panel">
            <div class="col-lg-12 col-xs-12 col-sm-12 living-payment-title">
                <span>生活缴费</span>
            </div>
            <#--<div class="col-lg-12 col-xs-12 col-sm-12 living-payment-city">
                <div class="col-lg-2 col-xs-2 col-sm-2 select-panel">
                    <select>
                        <option>北京市</option>
                        <option>天津市</option>
                        <option>保定市</option>
                        <option>包头市</option>
                    </select>
                </div>
            </div>-->
            <div class="col-lg-12 col-xs-12 col-sm-12 living-payment-item">
                <div class="col-lg-12 col-xs-12 col-sm-12 item-panel">
                    <div class="col-lg-3 col-xs-3 col-sm-3">
                        <div class="col-lg-12 col-xs-12 col-sm-12 item" data-toggle="modal" data-target="#chooseModal" onclick="openFeeModal('c2670');">
                            <div class="col-lg-12 col-xs-12 col-sm-12">
                                <img src="${bath}/images/frontpages/common/water-icon.jpg" alt=""/>
                            </div>
                        </div>
                        <div class="col-lg-12 col-xs-12 col-sm-12">
                            <span>水费</span>
                        </div>
                    </div>
                    <div class="col-lg-3 col-xs-3 col-sm-3">
                        <div class="col-lg-12 col-xs-12 col-sm-12 item" data-toggle="modal" data-target="#chooseModal" onclick="openFeeModal('c2680');">
                            <div class="col-lg-12 col-xs-12 col-sm-12">
                                <img src="${bath}/images/frontpages/common/electric-icon.jpg" alt=""/>
                            </div>
                        </div>
                        <div class="col-lg-12 col-xs-12 col-sm-12">
                            <span>电费</span>
                        </div>
                    </div>
                    <div class="col-lg-3 col-xs-3 col-sm-3">
                        <div class="col-lg-12 col-xs-12 col-sm-12 item" data-toggle="modal" data-target="#chooseModal" onclick="openFeeModal('c2681');">
                            <div class="col-lg-12 col-xs-12 col-sm-12">
                                <img src="${bath}/images/frontpages/common/gas-icon.jpg" alt=""/>
                            </div>
                        </div>
                        <div class="col-lg-12 col-xs-12 col-sm-12">
                            <span>燃气费</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--添加弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="chooseModal" tabindex="-1" role="dialog" aria-labelledby="chooseModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 60%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="font-size:44px;">
                        &times;</button>
                    <h4 class="modal-title" id="chooseModalLabel">
                        <i class="fa fa-check-square-o fa-fw"></i> 请选择缴费机构</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12" id="choosePanelGroup">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal" style="font-size:24px;background-color: #ccc;color: #444444">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加弹出面板结束-->

</body>
    <#include "footer.ftl">
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function () {
        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var footerHeight = $(".footer").height();
        var livingPaymentHeight = screenHeight - navPanelHeight - footerHeight + 110 + "px";
        $(".living-payment-panel").css("height",livingPaymentHeight);
    });

    //选择机构modal打开
    function openFeeModal(type){
        $("#choosePanelGroup").empty();
        var typeParam = type;
        getWaterInstitutionList(type);
    }

    //获取水费缴费机构列表
    function getWaterInstitutionList(type){
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalLivingPay/getItemId', //目标地址
            data : {
                ProjectId : type,
                AddressId : $(".AddressShengshi").text()
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
                    toastr.error('查询失败！');
                    return false;
                }else {
                    $("#choosePanelGroup").empty();
                    var retData = retInfo.data;
                    var retDataLength = retData.length;
                    for (var i = 0; i < retDataLength; i++){
                        var retBrandvId = retData[i].brandvid;//缴费机构ID
                        var retBrandvName = retData[i].brandvname;//缴费机构名称
                        var retCId = retData[i].cid;//水电煤类型
                        var retCityinvId = retData[i].cityinvid;//城市ID
                        var retCityinvName = retData[i].cityinvname;//城市名称
                        var retItemId = retData[i].itemId;//商品编号
                        var retPrvcinvId = retData[i].prvcinvid;//省ID
                        var retPrvcinvName = retData[i].prvcinvname;//省名称
                        var retSpecialvId = retData[i].specialvid;//缴费方式编号
                        var waterInstitutionListHtml = "<div class='panel panel-default' onclick='LinkToQueryPaymentList(\""+retBrandvName+"\",\""+type+"\",\""+retBrandvId+"\",\""+retCId+"\",\""+retCityinvId+"\",\""+retCityinvName+"\",\""+retItemId+"\",\""+retPrvcinvId+"\",\""+retPrvcinvName+"\",\""+retSpecialvId+"\");'>";
                        waterInstitutionListHtml += "<div class='panel-body'>"+retBrandvName+"</div>";
                        waterInstitutionListHtml += "</div>";
                        $("#choosePanelGroup").append(waterInstitutionListHtml);
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

    }

    //跳转查询缴费单
    function LinkToQueryPaymentList(retBrandvName,type,retBrandvId,retCId,retCityinvId,retCityinvName,retItemId,retPrvcinvId,retPrvcinvName,retSpecialvId){
        var institutionNameParam = retBrandvName;
        var iNameParam = encodeURI(encodeURI(institutionNameParam));//缴费机构名称

        var typeParam = type;//缴费方式编号
        var retBrandvIdParam = retBrandvId;//缴费机构ID
        var retCIdParam = retCId;//水电煤类型
        var retCityinvIdParam = retCityinvId;//城市ID

        var retCityinvNameParam = retCityinvName;
        var retCNameParam = encodeURI(encodeURI(retCityinvNameParam));//城市名称

        var retItemIdParam = retItemId;//商品编号
        var retPrvcinvIdParam = retPrvcinvId;//省ID

        var retPrvcinvNameParam = retPrvcinvName;
        var retNameParam = encodeURI(encodeURI(retPrvcinvNameParam));//省名称

        var retSpecialvIdParam = retSpecialvId;//缴费方式编号
            var url = "${bath}/portalLink/LinkToQueryPaymentList?iName="+iNameParam+"&type="+typeParam+"&retBrandvIdParam="+retBrandvIdParam+"&retCIdParam="+retCIdParam+"&retCityinvIdParam="+retCityinvIdParam+"&retCNameParam="+retCNameParam+"&retItemIdParam="+retItemIdParam+"&retPrvcinvIdParam="+retPrvcinvIdParam+"&retNameParam="+retNameParam+"&retSpecialvIdParam="+retSpecialvIdParam;
            window.open(url,"_self");
    }
</script>
