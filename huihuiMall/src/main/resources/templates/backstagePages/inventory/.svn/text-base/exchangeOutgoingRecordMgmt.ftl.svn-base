<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>换货出库记录管理</title>
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

            <span>出库单号：</span>
            <input type="text" id="outgoingCodeKey" placeholder="请输入商品编号">

            <span style="margin-left: 10px">出库类型：</span>
            <select style="width: 10%" id="ckTypeSelected">
                <option value="">请选择</option>
                <option value="1">订单</option>
                <option value="2">换货</option>
            </select>

            <span style="margin-left: 10px">出库日期：</span>
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
                <button type="button" class="btn btn-default" id="excelExport">
                    <i class="fa fa-download fa-fw"></i> 导出Excel</button>
                <button type="button" class="btn btn-default" id="Printing"  data-toggle='modal' data-target='#detailModal2'>
                    <i class="fa fa-plus fa-fw"></i> 预览打印</button>
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
                        出库单号
                    </th>
                    <th>
                        出库类型
                    </th>
                    <th>
                        出库日期
                    </th>
                    <th>
                        仓库名称
                    </th>
                    <th>
                        订单号
                    </th>
                    <th>
                        下单日期
                    </th>
                    <th>
                        门店名称
                    </th>
                    <th>
                        订单金额
                    </th>
                    <th>
                        操作人
                    </th>
                    <th>
                        查看详情
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
        <div class="modal-dialog" style="width:60%;">
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
                                        <label class="control-label">出库单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="ckCodeNumber">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">出库类型：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="ckType">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">出库日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="ckDate">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storageroomName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">订单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderNumber">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">下单人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderUser">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">下单日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="orderDate">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeAddress">
                                    </div>
                                </div>
                            </div>

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
                                                <th width="70">
                                                    规格型号
                                                </th>
                                                <th width="70">
                                                    计量单位
                                                </th>
                                                <th width="70">
                                                    商品数量
                                                </th>
                                                <th width="40">
                                                    单价
                                                </th>
                                                <th width="40">
                                                    小计
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="goodsListTbody">

                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td colspan="7" id="total">
                                                <#--合计：1200.00-->
                                                </td>
                                            </tr>
                                            </tfoot>
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
                                            <thead style="background-color: #ffffff;">
                                            <tr>
                                                <td colspan="7" class="text-center">惠惠网店出库单</td></tr>
                                            <td class="tdOne">出库日期</td>
                                            <td class="chukuTime"></td>
                                            <td class="tdOne">出库单号</td>
                                            <td class="chukuNumber"></td>
                                            <td class="tdOne">出库仓库</td>
                                            <td class="chukuRoom" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdOne">订购日期</td>
                                                <td class="dinggouTime"></td>
                                                <td class="tdOne">订单编号</td>
                                                <td class="dinggouNumber"></td>
                                                <td class="tdOne">店铺名称</td>
                                                <td class="storeName" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdOne">机器编号</td>
                                                <td class="deviceCode" colspan="1"></td>
                                                <td class="tdOne">店铺地址</td>
                                                <td class="storeAddress" colspan="4"></td>
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
                                            </thead>
                                            <tbody id="chukuTbody">

                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td class="tdOne">店主手机号</td>
                                                <td class="shopkeeperPhone"></td>
                                                <td class="tdOne">顾客手机号</td>
                                                <td class="CustomerPhone" colspan="2"></td>
                                                <td class="tdOne">合计</td>
                                                <td class="Totle"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdOne">备注</td>
                                                <td class="tdOne" colspan="6"></td>
                                            </tr>
                                            <tr>
                                                <td class="tdOne">出库人</td>
                                                <td class="OutOfStore" colspan="1"></td>
                                                <td class="tdOne" >收货人</td>
                                                <td class="Consignee" colspan="5"></td>
                                            </tr>
                                            </tfoot>
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
    var orderNumberId = "";
    var shopId = "";
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
        var currentPageNum=1;  //当前页数,默认首页为第一页

        //获取出库记录信息
        getOutgoingRecordsInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getOutgoingRecordsInfos(pageCount,1);
        });
        $("#excelExport").click(function(){
            excelExport(pageCount,1);
         });
        //重置点击
        $("#resetBtn").click(function(){
            reset();
        });

      //预览打印
      $("#viewPrint").click(function(){
            var startingDate = $("#startingDate").val();
            var endingDate = $("#endingDate").val();
            viewPrint(pageCount,1,startingDate,endingDate);
        });
        //上一页
        $("#prevPage").click(function(){
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum > 1)
            {
                $("#Tbody").empty();
                $("#loading").css("display","block");
                currentPageNum -= 1;
                getOutgoingRecordsInfos(pageCount,currentPageNum);
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
                getOutgoingRecordsInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });


        $("#Printing").click(function () {
            if (orderNumberId != "" && shopId != ""){
                $("#detailModal2").show();
                Printing();
            }else {
                toastr.error("请选择需要打印的订单！")
            }
        })
    });

    //获取信息方法
    function getOutgoingRecordsInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var outgoingCodeKeyParam = $("#outgoingCodeKey").val();
        var ckTypeSelectedParam = $("#ckTypeSelected").find("option:selected").val();
        var startingDateParam = $("#startingDate").val();
        var endingDateParam = $("#endingDate").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/exchengOutInventory', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                code : outgoingCodeKeyParam,
                startTime : startingDateParam,
                endTime : endingDateParam,
                type : 1,
                exChange : 1,
                retType : 1,
                status : ckTypeSelectedParam
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
                        var ckCode = retData[i].code;
                        var ckDate = retData[i].create_time;
                        var ckStorageroomName = retData[i].storehouse_name;
                        var orderNumber = retData[i].order_number;
                        var orderDate = retData[i].start_time;
                        var storeName = retData[i].storename;
                        var operator = retData[i].create_user;
                        var orderTotal = retData[i].total;
                        var orderId = retData[i].orderNumber;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox' id='"+id+"' class='mycheckbox' onclick='orderId("+orderNumber+","+orderId+");'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+ckCode+"</td>";
                            tbodyHtml += "<td>换货</td>";

                        if(ckDate == null || ckDate == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+ckDate+"</td>";
                        }

                        tbodyHtml += "<td>"+ckStorageroomName+"</td>";
                        tbodyHtml += "<td>"+orderNumber+"</td>";
                        tbodyHtml += "<td>"+orderDate+"</td>";
                        tbodyHtml += "<td>"+storeName+"</td>";
                        tbodyHtml += "<td>"+orderTotal+"</td>";
                        tbodyHtml += "<td>"+operator+"</td>";
                        tbodyHtml += "<td>";
                        tbodyHtml += "<a href='#' data-toggle='modal' data-target='#detailModal' onclick='viewDetail("+orderNumber+","+orderId+");'>查看详情</a>";
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

    function orderId(orderNumber,orderId) {
        orderNumberId = orderNumber;
        shopId = orderId;
        return orderNumberId;
        return shopId;
    }
    //打印
    function Printing() {
        var orderNumParam = orderNumberId;
        var orderId = shopId;
        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };
        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/exchengOutRecordDetail', //目标地址
            data : {
                orderNumber : orderNumParam,
                returnNumber:orderId
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
                if (retCode != 0){
                    toastr.error("信息查询失败！");
                }else {
                    $("#chukuTbody").empty();
                    var retData = retInfo.data;
                    var retCreateTime = retData.createTime;//出库日期
                    var retCode = retData.code;//出库单号
                    var retStorehouseName = retData.storehouseName;//出库仓库
                    var retStartTime = retData.startTime;//订购日期
                    var retOrderNumber = retData.orderNumber;//订单编号
                    var retStoreName = retData.storeName;//店铺名称
                    var retSoreAddress = retData.storeAddress;//店铺地址
                    var retName = retData.name;//顾客手机号/收货人
                    var retCreateUser = retData.createUser;//出库人
                    var shopkeeperPhone = retData.shopkeeperPhone;//店主手机号
                    var deviceCode=retData.deviceCode;
                    //缺  审批人  店主手机号
                    $(".chukuTime").text(retCreateTime);
                    $(".chukuNumber").text(retCode);
                    $(".chukuRoom").text(retStorehouseName);
                    $(".dinggouTime").text(retStartTime);
                    $(".dinggouNumber").text(retOrderNumber);
                    $(".storeName").text(retStoreName);
                    $(".storeAddress").text(retSoreAddress);
                    $(".CustomerPhone").text(retName);
                    $(".Consignee").text(retName);
                    $(".deviceCode").text(deviceCode);
                    $(".shopkeeperPhone").text(shopkeeperPhone);
                    $(".OutOfStore").text(retCreateUser);
                    var retOrderDetailProduct = retData.orderDetailProduct;
                    var retOrderDetailProductLength = retOrderDetailProduct.length;
                    for(var i = 0; i < retOrderDetailProductLength ; i++){
                        var retOrderCode = retOrderDetailProduct[i].code;//商品编号
                        var retOrderName = retOrderDetailProduct[i].name;//商品名称
                        var retOrderSpecifications = retOrderDetailProduct[i].specifications;//商品规格
                        var retOrderMeasurementUnit = retOrderDetailProduct[i].measurementUnit;//商品单位
                        var retOrderNum = retOrderDetailProduct[i].number;//商品数量
                        var retOrderPrice = retOrderDetailProduct[i].price;//商品单价
                        var retOrderTotal = retOrderDetailProduct[i].total;//商品小计
                        var goodsListHtml = "<tr>";
                        goodsListHtml += "<td>"+retOrderCode+"</td>";
                        goodsListHtml += "<td>"+retOrderName+"</td>";
                        goodsListHtml += "<td>"+retOrderSpecifications+"</td>";
                        goodsListHtml += "<td>"+retOrderMeasurementUnit+"</td>";
                        goodsListHtml += "<td>"+retOrderNum+"</td>";
                        goodsListHtml += "<td>"+retOrderPrice+"</td>";
                        goodsListHtml += "<td>"+retOrderTotal+"</td>";
                        goodsListHtml += "</tr>";

                        $(".Totle").text(retOrderTotal);
                        $("#chukuTbody").append(goodsListHtml);
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
    function viewDetail(orderNum,orderId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var orderNumParam = orderNum;

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/exchengOutRecordDetail', //目标地址
            data : {
                orderNumber : orderNumParam,
                  returnNumber:orderId
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
                    $("#loading").css("display","none");
                    toastr.error("查询失败！");
                    return false;
                }else{

                    $("#loading").css("display","none");
                    var retData = retInfo.data;

                    console.log(retData);

                    var ckCode = retData.code;
                    var ckType = retData.status;
                    var ckDate = retData.createTime;
                    var storehouseName = retData.storehouseName;
                    var orderNumber = retData.orderNumber;
                    var orderUser = retData.name;
                    var orderDate = retData.startTime;
                    var storeName = retData.storeName;
                    var storeAddress = retData.storeAddress;
                    var totalPrice = retData.orderTotal;

                    $("#ckCodeNumber").val(ckCode);

                        $("#ckType").val("换货");

                    if(ckDate == null || ckDate == ""){
                        $("#ckDate").val("");
                    }else{
                        $("#ckDate").val(ckDate);
                    }

                    $("#storageroomName").val(storehouseName);
                    $("#orderNumber").val(orderNumber);
                    $("#orderUser").val(orderUser);
                    $("#orderDate").val(orderDate);
                    $("#storeName").val(storeName);
                    $("#storeAddress").val(storeAddress);
                    $("#total").html("合计：" + totalPrice);

                    var goodsListData = retData.orderDetailProduct;
                    var goodsListDataLength = goodsListData.length;

                    $("#goodsListTbody").empty();

                    for(var gl = 0; gl < goodsListDataLength; gl++){

                        var goodsCode = goodsListData[gl].code;
                        var goodsName = goodsListData[gl].name;
                        var goodsSpecifications = goodsListData[gl].specifications;
                        var goodsMeasurementUnit = goodsListData[gl].measurementUnit;
                        var goodsNum = goodsListData[gl].number;
                        var goodsPrice = goodsListData[gl].price;
                        var goodsSum = goodsListData[gl].total;

                        var goodsListTbodyHtml = "<tr>";
                        goodsListTbodyHtml += "<td>"+goodsCode+"</td>";
                        goodsListTbodyHtml += "<td>"+goodsName+"</td>";
                        goodsListTbodyHtml += "<td>"+goodsSpecifications+"</td>";
                        goodsListTbodyHtml += "<td>"+goodsMeasurementUnit+"</td>";
                        goodsListTbodyHtml += "<td>"+goodsNum+"</td>";
                        goodsListTbodyHtml += "<td>"+goodsPrice+"</td>";
                        goodsListTbodyHtml += "<td>"+goodsSum+"</td>";
                        goodsListTbodyHtml += "</tr>";

                        $("#goodsListTbody").append(goodsListTbodyHtml);

                        $("#total").html("合计：" + goodsSum);
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

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#outgoingCodeKey").val("");
        $("#startingDate").val("");
        $("#endingDate").val("");
        $("#ckTypeSelected option:first").prop("selected", "selected");
        $("#loading").css("display","block");
        getOutgoingRecordsInfos(pageCount,currentPageNum);
    }

  function excelExport(pageCount,currentPageNum,startingDate,endingDate){
           var outgoingCodeKeyParam = $("#outgoingCodeKey").val();
           var ckTypeSelectedParam = $("#ckTypeSelected").find("option:selected").val();
           var startingDateParam = $("#startingDate").val();
           var endingDateParam = $("#endingDate").val();
           $("#currentPage").html(currentPageNum);
           var param={
               code : outgoingCodeKeyParam,
               startTime : startingDateParam,
               endTime : endingDateParam,
               type : 1,
               exChange : 1,
               retType : 1,
               status : ckTypeSelectedParam
               };
         window.location.href="${bath}/InventoryExecel/RetunrnOutInventory?param="+param;

        }

//浏览打印
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
