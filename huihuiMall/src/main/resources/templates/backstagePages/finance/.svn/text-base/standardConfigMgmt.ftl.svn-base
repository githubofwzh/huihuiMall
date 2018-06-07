<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <title>标准配置管理</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/form/form.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/table/table.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/button.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common.js" type="text/javascript" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-6 col-md-6 col-xs-6 table-panel" style="background-color: #f0f0f0">
            <div class="row">
                <div class="form-group" style="margin: 30px 0px 0px 0px;">
                    <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                        <div class="col-lg-12 col-md-12 col-xs-12">
                            <div class="col-lg-3 col-md-3 col-xs-3 title">
                                <label class="control-label">门店分润比例：</label>
                            </div>
                            <div class="col-lg-8 col-md-8 col-xs-8 input-group">
                                <input type="text" class="form-control required" id="storeProfit">
                                <span class="input-group-addon">%</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                        <div class="col-lg-12 col-md-12 col-xs-12">
                            <div class="col-lg-3 col-md-3 col-xs-3 title">
                                <label class="control-label">推荐分润比例：</label>
                            </div>
                            <div class="col-lg-8 col-md-8 col-xs-8 input-group">
                                <input type="text" class="form-control required" id="recommendProfit">
                                <span class="input-group-addon">%</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                        <div class="col-lg-12 col-md-12 col-xs-12">
                            <div class="col-lg-3 col-md-3 col-xs-3 title">
                                <label class="control-label">消费分润比例：</label>
                            </div>
                            <div class="col-lg-8 col-md-8 col-xs-8 input-group">
                                <input type="text" class="form-control required" id="consumptionProfit">
                                <span class="input-group-addon">%</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                        <div class="col-lg-12 col-md-12 col-xs-12">
                            <div class="col-lg-2 col-md-3 col-xs-2 title"></div>
                            <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                <button type="button" class="btn btn-default pull-right" id="saveBtn">
                                    <i class="fa fa-save fa-fw"></i> 保存
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function() {

        $("#loading").css("display","block");

        //获取当日任务计划号
        getConfigInfos();

        //保存
        $("#saveBtn").click(function(){

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            //门店
            var storeProfitParam = Number($("#storeProfit").val());

            //推荐
            var recommendProfitParam = Number($("#recommendProfit").val());

            //消费
            var consumptionProfitParam = Number($("#consumptionProfit").val());

            //判断推荐与消费合计
            var sum = recommendProfitParam + consumptionProfitParam;
            if(sum < 100 || sum > 100){
                toastr.error("推荐分润与消费分润总和为100%");
                return false;
            }

            $("#loading").css("display","block");

            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/financial/updateStandard', //目标地址
                data : {
                    id : 1,
                    storeProfit : storeProfitParam,
                    recommendProfit : recommendProfitParam,
                    consumptionProfit : consumptionProfitParam,
                },
                beforeSend: function(jqXHR) {
                    if (undefined != header){
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                    console.log(retInfo);

                    var retCode = retInfo.retCode;
                    if(retCode != 0){
                        $("#loading").css("display","none");
                        toastr.error("保存失败！");
                        return false;
                    }else{
                        $("#loading").css("display","none");
                        toastr.success("保存成功！");
                        setTimeout(function(){
                            location.reload();
                        },2000);
                    }
                },
                error:function(XMLHttpRequest, textStatus){
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $("#loading").css("display","none");
                    toastr.error("保存失败！");
                    return false;
                }
            });
        });
    });

    //获取信息方法
    function getConfigInfos(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/financial/getStandard', //目标地址
            data : {},
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

                var retCode = retInfo.retCode;

                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error("查询失败！");
                    return false;
                }else{
                    $("#loading").css("display","none");
                    var retData = retInfo.data;
                    var consumptionProfit = retData[0].consumptionProfit;
                    var recommendProfit = retData[0].recommendProfit;
                    var storeProfit = retData[0].storeProfit;

                    if(consumptionProfit == "" || consumptionProfit == null){
                        $("#consumptionProfit").val("");
                    }else{
                        $("#consumptionProfit").val(consumptionProfit);
                    }

                    if(recommendProfit == "" || recommendProfit == null){
                        $("#recommendProfit").val("");
                    }else{
                        $("#recommendProfit").val(recommendProfit);
                    }

                    if(storeProfit == "" || storeProfit == null){
                        $("#storeProfit").val("");
                    }else{
                        $("#storeProfit").val(storeProfit);
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
