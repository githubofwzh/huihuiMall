<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>自营退换货管理</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/form/form.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/table/table.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/checkbox_radio_select.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pagination.css" rel="stylesheet" type="text/css"/>
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

<div class="container-fluid btn-operation-panel">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span>退换货单号：</span>
            <input type="text" id="" placeholder="请输入退换货单号">

            <span style="margin-left: 10px">门店名称：</span>
            <input type="text" id="" placeholder="请输入门店名称">

            <span style="margin-left: 10px">类别：</span>
            <select style="width: 8%">
                <option>请选择</option>
                <option>退货</option>
                <option>换货</option>
            </select>

            <button type="button" class="btn btn-default" id="searchBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">
            <table class="table table-bordered table-hover table-responsive" style="margin-top: 20px;">
                <thead>
                <tr>
                    <th width="80">
                        序号
                    </th>
                    <th>
                        退换货单号
                    </th>
                    <th>
                        订单号
                    </th>
                    <th>
                        下单人
                    </th>
                    <th>
                        下单日期
                    </th>
                    <th>
                        门店名称
                    </th>
                    <th>
                        商品名称
                    </th>
                    <th>
                        商品数量
                    </th>
                    <th>
                        商品金额
                    </th>
                    <th>
                        合计金额
                    </th>
                    <th>
                        类别
                    </th>
                    <th>
                        订单详情
                    </th>
                    <th width="200">
                        操作
                    </th>
                </tr>
                </thead>
                <tbody id="Tbody">



                </tbody>
            </table>

            <div class="col-lg-12 col-md-12 col-xs-12 pagination-panel">
                <div class="col-lg-10 col-md-9 col-xs-10">
                    <div class="dataTables_info" role="status" aria-live="polite">
                        显示<label id="itemSize"></label>项结果，共<label id="totalItem"></label>项，
                        当前<label id="currentPage">1</label>/<label id="totalPages">1</label>页
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-xs-2">
                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                        <ul class="pagination" style="margin: 0px">
                            <li class="paginate_button previous" aria-controls="dataTables-example">
                                <a href="javascript:void(0);" id="prevPage">上一页</a>
                            </li>
                            <li class="paginate_button next" aria-controls="dataTables-example">
                                <a href="javascript:void(0);" id="nextPage">下一页</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--查看详情弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:60%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="detailModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 查看详情</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">退换货单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderNumber">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">订单类别：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeType" value="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">订单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderId">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">下单人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="userName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">下单日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderTime">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="shopAddress">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品清单：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <table class="table table-bordered table-hover table-responsive" style="margin-top: 20px;">
                                            <thead>
                                            <tr>
                                                <th width="50">
                                                    商品编号
                                                </th>
                                                <th width="100">
                                                    商品名称
                                                </th>
                                                <th width="70">
                                                    规格型号
                                                </th>
                                                <th width="70">
                                                    计量单位
                                                </th>
                                                <th width="70">
                                                    商品数量
                                                </th>
                                                <th width="40">
                                                    单价
                                                </th>
                                                <th width="40">
                                                    小计
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td id="shopCodeNumber">

                                                </td>
                                                <td id="shopName">

                                                </td>
                                                <td id="shopModel">

                                                </td>
                                                <td id="shopCompany">

                                                </td>
                                                <td id="shopNumber">

                                                </td>
                                                <td id="shopPrice">

                                                </td>
                                                <td id="shopTotal">

                                                </td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td colspan="7" id="summation">

                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">退换货理由：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <textarea class="form-control required" id="returnReason" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">实物图片：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <img id="retImg" src="" style="width:100px;height:75px">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--查看详情弹出面板结束-->

<!--同意弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="agreeModal" tabindex="-1" role="dialog" aria-labelledby="agreeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="agreeModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 同意</h4>
                </div>
                <div class="modal-body">
                    确定同意处理该退/换货?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmAgree" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--同意弹出面板结束-->

<!--不同意弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="disagreeModal" tabindex="-1" role="dialog" aria-labelledby="disagreeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="disagreeModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 不同意</h4>
                </div>
                <div class="modal-body">
                    确定不同意处理该退/换货?吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmDisagree" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--不同意弹出面板结束-->

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>
    var orderNumer = "";
    $(document).ready(function() {

        $("#loading").css("display","none");

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页

        //获取当日任务计划号
        getUserInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getUserInfos(pageCount,1);
        });

        //重置点击
        $("#resetBtn").click(function(){
            reset();
        });

        //上一页
        $("#prevPage").click(function(){
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum > 1)
            {
                $("#Tbody").empty();
                $("#loading").css("display","block");
                currentPageNum -= 1;
                getUserInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //下一页
        $("#nextPage").click(function(){
            var totalPages = parseInt($("#totalPages").text());
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum < totalPages)
            {
                $("#Tbody").empty();
                $("#loading").css("display","block");
                currentPageNum += 1;
                getUserInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //同意退换货
        $("#confirmAgree").click(function () {
            WhetherAllow(orderNumer,1);
        });
        //不同意退换货
        $("#confirmDisagree").click(function () {
            WhetherAllow(orderNumer,2);
        });
    });

    function getOrderNumber(retOrderNumber) {
        orderNumer = retOrderNumber;
        return orderNumer;
    }

    //获取信息方法
    function getUserInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var searchKeyParam = $("#searchKey").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/order/queryReturnExchangeOrder', //目标地址
            data : {

            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                $("#loading").css("display","none");
                $(".pagination").css("display","block");

                var itemSize = retInfo.size;
                $("#itemSize").html(itemSize);

                var totalItem = retInfo.total;
                $("#totalItem").html(totalItem);

                var totalPages = retInfo.pages;
                if(totalPages == 0){
                    $("#totalPages").html(1);
                }else{
                    $("#totalPages").html(totalPages);
                }

                var hasNextPage = retInfo.hasNextPage;
                if(hasNextPage == true){
                    $("#nextPage").css("display","block");
                }else{
                    $("#nextPage").css("display","none");
                }

                var hasPreviousPage = retInfo.hasPreviousPage;
                if(hasPreviousPage == true){
                    $("#prevPage").css("display","block");
                }else{
                    $("#prevPage").css("display","none");
                }

                var retCode = retInfo.retCode;
                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error('查询失败！');
                    return false;
                }else{
                    $("#loading").css("display","none");
                    var retData = retInfo.data;
                    console.log(retData);
                    var retDataLength = retData.length;

                    $("#Tbody").empty();

                    for(var i = 0 ;i < retDataLength; i ++){
                        var index = i + 1;
                        var retOrderNumber = retData[i].order_number;
                        var retOrderId = retData[i].order_id;
                        var retPhoneNumber = retData[i].phone_number;
                        var retStartTime = retData[i].start_time;
                        var retTime = retStartTime.substring(0,10);
                        var retStoreName = retData[i].storename;
                        var retShopName = retData[i].name;
                        var retNumber = retData[i].count;
                        var retPrice = retData[i].price;
                        var retTatol = retData[i].tatol;
                        var retType = retData[i].type;
                        var retTypeData = "";
                        if(retType == 0){
                            retTypeData = "退货"
                        }else {
                            retTypeData = "换货"
                        }
                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+retOrderNumber+"</td>";
                        tbodyHtml += "<td>"+retOrderId+"</td>";
                        tbodyHtml += "<td>"+retPhoneNumber+"</td>";
                        tbodyHtml += "<td>"+retTime+"</td>";
                        tbodyHtml += "<td>"+retStoreName+"</td>";
                        tbodyHtml += "<td>"+retShopName+"</td>";
                        tbodyHtml += "<td>"+retNumber+"</td>";
                        tbodyHtml += "<td>"+retPrice+"</td>";
                        tbodyHtml += "<td>"+retTatol+"</td>";
                        tbodyHtml += "<td class='return-goods'>"+retTypeData+"</td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='SeeDetails("+retOrderNumber+");'>查看详情</a></td>";
                        tbodyHtml += "<td>";
                        tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#agreeModal' style='margin:0px 10px' id='' onclick='getOrderNumber("+retOrderNumber+");'>同意</button>";
                        tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#disagreeModal' style='margin:0px 10px' id='' onclick='getOrderNumber("+retOrderNumber+");'>不同意</button>";
                        tbodyHtml += "</td>";
                        tbodyHtml += "</tr>";

                        $("#Tbody").append(tbodyHtml);
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

    //查看详情
    function SeeDetails(retOrderNumber) {
        console.log(retOrderNumber);
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/order/getReturnExchangeDetail', //目标地址
            data : {
                orderNumber : retOrderNumber
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error('查询失败！');
                    return false;
                }else {
                    $("#loading").css("display", "none");
                    var retData = retInfo.data;
                    var retOrderNumber = retData.order_number;
                    var retOrderType = retData.type;
                    var retOrderId = retData.order_id;
                    var retPhoneNumber = retData.phone_number;
                    var retOrderTime = retData.order_time;
                    var retTime = retOrderTime.substring(0,10);
                    var retStoreName = retData.storename;
                    var retShopName = retData.name;
                    var retShopNumber = retData.count;
                    var retPrice = retData.price;
                    var retTatol = retData.tatol;
                    var retStoreAddress = retData.storeaddress;
                    var retSpecifications = retData.specifications;
                    var retMeasurementUnit = retData.measurement_unit;
                    var retCode = retData.code;
                    var retReason = retData.reason;
                    var retImg = retData.return_img;

                    var retType = "";
                    if (retOrderType == 0){
                        retType = "退货"
                    }else {
                        retType = "换货"
                    }
                    $("#orderNumber").val(retOrderNumber);
                    $("#storeType").val(retType);
                    $("#orderId").val(retOrderId);
                    $("#userName").val(retPhoneNumber);
                    $("#orderTime").val(retTime);
                    $("#storeName").val(retStoreName);
                    $("#shopAddress").val(retStoreAddress);
                    $("#shopCodeNumber").text(retCode);
                    $("#shopName").text(retShopName);
                    $("#shopModel").text(retSpecifications);
                    $("#shopCompany").text(retMeasurementUnit);
                    $("#shopNumber").text(retShopNumber);
                    $("#shopPrice").text(retPrice);
                    $("#shopTotal").text(retTatol);
                    $("#returnReason").val(retReason);
                    $("#summation").text("合计："+retTatol);
                    $("#retImg").attr("src","${bath}"+retImg);

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

    //同意不同意
    function WhetherAllow(orderNumer,type) {
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/order/updateReturnExchangeStus', //目标地址
            data : {
                orderNumber : orderNumer,
                auditStatus : type
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error('审核失败！');
                    return false;
                }else {
                    $("#loading").css("display", "none");
                    $("#disagreeModal").modal("hide");
                    $("#agreeModal").modal("hide");
                    toastr.success('审核成功！');
                    setTimeout(function(){
                        reset();
                    },2000);
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
    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#loading").css("display","block");
        getUserInfos(pageCount,currentPageNum);
    }

</script>
