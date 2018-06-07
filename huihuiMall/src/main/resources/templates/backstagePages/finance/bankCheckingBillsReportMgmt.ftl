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

    <title>银行对账报表</title>
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

            <span>日期：</span>
            <input type="text" id="startingDate" placeholder="请选择开始时间">
            <span>-</span>
            <input type="text" id="endingDate" placeholder="请选择结束时间">
            <button type="button" class="btn btn-default" id="searchBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">

            <div class="col-lg-12 col-md-12 col-xs-12 btn-group-panel">
                <button type="button" class="btn btn-default" id="excelExport" >
                    <i class="fa fa-plus fa-fw"></i> 导出报表</button>
                <button type="button" class="btn btn-default"  data-toggle='modal' data-target='#detailModal' id="print">
                    <i class="fa fa-plus fa-fw"></i> 预览打印</button>
            </div>
            <table class="table table-bordered table-hover table-responsive text-center" style="margin: 20px auto; ">
                <thead>
                <tr>
                    <th width="80">
                        序号
                    </th>
                    <th>
                        日期
                    </th>
                    <th>
                        微信
                    </th>
                    <th>
                        支付宝
                    </th>
                    <th>
                        银行卡
                    </th>
                    <th>
                        合计
                    </th>
                </tr>
                </thead>
                <tbody id="Tbody">
                <tr>
                </tr>
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

<!--预览打印弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
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
                                         <table class="table table-bordered table-hover table-responsive text-center" style="margin: 20px auto; ">
                                            <thead>
                                            <tr>
                                                <th width="80">
                                                    序号
                                                </th>
                                                <th>
                                                    日期
                                                </th>
                                                <th>
                                                    微信
                                                </th>
                                                <th>
                                                    支付宝
                                                </th>
                                                <th>
                                                    银行卡
                                                </th>
                                                <th>
                                                    合计
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="Tbody1">
                                            <tr>
                                            </tr>
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
         $("#loading").css("display","none");
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
        //获取当日任务计划号
        getUserInfos(pageCount,currentPageNum);
        //搜索点击
        $("#searchBtn").click(function(){
            var startingDate = $("#startingDate").val();
            var endingDate = $("#endingDate").val();
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getUserInfos(pageCount,1,startingDate,endingDate);
        });
          $("#excelExport").click(function(){
            var startingDate = $("#startingDate").val();
            var endingDate = $("#endingDate").val();
            excelExport(pageCount,1,startingDate,endingDate);
        });
        //预览
           $("#print").click(function(){
            var startingDate = $("#startingDate").val();
            var endingDate = $("#endingDate").val();
           getUserInfos(pageCount,currentPageNum,startingDate,endingDate);
            });

        //打印
         $("#viewPrint").click(function(){
            var startingDate = $("#startingDate").val();
            var endingDate = $("#endingDate").val();
            viewPrint(pageCount,1,startingDate,endingDate);
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
    });
    //获取信息方法
    function getUserInfos(pageCount,currentPageNum){
        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };
        var startingDate = $("#startingDate").val();
        var endingDate = $("#endingDate").val();
        $("#currentPage").html(currentPageNum);
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/financialReport/BankReconciliation', //目标地址
            data : {
              PageNum : currentPageNum,
              PageSize : pageCount,
              startTime : startingDate,
              endTime: endingDate
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
                      var goodsListDataLength = retData.length;
                      $("#Tbody").empty();
                      $("#Tbody1").empty();
                      for(var g = 0; g < goodsListDataLength; g ++){
                          var index=g+1;
                          var Alipay = retData[g].Alipay;
                          var WeChat = retData[g].WeChat;
                          var bankcard = retData[g].bankcard;
                          var payTime = retData[g].payTime;
                          var sum = retData[g].sum;
                          var goodsListHtml = "<tr>";
                          goodsListHtml += "<td>"+index+"</td>";
                          goodsListHtml += "<td>"+payTime+"</td>";
                          goodsListHtml += "<td>"+WeChat+"</td>";
                          goodsListHtml += "<td>"+Alipay+"</td>";
                          goodsListHtml += "<td>"+bankcard+"</td>";
                          goodsListHtml += "<td>"+sum+"</td>";
                          goodsListHtml += "</tr>";
                          $("#Tbody").append(goodsListHtml);
                          $("#Tbody1").append(goodsListHtml);
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

       //导出
       function excelExport(pageCount,currentPageNum,startingDate,endingDate){
            var startingDate = $("#startingDate").val();
            var endingDate = $("#endingDate").val();
           var param={
                      startTime : startingDate,
                      endTime: endingDate };
        window.location.href="${bath}/FinanncialReportExecel/BankReconciliationReport?param="+param;
        }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#startingDate").val("");
        $("#endingDate").val("");
        $("#loading").css("display","block");
        getUserInfos(pageCount,currentPageNum);
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
           window.location.reload();//刷新当前页面.
    }

</script>
