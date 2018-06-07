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

    <title>中医院信息</title>
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
                    中医院信息
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;中医院管理</li>
                    <li class="active">中医院信息</li>
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
                <#--<button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal">
                    <i class="fa fa-plus fa-fw"></i>添加</button>-->
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyModal" id="modifyBtn">
                    <i class="fa fa-edit fa-fw"></i>修改</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteModal" id="deleteBtn">
                    <i class="fa fa-trash-o fa-fw"></i>删除</button>
                <button type="button" class="btn btn-default" onclick="refresh();">
                    <i class="fa fa-refresh fa-fw"></i>刷新</button>
            </div>
            <div class="col-lg-2 col-md-3" style="margin: 20px 0px; float: right">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="请输入中医院名称" id="searchKey">
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
                                                <th style="width: 60px;">
                                                    序号
                                                </th>
                                                <th style="width:350px">
                                                    中医院名称
                                                </th>
                                                <th style="width:200px">
                                                    所属省市
                                                </th>
                                                <th style="width: 80px;">
                                                    法人
                                                </th>
                                                <th style="width: 80px;">
                                                    联系人
                                                </th>
                                                <th style="width: 100px;">
                                                    电话
                                                </th>
                                                <th style="width: 350px;">
                                                    地址
                                                </th>
                                                <th style="width: 100px;">
                                                    电子邮箱
                                                </th>
                                                <th style="width: 100px;">
                                                    登记时间
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
<#--<div class="panel-body">
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
                                            中医院名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            法人：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            联系人：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            电话：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            地址：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            电子邮箱：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="">
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
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="提交中..." autocomplete="off" onclick="addEnteraccount();">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>-->
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
                                        <label class="control-label" >
                                            中医院名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            所属区域：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <select class="form-control required" id="ProvinceList">
                                            <option value="0">请选择省市</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label" >
                                            法人：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyLegalPerson">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label" >
                                            联系人：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyLinkman">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            电话：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyTelephone">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            地址：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyAddress">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            电子邮箱：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="modifyEmail">
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
        getHospital(pageCount,currentPageNum,search_key);

        //搜索点击
        $("#searchBtn").click(function(){
            var search_key = $("#searchKey").val();
            $("#tbody").empty();
            $("#loading").css("display","block");
            getHospital(pageCount,1,search_key);
        });

    });

    //获取医院信息
    function getHospital(pageCount,currentPageNum,search_key) {
        $("#currentPage").html(currentPageNum);
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/hospital/queryHospitals', //目标地址
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
                        var name = retData[i].name;
                        var provinceName = retData[i].provinceName;
                        var legalPerson = retData[i].legalPerson;
                        var linkman = retData[i].linkman;
                        var telephone = retData[i].telephone;
                        var address = retData[i].address;
                        var email = retData[i].email;
                        var registerTime = (retData[i].registerTime).substring(0,10);

                        var trHtml = "<tr class='gradeA odd' role='row' id='tr"+id+"'>";
                        trHtml += "<td><input type='checkbox' class='checkbox' id='"+id+"'/></td>";
                        trHtml += "<td>"+index+"</td>";
                        trHtml += "<td>"+name+"</td>";
                        trHtml += "<td>"+provinceName+"</td>";
                        trHtml += "<td>"+legalPerson+"</td>";
                        trHtml += "<td>"+linkman+"</td>";
                        trHtml += "<td>"+telephone+"</td>";
                        trHtml += "<td>"+address+"</td>";
                        trHtml += "<td>"+email+"</td>";
                        trHtml += "<td>"+registerTime+"</td>";
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
    }

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
                type : "GET", //用POST方式传输
                url : '${bath}/hospital/viewHospital', //目标地址
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
                    var name = retData.name;
                    var provinceId = retData.provinceId;
                    var legalPerson = retData.legalPerson;
                    var linkMan = retData.linkman;
                    var telephone = retData.telephone;
                    var address = retData.address;
                    var email = retData.email;

                    $("#modifyName").val(name);
                    $("#modifyLegalPerson").val(legalPerson);
                    $("#modifyLinkman").val(linkMan);
                    $("#modifyTelephone").val(telephone);
                    $("#modifyAddress").val(address);
                    $("#modifyEmail").val(email);

                    getProvinceInfo(provinceId);
                }
            });

            $("#confirmModify").attr("onclick","modifyRecord("+checkboxSelectedID+");");
        }
    });

    //修改前清空
    $('#modifyModal').on('hide.bs.modal', function () {
        $("input").val("");
        $("#ProvinceList").empty();
        $("#ProvinceList").append("<option value='0'>请选择省市</option>");
        //$("#modifyProvinceList option:first").prop("selected", 'selected');
    });

    //修改实现方法
    function modifyRecord(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var modifyRecordID = parseInt(checkboxSelectedID);

        var province_Id = $("#ProvinceList").find("option:selected").val();
        var modify_province_Id = province_Id;
        console.log(modify_province_Id);

        $("#confirmModify").button('loading');

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/hospital/updateHospital', //目标地址
            data: {
                id : modifyRecordID,
                provinceId : modify_province_Id,
                name : $("#modifyName").val(),
                legalPerson :  $("#modifyLegalPerson").val(),
                linkman : $("#modifyLinkman").val(),
                telephone : $("#modifyTelephone").val(),
                address : $("#modifyAddress").val(),
                email : $("#modifyEmail").val(),
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
                    $("#confirmModify").button('reset');
                    toastr.error('修改失败！');
                    return false;
                }
                else {
                    $("#confirmModify").button('reset');
                    $("input").val("");
                    $("textarea").val("");
                    $('#modifyModal').modal('hide');
                    toastr.success('修改成功！');
                    setTimeout(function () {
                        refresh();
                    }, 2000);
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
            type: "POST", //用POST方式传输
            url: '${bath}/hospital/deleteHospital', //目标地址
            data: {
                id: delRecordID
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
                    $("#confirmDelete").button('reset');
                    toastr.error('删除失败！');
                    return false;
                }
                else {
                    $("#confirmDelete").button('reset');
                    $('#deleteModal').modal('hide');
                    toastr.success('删除成功！');
                    setTimeout(function () {
                        refresh();
                    }, 2000);
                }
            }
        });
    };

    //删除点击
    $("#deleteBtn").click(function(){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        var checkboxSelectedID = $("#checkboxSelected").text();
        console.log(checkboxSelectedID);
        if (checkboxSelectedID == "") {
            $("#confirmDelete").css({
                "background-color": "#ccc",
                "color": "#444444"
            });
            toastr.error('请选择一条要删除的记录！');
            return false;
        }
        else {
            $("#deleteModal").toggle();
            $("#confirmDelete").css({
                "background-color": "#3c67c0",
                "color": "#FFF"
            });
            $("#confirmDelete").attr("onclick", "delRecord(" + checkboxSelectedID + ");");
        }


    });

    //上一页
    $("#prevPage").click(function () {
        var search_key = $("#searchKey").val();
        var currentPageNum = parseInt($("#currentPage").text());
        if (currentPageNum > 1) {
            $("#tbody").empty();
            $("#loading").css("display", "block");
            currentPageNum -= 1;
            getHospital()
            getHospital(pageCount, currentPageNum, search_key);
        }
        else {
            return;
        }
    });

    //下一页
    $("#nextPage").click(function () {
        var search_key = $("#searchKey").val();
        var totalPages = parseInt($("#totalPages").text());
        var currentPageNum = parseInt($("#currentPage").text());
        if (currentPageNum < totalPages) {
            $("#tbody").empty();
            $("#loading").css("display", "block");
            currentPageNum += 1;
            getHospital(pageCount, currentPageNum, search_key);
        }
        else {
            return;
        }
    });

    function refresh() {
        var search_key = $("#searchKey").val();
        var currentPageNum = parseInt($("#currentPage").text());
        var pageCount=20;
        $("#checkboxSelected").text("");
        $("#tbody").empty();
        $("#loading").css("display","block");
        getHospital(pageCount,currentPageNum,search_key);
    };

    //查询获取省市列表
    function getProvinceInfo(id){
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/provinceInfo/getProviceList', //目标地址
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
                    var provinceId = retData[i].id;
                    var provinceName = retData[i].provinceName;

                    if(provinceId == id){
                        var modifyOptionHtml = "<option value='"+provinceId+"' selected>"+provinceName+"</option>";
                        $("#ProvinceList").append(modifyOptionHtml);
                    }else{
                        var optionHtml = "<option value='"+provinceId+"'>"+provinceName+"</option>";
                        $("#ProvinceList").append(optionHtml);
                    }

                }

            }
        });
    };

    //改变提示窗位置
    /*function changeToastr() {
        var toscrollTop=$(window.parent).scrollTop();//滚动距离
        var documentHeight=$(document).height();//当前iframe总高度
        var percent;
        if(toscrollTop<80){
            percent=(((toscrollTop+170)/documentHeight)*100)+"%";
        }else {
            percent=(((toscrollTop+110)/documentHeight)*100)+"%";
        }
        /!* alert(documentHeight)
         alert(percent)*!/
        $("#toast-container").css("top",percent);
    };*/
</script>
