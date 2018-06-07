<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>品牌管理</title>
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

            <span>一级分类名称：</span>
            <select style="width: 10%" id="firstClassifySelected">

            </select>

            <span style="margin-left: 10px">二级分类名称：</span>
            <select style="width: 10%" id="secondClassifySelected">
                <option value="">请选择</option>
            </select>

            <span style="margin-left: 10px">品牌名称：</span>
            <input type="text" id="searchKey" placeholder="请输入品牌名称">

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
                        品牌名称
                    </th>
                    <th>
                        所属二级分类
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
                                        <label class="control-label">品牌名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="brandName">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off" onclick="addBrand();">提交</button>
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
                                        <label class="control-label">品牌名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyBrandName">
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

<!--设置品牌分类弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="classifyModal" tabindex="-1" role="dialog" aria-labelledby="classifyModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:800px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="classifyModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 设置品牌分类</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid table-operation-panel" style="padding:0px;">
                        <div class="row table-row">
                            <div class="col-lg-12 col-md-12 col-xs-12 table-panel">
                                <table class="table table-bordered table-hover table-responsive" style="margin-top: 15px;">
                                    <thead>
                                    <tr>
                                        <th width="50px">

                                        </th>
                                        <th width="80px">
                                            序号
                                        </th>
                                        <th>
                                            二级分类名称
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody id="classifyTbody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmClassify" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--设置品牌分类弹出面板结束-->

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

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页

        //获取一级分类信息
        getFirstClassifyList();

        //获取品牌信息
        getBrandInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getBrandInfos(pageCount,1);
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
                getBrandInfos(pageCount,currentPageNum);
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
                getBrandInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //一级分类点击获取二级分类
        $("#firstClassifySelected").change(function () {
           var pidParam = $(this).val();
            console.log(pidParam);
           if(pidParam == ""){
               $("#secondClassifySelected").empty();
               $("#secondClassifySelected").append("<option value=''>请选择</option>");
               return false;
           }

           getSecondClassifyList(pidParam);

        });

        //新增addModal关闭清空未提交数据
        $("#addModal").on("hide.bs.modal", function () {
            $("input").val("");
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
                    url: '${bath}/productMgmt/getBrandById', //目标地址
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

                        var brandName = retData.name;

                        $("#modifyBrandName").val(brandName);
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
            $("#checkboxSelected").text("");
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

        //设置modal消失清除保存按钮点击事件
        $("#classifyModal").on("hide.bs.modal", function () {
            $("#confirmClassify").removeAttr("onclick");
        });

    });

    //获取信息方法
    function getBrandInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var searchKeyParam = $("#searchKey").val();
        //var firstClassifySelectedParam = $("#firstClassifySelected").find("option:selected").val();
        var secondClassifySelectedParam = $("#secondClassifySelected").find("option:selected").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/queryAllBrand', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                name : searchKeyParam,
                parentId : secondClassifySelectedParam
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
                        var brandName = retData[i].name;
                        var parentNames = retData[i].parentnames;
                        var parentIds = retData[i].parentids;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox' id='"+id+"' class='mycheckbox'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";

                        tbodyHtml += "<td>"+brandName+"</td>";

                        if(parentNames == null || parentNames == ""){
                            tbodyHtml += " <td></td>";
                        }else{
                            tbodyHtml += " <td>"+parentNames+"</td>";
                        }
                        tbodyHtml += "<td>";
                        tbodyHtml += "<a href='#' data-toggle='modal' data-target='#classifyModal' onclick='openClassifyModal(\""+parentIds+"\",\""+id+"\");'>设置分类</a>";
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

    //添加品牌方法
    function addBrand(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var brandNameParam = $("#brandName").val();
        if (brandNameParam == "") {
            toastr.error("品牌名称不能为空！");
            return false;
        }

        $("#confirmAdd").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/productMgmt/addBrand', //目标地址
            data: {
                name : brandNameParam
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

    //修改品牌方法
    function modifyRecord(checkboxSelectedID) {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var modifyRecordID = parseInt(checkboxSelectedID);
        console.log(modifyRecordID);

        var modifyBrandNameParam = $("#modifyBrandName").val();
        if (modifyBrandNameParam == "") {
            toastr.error("品牌名称不能为空！");
            return false;
        }

        $("#confirmModify").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/productMgmt/updateBrand', //目标地址
            data: {
                id : modifyRecordID,
                name : modifyBrandNameParam
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

    //删除品牌方法
    function delRecord(recordId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var recordIdParam = recordId;

        $("#confirmDelete").button("loading");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/deleteBrand', //目标地址
            data : {
                id : recordIdParam
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

    //设置分类modal显示
    function openClassifyModal(brandParentId,brandId){
        var brandParentIdParam = brandParentId;
        var brandIdParam = brandId;
        getAllSecondClassifyList(brandParentIdParam);
        $("#confirmClassify").attr("onclick","saveClassifyToBrand("+brandIdParam+");");
    }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#checkboxSelected").text("");
        $("#firstClassifySelected option:first").prop("selected", "selected");
        $("#secondClassifySelected").empty();
        $("#secondClassifySelected").append("<option value=''>请选择</option>");
        $("#loading").css("display","block");
        getBrandInfos(pageCount,currentPageNum);
    }

    //获取一级分类列表方法
    function getFirstClassifyList(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getCategoryOneList', //目标地址
            data : {},
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
                    var retDataLength = retData.length;

                    $("#firstClassifySelected").empty();

                    var defaultFirstClassifySelectedHtml = "<option value=''>请选择</option>";
                    $("#firstClassifySelected").append(defaultFirstClassifySelectedHtml);

                    for(var fc = 0; fc < retDataLength; fc++){

                        var id = retData[fc].id;
                        var name = retData[fc].name;

                        var firstClassifySelectedHtml = "<option value='"+id+"'>"+name+"</option>";

                        $("#firstClassifySelected").append(firstClassifySelectedHtml);
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

    //根据一级分类id获取二级分类列表方法
    function getSecondClassifyList(pid){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var selectedPidParam = pid;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getCategoryTwoListByPId', //目标地址
            data : {
                parentId : selectedPidParam
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
                    var retDataLength = retData.length;

                    $("#secondClassifySelected").empty();

                    for(var scf = 0; scf < retDataLength; scf++){

                        var secondClassifyId = retData[scf].id;
                        var secondClassifyName = retData[scf].name;

                        var secondClassifyHtml = "<option value='"+secondClassifyId+"'>"+secondClassifyName+"</option>";

                        $("#secondClassifySelected").append(secondClassifyHtml);
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

    //获取所有二级分类列表
    function getAllSecondClassifyList(brandPid){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var selectedBrandPidParam = brandPid;
        var splitResult = selectedBrandPidParam.split(",");
        var splitResultArray = [];  //点击设置分类后根据品牌所属二级分类数组
        for(var b = 0;b < splitResult.length; b++) {
            var brandIdParam = splitResult[b];
            splitResultArray.push(brandIdParam);
        }

        var allCategoryTwoArray = [];

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getCategoryTwoList', //目标地址
            data : {},
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
                    var retDataLength = retData.length;

                    $("#classifyTbody").empty();

                    for(var m = 0; m < retDataLength; m++){

                        var index = m + 1;
                        var secondClassifyId = retData[m].id;
                        var secondClassifyName = retData[m].name;

                        var classifyTbodyHtml = "<tr>";
                        classifyTbodyHtml += "<td><input type='checkbox' id='classifycheckbox"+secondClassifyId+"' value='"+secondClassifyId+"' class='classifycheckbox'/></td>";
                        classifyTbodyHtml += "<td>"+index+"</td>";
                        classifyTbodyHtml += "<td>"+secondClassifyName+"</td>";
                        classifyTbodyHtml += "</tr>";

                        allCategoryTwoArray.push(secondClassifyId);

                        $("#classifyTbody").append(classifyTbodyHtml);

                    }
                    //比较两个数组中是否有相同的值
                    judgeAray(splitResultArray,allCategoryTwoArray);
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

    //比较两个数组中是否有相同的值
    function judgeAray(splitArray,categoryArray){

        var splitArrayParam = splitArray;
        var splitArrayParamLength = splitArrayParam.length;
        var categoryArrayParam = categoryArray;
        var categoryArrayParamLength = categoryArray.length;

        for(var s = 0; s < splitArrayParamLength; s++){
            var brandParentId = splitArrayParam[s];
            for(var c = 0; c < categoryArrayParamLength; c++){
                var categoryId = categoryArrayParam[c];
                if(brandParentId == categoryId){
                    $("#classifycheckbox"+categoryId).prop("checked","checked");
                }
            }
        }
    }

    //保存设置分类
    function saveClassifyToBrand(bId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var bIdParam = bId;
        var bIdCheckedData = [];

        $("#classifyTbody").find(":checkbox:checked").each(function(){
            var val = $(this).val();
            bIdCheckedData.push(val);
        });

        if(bIdCheckedData.length == 0){
            toastr.error("请选择分类！");
            return false;
        }else{

            var jsonData = JSON.stringify(bIdCheckedData);
            console.log(jsonData);

            $.ajax({
                type: "POST", //用POST方式传输
                url: '${bath}/productMgmt/addCategoryToBrand', //目标地址
                data: {
                    id : bIdParam,
                    data : jsonData
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
                    var retCode = retInfo.retCode;
                    if (retCode != 0) {
                        $("#confirmClassify").button("reset");
                        toastr.error("保存失败！");
                        return false;
                    }
                    else {
                        $("#confirmClassify").button("reset");
                        $("#classifyModal").modal("hide");
                        toastr.success("保存成功！");
                        setTimeout(function () {
                            reset();
                        }, 2000);
                    }
                },
                error: function (XMLHttpRequest, textStatus) {
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    toastr.error("操作失败！");
                    return false;
                }
            });
        }

    }

</script>
