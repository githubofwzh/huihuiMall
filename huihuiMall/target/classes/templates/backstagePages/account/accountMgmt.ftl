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
    <title>后台账户管理</title>
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

            <span>姓名：</span>
            <input type="text" id="userNameKey" placeholder="请输入姓名">

            <span style="margin-left:10px">手机号：</span>
            <input type="text" id="phoneKey" placeholder="请输入手机号">

            <span style="margin-left: 10px">账号状态：</span>
            <select style="width: 10%" id="statusSelected">
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
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal">
                    <i class="fa fa-plus fa-fw"></i> 添加</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyModal" id="modifyBtn">
                    <i class="fa fa-edit fa-fw"></i> 修改</button>
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
                        角色
                    </th>
                    <th>
                        姓名
                    </th>
                    <th>
                        联系方式
                    </th>
                    <th>
                        账户状态
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

<!--添加弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="addModalLabel">
                        <i class="fa fa-plus fa-fw"></i> 添加</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">姓名：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="realName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">账户名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="accountName" onkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">初始密码：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" id="initialPwd" placeholder="必填" value="123456" disabled="disabled">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系方式：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="phoneNumber">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">角色：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="role">

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">是否启用：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="isEnable">
                                            <option value="0">是</option>
                                            <option value="1">否</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off" onclick="addAccount();">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加弹出面板结束-->

<!--修改弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="modifyModalLabel">
                        <i class="fa fa-edit fa-fw"></i> 修改</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">姓名：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">账户名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyAccount">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系方式：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyPhone">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">角色：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="modifyRole">

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">是否启用：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="modifyIsEnable">
                                            <option value="0">是</option>
                                            <option value="1">否</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmModify" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--修改弹出面板结束-->

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

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页*/

        //获取当日任务计划号
        getAccountInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getAccountInfos(pageCount,1);
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
                getAccountInfos(pageCount,currentPageNum);
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
                getAccountInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //新增addModal关闭清空未提交数据
        $("#addModal").on("hide.bs.modal", function () {
            $("input").val("");
            $("#initialPwd").val("123456");
            $("#isEnable option:first").prop("selected", "selected");
            $("#role option:first").prop("selected", "selected");
        });

        //addModal显示时获取角色列表信息
        $("#addModal").on("show.bs.modal", function () {
            getRolesInfo(0);
        });

        //修改点击
        $("#modifyBtn").click(function () {

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            if (checkboxSelectedID == "") {
                toastr.error("请选择一条要修改的记录！");
                return false;
            }else {
                $("#modifyModal").toggle();
                var modifyRecordID = parseInt(checkboxSelectedID);
                console.log(modifyRecordID);

                //修改前查询
                $.ajax({
                    type: "POST", //用POST方式传输
                    url: '${bath}/accountMgmt/view', //目标地址
                    data: {
                        id : modifyRecordID
                    },
                    beforeSend: function (jqXHR) {
                        if (undefined != header) {
                            jqXHR.setRequestHeader(header, token);
                        }
                    },
                    dataType: "json", //数据格式:JSON
                    success: function (retInfo) {
                        var retData = retInfo.data;
                        console.log(retData);

                        var roleId = retData.roleId;
                        getRolesInfo(roleId);

                        var realName = retData.name;
                        var accountName = retData.loginAccount;
                        var phoneNumber = retData.phone;
                        var isEnable = retData.enable;

                        $("#modifyName").val(realName);
                        $("#modifyAccount").val(accountName);
                        $("#modifyPhone").val(phoneNumber);
                        $("#modifyIsEnable").val(isEnable);
                    },
                    error: function (XMLHttpRequest, textStatus) {
                        console.log(XMLHttpRequest);
                        console.log(textStatus);
                        toastr.error("获取信息失败！");
                        return false;
                    }
                });
                $("#confirmModify").attr("onclick", "modifyRecord(" + checkboxSelectedID + ");");
            }
        });

        //修改前清空
        $("#modifyModal").on("hide.bs.modal", function () {
            $("input").val("");
            $("#modifyIsEnable option:first").prop("selected", "selected");
            $("#modifyRole option:first").prop("selected", "selected");
        });
    });

    //获取信息方法
    function getAccountInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var userNameKeyParam = $("#userNameKey").val();
        var phoneKeyParam = $("#phoneKey").val();
        var statusSelectedParam = $("#statusSelected").find("option:selected").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/accountMgmt/queryAccounts', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                name : userNameKeyParam,
                phone : phoneKeyParam,
                enable : statusSelectedParam
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
                        var roleName = retData[i].rolename;
                        var realName = retData[i].name;
                        var phone = retData[i].phone;
                        var accountStatus = retData[i].enable;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox' id='"+id+"' class='mycheckbox'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+loginAccount+"</td>";
                        tbodyHtml += "<td>"+roleName+"</td>";
                        tbodyHtml += "<td>"+realName+"</td>";
                        tbodyHtml += "<td>"+phone+"</td>";
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

    //添加新账号方法
    function addAccount(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var realNameParam = $("#realName").val();
        if (realNameParam == "") {
            toastr.error("姓名不能为空！");
            return false;
        }

        var accountNameParam = $("#accountName").val();
        if (accountNameParam == "") {
            toastr.error("账户名称不能为空！");
            return false;
        }

        var passwordParam = "123456";

        var phoneNumberParam = $("#phoneNumber").val();
        if (accountNameParam == "") {
            toastr.error("联系方式不能为空！");
            return false;
        }

        var roleParam = $("#role").find("option:selected").val();

        var isEnable = $("#isEnable").find("option:selected").val();
        var isEnableParam = isEnable;

        $("#confirmAdd").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/accountMgmt/accountIsExits', //目标地址
            data: {
                loginAccount : accountNameParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                var isExits = retInfo.data.length;
                console.log(isExits);
                if (isExits == 0) {
                    $.ajax({
                        type: "POST", //用POST方式传输
                        url: '${bath}/accountMgmt/addKsAccount', //目标地址
                        data: {
                            loginAccount : accountNameParam,
                            loginPassword : passwordParam,
                            name : realNameParam,
                            phone : phoneNumberParam,
                            roleId : roleParam,
                            enable : isEnableParam
                        },
                        beforeSend: function (jqXHR) {
                            if (undefined != header) {
                                jqXHR.setRequestHeader(header, token);
                            }
                        },
                        dataType: "json", //数据格式:JSON
                        success: function (retInfo) {
                            console.log(retInfo);
                            var retCode = retInfo.retCode;
                            console.log(retCode);
                            if (retCode != 0) {
                                $("#confirmAdd").button("reset");
                                toastr.error("添加失败！");
                                return false;
                            }
                            else {
                                $("#confirmAdd").button("reset");
                                $("input").val("");
                                $('#addModal').modal("hide");
                                toastr.success("添加成功！");
                                setTimeout(function () {
                                    reset();
                                }, 2000);
                            }
                        },
                        error: function (XMLHttpRequest, textStatus) {
                            console.log(XMLHttpRequest);
                            console.log(textStatus);
                            $("#confirmAdd").button("reset");
                            toastr.error("添加失败！");
                            return false;
                        }
                    });
                } else {
                    $("#confirmAdd").button("reset");
                    toastr.error("该账户已存在！");
                    return false;
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#confirmAdd").button("reset");
                toastr.error("添加失败！");
                return false;
            }
        });
    }

    //修改实现方法
    function modifyRecord(checkboxSelectedID) {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var modifyRecordID = parseInt(checkboxSelectedID);
        console.log(modifyRecordID);

        var modifyNameParam = $("#modifyName").val();
        if (modifyNameParam == "") {
            toastr.error("姓名不能为空！");
            return false;
        }

        var modifyAccountParam = $("#modifyAccount").val();
        if (modifyAccountParam == "") {
            toastr.error("账户名称不能为空！");
            return false;
        }

        var modifyPhoneParam = $("#modifyPhone").val();
        if (modifyPhoneParam == "") {
            toastr.error("联系方式不能为空！");
            return false;
        }

        var modifyRoleId = $("#modifyRole").find("option:selected").val();
        var modifyRoleParam = modifyRoleId;
        console.log(modifyRoleParam);

        var modifyIsEnable = $("#modifyIsEnable").find("option:selected").val();
        var modifyIsEnableParam = modifyIsEnable;
        console.log(modifyIsEnableParam);


        $("#confirmModify").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/accountMgmt/accountIsExits', //目标地址
            data: {
                loginAccount : modifyAccountParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);
                var isExits = retInfo.data.length;
                console.log(isExits);
                if (isExits == 0) {
                    $.ajax({
                        type: "POST", //用POST方式传输
                        url: '${bath}/accountMgmt/updateKsAccount', //目标地址
                        data: {
                            id: modifyRecordID,
                            loginAccount : modifyAccountParam,
                            name : modifyNameParam,
                            phone : modifyPhoneParam,
                            roleId : modifyRoleParam,
                            enable : modifyIsEnableParam
                        },
                        beforeSend: function (jqXHR) {
                            if (undefined != header) {
                                jqXHR.setRequestHeader(header, token);
                            }
                        },
                        dataType: "json", //数据格式:JSON
                        success: function (retInfo) {
                            console.log(retInfo);
                            var retCode = retInfo.retCode;
                            console.log(retCode);
                            if (retCode != 0) {
                                $("#confirmModify").button("reset");
                                toastr.error("修改失败！");
                                return false;
                            }else {
                                $("#confirmModify").button("reset");
                                $("input").val("");
                                $("#modifyIsEnable option:first").prop("selected", "selected");
                                $("#modifyRole option:first").prop("selected", "selected");
                                $("#modifyModal").modal("hide");
                                toastr.success("修改成功！");
                                setTimeout(function () {
                                    reset();
                                }, 2000);
                            }
                        },
                        error: function (XMLHttpRequest, textStatus) {
                            console.log(XMLHttpRequest);
                            console.log(textStatus);
                            $("#confirmModify").button('reset');
                            toastr.error("修改失败！");
                            return false;
                        }
                    });
                } else if (retInfo.data[0].id == modifyRecordID) {
                    $.ajax({
                        type: "POST", //用POST方式传输
                        url: '${bath}/accountMgmt/updateKsAccount', //目标地址
                        data: {
                            id: modifyRecordID,
                            loginAccount : modifyAccountParam,
                            name : modifyNameParam,
                            phone : modifyPhoneParam,
                            roleId : modifyRoleParam,
                            enable : modifyIsEnableParam
                        },
                        beforeSend: function (jqXHR) {
                            if (undefined != header) {
                                jqXHR.setRequestHeader(header, token);
                            }
                        },
                        dataType: "json", //数据格式:JSON
                        success: function (retInfo) {
                            console.log(retInfo);
                            var retCode = retInfo.retCode;
                            console.log(retCode);
                            if (retCode != 0) {
                                $("#confirmModify").button("reset");
                                toastr.error("修改失败！");
                                return false;
                            }
                            else {
                                $("#confirmModify").button("reset");
                                $("input").val("");
                                $("#modifyIsEnable option:first").prop("selected", "selected");
                                $("#modifyRole option:first").prop("selected", "selected");
                                $("#modifyModal").modal("hide");
                                toastr.success("修改成功！");
                                setTimeout(function () {
                                    reset();
                                }, 2000);
                            }
                        },
                        error: function (XMLHttpRequest, textStatus) {
                            console.log(XMLHttpRequest);
                            console.log(textStatus);
                            $("#confirmModify").button("reset");
                            toastr.error("修改失败！");
                            return false;
                        }
                    });
                } else {
                    $("#confirmModify").button("reset");
                    toastr.error("该账户已存在！");
                    return false;
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#confirmModify").button('reset');
                toastr.error("修改失败！");
                return false;
            }
        });

    }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#userNameKey").val("");
        $("#phoneKey").val("");
        $("#statusSelected option:first").prop("selected", "selected");
        $("#checkboxSelected").text("");
        $("#loading").css("display","block");
        getAccountInfos(pageCount,currentPageNum);
    }

    //获取角色信息方法
    function getRolesInfo(roleId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var roleIdParam =  roleId;

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/role/queryAllRoles', //目标地址
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
                    toastr.error("获取角色数据失败！");
                    return false;
                }else{
                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#role").empty();
                    $("#modifyRole").empty();

                    for(var r = 0; r < retDataLength; r++){
                        var roleName = retData[r].name;
                        var roleId = retData[r].id;

                        if(roleIdParam == 0){
                            var selectedHtml = "<option value='"+roleId+"'>"+roleName+"</option>";
                            $("#role").append(selectedHtml);
                        }else{
                            var modifySelectedHtml = "";
                            if(roleIdParam == roleId){
                                modifySelectedHtml += "<option value='"+roleId+"' selected='selected'>"+roleName+"</option>";
                                $("#modifyRole").append(modifySelectedHtml);
                            }else{
                                modifySelectedHtml += "<option value='"+roleId+"'>"+roleName+"</option>";
                                $("#modifyRole").append(modifySelectedHtml);
                            }
                        }
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("获取角色数据失败！");
                return false;
            }
        });
    }

</script>
