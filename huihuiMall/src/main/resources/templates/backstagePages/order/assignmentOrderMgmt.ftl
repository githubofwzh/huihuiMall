<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>派单管理</title>
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

        <div class="col-lg-12 col-md-12 col-xs-12 business-search-panel">

            <span>订单号：</span>
            <input type="text" id="" placeholder="请输入订单号">

            <span style="margin-left: 10px">门店名称：</span>
            <input type="text" id="" placeholder="请输入门店名称">

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
                        订单号
                    </th>
                    <th>
                        下单人
                    </th>
                    <th>
                        下单日期
                    </th>
                    <th>
                        门店名称
                    </th>
                    <th>
                        查看详情
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody id="Tbody">
                <tr>
                    <td>
                        1
                    </td>
                    <td>
                        xyz111111111
                    </td>
                    <td>
                        13800138000
                    </td>
                    <td>
                        2018-03-02
                    </td>
                    <td>
                        大红门自选商店
                    </td>
                    <td>
                        <a href="#" data-toggle="modal" data-target="#detailModal">查看详情</a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#assignmentOrderModal" style="margin:0px 10px" id="">派单</button>
                    </td>
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
                                        <label class="control-label">订单号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">订单人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">下单日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="">
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
                                                <th width="100">
                                                    商品编号
                                                </th>
                                                <th width="120">
                                                    商品名称
                                                </th>
                                                <th width="100">
                                                    商品数量
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="">
                                            <tr>
                                                <td>
                                                    xyz0000001
                                                </td>
                                                <td>
                                                    康师傅茉莉清茶
                                                </td>
                                                <td>
                                                    200
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    xyz0000002
                                                </td>
                                                <td>
                                                    统一冰红茶
                                                </td>
                                                <td>
                                                    200
                                                </td>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--查看详情弹出面板结束-->

<!--派单弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="assignmentOrderModal" tabindex="-1" role="dialog" aria-labelledby="assignmentOrderModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="assignmentOrderModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 派单</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="">
                                            <option value="1">A仓库</option>
                                            <option value="2">B仓库</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmAssignment" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off" onclick="">确认</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--派单详情弹出面板结束-->

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    $(document).ready(function() {

        $("#loading").css("display","none");

        //分页方法
        /*var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页*/

        //获取当日任务计划号
        /*getUserInfos(pageCount,currentPageNum);*/

        //搜索点击
        /*$("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getUserInfos(pageCount,1);
        });*/

        //重置点击
        /*$("#resetBtn").click(function(){
            reset();
        });*/

        //上一页
        /*$("#prevPage").click(function(){
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
        });*/

        //下一页
        /*$("#nextPage").click(function(){
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
        });*/

    });

    //获取信息方法
    /*function getUserInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var searchKeyParam = $("#searchKey").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/user/getAllUserInfo', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                Phone : searchKeyParam
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
                        var uid = retData[i].id;
                        var userName = retData[i].name;
                        var sex = retData[i].sex;
                        var phone = retData[i].phone;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+userName+"</td>";
                        if(sex == 1){
                            tbodyHtml += "<td>男</td>";
                        }else{
                            tbodyHtml += "<td>女</td>";
                        }

                        tbodyHtml += "<td>"+phone+"</td>";
                        tbodyHtml += "<td><a href='javascript:void(0);' onclick='openFriendsModal("+uid+");'>查看</a></td>";
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
    }*/

    //重置实现方法
    /*function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#loading").css("display","block");
        getUserInfos(pageCount,currentPageNum);
    }*/

</script>
