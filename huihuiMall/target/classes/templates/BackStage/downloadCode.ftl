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

    <title>监管码下载</title>
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="${bath}/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />

    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css" />
    <#--tip CSS-->
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css" />

    <!-- jQuery -->
    <script src="${bath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
</head>
<style>
    #detailInfoModal .modal-dialog {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
    }

    #detailInfoModal .modal-content {
        /*overflow-y: scroll;*/
        position: absolute;
        top: 0;
        bottom: 80px;
        width: 100%;
    }

    #detailInfoModal .modal-body {
        overflow-y: scroll;
        position: absolute;
        top: 55px;
        bottom: 72px;
        width: 100%;
    }

    #detailInfoModal .modal-footer {
        position: absolute;
        width: 100%;
        bottom: 0;
    }
</style>
<body>

<!--顶部title与面包屑开始-->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-9 col-md-9" style="padding-left: 0px">
                <h3 class="page-header">
                    监管码下载
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;监管码管理</li>
                    <li class="active">监管码下载</li>
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
                <button type="button" class="btn btn-default" onclick="refresh();">
                    <i class="fa fa-refresh fa-fw"></i>刷新</button>
            </div>
            <div class="col-lg-2 col-md-3" style="margin: 20px 0px; float: right">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="请输入生产批次号" id="searchKey">
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
                                            <thead>
                                            <tr role="row">
                                                <th style="width: 50px;">
                                                    序号
                                                </th>
                                                <th style="width: 200px" id="companyName">
                                                    企业名称
                                                </th>
                                                <th style="width: 120px">
                                                    生产批次号
                                                </th>
                                                <th style="width: 120px">
                                                    申请数量
                                                </th>
                                                <th style="width: 120px;">
                                                    药品名称
                                                </th>
                                                <#--<th style="width: 150px;">
                                                    产地来源
                                                </th>-->
                                                <th style="width: 120px;">
                                                    申请状态
                                                </th>
                                               <#-- <th style="width: 120px;">
                                                    查看详情
                                                </th>-->
                                                <th style="width: 100px;">
                                                    下载监管码
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

<!--查看详情弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailInfoModal" tabindex="-1" role="dialog" aria-labelledby="detailInfoModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="detailInfoModalLabel">
                        <i class="fa fa-eye fa-fw"></i>查看详情</h4>
                </div>
                <label for="" id="entCode" style="display: none;"></label>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form" id="enterpriseNameForm" style="display: none">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            企业名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" disabled="disabled" id="enterpriseName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            生产批次号：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="batchNumber" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药品名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="medicineName" disabled="disabled" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药品规格：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="medicineSpecification" disabled="disabled" >
                                    </div>
                                </div>
                            </div>
                            <#--<div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            产地来源：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="sourceName"disabled="disabled">
                                    </div>
                                </div>
                            </div>-->
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            销售重量：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id=""disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            销售总价：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="input-group">
                                            <input type="text" class="form-control required" id=""disabled="disabled">
                                            <span class="input-group-addon">元</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            申请数量：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="input-group">
                                            <input type="text" class="form-control required" id="applyCount" disabled="disabled">
                                            <span class="input-group-addon">个</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            申请日期：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="applyDate" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            审核日期：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="checkDate" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            药材清单：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline"
                                               role="grid" aria-describedby="dataTables-example_info" style="width: 100%">
                                            <thead>
                                            <tr role="row">
                                                <th style="width: 150px;">
                                                    药材名称
                                                </th>
                                                <th style="width: 280px;">
                                                    扶贫基地名称
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr class='gradeA odd' role='row'>
                                                    <td>决明子</td>
                                                    <td id=''>贵州省铜仁地区沿河土家族自治县黑水乡</td>
                                                </tr>
                                                <tr class='gradeA odd' role='row'>
                                                    <td>茯苓</td>
                                                    <td id=''>贵州省铜仁地区沿河土家族自治县黑水乡</td>
                                                </tr>
                                                <tr class='gradeA odd' role='row'>
                                                    <td>茯苓2</td>
                                                    <td id=''>贵州省铜仁地区沿河土家族自治县黑水乡</td>
                                                </tr>
                                                <tr class='gradeA odd' role='row'>
                                                    <td>茯苓3</td>
                                                    <td id=''>贵州省铜仁地区沿河土家族自治县黑水乡</td>
                                                </tr>
                                                <tr class='gradeA odd' role='row'>
                                                    <td>茯苓4</td>
                                                    <td id=''>贵州省铜仁地区沿河土家族自治县黑水乡</td>
                                                </tr>
                                                <tr class='gradeA odd' role='row'>
                                                    <td>茯苓5</td>
                                                    <td id=''>贵州省铜仁地区沿河土家族自治县黑水乡</td>
                                                </tr>
                                                <tr class='gradeA odd' role='row'>
                                                    <td>茯苓6</td>
                                                    <td id=''>贵州省铜仁地区沿河土家族自治县黑水乡</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--查看详情面板结束-->

<#--数据加载loading开始-->
<div id="loading" class="loading">数据加载中...</div>
<#--数据加载loading结束-->

</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function(){
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页
        var search_key = $("#searchKey").val();

        //获取已通过的申请列表
        getPassedList(pageCount,currentPageNum,search_key);

        //搜索点击
        $("#searchBtn").click(function(){
            var search_key = $("#searchKey").val();
            $("#tbody").empty();
            $("#loading").css("display","block");
            getPassedList(pageCount,1,search_key);
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
                getPassedList(pageCount,currentPageNum,search_key);
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
                getPassedList(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });
    });

    //获取已通过的申请列表方法
    function getPassedList(pageCount,currentPageNum,search_key){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        $("#currentPage").html(currentPageNum);
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/apply/getCodeApply', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                BatchNumber : search_key
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
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

                console.log(retInfo);
                var isAdmin = retInfo.data.isAdmin;
                var retData = retInfo.data.list;
                if(retData == null){
                    toastr.error('获取数据失败！');
                    return false;
                }else{
                    $("#tbody").empty();
                    var retDataLength = retData.length;
                    for(var i = 0 ; i < retDataLength ; i ++){
                        var index = i + 1;
                        var id = retData[i].id;
                        var enterpriseName = retData[i].companyname;
                        var applyCount = retData[i].count;
                        var medicineName = retData[i].medicinename;
                        var sourceName = retData[i].sourcename;
                        var status = retData[i].status;
                        var batchNumber = retData[i].batchnumber;

                        var trHtml = "<tr class='gradeA odd' role='row'>";
                        trHtml += "<td>"+index+"</td>";
                        if(isAdmin == "1"){
                            trHtml += "<td>"+enterpriseName+"</td>";
                        }else{
                            $("#companyName").css("display","none");
                            trHtml += "<td style='display:none'>"+enterpriseName+"</td>";
                        }
                        trHtml += "<td>"+batchNumber+"</td>";
                        trHtml += "<td>"+applyCount+"个</td>";
                        trHtml += "<td>"+medicineName+"</td>";
                        /*trHtml += "<td>"+sourceName+"</td>";*/
                        trHtml += "<td style='color:#43CD80'>审核通过</td>";
                        //trHtml += "<td><a href='javascript:void(0)' class='aLink' onclick='viewDetailInfo("+id+")'>查看</a></td>";
                        trHtml += "<td><a href='${bath}/apply/uploadCodeToExcel?id="+id+"' class='aLink'>下载</a></td>";
                        trHtml += "</tr>";

                        $("#tbody").append(trHtml);
                    }
                }

                $("#loading").css("display","none");
            }
        });
    }

    /*刷新页面*/
    //刷新实现方法
    function refresh(){
        var search_key = $("#searchKey").val();
        var currentPageNum = parseInt($("#currentPage").text());
        var pageCount=20;
        $("#tbody").empty();
        $("#loading").css("display","block");
        getPassedList(pageCount,currentPageNum,search_key);
    };

    /*点击查看*/
    function viewDetailInfo(id) {

        $('#detailInfoModal').modal('show');

        //信息查询
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/apply/getApplyById', //目标地址
            data : {
                id : id
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                var retData=retInfo.data;
                console.log(retInfo);
                var id = retData.id;
                var enterpriseName = retData.companyname;
                var batchNumber = retData.batchnumber;
                var medicineName = retData.medicinename;
                var medicineSpecification = retData.specification;
                var sourceName =  retData.sourcename;
                var applyCount = retData.count;
                var applyDate = retData.applydateresult;
                var checkDate = retData.checkdateresult;
                var isAdmin = retData.isAdmin;

                if(isAdmin == 1){
                    $("#enterpriseName").val(enterpriseName);
                    $("#enterpriseNameForm").css("display","block");
                }else{
                    $("#enterpriseNameForm").css("display","none");
                }

                $("#batchNumber").val(batchNumber);
                $("#medicineName").val(medicineName);
                $("#medicineSpecification").val(medicineSpecification);
                $("#sourceName").val(sourceName);
                $("#applyCount").val(applyCount);
                $("#applyDate").val(applyDate);
                $("#checkDate").val(checkDate);
            }
        });
    };

</script>