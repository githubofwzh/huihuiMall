<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>调库审批</title>
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

    <style>
        .delBtn{
            margin: 0px;
            background-color: #b92c28;
            color:#FFFFFF;
            border-color: #b92c28;
        }

        .delBtn:hover{
            background-color: #b92c28;
            color:#FFFFFF;
            border-color: #b92c28;
        }

        .delBtn:focus{
            background-color: #b92c28 !important;
            color:#FFFFFF;
            border-color: #b92c28;
        }
    </style>

</head>
<body>

<div class="container-fluid btn-operation-panel">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span>调库单号：</span>
            <input type="text" id="codeKey" placeholder="请输入调库单号">

<#--            <span style="margin-left: 10px">调库状态：</span>
            <select style="width: 10%" id="exchangeSelected">
                <option value="">请选择</option>
                <option value="1">审核中</option>
                <option value="2">审核通过</option>
                <option value="3">已出库</option>
            </select>-->

            <span style="margin-left: 10px">制单日期：</span>
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

            <table class="table table-bordered table-hover table-responsive" style="margin-top: 20px;">
                <thead>
                <tr>
                    <th width="80">
                        序号
                    </th>
                    <th>
                        调库单号
                    </th>
                    <th>
                        出货仓库
                    </th>
                    <th>
                        入货仓库
                    </th>
                    <th>
                        调库状态
                    </th>
                    <th>
                        制单日期
                    </th>
                    <th>
                        查看详情
                    </th>
                    <th>
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
        <div class="modal-dialog" style="width:60%">
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
                                        <label class="control-label">调库单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" id="dkCodeDetail" disabled="disabled">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">制单日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" id="creatOrderDate" disabled="disabled">
                                    </div>
                                </div>
                            </div>

                        <#--<div class="col-lg-12 col-md-12 col-xs-12 input-form">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label">出货仓库：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <input type="text" class="form-control required" placeholder="必填" id="">
                                </div>
                            </div>
                        </div>-->

                        <#--<div class="col-lg-12 col-md-12 col-xs-12 input-form">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label">入货仓库：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <input type="text" class="form-control required" placeholder="必填" id="">
                                </div>
                            </div>
                        </div>-->

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
                                                <th width="60">
                                                    规格型号
                                                </th>
                                                <th width="60">
                                                    计量单位
                                                </th>
                                                <th width="60">
                                                    商品数量
                                                </th>
                                                <th width="50">
                                                    单价
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

<!--审批面板开始-->
<div class="panel-body">
    <div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="applyModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 调库审批</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label">请选择仓库：</label>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div hidden class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <select class="form-select" id="itId">

                                    </select>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label">出库仓库：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <select class="form-select" id="ckStorageroomSelect">

                                    </select>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label">入库仓库：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <select class="form-select" id="rkStorageroomSelect" disabled="disabled">

                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirm" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off" onclick="confirm();">确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--审批面板结束-->

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

        //获取调库审批信息
        getExchangeStorageApplyInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getExchangeStorageApplyInfos(pageCount,1);
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
                getExchangeStorageApplyInfos(pageCount,currentPageNum);
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
                getExchangeStorageApplyInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //调库单填写modal展示
        /*  $("#inputGoodsModal").on("show.bs.modal", function () {
            var id = $("#storageBtn").parents("tr").attr("name");
            console.log(id);

            //getSelfStorageroom();
            getCkStorageroomList();
            getRkStorageroomList();
        })*/

    });

    function storageBtnClick(id,inhouse_id,rkStorageroomName) {
        getCkStorageroomList();
        getRkStorageroomList(id,inhouse_id,rkStorageroomName);
    }

    //获取信息方法
    function getExchangeStorageApplyInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var codeParam = $("#codeKey").val();
        //var exchangeSelectedParam = $("#exchangeSelected").find("option:selected").val();
        var startingDate = $("#startingDate").val();
        var endingDate = $("#endingDate").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/queryApproveInventory', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                code : codeParam,
                /*status : exchangeSelectedParam,*/
                startTime : startingDate,
                endTime : endingDate
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
                        var id = retData[i].id?retData[i].id:'';
                        var inhouse_id = retData[i].inhouse_id?retData[i].inhouse_id:'';
                        var dkcode = retData[i].code?retData[i].code:'';
                        var ckStorageroomName = retData[i].ck_name?retData[i].ck_name:'';
                        var rkStorageroomName = retData[i].rk_name?retData[i].rk_name:'';
                        var status = retData[i].status?retData[i].status:'';
                        var createTime = retData[i].create_time?retData[i].create_time:'';
                        var tbodyHtml = "<tr>";


                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+dkcode+"</td>";
                        tbodyHtml += "<td>"+ckStorageroomName+"</td>";
                        tbodyHtml += "<td>"+rkStorageroomName+"</td>";
                        switch(status)
                        {
                            case 1:
                                tbodyHtml += "<td>审核中</td>";
                                break;
                            case 2:
                                tbodyHtml += "<td>审核通过</td>";
                                break;
                            /*case 3:
                                tbodyHtml += "<td>已出库</td>";
                                break;
                            case 4:
                                tbodyHtml += "<td>已入库</td>";
                                break;*/
                        }
                        tbodyHtml += "<td>"+createTime+"</td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='openDetailModal(\""+dkcode+"\");'>查看详情</a></td>";
                        tbodyHtml += "<td>";
                        tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#applyModal' style='margin:0px' id='storageBtn' onclick='storageBtnClick(\""+id+"\",\""+inhouse_id+"\",\""+rkStorageroomName+"\");'>审批</button>";
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
                toastr.error("查询失败！");
                return false;
            }
        });
    }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#codeKey").val("");
        $("#endingDate").val("");
        $("#startingDate").val("");
        $("#selfStorageroomId").text("");
        $("#loading").css("display","block");
        getExchangeStorageInfos(pageCount,currentPageNum);
    }

    //审批方法
    function confirm(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var id =  $("#itId").val();
        console.log(id);

        var ckStorageroomSelectParam = $("#ckStorageroomSelect").find("option:selected").val();
        console.log(ckStorageroomSelectParam);
        if(ckStorageroomSelectParam == ""){
            toastr.error("出库仓库不能为空！");
            return false;
        }

        var rkStorageroomSelectParam = $("#rkStorageroomSelect").find("option:selected").val();
        console.log(rkStorageroomSelectParam);

        if(ckStorageroomSelectParam == rkStorageroomSelectParam){
            toastr.error("出、入仓库不能相同！");
            return false;
        }

        $("#confirm").button("loading");

       $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/Inventory/ApproveInventory', //目标地址
            data : {
                id : id,
                storehouseout : ckStorageroomSelectParam,
                storehousein : rkStorageroomSelectParam
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
                    $("#confirm").button('reset');
                    toastr.error("调库失败！");
                    return false;
                }else{
                    $("#confirm").button('reset');
                    $("#inputGoodsModal").modal("hide");
                    toastr.success("调库成功！");
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

    //获取出库库房列表
    function getCkStorageroomList(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/getStorehouseList', //目标地址
            data : {},
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
                    toastr.error("查询失败！");
                    return false;
                }else{

                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#ckStorageroomSelect").empty();
                    $("#ckStorageroomSelect").append("<option value=''>请选择</option>");

                    for(var s = 0; s < retDataLength; s++){

                        var ckStorageroomId = retData[s].id;
                        var ckStorageroomName = retData[s].storehouseName;

                        var selectedHtml = "<option value='"+ckStorageroomId+"'>"+ckStorageroomName+"</option>";
                        $("#ckStorageroomSelect").append(selectedHtml);
                    }
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

    //获取可入库库房列表
    function getRkStorageroomList(id,inhouse_id,rkStorageroomName){
        var selectedHtml = "<option value='"+inhouse_id+"'>"+rkStorageroomName+"</option>";
        $("#rkStorageroomSelect").append(selectedHtml);
        var itIdHtml = "<option value='"+id+"'>"+id+"</option>";
        $("#itId").append(itIdHtml);
        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };
    }

    //查看详情
    function openDetailModal(dkcode){
        console.log(dkcode);

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var dkcodeParam = dkcode;

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/TransferRecordDetail', //目标地址
            data : {
                code : dkcodeParam
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
                    toastr.error("查询失败！");
                    return false;
                }else{
                    var retData = retInfo.data;

                    //调库单信息
                    var retTransferData = retData.inventoryTransfer;
                    var dkCode = retTransferData.code;
                    var createdTime = retTransferData.createTime;

                    $("#dkCodeDetail").val(dkCode);
                    $("#creatOrderDate").val(createdTime);

                    //调库商品
                    var exchangeStorageProduct = retData.orderDetailProduct;
                    var exchangeStorageProductLength = exchangeStorageProduct.length;
                    console.log(exchangeStorageProduct);

                    $("#goodsListTbody").empty();

                    for(var esp = 0; esp < exchangeStorageProductLength; esp++){

                        var goodsCode = exchangeStorageProduct[esp].code;
                        var goodsName = exchangeStorageProduct[esp].name;
                        var goodsSpecifications = exchangeStorageProduct[esp].specifications;
                        var goodsMeasurementUnit = exchangeStorageProduct[esp].measurementUnit;
                        var goodsNumber = exchangeStorageProduct[esp].number;
                        var goodsPrice = exchangeStorageProduct[esp].price;

                        var goodsListHtml = "<tr>";
                        goodsListHtml += "<td>"+goodsCode+"</td>";
                        goodsListHtml += "<td>"+goodsName+"</td>";
                        goodsListHtml += "<td>"+goodsSpecifications+"</td>";
                        goodsListHtml += "<td>"+goodsMeasurementUnit+"</td>";
                        goodsListHtml += "<td>"+goodsNumber+"</td>";
                        goodsListHtml += "<td>"+goodsPrice+"</td>";
                        goodsListHtml += "</tr>";

                        $("#goodsListTbody").append(goodsListHtml);
                    }
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("操作失败！");
                return false;
            }
        });
    }

</script>
