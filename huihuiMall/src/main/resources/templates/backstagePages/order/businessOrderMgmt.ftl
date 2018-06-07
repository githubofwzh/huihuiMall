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
    <title>商家订单管理</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/form/form.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/table/table.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/checkbox_radio_select.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pagination.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/button.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/laydate/theme/default/laydate.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common.js" type="text/javascript" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/laydate/laydate.js" type="text/javascript"></script>
</head>
<body>

<label id="entCode" style="display: none">${entCode!""}</label>
<label id="accountType" style="display: none">${accountType!""}</label>

<div class="container-fluid btn-operation-panel">
    <div class="row">

        <div class="col-lg-12 col-md-12 col-xs-12 business-search-panel">

            <span>订单号：</span>
            <input type="text" id="orderNumKey" placeholder="请输入订单号" style="width: 10%">

            <span style="margin-left: 10px;display: none" id="businessNameSpan">商家名称：</span>
            <input type="text" id="businessNameKey" placeholder="请输入商家名称" style="width: 10%;display: none">

            <span style="margin-left: 10px">订单状态：</span>
            <select style="width: 10%" id="orderStatusSelected">
                <option value="">请选择</option>
                <option value="1">未支付</option>
                <option value="2">已取消</option>
                <option value="3">已支付</option>
                <#--<option value="7">已分配</option>-->
                <option value="4">已出库</option>
                <option value="5">已到店</option>
                <option value="6">已完成</option>
            </select>

            <span style="margin-left: 10px">日期：</span>
            <input type="text" id="startingDate" placeholder="请选择开始时间" style="width: 11%">
            <span>-</span>
            <input type="text" id="endingDate" placeholder="请选择结束时间" style="width: 11%">

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
                    <th id="businessNameTh" style="display:none;">
                        商家名称
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
                        订单金额
                    </th>
                    <th>
                        订单状态
                    </th>
                    <th>
                        订单详情
                    </th>
                    <th id="operationTh" style="display:none;">
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
                        当前<label id="currentPage"></label>/<label id="totalPages"></label>页
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
        <div class="modal-dialog" style="width: 60%">
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
                                        <label class="control-label">订单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderNumberDetail">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">下单人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderUserDetail">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">下单日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderDateDetail">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeNameDetail">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeAddressDetail">
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
                                                <th width="100">
                                                    商品编号
                                                </th>
                                                <th width="120">
                                                    商品名称
                                                </th>
                                                <th width="100">
                                                    规格型号
                                                </th>
                                                <th width="100">
                                                    计量单位
                                                </th>
                                                <th width="100">
                                                    商品数量
                                                </th>
                                                <th width="50">
                                                    单价
                                                </th>
                                                <th width="50">
                                                    小计
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="goodsDetailTbody">

                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td colspan="7" id="orderTotal"></td>
                                            </tr>
                                            </tfoot>
                                        </table>
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

<!--出库弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="outStoreModal" tabindex="-1" role="dialog" aria-labelledby="outStoreModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="outStoreModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 出库</h4>
                </div>
                <div class="modal-body">
                    确定要出库该商品吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmOutStore" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--出库弹出面板结束-->

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var entCode = $("#entCode").text();
    var accountType = $("#accountType").text();

    $(document).ready(function() {

        //执行一个laydate实例
        laydate.render({
            elem: "#startingDate",//指定元素
            theme: '#3c8dbc'
        });

        laydate.render({
            elem: "#endingDate",//指定元素
            theme: '#3c8dbc'
        });

        $("#loading").css("display","block");

        //根据账户类型判断搜索面板显示内容
        //系统管理员
        if(accountType == 3){
            $("#businessNameTh").css("display","block");
            $("#businessNameSpan").css("display","inline-block");
            $("#businessNameKey").css("display","inline-block");
        }

        //第三方管理员
        if(accountType == 2){
            $("#operationTh").css("display","block");
        }

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页*/

        //获取第三方订单信息
        getBusinessOrderInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getBusinessOrderInfos(pageCount,1);
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
                getBusinessOrderInfos(pageCount,currentPageNum);
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
                getBusinessOrderInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

    });

    //获取订单信息方法
    function getBusinessOrderInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        if(accountType == 2){
            var orderTypeParam = 1; //第三方订单类型
            var orderNumKeyParam = $("#orderNumKey").val();
            var businessNameKeyParam = "";
            var orderStatusSelectedParam = $("#orderStatusSelected").val();
            var startingDateParam = $("#startingDate").val();
            var endingDateParam = $("#endingDate").val();
            var entCodeParam = entCode;
        }else{
            var orderTypeParam = 1; //第三方订单类型
            var orderNumKeyParam = $("#orderNumKey").val();
            var businessNameKeyParam = $("#businessNameKey").val();
            var orderStatusSelectedParam = $("#orderStatusSelected").val();
            var startingDateParam = $("#startingDate").val();
            var endingDateParam = $("#endingDate").val();
            var entCodeParam = "";
        }

        $("#currentPage").html(currentPageNum);
        var accountIdParam = sessionStorage.getItem("userId");
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/order/queryAllOrder', //目标地址
            data : {
                accountId : accountIdParam,
                PageNum : currentPageNum,
                PageSize : pageCount,
                orderNumber : orderNumKeyParam,
                startTime : startingDateParam,
                endTime : endingDateParam,
                type : orderTypeParam,
                orderstatus : orderStatusSelectedParam,
                merchantname : businessNameKeyParam,
                entCode : entCodeParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

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

                    for(var i = 0; i < retDataLength; i++){
                        var index = i + 1;
                        var orderId = retData[i].id;
                        var orderUser = retData[i].phone_number;
                        var orderDate = retData[i].start_time;
                        var orderTime = orderDate.substring(0,10);
                        var storeName = retData[i].storename;
                        var orderStatus = retData[i].orderstatus;
                        var orderNumber = retData[i].order_number;
                        var businessName = retData[i].merchantname;
                        var ordertotal = retData[i].ordertotal;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        if(accountType == 3){
                            tbodyHtml += "<td>"+businessName+"</td>";
                        }
                        tbodyHtml += "<td>"+orderNumber+"</td>";
                        tbodyHtml += "<td>"+orderUser+"</td>";
                        tbodyHtml += " <td>"+orderTime+"</td>";
                        tbodyHtml += "<td>"+storeName+"</td>";
                        tbodyHtml += "<td>"+ordertotal+"</td>";

                        if(orderStatus == "1"){
                            tbodyHtml += "<td class='un-pay'>未支付</td>";
                        }else if(orderStatus == "2"){
                            tbodyHtml += "<td class='be-cancel'>已取消</td>";
                        }else if(orderStatus == "3"){
                            tbodyHtml += "<td class='paid'>已支付</td>";
                        }else if(orderStatus == "4"){
                            tbodyHtml += "<td class='out-store'>已出库</td>";
                        }else if(orderStatus == "5"){
                            tbodyHtml += "<td class='arrive-shop'>已到店</td>";
                        }else{
                            tbodyHtml += "<td class='finished'>已完成</td>";
                        }

                        tbodyHtml += "<td>";
                        tbodyHtml += "<a href='#' data-toggle='modal' data-target='#detailModal' id='"+orderNumber+"' onclick='getOrderDetail(id,"+orderUser+","+ordertotal+")'>查看详情</a>";
                        tbodyHtml += "</td>";

                        if(accountType == 2){
                            tbodyHtml += "<td>";
                            if(orderStatus == "3"){
                                tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#outStoreModal' style='margin:0px' id='"+orderId+"' onclick='openOutStoreModal(id);'>出库</button>";
                            }else{
                                tbodyHtml += "<button type='button' class='btn btn-default disabled' style='margin:0px'>已出库</button>";
                            }
                            tbodyHtml += "</td>";
                        }
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

    //查看订单详情
    function getOrderDetail(orderNumber,orderUser,orderTotal){

        $("#loading").css("display","block");

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var orderNumberParam = orderNumber;
        console.log(orderNumberParam);
        var orderUserParam = orderUser;
        console.log(orderUserParam);
        var orderTotalParam = orderTotal;
        console.log(orderTotalParam);

        $("#orderTotal").empty();
        $("#orderTotal").append("订单金额：" + orderTotalParam);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/order/getOrderDetail', //目标地址
            data : {
                orderNumber : orderNumberParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

                var retCode = retInfo.retCode;

                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error('查询失败！');
                    return false;
                }else{
                    $("#loading").css("display","none");
                    var retData = retInfo.data;
                    var orderInfoData = retData.storeOrder;

                    //订单相关信息
                    var orderNum = orderInfoData.orderNumber;
                    var orderDate = orderInfoData.startTime;
                    var storeName = orderInfoData.storename;
                    var storeAddress = orderInfoData.storeaddress;

                    $("#orderNumberDetail").val(orderNum);
                    $("#orderUserDetail").val(orderUserParam);
                    $("#orderDateDetail").val(orderDate);
                    $("#storeNameDetail").val(storeName);
                    $("#storeAddressDetail").val(storeAddress);

                    //订单商品清单
                    var goodsListData = retData.list;
                    var goodsListDataLength = goodsListData.length;
                    console.log(goodsListData);

                    $("#goodsDetailTbody").empty();

                    for(var g = 0; g < goodsListDataLength; g ++){

                        var goodsCode = goodsListData[g].code;
                        var goodsName = goodsListData[g].name;
                        var goodsNumber = goodsListData[g].number;

                        var specifications = goodsListData[g].specifications;
                        var measurementUnit = goodsListData[g].measurementUnit;
                        var goodsNumber = goodsListData[g].number;

                        var price = goodsListData[g].price;
                        var orderTotal = goodsListData[g].orderTotal;
                        var total = goodsListData[g].total;

                        var goodsListHtml = "<tr>";
                        goodsListHtml += "<td>"+goodsCode+"</td>";
                        goodsListHtml += "<td>"+goodsName+"</td>";
                        goodsListHtml += "<td>"+specifications+"</td>";
                        goodsListHtml += "<td>"+measurementUnit+"</td>";
                        goodsListHtml += "<td>"+goodsNumber+"</td>";
                        goodsListHtml += "<td>"+price+"</td>";
                        goodsListHtml += "<td>"+total+"</td>";
                        goodsListHtml += "</tr>";

                        $("#goodsDetailTbody").append(goodsListHtml);
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

    //出库弹窗
    function openOutStoreModal(id){
        var idParam = id;
        console.log(idParam);
        $("#confirmOutStore").attr("onclick","confirm('"+idParam+"')");
    }

    //出库确认
    function confirm(orderId){

        var orderIdParam = orderId;
        console.log(orderIdParam);
        var orderStatusParam = 4;

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $("#confirmOutStore").button("loading");

        $("#loading").css("display","block");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/order/updateOrder', //目标地址
            data : {
                id : orderIdParam,
                orderstatus : orderStatusParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

                var retCode = retInfo.retCode;

                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error("出库失败！");
                    return false;
                }else{
                    $("#confirmOutStore").button('reset');
                    $('#outStoreModal').modal("hide");
                    toastr.success("出库成功！");
                    setTimeout(function(){
                        reset();
                    },2000);

                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("操作失败！");
                return false;
            }
        });
    }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        if(accountType == 2){
            $("#orderNumKey").val("");
            $("#orderStatusSelected option:first").prop("selected", "selected");
            $("#startingDate").val("");
            $("#endingDate").val("");
        }else{
            $("#orderNumKey").val("");
            $("#businessNameKey").val("");
            $("#orderStatusSelected option:first").prop("selected", "selected");
            $("#startingDate").val("");
            $("#endingDate").val("");
        }
        $("#loading").css("display","block");
        getBusinessOrderInfos(pageCount,currentPageNum);
    }

</script>
