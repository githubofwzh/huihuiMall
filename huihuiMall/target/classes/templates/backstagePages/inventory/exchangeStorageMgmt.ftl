<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>调库管理</title>
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

    <style>
        .delBtn{
            margin: 0px;
            background-color: #b92c28;
            color:#FFFFFF;
            border-color: #b92c28;
        }

        .delBtn:hover{
            background-color: #b92c28;
            color:#FFFFFF;
            border-color: #b92c28;
        }

        .delBtn:focus{
            background-color: #b92c28 !important;
            color:#FFFFFF;
            border-color: #b92c28;
        }
    </style>

</head>
<body>

<div class="container-fluid btn-operation-panel">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span>调库单号：</span>
            <input type="text" id="codeKey" placeholder="请输入调库单号">

            <span style="margin-left: 10px">调库状态：</span>
            <select style="width: 10%" id="exchangeSelected">
                <option value="">请选择</option>
                <option value="1">审核中</option>
                <option value="2">审核通过</option>
                <option value="3">已出库</option>
            </select>

            <span style="margin-left: 10px">制单日期：</span>
            <input type="text" id="startingDate" placeholder="开始时间">
            <span>-</span>
            <input type="text" id="endingDate" placeholder="结束时间">

            <button type="button" class="btn btn-default" id="searchBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">

            <div class="col-lg-12 col-md-12 col-xs-12 btn-group-panel">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#inputGoodsModal" id="storageBtn">
                    <i class="fa fa-plus fa-fw"></i> 调库单填写</button>
            </div>

            <table class="table table-bordered table-hover table-responsive" style="margin-top: 20px;">
                <thead>
                <tr>
                    <th width="80">
                        序号
                    </th>
                    <th>
                        调库单号
                    </th>
                    <th>
                        出货仓库
                    </th>
                    <th>
                        入货仓库
                    </th>
                    <th>
                        调库状态
                    </th>
                    <th>
                        制单日期
                    </th>
                    <th>
                        查看详情
                    </th>
                    <th>
                        打印
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

<!--查看详情弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:60%">
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
                                        <label class="control-label">调库单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" id="dkCodeDetail" disabled="disabled">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">制单日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" id="creatOrderDate" disabled="disabled">
                                    </div>
                                </div>
                            </div>

                            <#--<div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">出货仓库：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="">
                                    </div>
                                </div>
                            </div>-->

                            <#--<div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">入货仓库：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="">
                                    </div>
                                </div>
                            </div>-->

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品清单：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <table class="table table-bordered table-hover table-responsive" style="margin-top: 20px;">
                                            <thead>
                                            <tr>
                                                <th width="50">
                                                    商品编号
                                                </th>
                                                <th width="100">
                                                    商品名称
                                                </th>
                                                <th width="60">
                                                    规格型号
                                                </th>
                                                <th width="60">
                                                    计量单位
                                                </th>
                                                <th width="60">
                                                    商品数量
                                                </th>
                                                <th width="50">
                                                    单价
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="goodsListTbody">

                                            </tbody>
                                        </table>
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

<!--调拨单面板开始-->
<div class="panel-body">
    <div class="modal fade" id="inputGoodsModal" tabindex="-1" role="dialog" aria-labelledby="inputGoodsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="inputGoodsModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 调库单填写</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <#--<div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label">出库仓库：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <select class="form-select" id="ckStorageroomSelect">

                                    </select>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label">入库仓库：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <select class="form-select" id="rkStorageroomSelect">

                                    </select>
                                </div>
                            </div>-->

                            <div class="col-lg-12 col-md-12 col-xs-12" style="margin-top: 15px">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label" style="font-size: 16px">调库商品：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <button type="button" class="btn btn-default pull-right" onclick="addInputForm();" style="margin: 0px 0px 10px 0px" autocomplete="off">添加</button>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12" id="inputPanel">

                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off" onclick="confirmAdd();">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--调拨单面板结束-->

<!--入库弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="inStoreModal" tabindex="-1" role="dialog" aria-labelledby="inStoreModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="inStoreModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 入库</h4>
                </div>
                <div class="modal-body">
                    确定要调拨入库？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmInStore" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--入库面板结束-->

<!--出库弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="outStoreModal" tabindex="-1" role="dialog" aria-labelledby="outStoreModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="outStoreModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 出库</h4>
                </div>
                <div class="modal-body">
                    确定要调拨出库？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmOutStore" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--出库面板结束-->

<!--预览打印弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal2" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 80%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="detailModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 预览打印</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-12 col-md-12 col-xs-12 input-box">
                                      <button type="button" class="btn btn-default" id="viewPrint">打印</button>
                                 <!--startprint-->
                                        <table class="table table-bordered" style="height:350px;border:2px solid black" width="100%">
                                                <tbody>
                                                 <tr style="height:2px;border:none;border-top:2px solid black;">

                                                    <tr><td colspan="7" class="text-center">惠惠网店调库单</td></tr>
                                                        <td class="tdOne">制单日期</td>
                                                        <td class="creatTime" colspan="2"></td>
                                                        <td class="tdOne">调拨单号</td>
                                                        <td class="rkCode" colspan="3"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdOne">调出仓库</td>
                                                        <td class="ckName" colspan="2"></td>
                                                        <td class="tdOne">调入仓库</td>
                                                        <td class="rkName" colspan="3"></td>
                                                    </tr>
                                                    <tr style="height:1.5px;border:none;border-top:1.5px solid black;">
                                                        <td class="tdOne" style="vertical-align: middle;">商品编号</td>
                                                        <td class="tdOne">商品名称</td>
                                                        <td class="tdOne">规格</td>
                                                        <td class="tdOne">单位</td>
                                                        <td class="tdOne">数量</td>
                                                        <td class="tdOne">单价</td>
                                                        <td class="tdOne">小计</td>
                                                    </tr>
                                                    <tbody id="diaokuTbody">
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td class="tdOne" colspan="5"></td>
                                                        <td class="tdOne">合计</td>
                                                        <td class="tdOne"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdOne">备注</td>
                                                        <td class="tdOne" colspan="6"></td>
                                                    </tr>
                                                     <tr>
                                                        <td class="tdOne">审批人</td>
                                                        <td class="createUser"></td>
                                                        <td class="tdOne">出库人</td>
                                                        <td class="ckPeople" colspan="1"></td>
                                                        <td class="tdOne" >入库人</td>
                                                        <td class="rkPeople" colspan="2"></td>
                                                    </tr>
                                                    </tfoot>
                                                </tbody>
                                            </table>
                                 <!--endprint-->

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
<!--预览打印弹出面板结束-->

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

        //执行一个laydate实例
        laydate.render({
            elem: "#startingDate",//指定元素
            theme: '#3c8dbc'
        });

        laydate.render({
            elem: "#endingDate",//指定元素
            theme: '#3c8dbc'
        });

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页*/

        //获取调库信息
        getExchangeStorageInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getExchangeStorageInfos(pageCount,1);
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
                getExchangeStorageInfos(pageCount,currentPageNum);
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
                getExchangeStorageInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //调库单填写modal展示
        $("#inputGoodsModal").on("show.bs.modal", function () {
            //getSelfStorageroom();
            //getCkStorageroomList();
            //getRkStorageroomList();
        });

        //确认入库modal消失
        $("#inStoreModal").on("hide.bs.modal", function () {
            $("#confirmInStore").removeAttr("onclick");
        });

        //确认出库modal消失
        $("#outStoreModal").on("hide.bs.modal", function () {
            $("#confirmOutStore").removeAttr("onclick");
        });
    });

    //获取信息方法
    function getExchangeStorageInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var codeParam = $("#codeKey").val();
        var exchangeSelectedParam = $("#exchangeSelected").find("option:selected").val();
        var startingDate = $("#startingDate").val();
        var endingDate = $("#endingDate").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/InOutInventory', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                code : codeParam,
                status : exchangeSelectedParam,
                startTime : startingDate,
                endTime : endingDate
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
                        var id = retData[i].id?retData[i].id:'';
                        var dkcode = retData[i].code?retData[i].code:'';
                        var ckStorageroomName = retData[i].ck_name?retData[i].ck_name:'';
                        var rkStorageroomName = retData[i].rk_name?retData[i].rk_name:'';
                        var status = retData[i].status?retData[i].status:'';
                        var createTime = retData[i].create_time?retData[i].create_time:'';
                        var type = retData[i].type?retData[i].type:'';

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+dkcode+"</td>";
                        tbodyHtml += "<td>"+ckStorageroomName+"</td>";
                        tbodyHtml += "<td>"+rkStorageroomName+"</td>";

                        switch(status)
                        {
                            case 1:
                                tbodyHtml += "<td>审核中</td>";
                                break;
                            case 2:
                                tbodyHtml += "<td>审核通过</td>";
                                break;
                            case 3:
                                tbodyHtml += "<td>已出库</td>";
                                break;
                            case 4:
                                tbodyHtml += "<td>已入库</td>";
                                break;
                        }

                        tbodyHtml += "<td>"+createTime+"</td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='openDetailModal(\""+dkcode+"\");'>查看详情</a></td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal2' onclick='Printing(\""+dkcode+"\");'>打印</a></td>";
                        tbodyHtml += "<td>";
                        if(type==0){
                            tbodyHtml += "<button type='button' class='btn btn-default' style='margin:0px' onclick='openOutConfirmModal(\""+dkcode+"\",\""+status+"\");'>出库</button>";
                        } else{
                            tbodyHtml += "<button type='button' class='btn btn-default' style='margin:0px' onclick='openInConfirmModal(\""+dkcode+"\",\""+status+"\");'>入库</button>";
                        }
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
                toastr.error("查询失败！");
                return false;
            }
        });
    }

    //确认出库modal打开
    function openOutConfirmModal(dkcode,status){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var dkcodeParam = dkcode;
        var statusParam = status;

        if(statusParam == 3) {
            toastr.error("您已完成出库操作，请勿重复操作！");
            return false;
        }else{
            $("#outStoreModal").modal("show");
            $("#confirmOutStore").attr("onclick","outConfirm(\""+dkcodeParam+"\")");
        }
    }

    //确认出库方法
    function outConfirm(dkCkcode){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var dkCkcodeParam = dkCkcode;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/Inventory/confirmTransfer', //目标地址
            data : {
                code : dkCkcodeParam,
                type : 0
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
                    var retData = retInfo.data;
                    if(retData == null || retData == ""){
                        $("#confirmOutStore").button("reset");
                        toastr.error("出库操作失败！");
                    }else{
                        $("#confirmOutStore").button("reset");
                        toastr.error("库存不足，出库操作失败！");
                    }
                }
                else {
                    $("#confirmOutStore").button("reset");
                    $("#outStoreModal").modal("hide");
                    toastr.success("出库操作成功！");
                    setTimeout(function () {
                        reset();
                    }, 2000);
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

    //确认入库modal打开
    function openInConfirmModal(dkcode,status){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var dkcodeParam = dkcode;
        var statusParam = status;

        if(statusParam != 3) {
            toastr.error("出库未完成，无法进行入库操作！");
            return false;
        }else{
            $("#inStoreModal").modal("show");
            $("#confirmInStore").attr("onclick","inConfirm(\""+dkcodeParam+"\")");
        }
    }

    //确认入库方法
    function inConfirm(dkRkCode){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var dkRkCodeParam = dkRkCode;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/Inventory/confirmTransfer', //目标地址
            data : {
                    code : dkRkCodeParam,
                    type : 1
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
                    var retData = retInfo.data;
                    if(retData == null || retData == ""){
                        $("#confirmInStore").button("reset");
                        toastr.error("入库操作失败！");
                    }else{
                        $("#confirmInStore").button("reset");
                        toastr.error("库存不足，入库操作失败！");
                    }
                }
                else {
                    $("#confirmInStore").button("reset");
                    $("#inStoreModal").modal("hide");
                    toastr.success("入库操作成功！");
                    setTimeout(function () {
                        reset();
                    }, 2000);
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

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#codeKey").val("");
        $("#exchangeSelected option:first").prop("selected", "selected");
        $("#endingDate").val("");
        $("#startingDate").val("");
        $("#selfStorageroomId").text("");
        $("#loading").css("display","block");
        getExchangeStorageInfos(pageCount,currentPageNum);
    }

    //添加商品
    var inputFormId = 0;
    function addInputForm(){

        var inputFormLength = $("#inputPanel").find(".input-form").length;

        if(inputFormLength > 0){
            var lastInputFormId = $("#inputPanel").find(".input-form").last().attr("id");
            inputFormId = parseInt(lastInputFormId.substring(9)) + 1;
            var inputFormHtml = "<div class='col-lg-12 col-md-12 col-xs-12 input-form' id='inputForm"+inputFormId+"'>";
            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";

            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";
            inputFormHtml += "<div class='col-lg-3 col-md-3 col-xs-3 title'>";
            inputFormHtml += "<label class='control-label'>商品编号：</label>";
            inputFormHtml += "</div>";
            inputFormHtml += "<div class='col-lg-8 col-md-8 col-xs-8 input-box'>";
            inputFormHtml += "<input type='text' class='form-control required' onblur='getGoodsInfo(this.value,"+inputFormId+");' placeholder='必填'>";
            inputFormHtml += "</div>";
            inputFormHtml += "</div>";

            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";
            inputFormHtml += "<div class='col-lg-3 col-md-3 col-xs-3 title'>";
            inputFormHtml += "<label class='control-label'>商品名称：</label>";
            inputFormHtml += "</div>";
            inputFormHtml += "<div class='col-lg-8 col-md-8 col-xs-8 input-box'>";
            inputFormHtml += "<span style='display:none' id='goodsNameSpan"+inputFormId+"'></span>";
            inputFormHtml += "<input type='text' class='form-control required' id='goodsName"+inputFormId+"' disabled='disabled'>";
            inputFormHtml += "</div>";
            inputFormHtml += "</div>";

            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";
            inputFormHtml += "<div class='col-lg-3 col-md-3 col-xs-3 title'>";
            inputFormHtml += "<label class='control-label'>商品数量：</label>";
            inputFormHtml += "</div>";
            inputFormHtml += "<div class='col-lg-8 col-md-8 col-xs-8 input-box'>";
            inputFormHtml += "<input type='text' class='form-control required goodsCount' placeholder='必填'>";
            inputFormHtml += "</div>";
            inputFormHtml += "</div>";

            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";
            inputFormHtml += "<button type='button' class='btn btn-default pull-right delBtn' autocomplete='off' onclick='delInputForm("+inputFormId+");'>删除</button>";
            inputFormHtml += "</div>";

            inputFormHtml += "</div>";
            inputFormHtml += "</div>";

        }else{
            var inputFormHtml = "<div class='col-lg-12 col-md-12 col-xs-12 input-form' id='inputForm"+inputFormId+"'>";
            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";

            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";
            inputFormHtml += "<div class='col-lg-3 col-md-3 col-xs-3 title'>";
            inputFormHtml += "<label class='control-label'>商品编号：</label>";
            inputFormHtml += "</div>";
            inputFormHtml += "<div class='col-lg-8 col-md-8 col-xs-8 input-box'>";
            inputFormHtml += "<input type='text' class='form-control required' onblur='getGoodsInfo(this.value,"+inputFormId+");' placeholder='必填'>";
            inputFormHtml += "</div>";
            inputFormHtml += "</div>";

            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";
            inputFormHtml += "<div class='col-lg-3 col-md-3 col-xs-3 title'>";
            inputFormHtml += "<label class='control-label'>商品名称：</label>";
            inputFormHtml += "</div>";
            inputFormHtml += "<div class='col-lg-8 col-md-8 col-xs-8 input-box'>";
            inputFormHtml += "<span style='display:none' id='goodsNameSpan"+inputFormId+"'></span>";
            inputFormHtml += "<input type='text' class='form-control required' id='goodsName"+inputFormId+"' disabled='disabled'>";
            inputFormHtml += "</div>";
            inputFormHtml += "</div>";

            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";
            inputFormHtml += "<div class='col-lg-3 col-md-3 col-xs-3 title'>";
            inputFormHtml += "<label class='control-label'>商品数量：</label>";
            inputFormHtml += "</div>";
            inputFormHtml += "<div class='col-lg-8 col-md-8 col-xs-8 input-box'>";
            inputFormHtml += "<input type='text' class='form-control required goodsCount' placeholder='必填'>";
            inputFormHtml += "</div>";
            inputFormHtml += "</div>";

            inputFormHtml += "<div class='col-lg-12 col-md-12 col-xs-12'>";
            inputFormHtml += "<button type='button' class='btn btn-default pull-right delBtn' autocomplete='off' onclick='delInputForm("+inputFormId+");'>删除</button>";
            inputFormHtml += "</div>";

            inputFormHtml += "</div>";
            inputFormHtml += "</div>";

        }
        $("#inputPanel").append(inputFormHtml);
    }

    //删除按钮删除指定商品
    function delInputForm(Id){
        var idParam = Id;
        var inputFormId = "inputForm" + idParam;
        $("#"+inputFormId).remove();
    }

    //输入商品编码获取商品信息
    function getGoodsInfo(goodsCode,inputId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var goodsCodeParam = goodsCode;
        if(goodsCodeParam == "" || goodsCodeParam == 0 || goodsCodeParam ==""){
            toastr.error("商品编码输入错误！");
            return false;
        }

        var inputIdParam = inputId;
        var spanId = "goodsNameSpan" + inputIdParam;
        var goodsNameId = "goodsName" + inputIdParam;

        $("#loading").css("display","block");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getProductByCode', //目标地址
            data : {
                code : goodsCodeParam
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
                    $("#loading").css("display","none");
                    toastr.error("未找到该商品！");
                    return false;
                }else{

                    $("#loading").css("display","none");

                    var retData = retInfo.data;
                    var productId = retData.id;
                    var productName = retData.name;

                    $("#"+spanId).text(productId);
                    $("#"+goodsNameId).val(productName);
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

    //添加提交方法
    function confirmAdd(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var productArray = [];
        var productMap = {};

        var inputForm = $("#inputPanel").find(".input-form");
        var inputFormLength = $("#inputPanel").find(".input-form").length;

        for(var addg = 0; addg < inputFormLength; addg++){

            var spanId = $($(inputForm[addg]).find("span")).attr("id");
            var spanVal = parseInt($("#"+spanId).text());
            console.log(spanVal);

            var goodsCountInputVal = parseInt($($(inputForm[addg]).find(".goodsCount")).val());
            console.log(goodsCountInputVal);

            productMap = {
                id : spanVal,
                count : goodsCountInputVal
            };
            productArray.push(productMap);
        }

        var jsonData = JSON.stringify(productArray);
        console.log(jsonData);

        var rkStorageroomSelectParam = $("#rkStorageroomSelect").find("option:selected").val();
        console.log(rkStorageroomSelectParam);

        $("#confirmAdd").button("loading");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/Inventory/TransferAction', //目标地址
            data : {
                storehousein : rkStorageroomSelectParam,
                products: jsonData
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
                    $("#confirmAdd").button('reset');
                    toastr.error("调库失败！");
                    return false;
                }else{
                    $("#confirmAdd").button('reset');
                    $("#inputGoodsModal").modal("hide");
                    toastr.success("调库成功！");
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

    //查看详情
    function openDetailModal(dkcode){
        console.log(dkcode);

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var dkcodeParam = dkcode;

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/TransferRecordDetail', //目标地址
            data : {
                code : dkcodeParam
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

                    //调库单信息
                    var retTransferData = retData.inventoryTransfer;
                    var dkCode = retTransferData.code;
                    var createdTime = retTransferData.createTime;

                    $("#dkCodeDetail").val(dkCode);
                    $("#creatOrderDate").val(createdTime);

                    //调库商品
                    var exchangeStorageProduct = retData.orderDetailProduct;
                    var exchangeStorageProductLength = exchangeStorageProduct.length;
                    console.log(exchangeStorageProduct);

                    $("#goodsListTbody").empty();

                    for(var esp = 0; esp < exchangeStorageProductLength; esp++){

                        var goodsCode = exchangeStorageProduct[esp].code;
                        var goodsName = exchangeStorageProduct[esp].name;
                        var goodsSpecifications = exchangeStorageProduct[esp].specifications;
                        var goodsMeasurementUnit = exchangeStorageProduct[esp].measurementUnit;
                        var goodsNumber = exchangeStorageProduct[esp].number;
                        var goodsPrice = exchangeStorageProduct[esp].price;

                        var goodsListHtml = "<tr>";
                        goodsListHtml += "<td>"+goodsCode+"</td>";
                        goodsListHtml += "<td>"+goodsName+"</td>";
                        goodsListHtml += "<td>"+goodsSpecifications+"</td>";
                        goodsListHtml += "<td>"+goodsMeasurementUnit+"</td>";
                        goodsListHtml += "<td>"+goodsNumber+"</td>";
                        goodsListHtml += "<td>"+goodsPrice+"</td>";
                        goodsListHtml += "</tr>";

                        $("#goodsListTbody").append(goodsListHtml);
                    }
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("操作失败！");
                return false;
            }
        });
    }

    //获取出库库房列表
    /*function getCkStorageroomList(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/getStorehouseList', //目标地址
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
                    toastr.error("查询失败！");
                    return false;
                }else{

                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    for(var s = 0; s < retDataLength; s++){

                        var ckStorageroomId = retData[s].id;
                        var ckStorageroomName = retData[s].storehouseName;

                        var selectedHtml = "<option value='"+ckStorageroomId+"'>"+ckStorageroomName+"</option>";
                        $("#ckStorageroomSelect").append(selectedHtml);
                    }
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
    }*/

    //获取可入库库房列表
    /*function getRkStorageroomList(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/getStorehouseList', //目标地址
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
                    toastr.error("查询失败！");
                    return false;
                }else{

                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    for(var s = 0; s < retDataLength; s++){

                        var rkStorageroomId = retData[s].id;
                        var rkStorageroomName = retData[s].storehouseName;

                        var selectedHtml = "<option value='"+rkStorageroomId+"'>"+rkStorageroomName+"</option>";
                        $("#rkStorageroomSelect").append(selectedHtml);
                    }
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
    }*/


    //浏览
    function Printing(dkcode) {
        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/TransferRecordDetail', //目标地址
            data : {
                 code : dkcode
             },
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
                  console.log(retInfo);
                    var retData = retInfo.data;
                    var retDate2=retData.inventoryTransfer
                    var rkCode = retDate2.code;//单号
                    var createTime = retDate2.createTime;//日期
                    var ckName = retDate2.ckName;//出库仓库名称
                    var rkName = retDate2.rkName;//入库仓库名称
                    var createUser = retData.czName;//审批人
                    var ckPeople = retDate2.ckPeople;//出库人
                    var rkPeople = retData.czName;//入库人
                    //var status = retDate2.status;//合计
                    $(".creatTime").text(createTime);
                    $(".rkCode").text(rkCode);
                    $(".createTime").text(createTime);
                    $(".ckName").text(ckName);
                    $(".rkName").text(rkName);
                    $(".createUser").text(createUser);
                    $(".ckPeople").text(ckPeople);
                    $(".rkPeople").text(rkPeople);
                    //商品清单
                    var retGoodsData = retData.orderDetailProduct;
                    var retGoodsDataLength = retGoodsData.length;
                    $("#diaokuTbody").empty();
                    for(var gl = 0; gl < retGoodsDataLength; gl++){
                        var goodsCode = retGoodsData[gl].code;//商品编码
                        var goodsName = retGoodsData[gl].name;//商品名称
                        var goodsSpecifications = retGoodsData[gl].specifications;//规格型号
                        var goodsMeasurementUnit = retGoodsData[gl].measurementUnit;//计量单位
                        var goodsPrice = retGoodsData[gl].price;//单价
                        var goodsNumber = retGoodsData[gl].number;//数量
                        var goodsListHtml = "<tr>";
                        goodsListHtml += "<td>"+goodsCode+"</td>";
                        goodsListHtml += "<td>"+goodsName+"</td>";
                        goodsListHtml += "<td>"+goodsSpecifications+"</td>";
                        goodsListHtml += "<td>"+goodsMeasurementUnit+"</td>";
                        goodsListHtml += "<td>"+goodsNumber+"</td>";
                        goodsListHtml += "<td>"+goodsPrice+"</td>";
                        goodsListHtml += "<td>"+goodsPrice*goodsNumber+"</td>";
                        goodsListHtml += "</tr>";
                        $("#diaokuTbody").append(goodsListHtml);
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


          //打印
          function viewPrint(orderNumber,orderUser,orderTotal){
             bdhtml=window.document.body.innerHTML;
             sprnstr="<!--startprint-->";
             eprnstr="<!--endprint-->";
             prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+17);
             prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
             window.document.body.innerHTML=prnhtml;
             window.print();
             window.location.reload();
          }


</script>
