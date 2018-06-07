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

    <title>企业采购记录</title>
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
                    企业采购记录
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;企业信息</li>
                    <li class="active">企业采购记录</li>
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
                    <input type="text" class="form-control" placeholder="请输入扶贫基地名称" id="searchKey">
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
                                                <th style="width:100px">
                                                    采购批次号
                                                </th>
                                                <th style="width: 250px;">
                                                    扶贫基地名称
                                                </th>
                                                <th style="width: 120px;">
                                                    药材名称
                                                </th>
                                                <th style="width: 100px;">
                                                    药材编码
                                                </th>
                                                <th style="width: 100px;">
                                                    药材采购重量
                                                </th>
                                                <th style="width: 100px;">
                                                    药材规格
                                                </th>
                                                <th style="width: 120px;">
                                                    销售单价
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
                                            采购批次号：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="addPurchaseBatch">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材采购重量：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="addPurchaseWeight">
                                            <span class="input-group-addon">kg</span>
                                        </div>
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
                                        <select class="form-control required" id="addMedicinalMaterials">
                                            <option value="0">请选择药材名称</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            扶贫基地名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" disabled="disabled" id="addAidBaseName">
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
                                        <input type="text" class="form-control" disabled="disabled" id="addMedicineCode">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材规格：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" disabled="disabled" id="addMedicineSpecification">
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
                                            <input type="text" class="form-control" disabled="disabled" id="addSalesPrice">
                                            <span class="input-group-addon">元</span>
                                        </div>
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
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="提交中..." autocomplete="off" onclick="addPurchaseRecord();">
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
                                            采购批次号：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyPurchaseBatch">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材采购重量：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="modifyPurchaseWeight">
                                            <span class="input-group-addon">kg</span>
                                        </div>
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
                                        <select class="form-control required" id="modifyMedicinalMaterials">
                                            <option value="0">请选择药材名称</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            扶贫基地名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" disabled="disabled" id="modifyAidBaseName">
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
                                        <input type="text" class="form-control" disabled="disabled" id="modifyMedicineCode">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材规格：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" disabled="disabled" id="modifyMedicineSpecification">
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
                                            <input type="text" class="form-control" disabled="disabled" id="modifySalesPrice">
                                            <span class="input-group-addon">元</span>
                                        </div>
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


    $(document).ready(function() {

        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页
        var search_key = $("#searchKey").val();

        //获取采购信息
        getPurchaseRecords(pageCount,currentPageNum,search_key);

        //搜索点击
        $("#searchBtn").click(function(){
            var search_key = $("#searchKey").val();
            $("#tbody").empty();
            $("#loading").css("display","block");
            getPurchaseRecords(pageCount,1,search_key);
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
            else{
                $("#modifyModal").toggle();
                $("#confirmModify").css({
                    "background-color":"#3c67c0",
                    "color":"#FFF"
                });
                var modifyRecordID = parseInt(checkboxSelectedID);
                //修改前查询
                $.ajax({
                    type : "GET", //用GET方式传输
                    url : '${bath}/company/getAllCompanyPurchaseRecords', //目标地址
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
                    var retData =  retInfo.data;

                    var number = retData[0].number;
                    var weight = retData[0].weight;
                    var crudeMedicineId = retData[0].crudeMedicineId;
                    var aidBaseName = retData[0].aidbaseName;
                    var crudeMedicineCode = retData[0].crudeMedicineCode;
                    var salesSpecification = retData[0].salesSpecification;
                    var salesPrice = retData[0].salesPrice;

                    $("#modifyPurchaseBatch").val(number);
                    $("#modifyPurchaseWeight").val(weight);
                    $("#modifyAidBaseName").val(aidBaseName);
                    $("#modifyMedicineCode").val(crudeMedicineCode);
                    $("#modifyMedicineSpecification").val(salesSpecification);
                    $("#modifySalesPrice").val(salesPrice);

                    modifyGetMedicinalMaterials(crudeMedicineId);

                }
            });
                $("#confirmModify").attr("onclick","modifyRecord("+checkboxSelectedID+");");
            }
        });

        //修改前清空
        $('#modifyModal').on('hide.bs.modal', function () {
            $("input").val("");
        });

        //修改窗口显示时获取药材信息
        $('#modifyModal').on('show.bs.modal', function () {
            $("#modifyMedicinalMaterials").empty();
            $("#modifyMedicinalMaterials").append("<option value='0'>请选择药材名称</option>");
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
                getPurchaseRecords(pageCount,currentPageNum,search_key);
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
                getPurchaseRecords(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });
    });

    //获取采购信息方法
    function getPurchaseRecords(pageCount,currentPageNum,search_key){
        $("#currentPage").html(currentPageNum);
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/company/getAllCompanyPurchaseRecords', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                aidbaseName : search_key
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
                        var number = retData[i].number;
                        var aidBaseName = retData[i].aidbaseName;
                        var crudeMedicineName = retData[i].crudeMedicineName;
                        var crudeMedicineCode = retData[i].crudeMedicineCode;
                        var weight = retData[i].weight;
                        var salesSpecification=retData[i].salesSpecification;
                        var salesPrice=retData[i].salesPrice;


                        var trHtml = "<tr class='gradeA odd' role='row'>";
                        trHtml += "<td><input type='checkbox' class='checkbox' id='"+id+"'/></td>";
                        trHtml += "<td>"+index+"</td>";
                        trHtml += "<td>"+number+"</td>";
                        trHtml += "<td>"+aidBaseName+"</td>";
                        trHtml += "<td>"+crudeMedicineName+"</td>";
                        trHtml += "<td>"+crudeMedicineCode+"</td>";
                        trHtml += "<td>"+weight+"kg</td>";
                        trHtml += "<td>"+salesSpecification+"</td>";
                        trHtml += "<td>"+salesPrice+"元</td>";
                        trHtml += "</tr>";

                        $("#tbody").append(trHtml);

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


    //添加窗口显示时获取药材信息
    $('#addModal').on('show.bs.modal', function () {
        $("#addMedicinalMaterials").empty();
        $("#addMedicinalMaterials").append("<option value='0'>请选择药材名称</option>");
        getMedicinalMaterials();
    });

    //添加采购记录方法
    function addPurchaseRecord(){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var purchaseBatch = $("#addPurchaseBatch").val();
        console.log(purchaseBatch);

        var purchaseWeight = $("#addPurchaseWeight").val();
        console.log(purchaseWeight);

        var selectedMedicinalMaterialsId = $("#addMedicinalMaterials").find("option:selected").val();
        var medicinalMaterialsId = selectedMedicinalMaterialsId;
        console.log(medicinalMaterialsId);

        $("#confirmAdd").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/addPurchaseRecords', //目标地址
            data : {
                number : purchaseBatch,
                crudeMedicineId : medicinalMaterialsId,
                weight : purchaseWeight
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
                    $("#confirmAdd").button('reset');
                    toastr.error('添加失败！');
                    return false;
                }
                else{
                    $("#confirmAdd").button('reset');
                    $("input").val("");
                    $("#addMedicinalMaterials option:first").prop("selected", 'selected');
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
            $("#addMedicinalMaterials").empty();
            $("#addMedicinalMaterials").append("<option value='0'>请选择药材名称</option>");
        });
    });

    //修改实现方法
    function modifyRecord(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var modifyRecordID = parseInt(checkboxSelectedID);

        var modifyPurchaseBatch = $("#modifyPurchaseBatch").val();
        console.log(modifyPurchaseBatch);

        var modifyPurchaseWeight = $("#modifyPurchaseWeight").val();
        console.log(modifyPurchaseWeight);

        var selectedMedicinalMaterialsId = $("#modifyMedicinalMaterials").find("option:selected").val();
        var modifyMedicinalMaterialsId = selectedMedicinalMaterialsId;
        console.log(modifyMedicinalMaterialsId);

        $("#confirmModify").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/updatePurchaseRecords', //目标地址
            data : {
                id : modifyRecordID,
                number : modifyPurchaseBatch,
                crudeMedicineId : modifyMedicinalMaterialsId,
                weight : modifyPurchaseWeight
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
                    $("#modifyMedicinalMaterials option:first").prop("selected", 'selected');
                    $('#modifyModal').modal('hide');
                    toastr.success('修改成功！');
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });

    };

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
            url : '${bath}/company/deleteCompanyPurchaseRecord', //目标地址
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
    }

    //刷新实现方法
    function refresh(){
        var search_key = $("#searchKey").val();
        var currentPageNum = parseInt($("#currentPage").text());
        var pageCount=20;
        $("#checkboxSelected").text("");
        $("#tbody").empty();
        $("#loading").css("display","block");
        getPurchaseRecords(pageCount,currentPageNum,search_key);
    };

    //添加获取药材名称
    function getMedicinalMaterials(){
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/aid/queryAllCrudeMedicine', //目标地址
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
                    var medicinalMaterialsId = retData[i].id;
                    var medicinalMaterialsName = retData[i].name;

                    var optionHtml = "<option value='"+medicinalMaterialsId+"'>"+medicinalMaterialsName+"</option>";
                    $("#addMedicinalMaterials").append(optionHtml);

                    }
                }
        });
    }

    //添加点击select触发事件
    $("#addMedicinalMaterials").change(function(){

        var selectedVal = $("#addMedicinalMaterials option:selected").val();

        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/aid/queryAllCrudeMedicine', //目标地址
            data : {
                id : selectedVal
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
                var aidBaseName = retData[0].aidbasename;
                var crudeMedicineCode = retData[0].crudeMedicineCode;
                var salesPrice = retData[0].salesPrice;
                var salesSpecification = retData[0].salesSpecification;

                $("#addAidBaseName").val(aidBaseName);
                $("#addMedicineCode").val(crudeMedicineCode);
                $("#addMedicineSpecification").val(salesSpecification);
                $("#addSalesPrice").val(salesPrice);
            }
        });
    });

    //修改绑定药材名称
    function modifyGetMedicinalMaterials(id) {
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/aid/queryAllCrudeMedicine', //目标地址
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
                    var medicinalMaterialsId = retData[i].id;
                    var medicinalMaterialsName = retData[i].name;

                    if(medicinalMaterialsId == id){
                        var modifyOptionHtml = "<option value='"+medicinalMaterialsId+"' selected>"+medicinalMaterialsName+"</option>";
                        $("#modifyMedicinalMaterials").append(modifyOptionHtml);
                    }else{
                        var optionHtml = "<option value='"+medicinalMaterialsId+"'>"+medicinalMaterialsName+"</option>";
                        $("#modifyMedicinalMaterials").append(optionHtml);
                    }

                }
            }
        });
    };

    //修改点击select触发事件
    $("#modifyMedicinalMaterials").change(function(){

        var selectedVal = $("#modifyMedicinalMaterials option:selected").val();

        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/aid/queryAllCrudeMedicine', //目标地址
            data : {
                id : selectedVal
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
                var aidBaseName = retData[0].aidbasename;
                var crudeMedicineCode = retData[0].crudeMedicineCode;
                var salesPrice = retData[0].salesPrice;
                var salesSpecification = retData[0].salesSpecification;

                $("#modifyAidBaseName").val(aidBaseName);
                $("#modifyMedicineCode").val(crudeMedicineCode);
                $("#modifyMedicineSpecification").val(salesSpecification);
                $("#modifySalesPrice").val(salesPrice);
            }
        });
    });

</script>
