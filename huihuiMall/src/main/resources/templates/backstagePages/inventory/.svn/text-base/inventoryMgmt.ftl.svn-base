<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>库存管理</title>
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

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common.js" type="text/javascript" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<label id="accountType" style="display: none">${accountType!""}</label>
<label id="roleName" style="display: none">${roleName!""}</label>

<div class="container-fluid btn-operation-panel">

    <div class="row">

        <div class="col-lg-12 col-md-12 col-xs-12" style="margin-top: 10px; padding:0px 5px; display: none" id="adminChooseStorage">
            <span style="margin-left: 10px">请选择库房：</span>
            <select style="width: 10%" id="storageSelected">
                <option value="">请选择</option>
                <option value="">A库房</option>
                <option value="">B库房</option>
            </select>
        </div>

        <div class="col-lg-12 col-md-12 col-xs-12">

            <span>商品名称：</span>
            <input type="text" id="goodsNameKey" placeholder="请输入商品名称">

            <span style="margin-left: 10px">商品编号：</span>
            <input type="text" id="goodsCodeKey" placeholder="请输入商品编号">

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
                        商品名称
                    </th>
                    <th>
                        商品编号
                    </th>
                    <th>
                        品牌名称
                    </th>
                    <th>
                        规格型号
                    </th>
                    <th>
                        计量单位
                    </th>
                    <th>
                        所属一级分类
                    </th>
                    <th>
                        所属二级分类
                    </th>
                    <th>
                        存放仓库
                    </th>
                    <th>
                        库存数量
                    </th>
                    <#--<th>
                        所属区域(总admin)
                    </th>-->
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

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var accountTypeParam = $("#accountType").text();
    var roleNameParam = $("#roleName").text();
    console.log(roleNameParam);

    $(document).ready(function() {

        $("#loading").css("display","block");

        if(accountTypeParam == 3 || roleNameParam == "库房总管理员"){
            $("#adminChooseStorage").css("display","block");
            getStorageroomList();

            $("#storageSelected").change(function () {
                getInventoryInfos();
            });
        }

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页

        //获取库存信息
        getInventoryInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getInventoryInfos(pageCount,1);
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
                getInventoryInfos(pageCount,currentPageNum);
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
                getInventoryInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

    });

    //获取信息方法
    function getInventoryInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var adminChooseStorageParam = "";

        if(accountTypeParam == 3 || roleNameParam == "库房总管理员"){
            adminChooseStorageParam = $("#adminChooseStorage").find("option:selected").val();
        }

        var goodsNameKeyParam = $("#goodsNameKey").val();
        var goodsCodeKeyParam = $("#goodsCodeKey").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/Inventory/queryInventory', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                ProductName : goodsNameKeyParam,
                ProductCode : goodsCodeKeyParam,
                storehouseId : adminChooseStorageParam
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

                    for(var i = 0; i < retDataLength; i++){
                        var index = i + 1;
                        var goodsName = retData[i].name;
                        var goodsCode = retData[i].code;
                        var brandName = retData[i].bandName;
                        var specifications = retData[i].specifications;
                        var weight = retData[i].weight;
                        var firstCategoryName = retData[i].categoryoneName;
                        var secondCategoryName = retData[i].categorytwoName;
                        var storeageroomName = retData[i].storehouse_name;
                        var onhand = retData[i].onhand;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+goodsName+"</td>";
                        tbodyHtml += "<td>"+goodsCode+"</td>";
                        tbodyHtml += "<td>"+brandName+"</td>";
                        tbodyHtml += "<td>"+weight+"</td>";
                        tbodyHtml += "<td>"+specifications+"</td>";
                        tbodyHtml += "<td>"+firstCategoryName+"</td>";
                        tbodyHtml += "<td>"+secondCategoryName+"</td>";
                        tbodyHtml += " <td>"+storeageroomName+"</td>";
                        if(onhand == 0){
                            tbodyHtml += "<td class='out-of-stock'>0</td>";
                        }else{
                            tbodyHtml += "<td>"+onhand+"</td>";
                        }
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
        if(accountTypeParam == 3){
            $("#adminChooseStorage option:first").prop("selected", "selected");
        }
        $("#goodsNameKey").val("");
        $("#goodsCodeKey").val("");
        $("#loading").css("display","block");
        getInventoryInfos(pageCount,currentPageNum);
    }

    //获取库房列表
    function getStorageroomList(){

        $.ajax({
            type: "GET", //用GET方式传输
            url: '${bath}/Inventory/getStorehouseList', //目标地址
            data: {},
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    toastr.error("获取仓库列表失败！");
                    return false;
                }else{
                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#storageSelected").empty();

                    var storageDefaultSelectedHtml = "<option value=''>请选择</option>";
                    $("#storageSelected").append(storageDefaultSelectedHtml);

                    for(var s = 0; s < retDataLength; s++){

                        var storageroomId = retData[s].id;
                        //var storageroomManagerId = retData[s].managerId;
                        var storageroomName = retData[s].storehouseName;

                        var storageSelectedHtml = "<option value='"+storageroomId+"'>"+storageroomName+"</option>";

                        $("#storageSelected").append(storageSelectedHtml);
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("操作失败！");
                return false;
            }
        });
    }

</script>
