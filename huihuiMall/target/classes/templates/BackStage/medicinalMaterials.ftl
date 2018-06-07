<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <title>扶贫基地-药材信息</title>
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="${bath}/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<#--common CSS-->
    <link href="${bath}/css/common/checkBox_radio.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css" />
<#--tip CSS-->
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css" />

    <!-- jQuery -->
    <script src="${bath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>

</head>
<body>

<!--顶部title与面包屑开始-->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-9 col-md-9" style="padding-left: 0px">
                <h3 class="page-header">
                    药材信息
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;扶贫基地管理</li>
                    <li class="active">药材信息</li>
                </h4>
            </div>
        </div>
    </div>
</div>
<!--顶部title与面包屑结束-->

<!--操作面板与搜索面板开始-->
<div class="container-fluid" id="operation-panel">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-6 col-md-6" style="padding-left: 5px">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal">
                    <i class="fa fa-plus fa-fw"></i>添加</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyModal" id="modifyBtn">
                    <i class="fa fa-edit fa-fw"></i>修改</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteModal" id="deleteBtn">
                    <i class="fa fa-trash-o fa-fw"></i>删除</button>
                <button type="button" class="btn btn-default" onclick="refresh();">
                    <i class="fa fa-refresh fa-fw"></i>刷新</button>
            </div>
            <div class="col-lg-2 col-md-3" style="margin: 20px 0px; float: right">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="请输入药材名称" id="searchKey">
                    <span class="input-group-btn">
                        <button class="btn btn-search" type="button" id="searchBtn">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--操作面板与搜索面板结束-->

<!--table展示与分页开始-->
<div class="container-fluid" id="table-panel">
    <div class="row">
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                <div class="row">
                                    <div class="col-sm-12  col-md-12 col-lg-12">
                                        <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline"
                                               role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                            <lable id="checkboxSelected" style="display:none"></lable>
                                            <thead>
                                            <tr role="row">
                                                <th style="width: 20px;">
                                                </th>
                                                <th style="width: 50px;">
                                                    序号
                                                </th>
                                                <th style="width: 120px;">
                                                    药材名称
                                                </th>
                                                <th style="width: 120px;">
                                                    药材编码
                                                </th>
                                                <#--<th style="width: 120px;">
                                                   药材销售重量
                                                </th>-->
                                                <th style="width: 100px;">
                                                    药材规格
                                                </th>
                                                <th style="width: 100px;">
                                                    销售单价
                                                </th>
                                                <th style="width:400px">
                                                    扶贫基地名称
                                                </th>
                                                <th style="width: 180px;">
                                                    备注
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="tbody">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 40px">
                                    <div class="col-lg-2 col-md-3">
                                        <div class="dataTables_length" style="text-align: center">
                                        <#--<label>
                                                显示
                                                <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm" id="selectPageSize">
                                                    <option value="10">10</option>
                                                    <option value="25">25</option>
                                                    <option value="50">50</option>
                                                </select>
                                                条结果
                                            </label>-->
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-6">

                                        <div class="dataTables_info" role="status" aria-live="polite" style="text-align: center;
                                                line-height: 35px; margin-bottom: 10px">
                                            显示<lable id="itemSize"></lable>项结果，共<label id="totalItem"></label>项，
                                            当前<label id="currentPage"></label>/<label id="totalPages"></label>页
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-3">
                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate"
                                             style="text-align: center">
                                            <ul class="pagination" style="margin: 0px; display: none">
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
                </div>
            </div>
        </div>
    </div>
</div>
<!--table展示与分页结束-->

<!--添加弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="addModalLabel">
                        <i class="fa fa-plus fa-fw"></i>添加</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            扶贫基地名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <select class="form-control required" id="addAidBaseList">
                                            <option value="0">请选择扶贫基地名称</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="addMedicineName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材编码：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="addMedicineCode">
                                    </div>
                                </div>
                            </div>

                            <#--<div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材销售重量：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="必填" id="addMedicineWeight">
                                            <span class="input-group-addon">kg</span>
                                        </div>
                                    </div>
                                </div>
                            </div>-->

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材规格：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="addMedicineSpecification">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            销售单价：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="必填" id="addSalesPrice">
                                            <span class="input-group-addon">元</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            备注：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <textarea class="form-control" placeholder="选填" rows="3" id="addRemark"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="提交中..." autocomplete="off" onclick="addMedicinalMaterials();">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加弹出面板结束-->

<!--修改弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <label for="" class="idFrontLabel" style="display: none;"></label>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="modifyModalLabel">
                        <i class="fa fa-edit fa-fw"></i>修改</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            扶贫基地名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <select class="form-control required" id="modifyAidBaseList">
                                            <option value="0">请选择扶贫基地名称</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyMedicineName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材编码：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyMedicineCode">
                                    </div>
                                </div>
                            </div>

                            <#--<div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材销售重量：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="modifyMedicineWeight">
                                            <span class="input-group-addon">kg</span>
                                        </div>
                                    </div>
                                </div>
                            </div>-->

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材规格：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyMedicineSpecification">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            销售单价：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="modifySalesPrice">
                                            <span class="input-group-addon">元</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            备注：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <textarea class="form-control" rows="3" placeholder="选填" id="modifyRemark"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmModify" data-loading-text="修改中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--修改面板结束-->

<!--删除弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="deleteModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i>删除</h4>
                </div>
                <div class="modal-body">
                    确定要删除选中的1条记录？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmDelete"
                            data-loading-text="删除中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--删除面板结束-->

<#--数据加载loading开始-->
<div id="loading" class="loading">数据加载中...</div>
<#--数据加载loading结束-->

</body>
</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function() {

        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页
        var search_key = $("#searchKey").val();

        //获取扶贫基地信息
        getMedicineMaterials(pageCount,currentPageNum,search_key);

        //搜索点击
        $("#searchBtn").click(function(){
            var search_key = $("#searchKey").val();
            $("#tbody").empty();
            $("#loading").css("display","block");
            getMedicineMaterials(pageCount,1,search_key);
        });

        //修改点击
        $("#modifyBtn").click(function(){
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                $("#confirmModify").css({
                    "background-color":"#ccc",
                    "color":"#444444"
                });
                toastr.error('请选择一条要修改的记录！');
                return false;
            }
            else
            {
                $("#modifyModal").toggle();
                $("#confirmModify").css({
                    "background-color":"#3c67c0",
                    "color":"#FFF"
                });
                var modifyRecordID = parseInt(checkboxSelectedID);

                //修改前查询
                $.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/aid/queryMedicinalMaterials', //目标地址
                data : {
                    id : modifyRecordID
                },
                beforeSend: function(jqXHR) {
                    if (undefined != header){
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                        console.log(retInfo);
                        var retData = retInfo.data;

                        var aidBaseId = retData[0].aidbaseId;
                        getAidBaseInfo(aidBaseId);

                        var name = retData[0].name;
                        var crudeMedicineCode = retData[0].crudeMedicineCode;
                        //var salesWeight = retData[0].salesWeight;
                        var salesSpecification = retData[0].salesSpecification;
                        var salesPrice = retData[0].salesPrice;
                        var remark = retData[0].remark;

                        $("#modifyMedicineName").val(name);
                        $("#modifyMedicineCode").val(crudeMedicineCode);
                        //$("#modifyMedicineWeight").val(salesWeight);
                        $("#modifyMedicineSpecification").val(salesSpecification);
                        $("#modifySalesPrice").val(salesPrice);
                        $("#modifyRemark").val(remark);
                    }
                });

                $("#confirmModify").attr("onclick","modifyRecord("+checkboxSelectedID+");");
            }
        });

        //修改前清空
        $('#modifyModal').on('hide.bs.modal', function () {
            $("input").val("");
            $("textarea").val("");
            $("#modifyAidBaseList").empty();
            $("#modifyAidBaseList").append("<option value='0'>请选择扶贫基地名称</option>");
            //$("#modifyAidBaseList option:first").prop("selected", 'selected');
        });

        //删除点击
        $("#deleteBtn").click(function(){
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                $("#confirmDelete").css({
                    "background-color":"#ccc",
                    "color":"#444444"
                });
                toastr.error('请选择一条要删除的记录！');
                return false;
            }
            else{
                $("#deleteModal").toggle();
                $("#confirmDelete").css({
                    "background-color":"#3c67c0",
                    "color":"#FFF"
                });
                $("#confirmDelete").attr("onclick","delRecord("+checkboxSelectedID+");");
            }
        });

        //上一页
        $("#prevPage").click(function(){
            var search_key = $("#searchKey").val();
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum > 1)
            {
                $("#tbody").empty();
                $("#loading").css("display","block");
                currentPageNum -= 1;
                getMedicineMaterials(pageCount,currentPageNum,search_key);
            }
            else
            {
                return;
            }
        });

        //下一页
        $("#nextPage").click(function(){
            var search_key = $("#searchKey").val();
            var totalPages = parseInt($("#totalPages").text());
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum < totalPages)
            {
                $("#tbody").empty();
                $("#loading").css("display","block");
                currentPageNum += 1;
                getMedicineMaterials(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });
    });

    //获取药材信息方法
    function getMedicineMaterials(pageCount,currentPageNum,search_key){
        $("#currentPage").html(currentPageNum);
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/aid/queryMedicinalMaterials', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                name : search_key
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
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
                    $("#totalPages").html(totalPages);
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

                var retData = retInfo.data;
                if(retData == null){
                    toastr.error('获取数据失败！');
                    return false;
                }else{
                    $("#tbody").empty();
                    var retDataLength = retData.length;
                    console.log(retDataLength);
                    for(var i = 0; i < retDataLength; i++){

                        var index = i + 1;
                        var id = retData[i].id;
                        var aidBaseName = retData[i].aidbasename;
                        var name = retData[i].name;
                        var crudeMedicineCode = retData[i].crudeMedicineCode;
                        //var salesWeight = retData[i].salesWeight;
                        var salesSpecification = retData[i].salesSpecification;
                        var salesPrice = retData[i].salesPrice;
                        var remark = retData[i].remark;

                        var tbodyHtml = "<tr class='gradeA odd' role='row'>";
                        tbodyHtml += "<td><input type='checkbox' class='checkbox' id='"+id+"'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+name+"</td>";
                        tbodyHtml += "<td>"+crudeMedicineCode+"</td>";
                        //tbodyHtml += "<td>"+salesWeight+"kg</td>";
                        tbodyHtml += "<td>"+salesSpecification+"</td>";
                        tbodyHtml += "<td>"+salesPrice+"元</td>";
                        tbodyHtml += "<td>"+aidBaseName+"</td>";
                        if(remark == null){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+remark+"</td>";
                        }
                        tbodyHtml += "</tr>";

                        $("#tbody").append(tbodyHtml);

                        //获取表格中checkbox的选中值
                        $(".checkbox").on("click", function() {
                            if ($(this).prop("checked")) {
                                $(".checkbox").prop("checked", false);
                                $(this).prop("checked", true);
                                var checkboxID = $(this).attr("id");
                                $("#checkboxSelected").text(checkboxID);
                            }
                            else {
                                $("#checkboxSelected").text("");
                            }
                        });
                    }
                }
                $("#loading").css("display","none");
            }
        });
    };

    //添加窗口显示时获取扶贫基地信息
    $('#addModal').on('show.bs.modal', function () {
        $("#addAidBaseList").empty();
        $("#addAidBaseList").append("<option value='0'>请选择扶贫基地名称</option>");
        var id = "";
        getAidBaseInfo(id);
    });

    //添加药材信息方法
    function addMedicinalMaterials(){

        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var selectedAidBase = $("#addAidBaseList").find("option:selected").val();
        var aidBaseId = selectedAidBase;
        console.log(aidBaseId);

        var medicineName = $("#addMedicineName").val();
        console.log(medicineName);

        var medicineCode = $("#addMedicineCode").val();
        console.log(medicineCode);

        var medicineWeight = "";
        console.log(medicineWeight);

        var medicineSpecification = $("#addMedicineSpecification").val();
        console.log(medicineSpecification);

        var salesPrice = $("#addSalesPrice").val();
        console.log(salesPrice);

        var remark = $("#addRemark").val();
        console.log(remark);

        $("#confirmAdd").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/aid/addMedicinalMaterials', //目标地址
            data : {
                name : medicineName,
                aidbaseId : aidBaseId,
                crudeMedicineCode : medicineCode,
                salesWeight : medicineWeight,
                salesSpecification : medicineSpecification,
                salesPrice : salesPrice,
                remark : remark
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
                console.log(retCode);
                if(retCode != 0){
                    $("#confirmAdd").button('reset');
                    toastr.error('添加失败！');
                    return false;
                }
                else{
                    $("#confirmAdd").button('reset');
                    $("input").val("");
                    $("textarea").val("");
                    $("#addAidBaseList option:first").prop("selected", 'selected');
                    $('#addModal').modal('hide');
                    toastr.success('添加成功！');
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });

    };

    //新增addModal关闭清空未提交数据
    $(function() {
        $('#addModal').on('hide.bs.modal', function () {
            $("input").val("");
            $("textarea").val("");
            $("#addAidBaseList").empty();
            $("#addAidBaseList").append("<option value='0'>请选择扶贫基地名称</option>");
            //$("#addAidBaseList option:first").prop("selected", 'selected');
        });
    });

    //修改实现方法
    function modifyRecord(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var modifyRecordID = parseInt(checkboxSelectedID);
        console.log(modifyRecordID);

        var modifyAidBaseId = $("#modifyAidBaseList").find("option:selected").val();
        var modify_AidBaseId = modifyAidBaseId;
        console.log(modify_AidBaseId);

        var modify_MedicineName = $("#modifyMedicineName").val();
        console.log(modify_MedicineName);

        var modify_MedicineCode = $("#modifyMedicineCode").val();
        console.log(modify_MedicineCode);

        var modify_MedicineWeight = "";
        console.log(modify_MedicineWeight);

        var modify_MedicineSpecification = $("#modifyMedicineSpecification").val();
        console.log(modify_MedicineSpecification);

        var modify_SalesPrice = $("#modifySalesPrice").val();
        console.log(modify_SalesPrice);

        var modify_Remark = $("#modifyRemark").val();
        console.log(modify_Remark);

        $("#confirmModify").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/aid/updateMedicinalMaterirals', //目标地址
            data : {
                id : modifyRecordID,
                name : modify_MedicineName,
                aidbaseId : modifyAidBaseId,
                crudeMedicineCode : modify_MedicineCode,
                salesWeight : modify_MedicineWeight,
                salesSpecification : modify_MedicineSpecification,
                salesPrice : modify_SalesPrice,
                remark : modify_Remark
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
                    $("#confirmModify").button('reset');
                    toastr.error('修改失败！');
                    return false;
                }
                else{
                    $("#confirmModify").button('reset');
                    $("input").val("");
                    $("textarea").val("");
                    $("#modifyAidBaseList option:first").prop("selected", 'selected');
                    $('#modifyModal').modal('hide');
                    toastr.success('修改成功！');
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });

    };

    //添加窗口显示时获取扶贫基地信息
    $('#modifyModal').on('show.bs.modal', function () {
        $("#modifyAidBaseList").empty();
        $("#modifyAidBaseList").append("<option value='0'>请选择扶贫基地名称</option>");
    });

    //删除实现方法
    function delRecord(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var delRecordID = parseInt(checkboxSelectedID);

        $("#confirmDelete").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/aid/deleteMedicinalMaterials', //目标地址
            data : {
                id : delRecordID
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
                    toastr.error('删除失败！');
                    return false;
                }
                else{
                    $("#confirmDelete").button('reset');
                    $('#deleteModal').modal('hide');
                    toastr.success('删除成功！');
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });
    };

    //刷新实现方法
    function refresh(){
        var search_key = $("#searchKey").val();
        var currentPageNum = parseInt($("#currentPage").text());
        var pageCount=20;
        $("#checkboxSelected").text("");
        $("#tbody").empty();
        $("#loading").css("display","block");
        getMedicineMaterials(pageCount,currentPageNum,search_key);
    };

    //获取扶贫基地列表
    function getAidBaseInfo(id){
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/aid/getAidBaseListInfo', //目标地址
            data : {},
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);

                var retData = retInfo.data;
                var retDataLength = retData.length;

                for(var i = 0; i < retDataLength; i ++){
                    var aidBaseId = retData[i].id;
                    var aidBaseName = retData[i].name;

                    if(id == aidBaseId){
                        var modifyOptionHtml = "<option value='"+aidBaseId+"' selected>"+aidBaseName+"</option>";
                        $("#modifyAidBaseList").append(modifyOptionHtml);
                    }else{
                        var optionHtml = "<option value='"+aidBaseId+"'>"+aidBaseName+"</option>";
                        $("#addAidBaseList").append(optionHtml);
                        $("#modifyAidBaseList").append(optionHtml);
                    }
                }

            }
        });
    }

</script>
