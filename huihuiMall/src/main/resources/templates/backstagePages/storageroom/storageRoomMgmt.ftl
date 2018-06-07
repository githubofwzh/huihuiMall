<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>库房管理</title>
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

            <span>库房名称：</span>
            <input type="text" id="storageroomNameKey" placeholder="请输入库房名称">

            <span style="margin-left: 10px">区域：</span>
            <select style="width: 10%" id="areaSelected">

            </select>

            <button type="button" class="btn btn-default" id="searchBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">

            <div class="col-lg-12 col-md-12 col-xs-12 btn-group-panel">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal">
                    <i class="fa fa-plus fa-fw"></i> 添加</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyModal" id="modifyBtn">
                    <i class="fa fa-edit fa-fw"></i> 修改</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteModal" id="deleteBtn">
                    <i class="fa fa-trash-o fa-fw"></i> 删除</button>
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
                        仓库名称
                    </th>
                    <th>
                        所属区域
                    </th>
                    <th>
                        仓库地址
                    </th>
                    <th>
                        仓库面积
                    </th>
                    <th>
                        管理员
                    </th>
                    <th>
                        联系方式
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

<!--添加弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="addModalLabel">
                        <i class="fa fa-plus fa-fw"></i> 添加</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="storageroomName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">所属区域：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="area">

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="storageroomAddress">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库面积：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="storeageroomSpace">
                                        <span class="input-group-addon">平方米</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off" onclick="addStorageroom();">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加弹出面板结束-->

<!--修改弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="modifyModalLabel">
                        <i class="fa fa-edit fa-fw"></i> 修改</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyStorageroomName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">所属区域：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="modifyArea">

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyStorageroomAddress">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库面积：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyStoreageroomSpace">
                                        <span class="input-group-addon">平方米</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmModify" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--修改弹出面板结束-->

<!--删除弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="deleteModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 删除</h4>
                </div>
                <div class="modal-body">
                    确定要删除选中的1项记录？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmDelete" data-loading-text="删除中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--删除面板结束-->

<!--设置管理员弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="setAdminModal" tabindex="-1" role="dialog" aria-labelledby="setAdminModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:800px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="setAdminModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 设置管理员</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid table-operation-panel" style="padding:0px;">
                        <div class="row table-row">

                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <span style="margin-left: 10px">管理员姓名：</span>
                                <input type="text" id="adminNameKey" placeholder="请输入姓名" style="width:20%">

                                <button type="button" class="btn btn-default" id="searchAdminBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
                                <button type="button" class="btn btn-default" id="resetAdminBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 table-panel">
                                <table class="table table-bordered table-hover table-responsive" style="margin-top: 15px;">
                                    <label id="adminCheckboxSelected" style="display:none"></label>
                                    <thead>
                                    <tr>
                                        <th width="50px">

                                        </th>
                                        <th width="80px">
                                            序号
                                        </th>
                                        <th>
                                            姓名
                                        </th>
                                        <th>
                                            联系方式
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody id="adminTbody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmSave" style="margin-top: 0px" data-loading-text="保存中..." autocomplete="off">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--设置管理员弹出面板结束-->

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var pageCount=20;   //每页条数
    var currentPageNum=1;  //当前页数,默认首页为第一页

    var storageroomIdParam = "";

    $(document).ready(function() {

        $("#loading").css("display","block");

        //获取搜索面板区域信息
        getSearchStorageroomAreaInfos();

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getStorageroomInfos(pageCount,1);
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
                getStorageroomInfos(pageCount,currentPageNum);
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
                getStorageroomInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //新增addModal关闭清空未提交数据
        $("#addModal").on("hide.bs.modal", function () {
            $("input").val("");
            $("#area option:first").prop("selected", "selected");
        });

        //addModal显示时获取区域列表信息
        $("#addModal").on("show.bs.modal", function () {
            getStorageroomAreaInfo(0);
        });

        //修改点击
        $("#modifyBtn").click(function () {

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            if (checkboxSelectedID == "") {
                toastr.error("请选择一条要修改的记录！");
                return false;
            }else {
                $("#modifyModal").toggle();
                var modifyRecordID = parseInt(checkboxSelectedID);
                console.log(modifyRecordID);

                //修改前查询
                $.ajax({
                    type: "GET", //用GET方式传输
                    url: '${bath}/storeHouseMgmt/getStoreHouseById', //目标地址
                    data: {
                        id : modifyRecordID
                    },
                    beforeSend: function (jqXHR) {
                        if (undefined != header) {
                            jqXHR.setRequestHeader(header, token);
                        }
                    },
                    dataType: "json", //数据格式:JSON
                    success: function (retInfo) {
                        var retData = retInfo.data;
                        console.log(retData);

                        var areaId = retData.areaId;
                        getStorageroomAreaInfo(areaId);

                        var StorageroomName = retData.storehouseName;
                        var StorageroomAddress = retData.address;
                        var StoreageroomSpace = retData.space;

                        $("#modifyStorageroomName").val(StorageroomName);
                        $("#modifyStorageroomAddress").val(StorageroomAddress);
                        $("#modifyStoreageroomSpace").val(StoreageroomSpace);
                    },
                    error: function (XMLHttpRequest, textStatus) {
                        console.log(XMLHttpRequest);
                        console.log(textStatus);
                        toastr.error("获取信息失败！");
                        return false;
                    }
                });
                $("#confirmModify").attr("onclick", "modifyRecord(" + checkboxSelectedID + ");");
            }
        });

        //修改前清空
        $("#modifyModal").on("hide.bs.modal", function () {
            $("input").val("");
            $("#modifyArea option:first").prop("selected", "selected");
            $("#adminCheckboxSelected").text("");
        });

        //删除点击
        $("#deleteBtn").click(function(){

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                toastr.error("请选择一条要删除的记录！");
                return false;
            }
            else{
                $("#deleteModal").toggle();
                $("#confirmDelete").attr("onclick","delRecord("+checkboxSelectedID+");");
            }
        });

        //设置管理员弹窗关闭清空
        $("#setAdminModal").on("hide.bs.modal", function () {
            $("#adminCheckboxSelected").text("");
        });

    });

    //获取信息方法
    function getStorageroomInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storageroomNameKeyParam = $("#storageroomNameKey").val();
        var areaSelectedParam = $("#areaSelected").find("option:selected").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/storeHouseMgmt/queryAllStoreHouse', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                storeHouseName : storageroomNameKeyParam,
                areaId : areaSelectedParam
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

                    for(var i = 0; i < retDataLength; i++){
                        var index = i + 1;
                        var id = retData[i].id;
                        var storehouseName = retData[i].storehouseName;
                        var areaName = retData[i].areaName;
                        var address = retData[i].address;
                        var space = retData[i].space;
                        var managerName = retData[i].managerName;
                        var phone = retData[i].phone;
                        var managerId = retData[i].managerId;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox' id='"+id+"' class='mycheckbox'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+storehouseName+"</td>";
                        tbodyHtml += "<td>"+areaName+"</td>";
                        tbodyHtml += "<td>"+address+"</td>";
                        tbodyHtml += "<td>"+space+"平方米</td>";

                        if(managerName == null || managerName == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+managerName+"</td>";
                        }

                        if(phone == null || phone == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+phone+"</td>";
                        }

                        tbodyHtml += "<td>";
                        tbodyHtml += "<a href='#' data-toggle='modal' data-target='#setAdminModal' id='"+id+"' onclick='setAdmin(id,\""+managerId+"\");'>设置管理员</a>";
                        tbodyHtml += "</td>";
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

    //添加仓库方法
    function addStorageroom(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storageroomNameParam = $("#storageroomName").val();
        if (storageroomNameParam == "") {
            toastr.error("仓库名称不能为空！");
            return false;
        }

        var areaIdParam = $("#area").find("option:selected").val();

        var areaNameParam = $("#area").find("option:selected").text();

        var storageroomAddressParam = $("#storageroomAddress").val();
        if (storageroomAddressParam == "") {
            toastr.error("仓库地址不能为空！");
            return false;
        }

        var storeageroomSpaceParam = $("#storeageroomSpace").val();
        if (storeageroomSpaceParam == "") {
            toastr.error("仓库面积不能为空！");
            return false;
        }

        $("#confirmAdd").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/storeHouseMgmt/addStroeHouse', //目标地址
            data: {
                storeHouseName : storageroomNameParam,
                areaId : areaIdParam,
                areaName : areaNameParam,
                space : storeageroomSpaceParam,
                address : storageroomAddressParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                console.log(retCode);
                if (retCode != 0) {
                    $("#confirmAdd").button("reset");
                    toastr.error("添加失败！");
                    return false;
                }
                else {
                    $("#confirmAdd").button("reset");
                    $("input").val("");
                    $("#area option:first").prop("selected", "selected");
                    $("#addModal").modal("hide");
                    toastr.success("添加成功！");
                    setTimeout(function () {
                        reset();
                    }, 2000);
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#confirmAdd").button("reset");
                toastr.error("添加失败！");
                return false;
            }
        });
    }

    //修改实现方法
    function modifyRecord(checkboxSelectedID) {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var modifyRecordID = parseInt(checkboxSelectedID);
        console.log(modifyRecordID);

        var modifyStorageroomNameParam = $("#modifyStorageroomName").val();
        if (modifyStorageroomNameParam == "") {
            toastr.error("仓库名称不能为空！");
            return false;
        }

        var modifyStorageroomAddressParam = $("#modifyStorageroomAddress").val();
        if (modifyStorageroomAddressParam == "") {
            toastr.error("仓库地址不能为空！");
            return false;
        }

        var modifyStoreageroomSpaceParam = $("#modifyStoreageroomSpace").val();
        if (modifyStoreageroomSpaceParam == "") {
            toastr.error("仓库面积不能为空！");
            return false;
        }

        var modifyAreaId = $("#modifyArea").find("option:selected").val();
        var modifyAreaIdParam = modifyAreaId;
        console.log(modifyAreaIdParam);

        var modifyAreaName = $("#modifyArea").find("option:selected").text();
        var modifyAreaNameParam = modifyAreaName;
        console.log(modifyAreaNameParam);

        $("#confirmModify").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/storeHouseMgmt/updateStroeHouse', //目标地址
            data: {
                id : modifyRecordID,
                storeHouseName : modifyStorageroomNameParam,
                areaId : modifyAreaIdParam,
                areaName : modifyAreaNameParam,
                space : modifyStoreageroomSpaceParam,
                address : modifyStorageroomAddressParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if (retCode != 0) {
                    $("#confirmModify").button("reset");
                    toastr.error("修改失败！");
                    return false;
                }else {
                    $("#confirmModify").button("reset");
                    $("input").val("");
                    $("#modifyArea option:first").prop("selected", "selected");
                    $("#modifyModal").modal("hide");
                    toastr.success("修改成功！");
                    setTimeout(function () {
                        reset();
                    }, 2000);
                }

            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#confirmModify").button('reset');
                toastr.error("修改失败！");
                return false;
            }
        });

    }

    //删除仓库实现方法
    function delRecord(storageroomId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storageroomIdParam = storageroomId;

        $("#confirmDelete").button("loading");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/storeHouseMgmt/deleteStroeHouse', //目标地址
            data : {
                id : storageroomIdParam
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
                    $("#confirmDelete").button('reset');
                    toastr.error("删除失败！");
                    return false;
                }
                else{
                    $("#confirmDelete").button('reset');
                    $("#deleteModal").modal("hide");
                    toastr.success("删除成功！");
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

    //设置管理员modal打开
    function setAdmin(sId,mId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var managerIdParam = mId;
        storageroomIdParam = sId;
        var adminNameKeyParam = $("#adminNameKey").val();

        $("#loading").css("display","block");

        $.ajax({
            type: "GET", //用GET方式传输
            url: '${bath}/accountMgmt/queryStorageManagers', //目标地址
            data: {
                name : adminNameKeyParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error("获取数据失败！");
                    return false;
                }else{

                    $("#loading").css("display","none");

                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#adminTbody").empty();

                    for(var m = 0; m < retDataLength; m++){
                        var index = m + 1;
                        var id = retData[m].id;
                        var adminName = retData[m].name;
                        var adminPhone = retData[m].phone;

                        var adminTbodyHtml = "<tr>";
                        if(managerIdParam == id){
                            adminTbodyHtml += "<td><input type='checkbox' id='"+id+"' checked='checked' class='classifycheckbox'/></td>";
                            $("#adminCheckboxSelected").text(id);
                        }else{
                            adminTbodyHtml += "<td><input type='checkbox' id='"+id+"' class='classifycheckbox'/></td>";
                        }

                        adminTbodyHtml += "<td>"+index+"</td>";
                        adminTbodyHtml += "<td>"+adminName+"</td>";
                        adminTbodyHtml += "<td>"+adminPhone+"</td>";
                        adminTbodyHtml += "</tr>";

                        $("#adminTbody").append(adminTbodyHtml);
                    }

                    $(".classifycheckbox").on("click", function () {
                        if ($(this).prop("checked")) {
                            $(".classifycheckbox").prop("checked", false);
                            $(this).prop("checked", true);
                            var checkboxID = $(this).attr("id");
                            $("#adminCheckboxSelected").text(checkboxID);
                        }
                        else {
                            $("#adminCheckboxSelected").text("");
                        }
                    });
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("获取数据失败！");
                return false;
            }
        });

        //设置管理员搜索点击
        $("#searchAdminBtn").click(function(){
            $("#adminTbody").empty();
            $("#loading").css("display","block");
            $("#adminCheckboxSelected").text("");
            setAdmin(storageroomIdParam,managerIdParam);
        });

        //设置管理员重置点击
        $("#resetAdminBtn").click(function(){
            $("#adminTbody").empty();
            $("#adminNameKey").val("");
            $("#adminCheckboxSelected").text("");
            $("#loading").css("display","block");
            setAdmin(storageroomIdParam,managerIdParam);
        });
    }

    //保存按钮
    $("#confirmSave").click(function(){

        var adminCheckboxSelectedID = $("#adminCheckboxSelected").text();

        if(adminCheckboxSelectedID == ""){
            toastr.error("请选择一位库房管理员！");
            return false;
        }else{
            saveStorageroomAdmin(storageroomIdParam,adminCheckboxSelectedID);
        }
    });

    //保存库房管理员方法
    function saveStorageroomAdmin(storageroomId,adminCheckboxSelectedId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var saveStorageroomIdParam = storageroomId;
        var saveAdminCheckboxSelectedIdParam = adminCheckboxSelectedId;
        console.log(saveStorageroomIdParam);
        console.log(saveAdminCheckboxSelectedIdParam);

        $("#confirmSave").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/storeHouseMgmt/updateManager', //目标地址
            data: {
                id : saveStorageroomIdParam,
                managerId : saveAdminCheckboxSelectedIdParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    var retCodeData = retInfo.data;
                    if(retCodeData == 100055){
                        $("#confirmSave").button("reset");
                        toastr.error("该管理员已被分配！");
                        return false;
                    }
                    $("#confirmSave").button("reset");
                    toastr.error("保存失败！");
                    return false;
                }else{
                    $("#confirmSave").button("reset");
                    $("#setAdminModal").modal("hide");
                    toastr.success("保存成功！");
                    setTimeout(function(){
                        reset();
                    },2000);
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error("保存失败！");
                return false;
            }
        });
    }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#storageroomNameKey").val("");
        $("#areaSelected option:first").prop("selected", "selected");
        $("#checkboxSelected").text("");
        $("#adminCheckboxSelected").text("");
        $("#loading").css("display","block");
        getStorageroomInfos(pageCount,currentPageNum);
    }

    //获取搜索面板区域信息
    function getSearchStorageroomAreaInfos(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/storeHouseMgmt/queryLevelOneArea', //目标地址
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
                    $("#loading").css("display","none");
                    toastr.error("查询失败！");
                    return false;
                }else{
                    $("#loading").css("display","none");
                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#areaSelected").empty();

                    var areaDefaultSelectedHtml = "<option value=''>请选择</option>";

                    $("#areaSelected").append(areaDefaultSelectedHtml);

                    for(var a = 0; a < retDataLength; a++){

                        var areaId = retData[a].id;
                        var areaName = retData[a].shortname;

                        var areaSelectedHtml = "<option value='"+areaId+"'>"+areaName+"</option>";

                        $("#areaSelected").append(areaSelectedHtml);
                    }

                    //获取仓库信息
                    getStorageroomInfos(pageCount,currentPageNum);
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

    //获取仓库区域信息
    function getStorageroomAreaInfo(areaId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var areaIdParam =  areaId;

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/storeHouseMgmt/queryLevelOneArea', //目标地址
            data: {},
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    toastr.error("获取区域数据失败！");
                    return false;
                }else{
                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#area").empty();
                    $("#modifyArea").empty();

                    for(var aa = 0; aa < retDataLength; aa++){
                        var areaName = retData[aa].shortname;
                        var areaId = retData[aa].id;

                        if(areaIdParam == 0){
                            var selectedHtml = "<option value='"+areaId+"'>"+areaName+"</option>";
                            $("#area").append(selectedHtml);
                        }else{
                            var modifySelectedHtml = "";
                            if(areaIdParam == areaId){
                                modifySelectedHtml += "<option value='"+areaId+"' selected='selected'>"+areaName+"</option>";
                                $("#modifyArea").append(modifySelectedHtml);
                            }else{
                                modifySelectedHtml += "<option value='"+areaId+"'>"+areaName+"</option>";
                                $("#modifyArea").append(modifySelectedHtml);
                            }
                        }
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("获取区域数据失败！");
                return false;
            }
        });
    }

</script>
