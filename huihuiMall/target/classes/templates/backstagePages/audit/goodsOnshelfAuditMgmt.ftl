<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <title>商家商品上架审核管理</title>
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

            <span>商家名称：</span>
            <input type="text" id="searchKey" placeholder="请输入商家名称">

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
                    <th width="50">
                        序号
                    </th>
                    <th width="140">
                        商家名称
                    </th>
                    <th width="120">
                        商品名称
                    </th>
                    <th width="100">
                        商品编号
                    </th>
                    <th width="100">
                        品牌名称
                    </th>
                    <th width="150">
                        所属二级分类名称
                    </th>
                    <th width="150">
                        所属一级分类名称
                    </th>
                    <th width="100">
                        申请时间
                    </th>
                    <th width="100">
                        查看详情
                    </th>
                    <th width="180">
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
                        显示<label id="itemSize">1</label>项结果，共<label id="totalItem">1</label>项，
                        当前<label id="currentPage">1</label>/<label id="totalPages">1</label>页
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

<!--通过弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="passModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="passModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 通过</h4>
                </div>
                <div class="modal-body">
                    确定该商家商品通过审核可以上架？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmPass" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--通过弹出面板结束-->

<!--打回弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="notPassModal" tabindex="-1" role="dialog" aria-labelledby="notPassModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="notPassModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 打回</h4>
                </div>
                <div class="modal-body">
                    确定该商家商品打回审核？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmNotpass" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--打回弹出面板结束-->

<!--查看详情弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog">
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
                                        <label class="control-label">商品名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="viewGoodsName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品编号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="viewGoodsCode">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">一级分类名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                         <input type="text" class="form-control required" disabled="disabled" id="viewFirstClassify">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">二级分类名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                         <input type="text" class="form-control required" disabled="disabled" id="viewSecondClassify">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">品牌名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                         <input type="text" class="form-control required" disabled="disabled" id="viewBrandName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">规格型号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                          <input type="text" class="form-control required" disabled="disabled" id="viewSpecifications">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">计量单位：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewMeasurementUnit">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">包装：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewPacking">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">毛重：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewWeight">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">进货单价：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                       <input type="text" class="form-control required" disabled="disabled" id="viewPurchasePrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">包装费：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewPackingPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">物料费：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewMaterialPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">零售价格：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">批发价格：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                       <input type="text" class="form-control required" disabled="disabled" id="viewTradePrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">生产日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                       <input type="text" disabled="disabled" id="viewManufactureDate" style="width:100%;height:34px">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">保质期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                         <input type="text" class="form-control required" disabled="disabled" id="viewGuarantee">
                                        <span class="input-group-addon">天</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">到期日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                         <input type="text" disabled="disabled" id="viewExpirationDate" style="width:100%;height:34px">
                                    </div>
                                </div>
                            </div>



                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                                           <div class="col-lg-12 col-md-12 col-xs-12">
                                                               <div class="col-lg-3 col-md-3 col-xs-3 title">
                                                                   <label class="control-label">商品展示：</label>
                                                               </div>
                                                               <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                                                   <div class="col-lg-12 col-md-12 col-xs-12 upload-panel" id="mainImage">

                                                                   </div>
                                                               </div>
                                                           </div>
                                                       </div>

                                                       <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                                           <div class="col-lg-12 col-md-12 col-xs-12">
                                                               <div class="col-lg-3 col-md-3 col-xs-3 title">
                                                                   <label class="control-label">商品介绍图：</label>
                                                               </div>
                                                               <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                                                   <div class="col-lg-12 col-md-12 col-xs-12 upload-panel" id="detailImage">

                                                                   </div>
                                                               </div>
                                                           </div>
                                                       </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">备注：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <textarea class="form-control required" disabled="disabled" id="viewRemark" rows="3"></textarea>
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

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>
 var token = $("meta[name='_csrf']").attr("content");
 var header = $("meta[name='_csrf_header']").attr("content");

    var shopId = "";
    var enableStatus = "";
    var nineTen = "";
    $(document).ready(function() {

        $("#loading").css("display","none");

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页

        //获取当日任务计划号
        getUserInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getUserInfos(pageCount,1);
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
                getUserInfos(pageCount,currentPageNum);
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
                getUserInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //审核通过
        $("#confirmPass").click(function () {
            if (nineTen == 9){
                ToExamine(shopId,enableStatus)
            }else if (nineTen == 10){
                TheShelves(shopId,enableStatus)
            }
        })
        //审核打回
        $("#confirmNotpass").click(function () {
            if (nineTen == 9){
                ToExamine(shopId,enableStatus)
            }else if (nineTen == 10){
                TheShelves(shopId,enableStatus)
            }
        })
    });

    //获取信息方法
    function getUserInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var searchKeyParam = $("#searchKey").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getselfServiceReviewProduct', //目标地址
            data : {
                mername : $("#searchKey").val()
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
                    toastr.error('查询失败！');
                    return false;
                }else{
                    $("#loading").css("display","none");
                    var retData = retInfo.data;
                    console.log(retData);
                    var retDataLength = retData.length;
                    $("#Tbody").empty();

                    for(var i = 0 ;i < retDataLength; i ++){
                        var index = i + 1;
                        var retMerchantname = retData[i].merchantname;
                        var retId = retData[i].id;
                        var retName = retData[i].name;
                        var retCode = retData[i].code;
                        var retBrandName = retData[i].brandname;
                        var retCategoryTwoName = retData[i].categorytwoname;
                        var retCategoryOneName = retData[i].categoryonename;
                        var retShelvesStatus = retData[i].shelves_status;
                        var retReviewStatus = retData[i].review_status;
                        var review_time = retData[i].review_time;


                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+retMerchantname+"</td>";
                        tbodyHtml += "<td>"+retName+"</td>";
                        tbodyHtml += "<td>"+retCode+"</td>";
                        tbodyHtml += "<td>"+retBrandName+"</td>";
                        tbodyHtml += "<td>"+retCategoryTwoName+"</td>";
                        tbodyHtml += "<td>"+retCategoryOneName+"</td>";
                        tbodyHtml += "<td>"+review_time+"</td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='SeeDetails("+retId+");'>查看详情</a></td>";
                        tbodyHtml += "<td>";
                        if (retReviewStatus == 1){
                            tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#passModal' style='margin:0px 10px' id='' onclick='getToExamine("+retId+","+2+","+9+");'>通过</button>";
                            tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#notPassModal' style='margin:0px 10px' id='' onclick='getToExamine("+retId+","+3+","+9+");'>打回</button>";
                        }else if (retReviewStatus == 2){
                            tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#passModal' style='margin:0px 10px' id='' onclick='TheShelves("+retId+","+3+","+10+");'>上架</button>";
                            tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#notPassModal' style='margin:0px 10px' id='' onclick='TheShelves("+retId+","+0+","+10+");'>打回</button>";
                        };
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
                toastr.error('查询失败！');
                return false;
            }
        });
    }

    function SeeDetails(retId) {
        toastr.options = {
                  "positionClass": "toast-tip-center-center", //弹出窗的位置
                  "timeOut": "1000" //展现时间
              };
              var gIdParam = retId;
              $.ajax({
                  type : "POST", //用POST方式传输
                  url : '${bath}/productMgmt/selectProductbyid', //目标地址
                  data : {
                      id : gIdParam
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
                      if (retCode != 0) {
                          toastr.error("查询失败！");
                          return false;
                      }
                      else {
                          var retData = retInfo.data;
                          console.log(retData);

                          $("#mainImage").empty();
                          $("#detailImage").empty();

                          var goodsName = retData[0].name;
                          var goodsCode = retData[0].code;
                          var goodsCategoryOneName = retData[0].categoryonename;
                          var goodsCategoryTwoname = retData[0].categorytwoname;
                          var goodsBrandName = retData[0].brandname;
                          var goodsSpecifications = retData[0].specifications;
                          var goodsMeasurementUnit = retData[0].measurement_unit;
                          var goodsPacking = retData[0].packing;
                          var goodsWeight = retData[0].weight;
                          var goodsPurchasePrice = retData[0].purchase_price;
                          var goodsPackingPrice = retData[0].packing_price;
                          var goodsMaterialPrice = retData[0].material_price;
                          var goodsTransportPrice = retData[0].transport_price;
                          var goodsPlaceOfOrigin = retData[0].place_of_origin;
                          var goodsPrice = retData[0].price;
                          var goodsTradePrice = retData[0].trade_price;
                          var goodsDateManufacture = retData[0].date_manufacture;
                          var subDateManufacture = goodsDateManufacture.substring(0,10);
                          var goodsGuaranteeDate = retData[0].guarantee_date;
                          var goodsExpirationDate = retData[0].expiration_date;
                          var subExpirationDate = goodsExpirationDate.substring(0,10);
                          var goodsRemarks = retData[0].Remarks;
                          var mainImage = retData[0].main_image_path;
                          var detailImage = retData[0].detail_image_path;

                          $("#viewGoodsName").val(goodsName);
                          $("#viewGoodsCode").val(goodsCode);
                          $("#viewFirstClassify").val(goodsCategoryOneName);
                          $("#viewSecondClassify").val(goodsCategoryTwoname);
                          $("#viewBrandName").val(goodsBrandName);
                          $("#viewSpecifications").val(goodsSpecifications);
                          $("#viewMeasurementUnit").val(goodsMeasurementUnit);
                          $("#viewPacking").val(goodsPacking);
                          $("#viewWeight").val(goodsWeight);
                          $("#viewPurchasePrice").val(goodsPurchasePrice);
                          $("#viewPackingPrice").val(goodsPackingPrice);
                          $("#viewMaterialPrice").val(goodsMaterialPrice);
                          $("#viewTransportPrice").val(goodsTransportPrice);
                          $("#viewPlace").val(goodsPlaceOfOrigin);
                          $("#viewPrice").val(goodsPrice);
                          $("#viewTradePrice").val(goodsTradePrice);
                          $("#viewManufactureDate").val(subDateManufacture);
                          $("#viewGuarantee").val(goodsGuaranteeDate);
                          $("#viewExpirationDate").val(subExpirationDate);
                          $("#viewRemark").val(goodsRemarks);

                          var mainImagePath = "${bath}/"+mainImage;
                          var mainImagePathHtml = "<a href='"+mainImagePath+"' class='swipebox'>";
                          mainImagePathHtml += "<img src='"+mainImagePath+"' style='width:80px;height:80px' alt=''/>";
                          mainImagePathHtml += "</a>";
                          $("#mainImage").append(mainImagePathHtml);

                          var jsonDetailImage = JSON.parse(detailImage);
                          var jsonDetailImageLength = jsonDetailImage.length;

                          for(var dimg = 0; dimg < jsonDetailImageLength; dimg++){
                              var dimgPath = "${bath}/"+jsonDetailImage[dimg];
                              var dimgPathHtml = "<a href='"+dimgPath+"' class='swipebox'>";
                              dimgPathHtml += "<img src='"+dimgPath+"' style='width:80px;height:80px; margin:10px 10px 0px 0px' alt=''/>";
                              dimgPathHtml += "</a>";
                              $("#detailImage").append(dimgPathHtml);
                          }

                        //  $(".swipebox").swipebox();
                      }
                  },
                  error:function(XMLHttpRequest, textStatus){
                      console.log(XMLHttpRequest);
                      console.log(textStatus);
                      toastr.error("查询失败！");
                      return false;
                  }
              });
    }


    //商品参数传参
    function getToExamine(retId,type,TheShelves) {
        shopId = retId;
        enableStatus = type;
        nineTen = TheShelves;
        return shopId;
        return enableStatus;
        return nineTen;
    }
    //审核商品
    function ToExamine(shopId,enableStatus) {
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/selfServiceReview', //目标地址
            data : {
                id : shopId,
                reviewStatus : enableStatus
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    toastr.error("审核失败！");
                    return false;
                }
                else{
                    $("#passModal").modal("hide");
                    $("#notPassModal").modal("hide");
                    toastr.success("审核成功！");
                    setTimeout(function(){
                        reset();
                    },2000);
                }

            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        });
    }
    //审核上架
    function TheShelves(shopId,enableStatus) {
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/putOnTheShelfThird', //目标地址
            data : {
                id : shopId,
                reviewStatus : enableStatus
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    toastr.error("审核失败！");
                    return false;
                }
                else{
                    $("#passModal").modal("hide");
                    $("#notPassModal").modal("hide");
                    toastr.success("审核成功！");
                    setTimeout(function(){
                        reset();
                    },2000);
                }

            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        });
    }
    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#loading").css("display","block");
        getUserInfos(pageCount,currentPageNum);
    }

</script>
