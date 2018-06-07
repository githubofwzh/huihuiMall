<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>第三方账户管理</title>
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

<div class="container-fluid btn-operation-panel">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span style="margin-left: 10px">第三方商家名称：</span>
            <input type="text" id="businessNameKey" placeholder="请输入第三方商家名称">

            <span style="margin-left: 10px">账号状态：</span>
            <select style="width: 10%" id="accountStatusSelected">
                <option value="">请选择</option>
                <option value="0">已启用</option>
                <option value="1">已禁用</option>
            </select>

            <button type="button" class="btn btn-default" id="searchBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">

        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">

            <div class="col-lg-12 col-md-12 col-xs-12 btn-group-panel">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#openModal" id="openBtn">
                    <i class="fa fa-play fa-fw"></i> 启用</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#banModal" id="banBtn">
                    <i class="fa fa-ban fa-fw"></i> 禁用</button>
                <#--<button type="button" class="btn btn-default" data-toggle="modal" data-target="#resetPwdModal" id="resetPwdBtn">
                    <i class="fa fa-lock fa-fw"></i> 重置密码</button>-->
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
                        账户名称
                    </th>
                    <th>
                        第三方商家名称
                    </th>
                    <th width="130">
                        姓名
                    </th>
                    <th width="130">
                        联系方式
                    </th>
                    <th>
                        地址
                    </th>
                    <th width="100">
                        账号状态
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

<!--启用弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="openModal" tabindex="-1" role="dialog" aria-labelledby="openModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="openModalLabel">
                        <i class="fa fa-play fa-fw"></i> 启用</h4>
                </div>
                <div class="modal-body">
                    确定启用该账号吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmOpen" data-loading-text="启用中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--通过弹出面板结束-->

<!--禁用弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="banModal" tabindex="-1" role="dialog" aria-labelledby="banModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="banModalLabel">
                        <i class="fa fa-ban fa-fw"></i> 禁用</h4>
                </div>
                <div class="modal-body">
                    确定禁用该账号吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmBan" data-loading-text="禁用中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--禁用弹出面板结束-->

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

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页

        //获取第三方账号信息
        getBusinessAccountInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getBusinessAccountInfos(pageCount,1);
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
                getBusinessAccountInfos(pageCount,currentPageNum);
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
                getBusinessAccountInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //启用点击
        $("#openBtn").click(function () {

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if (checkboxSelectedID == "") {
                toastr.error("请选择一个要启用的账号！");
                return false;
            }
            else {
                $("#openModal").toggle();
                $("#confirmOpen").attr("onclick", "accountOpenModal(" + checkboxSelectedID + ");");
            }
        });

        //禁用点击
        $("#banBtn").click(function () {

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if (checkboxSelectedID == "") {
                toastr.error("请选择一个要禁用的账号！");
                return false;
            }
            else {
                $("#banModal").toggle();
                $("#confirmBan").attr("onclick", "accountBanModal(" + checkboxSelectedID + ");");
            }
        });

    });

    //获取信息方法
    function getBusinessAccountInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var businessNameKeyParam = $("#businessNameKey").val();
        var accountStatusSelectedParam = $("#accountStatusSelected").find("option:selected").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/thriadAccoundType/queryThiradAccount', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                merchantname : businessNameKeyParam,
                enable : accountStatusSelectedParam
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
                        var id = retData[i].id;
                        var loginAccount = retData[i].login_account;
                        var businessName = retData[i].mname;
                        var accountRealName = retData[i].lname;
                        var accountPhone = retData[i].lmobile;
                        var businessAddress = retData[i].raddress;
                        var accountStatus = retData[i].enable;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox' id='"+id+"' class='mycheckbox'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+loginAccount+"</td>";

                        if(businessName == null || businessName == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+businessName+"</td>";
                        }

                        if(accountRealName == null || accountRealName == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+accountRealName+"</td>";
                        }

                        if(accountPhone == null || accountPhone == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+accountPhone+"</td>";
                        }

                        if(businessAddress == null || businessAddress == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+businessAddress+"</td>";
                        }

                        if(accountStatus == 0){
                            tbodyHtml += "<td class='open-status'>已启用</td>";
                        }else{
                            tbodyHtml += "<td class='ban-status'>已禁用</td>";
                        }

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
                toastr.error('查询失败！');
                return false;
            }
        });
    }

    //启用弹窗
    function accountOpenModal(accountOpenId){
        var accountOpenIdParam = accountOpenId;
        var accountOpenStatusParam = 0;
        openAndBan(accountOpenIdParam,accountOpenStatusParam);
    }

    //禁用弹窗
    function accountBanModal(accountBanId){
        var accountBanIdParam = accountBanId;
        var accountBanStatusParam = 1;
        openAndBan(accountBanIdParam,accountBanStatusParam);
    }

    //启用禁用方法
    function openAndBan(accountId,accountStatus){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var accountIdParam = accountId;
        var accountStatusParam = accountStatus;
        console.log(accountIdParam);
        console.log(accountStatusParam);

        if(accountStatusParam == 0){
            $("#confirmOpen").button("loading");
        }else{
            $("#confirmBan").button("loading");
        }

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/thriadAccoundType/updateThiradAccount', //目标地址
            data: {
                id : accountIdParam,
                enable : accountStatusParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                //console.log(retInfo);
                var retCode = retInfo.retCode;
                if (retCode != 0) {
                    if(accountStatusParam == 0){
                        $("#confirmOpen").button("reset");
                        toastr.error("启用失败！");
                        return false;
                    }else{
                        $("#confirmBan").button("reset");
                        toastr.error("禁用失败！");
                        return false;
                    }
                }
                else {
                    if(accountStatusParam == 0){
                        $("#confirmOpen").button("reset");
                        $("#openModal").modal("hide");
                        toastr.success("启用成功！");
                        setTimeout(function () {
                            reset();
                        }, 2000);
                    }else{
                        $("#confirmBan").button("reset");
                        $("#banModal").modal("hide");
                        toastr.success("禁用成功！");
                        setTimeout(function () {
                            reset();
                        }, 2000);
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                if(accountStatusParam == 0){
                    $("#confirmOpen").button("reset");
                    toastr.error("操作失败！");
                    return false;
                }else{
                    $("#confirmBan").button("reset");
                    toastr.error("操作失败！");
                    return false;
                }
            }
        });
    }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#businessNameKey").val("");
        $("#accountStatusSelected option:first").prop("selected", "selected");
        $("#checkboxSelected").text("");
        $("#loading").css("display","block");
        getBusinessAccountInfos(pageCount,currentPageNum);
    }

</script>
