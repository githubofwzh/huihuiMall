<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>入库记录</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
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

<div class="container-fluid btn-operation-panel">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span>入库单号：</span>
            <input type="text" id="searchCodeKey" placeholder="请输入入库单号">

            <span style="margin-left: 10px">入库类型：</span>
            <select style="width: 10%" id="searchStatusSelected">
                <option value="">请选择</option>
                <option value="1">采购</option>
                <option value="2">退货</option>
                <option value="3">换货</option>
            </select>

            <span style="margin-left: 10px">入库日期：</span>
            <input type="text" id="startingDate" placeholder="开始时间">
            <span>-</span>
            <input type="text" id="endingDate" placeholder="结束时间">

            <button type="button" class="btn btn-default" id="searchBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">

            <div class="col-lg-12 col-md-12 col-xs-12 btn-group-panel">
                <button type="button" class="btn btn-default" id="excelExport">
                    <i class="fa fa-download fa-fw"></i> 导出Excel</button>
            <button type="button" class="btn btn-default" id="Printing"  data-toggle='modal' data-target='#detailModal2'>
                    <i class="fa fa-plus fa-fw"></i> 预览打印</button>
            </div>

            <table class="table table-bordered table-hover table-responsive" style="margin-top: 20px;">
                <label id="checkboxSelected" style="display:none"></label>
                <thead>
                <tr>
                    <th width="50">

                    </th>
                    <th width="80">
                        序号
                    </th>
                    <th>
                        入库单号
                    </th>
                    <th>
                        入库类型
                    </th>
                    <th>
                        入库日期
                    </th>
                    <th>
                        仓库名称
                    </th>
                    <th>
                        操作人
                    </th>
                    <th>
                        查看详情
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
                                        <label class="control-label">入库单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="rkCode">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">入库类型：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="rkType">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">入库日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="rkDate">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="rkStorageName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">操作人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="rkOperator">
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
                                                <th width="120">
                                                    商品名称
                                                </th>
                                                <th width="70">
                                                    规格型号
                                                </th>
                                                <th width="70">
                                                    计量单位
                                                </th>
                                                <th width="40">
                                                    单价
                                                </th>
                                                <th width="100">
                                                    入库商品数量
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="goodsListTbody">

                                            </tbody>
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

<!--预览打印弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal2" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 80%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="detailModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 预览打印</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-12 col-md-12 col-xs-12 input-box">
                                      <button type="button" class="btn btn-default" id="viewPrint">打印</button>
                                 <!--startprint-->
                                        <table class="table table-bordered" style="height:350px;border:2px solid black" width="100%">
                                                <thead style="background-color : #fff;">

                                                <tr><td colspan="7" class="text-center">惠惠网店入库单</td></tr>
                                                <td class="tdOne">入库日期</td>
                                                <td class="chukuTime" colspan="2"></td>
                                                <td class="tdOne">入库单号</td>
                                                <td class="chukuNumber" colspan="3"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tdOne">入库仓库</td>
                                                    <td class="rukuRoom" colspan="2"></td>
                                                    <td class="tdOne">入库类型</td>
                                                    <td class="rukuType" colspan="3"></td>
                                                </tr>

                                                <tr style="height:1.5px;border:none;border-top:1.5px solid black;">
                                                    <td class="tdOne" style="vertical-align: middle;">商品编号</td>
                                                    <td class="tdOne">商品名称</td>
                                                    <td class="tdOne">规格</td>
                                                    <td class="tdOne">单位</td>
                                                    <td class="tdOne">数量</td>
                                                    <td class="tdOne">单价</td>
                                                    <td class="tdOne">小计</td>
                                                </tr>
                                                </thead>
                                                <tbody id="chukuTbody">

                                                </tbody>
                                                <tfoot>
                                                <tr>
                                                    <td class="tdOne">合计</td>
                                                    <td class="Total" colspan="6"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tdOne">备注</td>
                                                    <td class="tdOne" colspan="6"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tdOne">入库人</td>
                                                    <td class="chukuMan" colspan="6"></td>
                                                </tr>
                                                </tfoot>
                                            </table>
                                 <!--endprint-->

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
<!--预览打印弹出面板结束-->

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var orderNumberId = "";
    $(document).ready(function() {

        $("#loading").css("display","none");

        //执行一个laydate实例
        laydate.render({
            elem: "#startingDate",//指定元素
            theme: '#3c8dbc'
        });

        laydate.render({
            elem: "#endingDate",//指定元素
            theme: '#3c8dbc'
        });

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页*/

        //获取当日任务计划号
        getStorageRecordInfos(pageCount,currentPageNum);

        //打印
          $("#viewPrint").click(function(){
            var startingDate = $("#startingDate").val();
            var endingDate = $("#endingDate").val();
            viewPrint(pageCount,1,startingDate,endingDate);
        });
        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getStorageRecordInfos(pageCount,1);
        });

         $("#excelExport").click(function(){
            excelExport(pageCount,1);
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
                getStorageRecordInfos(pageCount,currentPageNum);
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
                getStorageRecordInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });


        //预览
        $("#Printing").click(function () {
            if (orderNumberId != ""){
                $("#detailModal2").show();
                Printing();
            }else {
                toastr.error("请选择需要打印的订单！")
            }
        })
    });

    //获取信息方法
    function getStorageRecordInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var searchCodeKeyParam = $("#searchCodeKey").val();
        var searchStatusSelectedParam = $("#searchStatusSelected").find("option:selected").val();
        var startTimeParam = $("#startingDate").val();
        var endTimeParam = $("#endingDate").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/queryInventoryRecord', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                code : searchCodeKeyParam,
                status : searchStatusSelectedParam,
                startTime : startTimeParam,
                endTime : endTimeParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);

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
                    toastr.error("查询失败！");
                    return false;
                }else{
                    $("#loading").css("display","none");
                    var retData = retInfo.data;
                    console.log(retData);
                    var retDataLength = retData.length;

                    $("#Tbody").empty();

                    for(var i = 0 ;i < retDataLength; i ++){
                        var index = i + 1;
                        var id = retData[i].id;
                        var code = retData[i].code;
                        var createTime = retData[i].create_time;
                        var storehouseName = retData[i].storehouse_name;
                        var storageType = retData[i].status;
                        var createUser = retData[i].create_user;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox' class='orderNumber' onclick='orderId("+id+");' name='click' value='"+id+"'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+code+"</td>";

                        if(storageType == 1){
                            tbodyHtml += "<td>采购</td>";
                        }else if(storageType==2){
                            tbodyHtml += "<td>退货</td>";
                        }else{
                             tbodyHtml += "<td>换货</td>";
                         }

                        if(createTime == null || createTime == "" || createTime == undefined){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+createTime+"</td>";
                        }

                        tbodyHtml += "<td>"+storehouseName+"</td>";
                        tbodyHtml += "<td>"+createUser+"</td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='openDetailModal(\""+id+"\");'>查看详情</a></td>";
                        tbodyHtml += "</tr>";

                        $("#Tbody").append(tbodyHtml);

                    }

                    $(".mycheckbox").on("click", function() {
                        if ($(this).prop("checked")) {
                            $(".mycheckbox").prop("checked", false);
                            $(this).prop("checked", true);
                            var checkboxID = $(this).attr("id");
                            $("#checkboxSelected").text(checkboxID);
                        }
                        else {
                            $("#checkboxSelected").text("");
                        }
                    });
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

    //入库单ID
    function orderId(id) {
        orderNumberId = id;
        return orderNumberId;
    }

    //打印
    function Printing() {
        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/InInventoryRecordDetail', //目标地址
            data : {
                id : orderNumberId
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
                    toastr.error("查询失败！");
                    return false;
                }else{
                    var retData = retInfo.data;
                    console.log(retData);
                    var rkCode = retData.code;//入库单号
                    var createTime = retData.createTime;//入库日期
                    var createUser = retData.createUser;//操作人
                    var status = retData.status;//入库类型
                    var storehouseName = retData.storehouseName;//入库仓库名称
                    if(status == 1){
                        $(".rukuType").text("采购");
                    }else if(status==2){
                        $(".rukuType").text("退货");
                    }else{
                        $(".rukuType").text("换货");
                    }

                    $(".chukuTime").text(createTime);
                    $(".chukuNumber").text(rkCode);
                    $(".rukuRoom").text(storehouseName);
                    $(".chukuMan").text(createUser);


                    //商品清单
                    var retGoodsData = retData.orderDetailProduct;
                    var retGoodsDataLength = retGoodsData.length;

                    $("#chukuTbody").empty();

                    for(var gl = 0; gl < retGoodsDataLength; gl++){

                        var goodsCode = retGoodsData[gl].code;//商品编码
                        var goodsName = retGoodsData[gl].name;//商品名称
                        var goodsSpecifications = retGoodsData[gl].specifications;//规格型号
                        var goodsMeasurementUnit = retGoodsData[gl].measurementUnit;//计量单位
                        var goodsPrice = retGoodsData[gl].price;//单价
                        var goodsNumber = retGoodsData[gl].number;//数量
                        var goodsListHtml = "<tr>";
                        goodsListHtml += "<td>"+goodsCode+"</td>";
                        goodsListHtml += "<td>"+goodsName+"</td>";
                        goodsListHtml += "<td>"+goodsSpecifications+"</td>";
                        goodsListHtml += "<td>"+goodsMeasurementUnit+"</td>";
                        goodsListHtml += "<td>"+goodsNumber+"</td>";
                        goodsListHtml += "<td>"+goodsPrice+"</td>";
                        goodsListHtml += "<td>"+goodsPrice+"</td>";
                        goodsListHtml += "</tr>";
                        $("#chukuTbody").append(goodsListHtml);
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

    //查看详情方法
    function openDetailModal(rkCode){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var rkCodeParam = rkCode;

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/InInventoryRecordDetail', //目标地址
            data : {
                id : rkCodeParam
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
                    toastr.error("查询失败！");
                    return false;
                }else{
                    var retData = retInfo.data;
                    console.log(retData);
                    var rkCode = retData.code;
                    var createTime = retData.createTime;
                    var createUser = retData.createUser;
                    var status = retData.status;
                    var storehouseName = retData.storehouseName;

                    $("#rkCode").val(rkCode);
                    if(status == 1){
                        $("#rkType").val("采购");
                    }else if(status==2){
                        $("#rkType").val("退货");
                    }else{
                         $("#rkType").val("换货");
                     }

                    $("#rkDate").val(createTime);
                    $("#rkStorageName").val(storehouseName);
                    $("#rkOperator").val(createUser);

                    //商品清单
                    var retGoodsData = retData.orderDetailProduct;
                    var retGoodsDataLength = retGoodsData.length;

                    $("#goodsListTbody").empty();

                    for(var gl = 0; gl < retGoodsDataLength; gl++){

                        var goodsCode = retGoodsData[gl].code;
                        var goodsName = retGoodsData[gl].name;
                        var goodsSpecifications = retGoodsData[gl].specifications;
                        var goodsMeasurementUnit = retGoodsData[gl].measurementUnit;
                        var goodsPrice = retGoodsData[gl].price;
                        var goodsNumber = retGoodsData[gl].number;

                        var goodsListHtml = "<tr>";
                        goodsListHtml += "<td>"+goodsCode+"</td>";
                        goodsListHtml += "<td>"+goodsName+"</td>";
                        goodsListHtml += "<td>"+goodsSpecifications+"</td>";
                        goodsListHtml += "<td>"+goodsMeasurementUnit+"</td>";
                        goodsListHtml += "<td>"+goodsPrice+"</td>";
                        goodsListHtml += "<td>"+goodsNumber+"</td>";
                        goodsListHtml += "</tr>";

                        $("#goodsListTbody").append(goodsListHtml);
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
    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchCodeKey").val("");
        $("#searchStatusSelected option:first").prop("selected", "selected");
        $("#startingDate").val("");
        $("#endingDate").val("");
        $("#checkboxSelected").text("");
        $("#loading").css("display","block");
        getStorageRecordInfos(pageCount,currentPageNum);
    }

   function excelExport(pageCount,currentPageNum,startingDate,endingDate){
           var searchCodeKeyParam = $("#searchCodeKey").val();
           var searchStatusSelectedParam = $("#searchStatusSelected").find("option:selected").val();
           var startTimeParam = $("#startingDate").val();
           var endTimeParam = $("#endingDate").val();
           var param= {
                   code : searchCodeKeyParam,
                   status : searchStatusSelectedParam,
                   startTime : startTimeParam,
                   endTime : endTimeParam  };
            window.location.href="${bath}/InventoryExecel/InInventoryRecord?param="+param;

        }

//浏览打印
    function viewPrint(orderNumber,orderUser,orderTotal){
           bdhtml=window.document.body.innerHTML;
           sprnstr="<!--startprint-->";
           eprnstr="<!--endprint-->";
           prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+17);
           prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
           window.document.body.innerHTML=prnhtml;
           window.print();
           window.location.reload();
    }

</script>
