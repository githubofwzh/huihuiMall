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
    <title>生活缴费交易记录管理</title>
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

            <span>商户单号：</span>
            <input type="text" id="transactionCodeKey" placeholder="请输入商户单号" style="width: 10%">

            <span style="margin-left: 10px">支付方式：</span>
            <select style="width: 10%" id="payTypeSelected">
                <option value="">请选择</option>
                <option value="1">支付宝</option>
                <option value="2">微信</option>
            </select>

            <span style="margin-left: 10px">类型：</span>
            <select style="width: 10%" id="payStatusSelected">
                <option value="">请选择</option>
                <option value="0">充值中</option>
                <option value="1">充值成功</option>
                <option value="9">已撤销</option>
            </select>

            <span style="margin-left: 10px">日期：</span>
            <input type="text" id="startingDate" placeholder="请选择开始时间" style="width: 12%">
            <span>-</span>
            <input type="text" id="endingDate" placeholder="请选择结束时间" style="width: 12%">

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
                        e生活订单号
                    </th>
                    <th>
                        商户单号
                    </th>
                    <th>
                        支付类型
                    </th>
                    <th>
                        类型
                    </th>
                    <th>
                        金额
                    </th>
                    <th>
                        时间
                    </th>
                    <th>
                        下单人
                    </th>
                </tr>
                </thead>
                <tbody id="Tbody">

                </tbody>
            </table>

            <div class="col-lg-12 col-md-12 col-xs-12 pagination-panel">
                <div class="col-lg-10 col-md-9 col-xs-10">
                    <div class="dataTables_info" role="status" aria-live="polite">
                        显示<label id="itemSize">2</label>项结果，共<label id="totalItem">2</label>项，
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

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function() {

        //执行一个laydate实例
        //执行一个laydate实例
        laydate.render({
            elem: "#startingDate",//指定元素
            theme: '#3c8dbc'
        });

        laydate.render({
            elem: "#endingDate",//指定元素
            theme: '#3c8dbc'
        });

        $("#loading").css("display","block");

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页*/

        //获取当日任务计划号
        getTransactionInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getTransactionInfos(pageCount,1);
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
                getTransactionInfos(pageCount,currentPageNum);
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
                getTransactionInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

    });

    //获取信息方法
    function getTransactionInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var transactionCodeKeyParam = $("#transactionCodeKey").val();
        var payTypeSelectedParam = $("#payTypeSelected").val();
        var payStatusSelectedParam = $("#payStatusSelected").val();
        var startingDateParam = $("#startingDate").val();
        var endingDateParam = $("#endingDate").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/PortalLivingPay/getPayBill', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                OuterTid : transactionCodeKeyParam,
                PayType : payTypeSelectedParam,
                rechargestate : payStatusSelectedParam,
                StartTime : startingDateParam,
                endTime : endingDateParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
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

                var retCode = retInfo.retCode;
                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error("查询失败！");
                    return false;
                }else{
                    $("#loading").css("display","none");
                    console.log(retInfo);
                    var retData = retInfo.data;
                    console.log(retData);
                    var retDataLength = retData.length;

                    $("#Tbody").empty();

                    for(var i = 0; i < retDataLength; i++){
                        var index = i + 1;
                        var billid = retData[i].BillId;
                        var outTradeNum = retData[i].OuterTid;
                        var payType = retData[i].PayType;
                        var payStatus = retData[i].RechargeState;
                        var money = retData[i].SaleAmount;
                        if(money==null){
                            money = '';
                        }
                        var payTime = retData[i].OrderTime!=null?retData[i].OrderTime:'';
                        if(payTime==null){
                            payTime = '';
                        }
                        var phone = retData[i].user_account?retData[i].user_account:'';

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += " <td>"+billid+"</td>";
                        tbodyHtml += " <td>"+outTradeNum+"</td>";
                        if(payType == 1){
                            tbodyHtml += "<td>支付宝</td>";
                        }else{
                            tbodyHtml += "<td>微信</td>";
                        }

                        if(payStatus == 9){
                            tbodyHtml += "<td class='payMoney'>已撤销</td>";
                        }else if(payStatus == 1){
                            tbodyHtml += "<td class='refundMoney'>充值成功</td>";
                        }else{
                            tbodyHtml += "<td class='refundMoney'>充值中</td>";
                        }

                        tbodyHtml += "<td>"+money+"元</td>";
                        tbodyHtml += "<td>"+payTime+"</td>";
                        tbodyHtml += "<td>"+phone+"</td>";
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

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#transactionCodeKey").val("");
        $("#payTypeSelected option:first").prop("selected", "selected");
        $("#payStatusSelected option:first").prop("selected", "selected");
        $("#startingDate").val("");
        $("#endingDate").val("");
        $("#loading").css("display","block");
        getTransactionInfos(pageCount,currentPageNum);
    }

</script>
