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

    <title>批次/码管理</title>
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
    <script src="${bath}/js/jquery-validate.js" type="text/javascript"></script>
</head>
<body>

<!--顶部title与面包屑开始-->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-9 col-md-9" style="padding-left: 0px">
                <h3 class="page-header">
                    批次/码管理
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;产品管理</li>
                    <li class="active">批次/码管理</li>
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
                    <span style="display: table-cell;vertical-align: middle;width: 50px;">批次号</span>
                    <input type="text" class="form-control" placeholder="请输入批次号" id="searchKey" >
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
                                                <th style="width: 180px;">
                                                    批次号
                                                </th>
                                                <th style="width: 240px;">
                                                    批次名称
                                                </th>
                                                <th style="width: 100px">
                                                    码数量（个）
                                                </th>
                                                <th style="width: 90px">
                                                    码状态
                                                </th>
                                                <th style="width: 180px;">
                                                    创建时间
                                                </th>
                                                <th style="width: 90px;">
                                                    下载编码
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
                                <div class="col-lg-10 col-md-10">
                                    <div class="col-lg-4 col-md-4 title">
                                        <label class="control-label">
                                            批次号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="bath_number" data-valid="isNonEmpty||onlyInt" data-error="批次号不能为空||批次号只能是整型数字">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-10 col-md-10">
                                    <div class="col-lg-4 col-md-4 title">
                                        <label class="control-label">
                                            批次名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="batch_name" data-valid="isNonEmpty" data-error="批次名称不能为空">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-10 col-md-10">
                                    <div class="col-lg-4 col-md-4 title">
                                        <label class="control-label">
                                            码数量：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="batch_count" data-valid="isNonEmpty||onlyInt" data-error="码数量不能为空||请填入正确的码数量">
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
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="提交中..." autocomplete="off" onclick="addBath();">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加弹出面板结束-->

<!--修改弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModal"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="addModalLabel">
                        <i class="fa fa-edit fa-fw"></i>修改</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-10 col-md-10">
                                    <div class="col-lg-4 col-md-4 title">
                                        <label class="control-label">
                                            批次号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifybath_number" data-valid="isNonEmpty||onlyInt" data-error="批次号不能为空||批次号只能是整型数字">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-10 col-md-10">
                                    <div class="col-lg-4 col-md-4 title">
                                        <label class="control-label">
                                            批次名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifybatch_name" data-valid="isNonEmpty" data-error="批次名称不能为空">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-10 col-md-10">
                                    <div class="col-lg-4 col-md-4 title">
                                        <label class="control-label">
                                            码数量：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 input-box">
                                        <input type="text" class="form-control"  id="modifybatch_count" disabled>
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
                    <button type="button" class="btn btn-default" id="confirmModify" style="margin-top: 0px" data-loading-text="修改中..." autocomplete="off">
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
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmDelete" data-loading-text="删除中..." autocomplete="off">
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

        /*$("#loading").css("display","block");*/

        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页
        var search_key = $("#searchKey").val();

        //获取工厂信息
        getBatchcode(pageCount,currentPageNum,search_key);

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
                //改变提示窗位置
                changeToastr();
                return false;
            }
            else{
                $("#modifyModal").toggle();
                $("#confirmModify").css({
                    "background-color":"#00b38b",
                    "color":"#FFF"
                });
                var modifyRecordID = parseInt(checkboxSelectedID);
                //修改前查询
                $.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/batch/viewBatch', //目标地址
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
                        var retData=retInfo.data;
                        var bath_number = retData.number;
                        var batch_name = retData.batchName;
                        var batch_count = retData.count;

                        $("#modifybath_number").val(bath_number);
                        $("#modifybatch_name").val(batch_name);
                        $("#modifybatch_count").val(batch_count);
                    }
                });
                $("#confirmModify").attr("onclick","modifyRecord("+checkboxSelectedID+");");
            }
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
                //改变提示窗位置
                changeToastr();
                return false;
            }
            else{
                $("#deleteModal").toggle();
                $("#confirmDelete").css({
                    "background-color":"#00b38b",
                    "color":"#FFF"
                });
                $("#confirmDelete").attr("onclick","delRecord("+checkboxSelectedID+");");
            }
        });

        //搜索点击
        $("#searchBtn").click(function(){
            var search_key = $("#searchKey").val();
            $("#tbody").empty();
            $("#loading").css("display","block");
            getBatchcode(pageCount,1,search_key);
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
                getBatchcode(pageCount,currentPageNum,search_key);
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
                getBatchcode(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });

        //关闭前清空
        $('#addModal').on('hide.bs.modal', function () {
            $(".success").removeClass("success");
            $(".error").removeClass("error");
            $(".valid_message").css("display","none");
            $("input").val("");
            $("textarea").val("");
        });

        /*验证信息*/
        $('#addModal.form-group').validate({
            onFocus: function() {
                this.parent().addClass('active');
                $(this).next('span').css("display","none");
                return false;
            },

            onBlur: function() {
                var $parent = this.parent();
                var _status = parseInt(this.attr('data-status'));
                $parent.removeClass('active');
                if (!_status) {
                    $parent.addClass('error');
                }
                return false;
            }
        });
        //设置弹框高度居中
        $('.modal').on('show.bs.modal', function (event) {
            var documentHeight=$(document).height();//当前iframe总高度
            var scrollHeight=screen.availHeight;//浏览器窗口高度
            var selfHeight=$(this).find(".modal-content")[0].offsetHeight;
            var trueHeight=(scrollHeight-selfHeight)/2+toscrollTop+"px";
            var toscrollTop=$(window.parent).scrollTop();//滚动距离
            if(toscrollTop<80){
                $(this).find(".modal-content").css("top",0);
            }else{
                $(this).find(".modal-content").css("top",toscrollTop-80);
            }
        })

    });

    //获取批次/码管理方法
    function getBatchcode(pageCount,currentPageNum,search_key){
        $("#currentPage").html(currentPageNum);
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/batch/queryBatchs', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                number : search_key
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);

                $("#loading").css("display","none");

                $(".pagination").css("display","block");

                var itemSize = retInfo.size;
                $("#itemSize").html(itemSize);

                var totalItem = retInfo.total;
                $("#totalItem").html(totalItem);

                var totalPages = retInfo.pages;
                $("#totalPages").html(totalPages);

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
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }else{
                    $("#tbody").empty();
                    var retDataLength = retData.length;
                    for(var i = 0; i < retDataLength; i++){
                        var index = i + 1;
                        var bathcodeID = retData[i].id;
                        var bathcodeNumber = retData[i].number;
                        var batch_name = retData[i].batchName;
                        var bathcodeCount = retData[i].count;
                        var bathcodeCreateTime = retData[i].createTime;
                        var status = retData[i].status;

                        var trHtml = "<tr class='gradeA odd' role='row' id='tr"+bathcodeID+"'>";
                        trHtml += "<td><input type='checkbox' class='checkbox' id='"+bathcodeID+"'/></td>";
                        trHtml += "<td>"+index+"</td>";
                        if(bathcodeNumber != null){
                            trHtml += "<td>"+bathcodeNumber+"</td>";
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(batch_name != null){
                            if(batch_name.length > 16){
                                var subBatchName = batch_name.substring(0,16);
                                trHtml += "<td>"+subBatchName+"...</td>";
                            }else{
                                trHtml += "<td>"+batch_name+"</td>";
                            }
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(bathcodeCount != null){
                            trHtml += "<td>"+bathcodeCount+"</td>";
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(status == 0){
                            trHtml += "<td>初始</td>";
                        }else if(status == 1){
                            trHtml += "<td>生成中</td>";
                        }else if(status == 2){
                            trHtml += "<td>生成失败</td>";
                        }else if(status == 3){
                            trHtml += "<td>已完成</td>";
                        }else {
                            trHtml += "<td>-</td>";
                        }
                        if(bathcodeCreateTime != null){
                            trHtml += "<td>"+bathcodeCreateTime+"</td>";
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(status==3){
                            trHtml += "<td><a  href='${bath}/batch/uploadCodeToExcel?id="+bathcodeID+"'  class='aLink' >下载</a></td>";
                        }else {
                            trHtml += "<td><a  href='javascript:void(0)' onclick='tipsNo();' class='aLink' >下载</a></td>";
                        }

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
        getBatchcode(pageCount,currentPageNum,search_key);
    };

    //批次码未生成完成的提示
    function tipsNo() {
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        toastr.error('批次码未生成完毕，请稍候再试');
        //改变提示窗位置
        changeToastr();
        setTimeout(function(){
            refresh();
        },1000);
    }

    //新增实现方法
    function addBath(){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        if (! $('#addModal .form-group').validate('submitValidate')){
            return false;
        }
        var bath_number = $("#bath_number").val();

        var batch_name = $("#batch_name").val();
        console.log(batch_name);

        var batch_count = $("#batch_count").val();
        console.log(batch_count);

        $("#confirmAdd").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/batch/numberIsExits', //目标地址
            data : {
                number : bath_number
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
                if(retData==null){
                     $.ajax({
                       type : "POST", //用POST方式传输
                       url : '${bath}/batch/addBatch', //目标地址
                        data : {
                            number : bath_number,
                            batchName : batch_name,
                            count : batch_count
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
                                //改变提示窗位置
                                changeToastr();
                                $('#addModal').modal('hide');
                                return false;
                            }
                            else{
                                $("#confirmAdd").button('reset');
                                $("input").val("");
                                $("textarea").val("");
                                $('#addModal').modal('hide');
                                toastr.success('添加成功！');
                                //改变提示窗位置
                                changeToastr();
                                setTimeout(function(){
                                    refresh();
                                },2000);
                            }
                        }
                    });
                }else{
                    toastr.error('批次号已存在，请更改后添加！');
                    //改变提示窗位置
                    changeToastr();
                    $("#confirmAdd").button('reset');
                    return false;
                }
            }
        });
    };

    //修改实现方法
    function modifyRecord(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        if (! $('#modifyModal').validate('submitValidate')){
            return false;
        }
        var modifyRecordID = parseInt(checkboxSelectedID);

        var modifybath_number = $("#modifybath_number").val();

        var modifybatch_name = $("#modifybatch_name").val();

        var modifybatch_count = $("#modifybatch_count").val();

        $("#confirmModify").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/batch/numberIsExits', //目标地址
            data : {
                number : modifybath_number
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
                var _id = $("#checkboxSelected").text();
                if (retData==null||retData.id==_id){
                       $.ajax({
                           type : "POST", //用POST方式传输
                           url : '${bath}/batch/updateBatch', //目标地址
                            data : {
                                id : modifyRecordID,
                                number : modifybath_number,
                                batchName : modifybatch_name,
                                count : modifybatch_count
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
                                    //改变提示窗位置
                                    changeToastr();
                                    $('#modifyModal').modal('hide');
                                    return  false;
                                }
                                else{
                                    $("#confirmModify").button('reset');
                                    $("input").val("");
                                    $("textarea").val("");
                                    $('#modifyModal').modal('hide');
                                    toastr.success('修改成功！');
                                    //改变提示窗位置
                                    changeToastr();
                                    setTimeout(function(){
                                        refresh();
                                    },2000);
                                }
                            }
                        });
                }else{
                    $("#confirmModify").button('reset');
                    toastr.error('批次号已存在，请更改后添加！');
                    //改变提示窗位置
                    changeToastr();
                    return  false;
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
            url : '${bath}/batch/deleteBatch', //目标地址
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
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
                else{
                    $("#confirmDelete").button('reset');
                    $('#deleteModal').modal('hide');
                    toastr.success('删除成功！');
                    //改变提示窗位置
                    changeToastr();
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });
    }

    //改变提示窗位置
    function changeToastr() {
        var toscrollTop=$(window.parent).scrollTop();//滚动距离
        var documentHeight=$(document).height();//当前iframe总高度
        var percent;
        if(toscrollTop<80){
            percent=(((toscrollTop+170)/documentHeight)*100)+"%";
        }else {
            percent=(((toscrollTop+110)/documentHeight)*100)+"%";
        }
        /* alert(documentHeight)
         alert(percent)*/
        $("#toast-container").css("top",percent);
    }

    //分页选择显示几条结果触发开始
    /*$("#selectPageSize").change(function(){
        selectChange();
    });*/

    //分页选择显示几条结果方法开始
    /*function selectChange() {
        var selectText = $("#selectPageSize").find("option:selected").text();
        console.log(selectText);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '', //目标地址
            data : {

            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
            }
        });
    };*/

</script>