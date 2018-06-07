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

    <title>申请监管码--上报数据</title>
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
            <div class="col-lg-9 col-md-7" style="padding-left: 0px">
                <h3 class="page-header">
                    申请监管码
                </h3>
            </div>
            <div class="col-lg-3  col-md-5">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;监管码管理</li>
                    <li style="color: #777">申请监管码</li>
                    <li class="active">上报数据</li>
                </h4>
            </div>
        </div>
    </div>
</div>
<!--顶部title与面包屑结束-->

<!--填报数据面板开始-->
<div class="panel-body" style="margin-top: 30px">
    <div class="row">
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <div class="col-lg-12 col-md-12 input-form">
                    <div class="col-lg-12 col-md-12 _padding">
                        <div class="col-lg-3 col-md-3 title">
                            <label class="control-label">
                                生产批次号：</label>
                        </div>
                        <div class="col-lg-9 col-md-9 input-box">
                            <input type="text" class="form-control required" id="batchNumber">
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 input-form">
                    <div class="col-lg-12 col-md-12 _padding">
                        <div class="col-lg-3 col-md-3 title">
                            <label class="control-label">
                                药品名称：</label>
                        </div>
                        <div class="col-lg-9 col-md-9 input-box input-group" style="padding-left:15px">
                            <input type="text" class="form-control required" id="medicineName" disabled='disabled' style="background-color: #FFFFFF">
                            <label id="medicineId" style="display: none"></label>
                            <span class="input-group-btn">
                                <button class="btn btn-default" style="margin:0px" type="button" data-toggle="modal" data-target="#chooseDrugsModal" id="chooseDrugsBtn">
                                    选择
                                </button>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 col-md-12 input-form">
                    <div class="col-lg-12 col-md-12 _padding">
                        <div class="col-lg-3 col-md-3 title">
                            <label class="control-label">
                                药品规格：</label>
                        </div>
                        <div class="col-lg-9 col-md-9 input-box">
                            <input type="text" class="form-control required" id="specification">
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 input-form">
                    <div class="col-lg-12 col-md-12 _padding">
                        <div class="col-lg-3 col-md-3 title">
                            <label class="control-label">
                                销售重量：</label>
                        </div>
                        <div class="col-lg-9 col-md-9 input-box">
                            <div class="input-group">
                                <input type="text" class="form-control required" id="salesWeight">
                                <span class="input-group-addon">kg</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 input-form">
                    <div class="col-lg-12 col-md-12 _padding">
                        <div class="col-lg-3 col-md-3 title">
                            <label class="control-label">
                                销售总价：</label>
                        </div>
                        <div class="col-lg-9 col-md-9 input-box">
                            <div class="input-group">
                                <input type="text" class="form-control required" id="totalPrice">
                                <span class="input-group-addon">元</span>
                            </div>
                        </div>
                    </div>
                </div>
                <#--<div class="col-lg-12 col-md-12 input-form">
                    <div class="col-lg-12 col-md-12 _padding">
                        <div class="col-lg-3 col-md-3 title">
                            <label class="control-label">
                                产地来源：</label>
                        </div>
                        <div class="col-lg-7 col-md-7 input-box input-group" style="padding-left:15px">
                            <input type="text" class="form-control required" id="sourceName" disabled='disabled' style="background-color: #FFFFFF">
                            <label id="sourceId" style="display: none"></label>
                            <span class="input-group-btn">
                                <button class="btn btn-default" style="margin:0px" type="button" data-toggle="modal" data-target="#chooseSourceModal" id="chooseSourceBtn">
                                    选择
                                </button>
                            </span>
                        </div>
                    </div>
                </div>-->
                <div class="col-lg-12 col-md-12 input-form">
                    <div class="col-lg-12 col-md-12 _padding">
                        <div class="col-lg-3 col-md-3 title">
                            <label class="control-label">
                                申请数量：</label>
                        </div>
                        <div class="col-lg-9 col-md-9 input-box">
                            <div class="input-group">
                                <input type="text" class="form-control required" id="applyCount">
                                <span class="input-group-addon">个</span>
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
                        <div class="col-lg-9 col-md-9 input-box input-group" style="padding-left:15px">
                            <span class="input-group-btn">
                                <button class="btn btn-default" style="margin:0px; border-radius:4px" type="button" data-toggle="modal" data-target="#chooseMaterialsModal" id="chooseMaterialsBtn">
                                    选择
                                </button>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 col-md-12 input-form">
                    <div class="col-lg-12 col-md-12 _padding" style="display:none"  id="materialsPanel">
                        <div class="col-lg-3 col-md-3 title">
                            <label class="control-label" style="display:none"></label>
                        </div>
                        <div class="col-lg-9 col-md-9 input-box input-group" style="padding-left:15px;">
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
                                    <th style="width: 50px;">
                                        操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="MaterialTbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12" style="padding-right: 0px">
                <button type="button" class="btn btn-default pull-right" id="submitBtn">
                    提交</button>
            </div>
        </div>
    </div>
</div>
<!--填报数据面板结束-->

<!--选择药品信息面板开始-->
<div class="panel-body">
    <div class="modal fade" id="chooseDrugsModal" tabindex="-1" role="dialog" aria-labelledby="chooseDrugsModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="chooseDrugsModalLabel">
                        <i class="fa fa-check-square-o fa-fw"></i>选择药品名称</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        关键字：</label>
                                </div>
                                <div class="col-lg-5 col-md-5 input-box">
                                    <input type="text" class="form-control required" placeholder="必填" id="typeKey"  data-tip="" data-valid="isNonEmpty" data-error="角色名称不能为空">
                                </div>
                                <div class="col-lg-3 col-md-3">
                                    <button type="button" id="typeSearchBtn" class="btn btn-search" style="background-color: #ccc;
                            color: #444444">
                                        搜索</button>
                                </div>
                            </div>

                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline"
                                       role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                    <lable id="typeCheckboxSelected" style="display: none"></lable>
                                    <thead>
                                        <tr role="row">
                                            <th style="width: 20px;">
                                            </th>
                                            <th style="width: 20px;">
                                                序号
                                            </th>
                                            <th style="width: 280px;">
                                               药品名称
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="drugsTbody">

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
                                            <a href="javascript:void(0);" id="nextPage" style="margin-left: 0px">下一页</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px"
                            data-loading-text="提交中..." autocomplete="off" onclick="confirmType();">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--选择药品信息面板结束-->

<!--选择药材来源面板开始-->
<div class="panel-body">
    <div class="modal fade" id="chooseMaterialsModal" tabindex="-1" role="dialog" aria-labelledby="chooseMaterialsModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="chooseMaterialsModalLabel">
                        <i class="fa fa-check-square-o fa-fw"></i>选择药材</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        关键字：</label>
                                </div>
                                <div class="col-lg-5 col-md-5 input-box">
                                    <input type="text" class="form-control required" placeholder="必填" id="sourceKey"  data-tip="" data-valid="isNonEmpty" data-error="角色名称不能为空">
                                </div>
                                <div class="col-lg-3 col-md-3">
                                    <button type="button" id="sourceSearchBtn" class="btn btn-search"  style="background-color: #ccc;
                            color: #444444">
                                        搜索</button>
                                </div>
                            </div>

                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline"
                                       role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                    <lable id="sourceCheckboxSelected" style="display: none"></lable>
                                    <thead>
                                    <tr role="row">
                                        <th style="width: 30px;">
                                        </th>
                                        <th style="width: 50px;">
                                            序号
                                        </th>
                                        <th style="width: 120px;">
                                            药材名称
                                        </th>
                                        <th style="width: 280px;">
                                            扶贫基地名称
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody id="sourceTbody">

                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 40px">
                            <div class="col-lg-2 col-md-3">
                                <div class="dataTables_length" style="text-align: center">
                                   <#-- <label>
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
                                    显示<lable id="itemSize2"></lable>项结果，共<label id="totalItem2"></label>项，
                                    当前<label id="currentPage2"></label>/<label id="totalPages2"></label>页
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate"
                                     style="text-align: center">
                                    <ul class="pagination" style="margin: 0px; display: none">
                                        <li class="paginate_button previous" aria-controls="dataTables-example">
                                            <a href="javascript:void(0);" id="prevPage2">上一页</a>
                                        </li>
                                        <li class="paginate_button next" aria-controls="dataTables-example">
                                            <a href="javascript:void(0);" id="nextPage2" style="margin-left: 0px">下一页</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px"
                            data-loading-text="提交中..." autocomplete="off" onclick="addMaterials();">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--选择药材来源面板结束-->

<#--数据加载loading开始-->
<div id="loading" class="loading">数据加载中...</div>
<#--数据加载loading结束-->

</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function(){
        var pageCount=8;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页
        var search_key = $("#typeKey").val();
        var search_key2 = $("#sourceKey").val();

        //获取药品类别
        getMedicinetype(pageCount,currentPageNum,search_key);

        //获取药材来源
        getSource(pageCount,currentPageNum,search_key2);

        //药品类别搜索点击
        $("#typeSearchBtn").click(function(){
            var search_key = $("#typeKey").val();
            $("#drugsTbody").empty();
            $("#loading").css("display","block");
            getMedicinetype(pageCount,1,search_key);
        });

        //药品类别上一页
        $("#prevPage").click(function(){
            var search_key = $("#typeKey").val();
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum > 1)
            {
                $("#drugsTbody").empty();
                $("#loading").css("display","block");
                currentPageNum -= 1;
                getMedicinetype(pageCount,currentPageNum,search_key);
            }
            else
            {
                return;
            }
        });

        //药品类别下一页
        $("#nextPage").click(function(){
            var search_key = $("#typeKey").val();
            var totalPages = parseInt($("#totalPages").text());
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum < totalPages)
            {
                $("#drugsTbody").empty();
                $("#loading").css("display","block");
                currentPageNum += 1;
                getMedicinetype(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });

        //药材来源搜索点击
        $("#sourceSearchBtn").click(function(){
            var search_key = $("#sourceKey").val();
            $("#sourceTbody").empty();
            $("#loading").css("display","block");
            getSource(pageCount,1,search_key);
        });

        //药材来源来源上一页
        $("#prevPage2").click(function(){
            var search_key = $("#sourceKey").val();
            var currentPageNum = parseInt($("#currentPage2").text());
            if(currentPageNum > 1)
            {
                $("#sourceTbody").empty();
                $("#loading").css("display","block");
                currentPageNum -= 1;
                getSource(pageCount,currentPageNum,search_key);
            }
            else
            {
                return;
            }
        });

        //药材来源下一页
        $("#nextPage2").click(function(){
            var search_key = $("#sourceKey").val();
            var totalPages = parseInt($("#totalPages2").text());
            var currentPageNum = parseInt($("#currentPage2").text());
            if(currentPageNum < totalPages)
            {
                $("#sourceTbody").empty();
                $("#loading").css("display","block");
                currentPageNum += 1;
                getSource(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });

        //提交申请
        $("#submitBtn").click(function(){

            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };

            var batchNumParam = $("#batchNumber").val();
            var medicineIdParam = $("#medicineId").text();
            var medicineSpecificationParam = $("#specification").val();
            var salesWeightParam = $("#salesWeight").val();
            var totalPriceParam = $("#totalPrice").val();
            var applyCountParam = $("#applyCount").val();

            var crudeMedicineIdArray = [];

            var MaterialTbodyLength = $("#MaterialTbody").find("tr").length;
            if(MaterialTbodyLength == 0){
                toastr.error('药材项不能为空！');
                return false;
            }else{
                var trList = $("#MaterialTbody").children("tr");
                for (var i = 0;i < trList.length; i ++) {
                    var trId = trList.eq(i).attr("id");
                    crudeMedicineIdArray.push(trId);
                }
            }
            console.log(crudeMedicineIdArray);

            if(batchNumParam == "" || medicineIdParam == "" || medicineSpecificationParam == "" || salesWeightParam  == ""|| applyCountParam == "" || totalPriceParam == ""){
                toastr.error('必填项不能为空！');
                return false;
            }else{
                $.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/apply/apply', //目标地址
                    data : {
                        batchNumber : batchNumParam,
                        medicineId : medicineIdParam,
                        specification : medicineSpecificationParam,
                        salesWeight : salesWeightParam,
                        count : applyCountParam,
                        totalPrice : totalPriceParam,
                        crudeMedicineIds : JSON.stringify(crudeMedicineIdArray)
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
                        if(retCode != 0 ){
                            toastr.error('填报失败！');
                            return false;
                        }else{
                            toastr.success('填报成功！');
                            setTimeout(function(){
                                var url = "${bath}/regulatoryCode/applyCode";
                                window.open(url,"_self");
                            },2000);
                        }
                        $("#loading").css("display","none");
                    }
                });
            }
        });
    });

    //获取药品类别方法
    function getMedicinetype(pageCount,currentPageNum,search_key){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        $("#currentPage").html(currentPageNum);
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/apply/getAllMedicine', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                medicineName : search_key
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

                console.log(retInfo);
                var retData = retInfo.data;
                if(retData == null){
                    toastr.error('获取数据失败！');
                    return false;
                }else{
                    $("#drugsTbody").empty();
                    var retDataLength = retData.length;
                    for(var k = 0 ; k < retDataLength ; k ++){

                        var index = k + 1;
                        var medicineId = retData[k].id;
                        var medicineName = retData[k].name;

                        var trMedicineHtml = "<tr class='gradeA odd' role='row'>";
                        trMedicineHtml += "<td><input type='checkbox' class='checkbox checkbox2' id='d_"+medicineId+"' style='position: absolute;margin-top:4px'/></td>";
                        trMedicineHtml += "<td>"+index+"</td>";
                        trMedicineHtml += "<td id='d_"+medicineId+"_name'>"+medicineName+"</td>";
                        trMedicineHtml += "</tr>";

                        $("#drugsTbody").append(trMedicineHtml);
                    }

                    //选择药材类型
                    $("#drugsTbody .checkbox").on("click", function() {
                        if ($(this).prop("checked")) {
                            $(".checkbox").prop("checked", false);
                            $(this).prop("checked", true);
                            var checkboxID = $(this).attr("id");
                            $("#typeCheckboxSelected").text(checkboxID);
                        }
                        else {
                            $("#typeCheckboxSelected").text("");
                        }
                    });
                }
                $("#loading").css("display","none");
            }
        });
    };

    //提交药品种类
    function confirmType(){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        var typeStr = $("#typeCheckboxSelected").text();
        if(typeStr == ""){
            toastr.error('请选择一个药材分类！');
            return false;
        }else{
            var typeNameStr = typeStr+"_name";
            var typeName = $("#"+typeNameStr).html();
            $("#medicineName").val(typeName);

            var typeId = typeStr.split('_')[1];
            $("#medicineId").html(typeId);
        }
        $('#chooseDrugsModal').modal('hide')
    };

    //获取药材来源方法
    function getSource(pageCount,currentPageNum,search_key2) {
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        $("#currentPage2").html(currentPageNum);
        $.ajax({
            type: "GET", //用POST方式传输
            url: '${bath}/aid/queryAllCrudeMedicine', //目标地址
            data: {
                PageNum: currentPageNum,
                PageSize: pageCount,
                name: search_key2
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {

                $(".pagination").css("display", "block");

                var itemSize = retInfo.size;
                $("#itemSize2").html(itemSize);

                var totalItem = retInfo.total;
                $("#totalItem2").html(totalItem);

                var totalPages = retInfo.pages;
                if(totalPages == 0){
                    $("#totalPages2").html(1);
                }else{
                    $("#totalPages2").html(totalPages);
                }

                var hasNextPage = retInfo.hasNextPage;
                if (hasNextPage == true) {
                    $("#nextPage2").css("display", "block");
                } else {
                    $("#nextPage2").css("display", "none");
                }

                var hasPreviousPage = retInfo.hasPreviousPage;
                if (hasPreviousPage == true) {
                    $("#prevPage2").css("display", "block");
                } else {
                    $("#prevPage2").css("display", "none");
                }

                console.log(retInfo);
                var retData = retInfo.data;
                if(retData == null){
                    toastr.error('获取数据失败！');
                    return false;
                }else{
                    $("#sourceTbody").empty();
                    var retDataLength = retData.length;
                    for(var i = 0 ; i < retDataLength ; i ++){

                        var index = i + 1;
                        var sourceId = retData[i].id;
                        var sourceName = retData[i].name;
                        var aidBaseName = retData[i].aidbasename;

                        var trSourceHtml = "<tr class='gradeA odd' role='row'>";
                        trSourceHtml += "<td><input type='checkbox' class='checkbox checkbox2' id='s_"+sourceId+"' style='position: absolute;margin-top:4px'/></td>";
                        trSourceHtml += "<td>"+index+"</td>";
                        trSourceHtml += "<td id='s_"+sourceId+"_name'>"+sourceName+"</td>";
                        trSourceHtml += "<td>"+aidBaseName+"</td>";
                        trSourceHtml += "</tr>";

                        $("#sourceTbody").append(trSourceHtml);
                    }

                    //选择药材来源
                    $("#sourceTbody .checkbox2").on("click", function() {
                        if ($(this).prop("checked")) {
                            $(".checkbox").prop("checked", false);
                            $(this).prop("checked", true);
                            var checkboxID = $(this).attr("id");
                            $("#sourceCheckboxSelected").text(checkboxID);
                        }
                        else {
                            $("#sourceCheckboxSelected").text("");
                        }
                    });
                }
                $("#loading").css("display","none");
            }
        });
    };

    //提交药材来源
    function addMaterials(){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var typeStr = $("#sourceCheckboxSelected").text();
        console.log(typeStr);

        if(typeStr == ""){
            toastr.error('请选择一个药材！');
            return false;
        }else{
            var typeId = typeStr.split('_')[1];

            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/aid/queryMedicinalMaterials', //目标地址
                data : {
                    id : typeId
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

                    var medicineName = retData[0].name;
                    var aidBaseName = retData[0].aidbasename;

                    $("#materialsPanel").css("display","block");

                    var html ="<tr class='gradeA odd' role='row' id='"+typeId+"'>";
                    html += "<td>"+medicineName+"</td>";
                    html += "<td>"+aidBaseName+"</td>";
                    html += "<td><a href='javascript:void(0);' onclick='removeTr("+typeId+");'>移除</a></td>";
                    html += "</tr>";

                    $("#MaterialTbody").append(html);
                }
            });
        }
        $('#chooseMaterialsModal').modal('hide');
    };

    //移除药材
    function removeTr(id){
        $("#"+id).remove();
        var MaterialTbodyTrLength = $("#MaterialTbody").find("tr").length;
        if(MaterialTbodyTrLength == 0){
            $("#materialsPanel").css("display","none");
        }
    };

</script>