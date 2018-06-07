<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>门店分润记录</title>
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
</head>
<body>

<div class="container-fluid btn-operation-panel">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span>门店名称：</span>
            <input type="text" id="storeNameKey" placeholder="请输入门店名称">

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
                        门店名称
                    </th>
                    <th>
                        门店负责人
                    </th>
                    <th>
                        联系方式
                    </th>
                    <th>
                        门店地址
                    </th>
                    <th>
                        仓库名称
                    </th>
                    <th>
                        门店分润详情
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

<!--门店分润记录弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="detailModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 门店分润详情</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid table-operation-panel" style="padding:0px;">
                        <div class="row table-row">

                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <span style="margin-left: 10px">请选择日期：</span>
                                <input type="text" id="date" placeholder="请选择日期" style="width:40%">

                                <button type="button" class="btn btn-default" id="searchProfitBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
                                <button type="button" class="btn btn-default" id="resetProfitBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 table-panel">
                                <label id="storeId" style="display: none"></label>
                                <table class="table table-bordered table-hover table-responsive" style="margin-top: 15px;">
                                    <thead>
                                    <tr>
                                        <th width="50px">
                                            序号
                                        </th>
                                        <th>
                                            订单号
                                        </th>
                                        <th>
                                            日期
                                        </th>
                                        <th>
                                            订单金额
                                        </th>
                                        <th>
                                            推荐收益
                                        </th>
                                        <th>
                                            销售收益
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody id="profitTbody">

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="6" id="sum"></td>
                                    </tr>
                                    </tfoot>
                                </table>
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
<!--门店分润记录弹出面板结束-->

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function() {

        var systemDate = new Date();
        var year = systemDate.getFullYear();
        var month = systemDate.getMonth() + 1;

        if(month >= 13){
            month = 1;
        }

        var currentDate = year + "-" + month;
        console.log(currentDate);
        $("#date").val(currentDate);

        //执行一个laydate实例
        laydate.render({
            elem: "#date",//指定元素
            theme: '#3c8dbc',
            type:'month'
        });

        $("#loading").css("display","block");

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页*/

        //获取门店信息
        getStoreInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getStoreInfos(pageCount,1);
        });

        //分润详情搜索
        $("#searchProfitBtn").click(function(){
            var storeIdParam = $("#storeId").text();
            viewDetail(storeIdParam);
        });

        //重置点击
        $("#resetBtn").click(function(){
            reset();
        });

        //重置分润详情点击
        $("#resetProfitBtn").click(function(){

            var systemDate = new Date();
            var year = systemDate.getFullYear();
            var month = systemDate.getMonth() + 1;

            if(month >= 13){
                month = 1;
            }

            var currentDate = year + "-" + month;
            console.log(currentDate);
            $("#date").val(currentDate);

            var storeIdParam = $("#storeId").text();
            viewDetail(storeIdParam);
        });

        //上一页
        $("#prevPage").click(function(){
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum > 1)
            {
                $("#Tbody").empty();
                $("#loading").css("display","block");
                currentPageNum -= 1;
                getStoreInfos(pageCount,currentPageNum);
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
                getStoreInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //查看分润详情modal关闭
        $("#detailModal").on("hide.bs.modal", function () {
            $("#storeId").text("");
        });

    });

    //获取信息方法
    function getStoreInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storeNameKeyParam = $("#storeNameKey").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/StoreController/queryStore', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                storeName : storeNameKeyParam
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
                    var retDataLength = retData.length;

                    $("#Tbody").empty();

                    for(var i = 0 ;i < retDataLength; i ++){

                        var index = i + 1;
                        var id = retData[i].id;
                        var storeName = retData[i].store_name;
                        var shopKeeperName = retData[i].name;
                        var shopKeeperPhoneNumber = retData[i].phone_number;
                        var storeAddress = retData[i].store_address;
                        var storehouseName = retData[i].storehouse_name;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+storeName+"</td>";
                        tbodyHtml += "<td>"+shopKeeperName+"</td>";

                        tbodyHtml += "<td>"+shopKeeperPhoneNumber+"</td>";
                        tbodyHtml += "<td>"+storeAddress+"</td>";

                        if(storehouseName == null || storehouseName == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+storehouseName+"</td>";
                        }

                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='viewDetail(\""+id+"\")'>查看详情</a></td>";
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

    //查看详情方法
    function viewDetail(storeId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storeIdParam = storeId;
        $("#storeId").text(storeIdParam);
        var dateParam = $("#date").val();

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/ProtalStoreOrder/getOrderProfit', //目标地址
            data : {
                storeId : storeIdParam,
                date: dateParam
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

                    var sum = retInfo.retNum;
                    $("#sum").html("总计：" + sum);

                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#profitTbody").empty();

                    for(var p = 0; p < retDataLength; p++){

                        var index = p + 1;
                        //订单号
                        var orederNumber = retData[p].orderNumber;
                        //日期
                        var startTime = retData[p].startTime;
                        var subStartTime = startTime.substring(0,10);
                        //订单金额
                        var total = retData[p].total;
                        //销售分润
                        var consumption = retData[p].consumption;
                        //推荐分润
                        var recommend = retData[p].recommend;

                        var profitTbodyHtml = "<tr>";
                        profitTbodyHtml += "<td>"+index+"</td>";
                        profitTbodyHtml += "<td>"+orederNumber+"</td>";
                        profitTbodyHtml += " <td>"+subStartTime+"</td>";
                        profitTbodyHtml += "<td>"+total+"</td>";
                        profitTbodyHtml += "<td>"+consumption+"</td>";
                        profitTbodyHtml += "<td>"+recommend+"</td>";
                        profitTbodyHtml += " </tr>";

                        $("#profitTbody").append(profitTbodyHtml);
                    }
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

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#storeNameKey").val("");
        $("#loading").css("display","block");
        getStoreInfos(pageCount,currentPageNum);
    }

</script>
