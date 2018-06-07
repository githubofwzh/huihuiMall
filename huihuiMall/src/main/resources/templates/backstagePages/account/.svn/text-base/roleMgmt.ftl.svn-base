<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <title>角色管理</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/form/form.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/table/table.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/checkbox_radio_select.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/tree.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pagination.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/button.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<div class="container-fluid btn-operation-panel">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span>角色名称：</span>
            <input type="text" placeholder="请输入角色名称" id="searchKey">

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
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteModal" id="deleteBtn">
                    <i class="fa fa-trash-o fa-fw"></i> 删除</button>
            </div>

            <table class="table table-bordered table-hover table-responsive" style="margin-top: 15px;">
                <lable id="checkboxSelected" style="display:none"></lable>
                <thead>
                <tr>
                    <th width="50px">

                    </th>
                    <th width="80px">
                        序号
                    </th>
                    <th width="150px">
                        角色名称
                    </th>
                    <th width="150px">
                        角色类型
                    </th>
                    <th>
                        角色描述
                    </th>
                    <th width="100px">
                        是否启用
                    </th>
                    <th width="100px">
                        操作
                    </th>
                </tr>
                </thead>
                <tbody id="tbody">

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
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="addModalLabel">
                        <i class="fa fa-plus fa-fw"></i> 添加</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-2 col-md-3 col-xs-2 title">
                                        <label class="control-label">角色名称：</label>
                                    </div>
                                    <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="roleName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-2 col-md-3 col-xs-2 title">
                                        <label class="control-label">角色描述：</label>
                                    </div>
                                    <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                        <textarea name="" class="form-control required" rows="3" placeholder="选填"
                                                  style="padding-left:18px" id="roleDescription"></textarea>
                                    </div>
                                </div>
                            </div>

                            <#--<div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-2 col-md-3 col-xs-2 title">
                                        <label class="control-label">角色类型：</label>
                                    </div>
                                    <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                        <select class="form-select" id="roleType">
                                            <option value="1">管理员</option>
                                            <option value="2">普通员工</option>
                                        </select>
                                    </div>
                                </div>
                            </div>-->

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-2 col-md-3 col-xs-2 title">
                                        <label class="control-label">是否启用：</label>
                                    </div>
                                    <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                        <select class="form-select" id="isEnable">
                                            <option value="0">是</option>
                                            <option value="1">否</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                        <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="提交中..." onclick="addRole();" autocomplete="off">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加弹出面板结束-->

<!--修改弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="modifyModalLabel">
                        <i class="fa fa-edit fa-fw"></i> 修改</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-2 col-md-3 col-xs-2 title">
                                        <label class="control-label">角色名称：</label>
                                    </div>
                                    <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyRoleName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-2 col-md-3 col-xs-2 title">
                                        <label class="control-label">角色描述：</label>
                                    </div>
                                    <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                        <textarea name="" class="form-control required" rows="3" placeholder="选填" id="modifyRoleDescription"></textarea>
                                    </div>
                                </div>
                            </div>

                            <#--<div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-2 col-md-3 col-xs-2 title">
                                        <label class="control-label">角色类型：</label>
                                    </div>
                                    <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                        <select class="form-select" id="modifyRoleType">
                                            <option value="1">管理员</option>
                                            <option value="2">普通员工</option>
                                        </select>
                                    </div>
                                </div>
                            </div>-->

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-2 col-md-3 col-xs-2 title">
                                        <label class="control-label">是否启用：</label>
                                    </div>
                                    <div class="col-lg-9 col-md-8 col-xs-9 input-box">
                                        <select class="form-select" id="modifyIsEnable">
                                            <option value="0">是</option>
                                            <option value="1">否</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                        <button type="button" class="btn btn-default" id="confirmModify" style="margin-top: 0px" data-loading-text="提交中..." autocomplete="off">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--修改弹出面板结束-->

<!--删除弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="deleteModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i>删除</h4>
                </div>
                <div class="modal-body">
                    确定要删除选中的1条记录？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                        color: #444444">
                        取消
                    </button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmDelete"
                            data-loading-text="删除中..." autocomplete="off">
                        确定
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--删除面板结束-->

<!--设置权限弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="setAuthorityModal" tabindex="-1" role="dialog" aria-labelledby="setAuthorityModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="setAuthorityModalLabel">
                        <i class="fa fa-cogs fa-fw"></i>设置权限</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-5 col-md-5 title">
                                    <label class="control-label">
                                        请勾选此用户可访问的页面：</label>
                                </div>
                                <div class="col-lg-6 col-md-6 input-box">
                                    <div class="tree_content">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                                color: #444444">
                        取消
                    </button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmSave"
                            data-loading-text="保存中..." autocomplete="off">
                        保存
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--设置权限面板结束-->

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function () {

        $("#loading").css("display", "block");

        //分页方法
        var pageCount = 20;   //每页条数
        var currentPageNum = 1;  //当前页数,默认首页为第一页

        //获取信息
        getRolesInfo(pageCount, currentPageNum);

        //搜索点击
        $("#searchBtn").click(function () {
            $("#tbody").empty();
            $("#loading").css("display", "block");
            getRolesInfo(pageCount, 1);
        });

        //重置点击
        $("#resetBtn").click(function () {
            reset();
        });

        //上一页
        $("#prevPage").click(function () {
            var currentPageNum = parseInt($("#currentPage").text());
            if (currentPageNum > 1) {
                $("#tbody").empty();
                $("#loading").css("display", "block");
                currentPageNum -= 1;
                getRolesInfo(pageCount, currentPageNum);
            }
            else {
                return;
            }
        });

        //下一页
        $("#nextPage").click(function () {
            var totalPages = parseInt($("#totalPages").text());
            var currentPageNum = parseInt($("#currentPage").text());
            if (currentPageNum < totalPages) {
                $("#tbody").empty();
                $("#loading").css("display", "block");
                currentPageNum += 1;
                getRolesInfo(pageCount, currentPageNum);
            }
            else {
                return;
            }
        });

        //新增addModal关闭清空未提交数据
        $("#addModal").on("hide.bs.modal", function () {
            $("input").val("");
            $("textarea").val("");
            $("#isEnable option:first").prop("selected", "selected");
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
                    url: '${bath}/role/view', //目标地址
                    data: {
                        id: modifyRecordID
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

                        var roleName = retData.name;
                        var roleDescription = retData.description;
                        var isEnable = retData.enable;

                        $("#modifyRoleName").val(roleName);
                        $("#modifyRoleDescription").val(roleDescription);
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
        $('#modifyModal').on('hide.bs.modal', function () {
            $("input").val("");
            $("textarea").val("");
            $("#modifyIsEnable option:first").prop("selected", 'selected');
        });

        //删除点击
        $("#deleteBtn").click(function () {

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if (checkboxSelectedID == "") {
                toastr.error("请选择一条要删除的记录！");
                return false;
            }
            else {
                $("#deleteModal").toggle();
                $("#confirmDelete").attr("onclick", "delRecord(" + checkboxSelectedID + ");");
            }
        });

    });

    //获取信息方法
    function getRolesInfo(pageCount, currentPageNum) {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var search_key = $("#searchKey").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/role/queryRoles', //目标地址
            data: {
                PageNum : currentPageNum,
                PageSize : pageCount,
                Name : search_key
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {

                console.log(retInfo);

                $("#loading").css("display", "none");

                $(".pagination").css("display", "block");

                var itemSize = retInfo.size;
                $("#itemSize").html(itemSize);

                var totalItem = retInfo.total;
                $("#totalItem").html(totalItem);

                var totalPages = retInfo.pages;
                if (totalPages == 0) {
                    $("#totalPages").html(1);
                } else {
                    $("#totalPages").html(totalPages);
                }

                var hasNextPage = retInfo.hasNextPage;
                if (hasNextPage == true) {
                    $("#nextPage").css("display", "block");
                } else {
                    $("#nextPage").css("display", "none");
                }

                var hasPreviousPage = retInfo.hasPreviousPage;
                if (hasPreviousPage == true) {
                    $("#prevPage").css("display", "block");
                } else {
                    $("#prevPage").css("display", "none");
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

                    $("#tbody").empty();

                    for (var i = 0; i < retDataLength; i++) {
                        var index = i + 1;
                        var id = retData[i].id;
                        var roleName = retData[i].name;
                        var roleDescription = retData[i].description;
                        var roleEnable = retData[i].enable;
                        var roleType = retData[i].type;

                        var roleInfoHtml = "<tr>";
                        if(roleType == 3){
                            roleInfoHtml += "<td><input type='checkbox' disabled='disabled' class='mycheckbox' /></td>";
                        }else{
                            roleInfoHtml += "<td><input type='checkbox' id='" + id + "' class='mycheckbox' /></td>";
                        }

                        roleInfoHtml += "<td>" + index + "</td>";
                        roleInfoHtml += "<td>" + roleName + "</td>";
                        if (roleType == 1) {
                            roleInfoHtml += "<td>普通管理员</td>";
                        } else if(roleType == 2) {
                            roleInfoHtml += "<td>第三方管理员</td>";
                        }else{
                            roleInfoHtml += "<td>系统管理员</td>";
                        }

                        if(roleDescription != null || roleDescription == ""){
                            roleInfoHtml += "<td>" + roleDescription + "</td>";
                        }else{
                            roleInfoHtml += "<td></td>";
                        }

                        if (roleEnable == 0) {
                            roleInfoHtml += "<td><span class='open-status'>是</span></td>";
                        } else {
                            roleInfoHtml += "<td><span class='ban-status'>否</span></td>";
                        }

                        roleInfoHtml += "<td>";
                        if(roleType == 3){
                            roleInfoHtml += "<a href='javascript:void(0);' style='color:#999999; text-decoration: none; cursor: default'>设置权限</a>";
                        }else{
                            roleInfoHtml += "<a href='#' data-toggle='modal' data-target='#setAuthorityModal' id='"+id+"' onclick='setAuthority(id);'>设置权限</a>";
                        }

                        roleInfoHtml += "</td>";

                        roleInfoHtml += "</tr>";

                        $("#tbody").append(roleInfoHtml);

                    }

                    $(".mycheckbox").on("click", function () {
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
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display", "none");
                toastr.error("获取数据失败！");
                return false;
            }
        });
    }

    //添加新角色信息
    function addRole() {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var roleNameParam = $("#roleName").val();
        if (roleNameParam == "") {
            toastr.error("角色名不能为空！");
            return false;
        }

        var roleDescriptionParam = $("#roleDescription").val();

        var isEnable = $("#isEnable").find("option:selected").val();
        var isEnableParam = isEnable;

        //默认添加角色的角色类型为2
        var roleTypeParam = 2;

        $("#confirmAdd").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/role/RoleIsExits', //目标地址
            data: {
                name: roleNameParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                var isExits = retInfo.data.length;
                if (isExits == 0) {
                    $.ajax({
                        type: "POST", //用POST方式传输
                        url: '${bath}/role/addRole', //目标地址
                        data: {
                            name: roleNameParam,
                            description: roleDescriptionParam,
                            enable: isEnableParam,
                            roleType: roleTypeParam
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
                                $("textarea").val("");
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
                    toastr.error("该角色已存在！");
                    return false;
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#confirmAdd").button('reset');
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

        var modifyRoleNameParam = $("#modifyRoleName").val();
        if (modifyRoleNameParam == "") {
            toastr.error("角色名不能为空！");
            return false;
        }

        var modifyRoleDescriptionParam = $("#modifyRoleDescription").val();
        console.log(modifyRoleDescriptionParam);

        var modifyIsEnable = $("#modifyIsEnable").find("option:selected").val();
        var modifyIsEnableParam = modifyIsEnable;
        console.log(modifyIsEnableParam);

        var modifyRoleTypeParam = 2;

        $("#confirmModify").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/role/RoleIsExits', //目标地址
            data: {
                name: modifyRoleNameParam
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
                        url: '${bath}/role/updateRole', //目标地址
                        data: {
                            id: modifyRecordID,
                            name: modifyRoleNameParam,
                            description: modifyRoleDescriptionParam,
                            enable: modifyIsEnableParam,
                            roleType: modifyRoleTypeParam
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
                                $("textarea").val("");
                                $("#modifyIsEnable option:first").prop("selected", "selected");
                                $('#modifyModal').modal("hide");
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
                        url: '${bath}/role/updateRole', //目标地址
                        data: {
                            id: modifyRecordID,
                            name: modifyRoleNameParam,
                            description: modifyRoleDescriptionParam,
                            enable: modifyIsEnableParam,
                            roleType: modifyRoleTypeParam
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
                                $("textarea").val("");
                                $("#modifyIsEnable option:first").prop("selected", "selected");
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
                    toastr.error("该角色已存在！");
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

    //删除实现方法
    function delRecord(checkboxSelectedID) {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var delRecordIDParam = parseInt(checkboxSelectedID);

        $("#confirmDelete").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/role/deleteRole', //目标地址
            data: {
                id: delRecordIDParam
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
                    $("#confirmDelete").button("reset");
                    toastr.error("删除失败！");
                    return false;
                }
                else {
                    $("#confirmDelete").button("reset");
                    $("#deleteModal").modal("hide");
                    toastr.success("删除成功！");
                    setTimeout(function () {
                        reset();
                    }, 2000);
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#confirmDelete").button("reset");
                toastr.error("删除失败！");
                return false;
            }
        });
    }

    //设置权限实现方法
    function setAuthority(roleId) {

        var roleIdParam = roleId;

        $(".tree_content").empty();

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/menuToResource', //目标地址
            data: {
                roleId : roleIdParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);

                var retData = retInfo.data.model.children;
                var retDataLength = retData.length;

                for (var i = 0; i < retDataLength; i++) {
                    var pName = retData[i].name;
                    var pId = retData[i].id;
                    var treeHtml = "<div class='tree_node'>";
                    treeHtml += "<div class='div_inline'>";
                    treeHtml += "<span class='tree_node_toggle_button'></span>";
                    treeHtml += "</div>";

                    treeHtml += "<div class='div_inline tree_node_parent'>";
                    treeHtml += "<input type='checkbox' class='tree_node_parent_checkbox' value='" + pId + "'>" + pName + "";

                    var retDataChildren = retData[i].children;
                    var retDataChildrenLength = retDataChildren.length;
                    treeHtml += "<div class='tree_node_child'>";
                    for (var k = 0; k < retDataChildrenLength; k++) {
                        var childrenId = retDataChildren[k].id;
                        var childrenName = retDataChildren[k].name;

                        treeHtml += "<div class='tree_node_child_item'><span class='childrenLine' style='background-position: -56px -45px;'></span>";
                        treeHtml += "<input type='checkbox' class='tree_node_child_checkbox' value='" + childrenId + "'>";
                        treeHtml += "<span>" + childrenName + "</span><br />";

                        var retDataChildrenChild = retDataChildren[k].children;
                        if (retDataChildrenChild == null) {
                            treeHtml += "</div>"
                        } else {
                            var retDataChildrenChildLength = retDataChildrenChild.length;

                            treeHtml += "<div class='tree_node_child_child'>";
                            for (var m = 0; m < retDataChildrenChildLength; m++) {

                                var childrenChildId = retDataChildrenChild[m].id;
                                var childrenChildName = retDataChildrenChild[m].name;

                                treeHtml += "<div class='tree_node_child_child_item'><span class='childrenLine' style='background-position: -56px -45px;'></span>";
                                treeHtml += "<input type='checkbox' class='tree_node_child_child_checkbox' value='" + childrenChildId + "'>";
                                treeHtml += "<span>" + childrenChildName + "</span></div>";
                            }
                            treeHtml += "</div></div>";
                        }
                    }
                    treeHtml += "</div>";
                    treeHtml += "</div>";
                    treeHtml += "</div>";

                    $(".tree_content").append(treeHtml);
                }

                $('.tree_content').on('change', 'input[type=checkbox]', function () {
                    if ($(this).prop('checked')) {
                        parentChecked($(this), true);
                        childChecked($(this), true);
                    } else {
                        childChecked($(this), false);
                        parentChecked($(this), false);
                    }
                });

                // 对父元素操作
                function parentChecked(obj, booble) {
                    var parentInput = obj.parent().parent().siblings('input');
                    var allChild = obj.parent().parent().find('input:checked');
                    // 如果有父元素 点选中 父元素选中
                    if (parentInput.length && booble) {
                        parentInput.prop('checked', booble);
                        parentChecked(parentInput, booble);
                    }
                    // 如果有父元素 点取消 父元素下没有选中项 则取消选中
                    if (parentInput.length && !allChild.length && !booble) {
                        parentInput.prop('checked', booble);
                        parentChecked(parentInput, booble);
                    }

                }

                // 对子元素操作
                function childChecked(obj, booble) {
                    var childInput = obj.siblings('div').find('input');
                    if (childInput.length) {
                        childInput.prop('checked', booble);
                        childChecked(childInput, booble);
                    }
                }

                // 为所有的切换按钮添加点击事件
                $(".tree_node_toggle_button").click(function () {
                    // 获取需要隐藏或显示的节点
                    var $toggle_node = $(this).parent().next().find(".tree_node_child");
                    $toggle_node.toggle(); // 切换隐藏或显示
                    // 切换按钮的显示
                    if ($toggle_node.is(":visible")) {
                        $(this).css("background-position", " -110px -25px");
                        $(this).parent().parent().css("margin-bottom", "0");
                    } else {
                        $(this).css("background-position", " -110px -4px");
                        $(this).parent().parent().css("margin-bottom", "15px");
                    }
                });
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("设置失败！");
                return false;
            }
        });

        //选中已经设置的权限
        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/role/queryRoleResource', //目标地址
            data: {
                roleId: roleIdParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType: "json", //数据格式:JSON
            success: function (retInfo) {
                console.log(retInfo);
                var retData = retInfo.data;
                for (var i = 0; i < retData.length; i++) {
                    var value = retData[i].resourceId;
                    $('#setAuthorityModal input:checkbox[value=' + value + ']').attr('checked', 'true');
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                return false;
            }
        });

        $("#confirmSave").attr("onclick", "saveAuthority(" + roleIdParam + ");");

    }

    //保存权限
    function saveAuthority(id) {

        var roleId = id;

        $("#confirmSave").button("loading");

        var resourceIdArray = ["1"];

        var obj = $(".tree_content").find("input:checkbox");

        for (t = 0; t < obj.length; t++) {
            if (obj[t].checked) {
                var resourceID = obj[t].value;
                resourceIdArray.push(resourceID);
            }
        }

        var jsonData = JSON.stringify(resourceIdArray);

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/role/roleToResource', //目标地址
            data: {
                roleId: roleId,
                resourceIds: jsonData
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
                if (retCode != 0) {
                    $("#confirmSave").button('reset');
                    toastr.success("保存失败！");
                    return false;
                } else {
                    $("#confirmSave").button('reset');
                    $('#setAuthorityModal').modal('hide');
                    toastr.success("保存成功！");
                    setTimeout(function () {
                        reset();
                    }, 2000);
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#confirmSave").button("reset");
                toastr.error("保存失败！");
                return false;
            }
        });

    }

    //刷新实现方法
    function reset() {
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#checkboxSelected").text("");
        $("#tbody").empty();
        $("#loading").css("display", "block");
        getRolesInfo(pageCount, currentPageNum);
    }

</script>
