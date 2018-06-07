<!DOCTYPE html>
<html>
<head>
    <#assign bath=request.getContextPath()>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <#if _csrf??>
        <meta name="_csrf" content="${_csrf.token}"/>
        <!-- default header name is X-CSRF-TOKEN -->
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
    </#if>

    <title>角色管理</title>
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="${bath}/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <!--common CSS-->
    <link href="${bath}/css/common/checkBox_radio.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/systemMgmt.css" rel="stylesheet" type="text/css" />
    <!--tip CSS-->
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css" />
    <!-- jQuery -->

    <script src="${bath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>

    <script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery-validate.js" type="text/javascript"></script>

</head>
<body>
<!--顶部title与面包屑开始-->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-9 col-md-9" style="padding-left: 0px">
                <h3 class="page-header">
                    角色管理
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a  href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;系统管理</li>
                    <li class="active">角色管理</li>
                </h4>
            </div>
        </div>
    </div>
</div>
<!--顶部title与面包屑结束-->
<!--操作面板与搜索面板开始-->
<div class="container-fluid" id="operation-panel">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-6 col-md-6" style="padding-left: 5px">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal">
                    <i class="fa fa-plus fa-fw"></i>添加</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyModal"
                        id="modifyBtn">
                    <i class="fa fa-edit fa-fw"></i>修改</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteModal"
                        id="deleteBtn">
                    <i class="fa fa-trash-o fa-fw"></i>删除</button>
                <button type="button" class="btn btn-default" onclick="refresh();">
                    <i class="fa fa-refresh fa-fw"></i>刷新</button>
            </div>
            <div class="col-lg-2 col-md-3" style="margin: 20px 0px; float: right">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="请输入角色名称" id="searchKey">
                    <span class="input-group-btn">
                            <button class="btn btn-search" type="button" id="searchBtn">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--操作面板与搜索面板结束-->
<!--table展示与分页开始-->
<div class="container-fluid" id="table-panel">
    <div class="row">
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                <div class="row">
                                    <div class="col-sm-12  col-md-12 col-lg-12">
                                        <table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline"
                                               role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                            <lable id="checkboxSelected" style="display: none"></lable>
                                            <thead>
                                            <tr role="row">
                                                <th style="width: 20px;">
                                                </th>
                                                <th style="width: 50px;">
                                                    序号
                                                </th>
                                                <th style="width: 280px;">
                                                    角色名称
                                                </th>
                                                <th style="width: 280px;">
                                                    角色描述
                                                </th>
                                                <th style="width: 280px;">
                                                    是否启用
                                                </th>
                                                <th style="width: 280px;">
                                                    设置权限
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="tbody">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 40px">
                                    <div class="col-lg-2 col-md-3">
                                        <div class="dataTables_length" style="text-align: center">
                                            <!--<label>
                                            显示
                                            <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm" id="selectPageSize">
                                                <option value="10">10</option>
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                            </select>
                                            条结果
                                        </label>-->
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-6">
                                        <div class="dataTables_info" role="status" aria-live="polite" style="text-align: center;
                                                line-height: 35px; margin-bottom: 10px">
                                            显示<lable id="itemSize"></lable>项结果，共<label id="totalItem"></label>项， 当前<label id="currentPage"></label>/<label id="totalPages"></label>页
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-3">
                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate"
                                             style="text-align: center">
                                            <ul class="pagination" style="margin: 0px; display: none">
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
                </div>
            </div>
        </div>
    </div>
</div>
<!--table展示与分页结束-->
<!--添加弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="addModalLabel">
                        <i class="fa fa-plus fa-fw"></i>添加</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        角色名称：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 input-box">
                                    <input type="text" class="form-control required" placeholder="必填" id="roleName"  data-tip="" data-valid="isNonEmpty" data-error="角色名称不能为空">
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        是否启用：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 input-box">
                                    <select name="" class="form-control required" id="roleEnable" data-tip=""  data-valid="isRoleEnable" data-error="请选择状态">
                                        <option value="0">启用</option>
                                        <option value="1">未启用</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        备注：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 input-box">
                                    <textarea class="form-control required forInput" rows="6" placeholder="请将字数控制在200字以内" id="roleDescription" data-tip="" data-valid="between:0-200" data-error="备注长度200字数以内"></textarea>
                                    <p class="controlContent" style="float: right;">0/200字</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px"
                            data-loading-text="提交中..." autocomplete="off" onclick="addRole();">
                        确定</button>
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
                        &times;</button>
                    <h4 class="modal-title" id="modifyModalLabel">
                        <i class="fa fa-edit fa-fw"></i>修改</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        角色名称：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 input-box">
                                    <input type="text" class="form-control required" placeholder="必填" id="modifyRoleName"  data-tip="" data-valid="isNonEmpty" data-error="角色名称不能为空">
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        是否启用：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 input-box">
                                    <select name="" class="form-control" id="modifyRoleEnable"   style="width: 100%">
                                        <option value="0">启用</option>
                                        <option value="1">未启用</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        角色描述：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 input-box">
                                    <textarea class="form-control required forInput" rows="6" placeholder="请将字数控制在200字以内" id="modifyRoleDescription" data-tip="" data-valid="between:0-200" data-error="备注长度200字数以内"></textarea>
                                    <p class="controlContent" style="float: right;">0/200字</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmModify"
                            data-loading-text="修改中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--修改面板结束-->

<!--删除弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="deleteModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i>删除</h4>
                </div>
                <div class="modal-body">
                    确定要删除选中的1条记录？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmDelete"
                            data-loading-text="删除中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--删除面板结束-->

<!--设置权限弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="setPermissionsModal" tabindex="-1" role="dialog" aria-labelledby="setPermissionsModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="setPermissionsModalLabel">
                        <i class="fa fa-gear fa-fw"></i>设置权限</h4>
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
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmSave"
                            data-loading-text="保存中..." autocomplete="off">
                        保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--设置权限面板结束-->

<!--数据加载loading开始-->
<div id="loading" class="loading">数据加载中...</div>
<!--数据加载loading结束-->
</body>
</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function() {

        /*$("#loading").css("display","block");*/

        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页
        var search_key = $("#searchKey").val();

        //获取角色信息
        getRoles(pageCount,currentPageNum,search_key);
        //检查输入字数
        $('.forInput').bind('input propertychange', function() {
            if($(this).val().length>200){
                $(this).next(".controlContent").html($(this).val().length + '/200字').css("color","#ff0000");
            }else{
                $(this).next(".controlContent").html($(this).val().length + '/200字').css("color","#333");
            }
        });

        //搜索点击
        $("#searchBtn").click(function(){
            var search_key = $("#searchKey").val();
            $("#tbody").empty();
            $("#loading").css("display","block");
            getRoles(pageCount,1,search_key);
        });

        //修改点击
        $("#modifyBtn").click(function(){
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                $("#confirmModify").css({
                    "background-color":"#ccc",
                    "color":"#444444"
                });
                toastr.error('请选择一条要修改的记录！');
                //改变提示窗位置
                changeToastr();
                return false;
            }
            else{
                $("#modifyModal").toggle();
                $("#confirmModify").css({
                    "background-color":"#00b38b",
                    "color":"#FFF"
                });
                var modifyRecordID = parseInt(checkboxSelectedID);
                //修改前查询
                $.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/role/view', //目标地址
                    data : {
                        id : modifyRecordID
                    },
                    beforeSend: function(jqXHR) {
                        if (undefined != header){
                            jqXHR.setRequestHeader(header, token);
                        }
                    },
                    dataType : "json", //数据格式:JSON
                    success : function(retInfo) {

                        console.log(retInfo);
                        var retData = retInfo.data;
                        var roleName = retData.name;
                        var roleEnable = retData.enable;
                        var roleDescription = retData.description;

                        $("#modifyRoleName").val(roleName);
                        $("#modifyRoleEnable").val(roleEnable);
                        $("#modifyRoleDescription").val(roleDescription);
                        $("#modifyModal .controlContent").html(roleDescription.length + '/200字');
                    }
                });
                $("#confirmModify").attr("onclick","modifyRecord("+checkboxSelectedID+");");
            }
        });
        /*修改前清空*/
        $('#modifyModal').on('hide.bs.modal', function () {
            $(".success").removeClass("success");
            $(".error").removeClass("error");
            $(".valid_message").css("display","none");
            $("input").val("");
            $("textarea").val("");
            $("#modifyModal .controlContent").html("0/200字").css("color","#333");
            $("#modifyRoleEnable option:first").prop("selected", 'selected');
        });

        //删除点击
        $("#deleteBtn").click(function(){
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                $("#confirmDelete").css({
                    "background-color":"#ccc",
                    "color":"#444444"
                });
                toastr.error('请选择一条要删除的记录！');
                //改变提示窗位置
                changeToastr();
                return false;
            }
            else{
                $("#deleteModal").toggle();
                $("#confirmDelete").css({
                    "background-color":"#00b38b",
                    "color":"#FFF"
                });
                $("#confirmDelete").attr("onclick","delRecord("+checkboxSelectedID+");");
            }
        });

        //上一页
        $("#prevPage").click(function(){
            var search_key = $("#searchKey").val();
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum > 1)
            {
                $("#tbody").empty();
                $("#loading").css("display","block");
                currentPageNum -= 1;
                getRoles(pageCount,currentPageNum,search_key);
            }
            else
            {
                return;
            }
        });

        //下一页
        $("#nextPage").click(function(){
            var search_key = $("#searchKey").val();
            var totalPages = parseInt($("#totalPages").text());
            var currentPageNum = parseInt($("#currentPage").text());
            if(currentPageNum < totalPages)
            {
                $("#tbody").empty();
                $("#loading").css("display","block");
                currentPageNum += 1;
                getRoles(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });

        /*验证信息*/
        $('#addModal.form-group').validate({
            onFocus: function() {
                this.parent().addClass('active');
                $(this).next('span[class=valid_message]').css("display","none");
                return false;
            },

            onBlur: function() {
                var $parent = this.parent();
                var _status = parseInt(this.attr('data-status'));
                $parent.removeClass('active');
                if (!_status) {
                    $parent.addClass('error');
                }
                return false;
            }
        });

        //设置弹框高度居中
        $('.modal').on('show.bs.modal', function (event) {
            var documentHeight=$(document).height();//当前iframe总高度
            var scrollHeight=screen.availHeight;//浏览器窗口高度
            var selfHeight=$(this).find(".modal-content")[0].offsetHeight;
            var trueHeight=(scrollHeight-selfHeight)/2+toscrollTop+"px";
            var toscrollTop=$(window.parent).scrollTop();//滚动距离
            if(toscrollTop<80){
                $(this).find(".modal-content").css("top",0);
            }else{
                $(this).find(".modal-content").css("top",toscrollTop-80);
            }
        })
    });

    //获取角色信息方法
    function getRoles(pageCount,currentPageNum,search_key){
        $("#currentPage").html(currentPageNum);
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/role/queryRoles', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                name : search_key
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
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
                $("#totalPages").html(totalPages);

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

                var retData = retInfo.data;
                if(retData == null){
                    toastr.error('获取数据失败！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }else{
                    $("#tbody").empty();
                    var retDataLength = retData.length;
                    console.log(retDataLength);
                    for(var i = 0; i < retDataLength; i++){

                        var index = i + 1;
                        var roleID = retData[i].id;
                        var roleName = retData[i].name;
                        var roleEntCode = retData[i].entcode;
                        var roleDescription = retData[i].description;
                        var roleEnable = retData[i].enable;
                        var roleType=retData[i].type;

                        var trHtml = "<tr class='gradeA odd' role='row' id='tr"+roleID+"'>";
                        if(roleType==2){
                            trHtml += "<td><input type='checkbox' class='checkbox' id='"+roleID+"' disabled='disabled'/></td>";
                        }else {
                            trHtml += "<td><input type='checkbox' class='checkbox' id='"+roleID+"'/></td>";
                        }
                        trHtml += "<td>"+index+"</td>";
                        if(roleName != null){
                            trHtml += "<td>"+roleName+"</td>";
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(roleDescription != null){
                            if(roleDescription.length > 14){
                                var subroleDescription = roleDescription.substring(0,14);
                                trHtml += "<td>"+subroleDescription+"...</td>";
                            }else{
                                trHtml += "<td>"+roleDescription+"</td>";
                            }
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(roleEnable == 0){
                            trHtml += "<td>启用</td>";
                        }else{
                            trHtml += "<td>未启用</td>";
                        }
                        if(roleType==2){
                            trHtml += "<td><button data-toggle='modal' data-target='#setPermissionsModal' onclick='setPermissions("+roleID+")' disabled='disabled' style='color:#cccccc;background: none;border: 0;'>设置权限</button></td>";
                        }else {
                            trHtml += "<td><a href='#' class='aLink' data-toggle='modal' data-target='#setPermissionsModal' onclick='setPermissions("+roleID+")'>设置权限</a></td>";
                        }

                        trHtml += "</tr>";

                        $("#tbody").append(trHtml);

                        //获取表格中checkbox的选中值
                        $(".checkbox").on("click", function() {
                            if ($(this).prop("checked")) {
                                $(".checkbox").prop("checked", false);
                                $(this).prop("checked", true);
                                var checkboxID = $(this).attr("id");
                                $("#checkboxSelected").text(checkboxID);
                            }
                            else {
                                $("#checkboxSelected").text("");
                            }
                        });
                    }
                }
                $("#loading").css("display","none");
            }
        });
    };

    //添加角色方法
    function addRole(){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        if (! $('#addModal .form-group').validate('submitValidate')){
            return false;
        }
        var role_name = $("#roleName").val();
        console.log(role_name);

        var role_description = $("#roleDescription").val();
        console.log(role_description);

        var roleEnableVal = $("#roleEnable").find("option:selected").val();
        var role_enable = roleEnableVal;
        console.log(role_enable);

        $("#confirmAdd").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/role/RoleIsExits', //目标地址
            data : {
                name : role_name,
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                if(retInfo.data.length==0){
                    $.ajax({
                        type : "POST", //用POST方式传输
                        url : '${bath}/role/addRole', //目标地址
                        data : {
                            name : role_name,
                            description : role_description,
                            enable : role_enable,
                            //entcode : 100000001
                        },
                        beforeSend: function(jqXHR) {
                            if (undefined != header){
                                jqXHR.setRequestHeader(header, token);
                            }
                        },
                        dataType : "json", //数据格式:JSON
                        success : function(retInfo) {
                            console.log(retInfo);
                            var retCode = retInfo.retCode;
                            console.log(retCode);
                            if(retCode != 0){
                                $("#confirmAdd").button('reset');
                                toastr.error('添加失败！');
                                //改变提示窗位置
                                changeToastr();
                                return false;
                            }
                            else{
                                $("#confirmAdd").button('reset');
                                $("input").val("");
                                $("textarea").val("");
                                $('#addModal').modal('hide');
                                toastr.success('添加成功！');
                                //改变提示窗位置
                                changeToastr();
                                setTimeout(function(){
                                    refresh();
                                },2000);
                            }
                        }
                    });
                }else{
                    $("#confirmAdd").button('reset');
                    toastr.error('角色名已存在！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
            }
        });

    };

    //新增addModal关闭清空未提交数据
    $(function() {
        $('#addModal').on('hide.bs.modal', function () {
            $(".success").removeClass("success");
            $(".error").removeClass("error");
            $(".valid_message").css("display","none");
            $("input").val("");
            $("textarea").val("");
            $("#addModal .controlContent").html("0/200字").css("color","#333");
            $("#roleEnable option:first").prop("selected", 'selected');
        });
    });

    //修改实现方法
    function modifyRecord(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        if (! $('#modifyModal .form-group').validate('submitValidate')){
            return false;
        }

        var modifyRecordID = parseInt(checkboxSelectedID);

        var modify_role_name = $("#modifyRoleName").val();
        console.log(modify_role_name);

        var modifyRoleEnableVal = $("#modifyRoleEnable").find("option:selected").val();
        var modify_role_enable = modifyRoleEnableVal;
        console.log(modify_role_enable);

        var modify_role_description = $("#modifyRoleDescription").val();
        console.log(modify_role_description);

        $("#confirmModify").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/role/RoleIsExits', //目标地址
            data : {
                name : modify_role_name
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                if(retInfo.data.length==0||retInfo.data[0].id==modifyRecordID){
                    $.ajax({
                        type : "POST", //用POST方式传输
                        url : '${bath}/role/updateRole', //目标地址
                        data : {
                            id : modifyRecordID,
                            name : modify_role_name,
                            enable : modify_role_enable,
                            description : modify_role_description,
                            //entcode : 100000001
                        },
                        beforeSend: function(jqXHR) {
                            if (undefined != header){
                                jqXHR.setRequestHeader(header, token);
                            }
                        },
                        dataType : "json", //数据格式:JSON
                        success : function(retInfo) {
                            console.log(retInfo);
                            var retCode = retInfo.retCode;
                            if(retCode != 0){
                                $("#confirmModify").button('reset');
                                toastr.error('修改失败！');
                                //改变提示窗位置
                                changeToastr();
                                return false;
                            }
                            else{
                                $("#confirmModify").button('reset');
                                $("input").val("");
                                $("textarea").val("");
                                $('#modifyModal').modal('hide');
                                toastr.success('修改成功！');
                                //改变提示窗位置
                                changeToastr();
                                setTimeout(function(){
                                    refresh();
                                },2000);
                            }
                        }
                    });
                }else{
                    $("#confirmModify").button('reset');
                    toastr.error('角色名已存在！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
            }
        });

    };

    //删除实现方法
    function delRecord(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var delRecordID = parseInt(checkboxSelectedID);

        $("#confirmDelete").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/role/deleteRole', //目标地址
            data : {
                id : delRecordID
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    $("#confirmDelete").button('reset');
                    toastr.error('删除失败！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
                else{
                    $("#confirmDelete").button('reset');
                    $('#deleteModal').modal('hide');
                    toastr.success('删除成功！');
                    //改变提示窗位置
                    changeToastr();
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });
    }

    //刷新实现方法
    function refresh(){
        var search_key = $("#searchKey").val();
        var currentPageNum = parseInt($("#currentPage").text());
        var pageCount=20;
        $("#checkboxSelected").text("");
        $("#tbody").empty();
        $("#loading").css("display","block");
        getRoles(pageCount,currentPageNum,search_key);
    };

    //设置权限按钮添加保存方法
    function setPermissions(id) {
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        //获取菜单资源
        getMenuTree(id);

        $("#confirmSave").attr("onclick","saveSetPermissions("+id+");");
    };

    //设置权限按钮保存方法
    function saveSetPermissions(id){
        $("#confirmSave").button('loading');
        var setPermissionsID = id;
        console.log(setPermissionsID);


        //var count = 0;
        var resourceIdArray = ["1"];
        var obj = $(".tree_content").find("input:checkbox");

        for(t = 0; t < obj.length; t++){
            if(obj[t].checked){
                var resourceID = obj[t].value;
                resourceIdArray.push(resourceID);
            }
        }
        console.log(resourceIdArray);
        var jsonData = JSON.stringify(resourceIdArray);
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/role/roleToResource', //目标地址
            data : {
                roleId : setPermissionsID,
                resourceIds : jsonData
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode=retInfo.retCode;
                if (retCode !=0){
                    $("#confirmSave").button('reset');
                    toastr.success('保存失败！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }else {
                    $("#confirmSave").button('reset');
                    $('#setPermissionsModal').modal('hide');
                    toastr.success('保存成功！');
                    //改变提示窗位置
                    changeToastr();
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });
    };

    //获取菜单方法
    function getMenuTree(id){
        var roleId = id;
        $(".tree_content").empty();

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/menuToResource', //目标地址
            data: {
                roleId : roleId
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

                var retDataChildren = retData.children;
                var retDataLength = retDataChildren.length;

                for(var i = 0; i < retDataLength; i++){
                    var Pname = retDataChildren[i].name;
                    var Pid = retDataChildren[i].id;

                    var treeHtml = "<div class='tree_node'>";
                    treeHtml += "<div class='div_inline'>";
                    treeHtml += "<span class='tree_node_toggle_button'></span></div>";
                    treeHtml += "<div class='div_inline tree_node_parent'>";
                    treeHtml += "<input type='checkbox' class='tree_node_parent_checkbox' value='"+Pid+"'>"+Pname+"";
                    treeHtml += "<div class='tree_node_child'>";

                    var childrenData = retDataChildren[i].children;
                    var childrenDataLength = childrenData.length;
                    for(var k =0 ; k < childrenDataLength; k ++){
                        var Cname = childrenData[k].name;
                        var Cid = childrenData[k].id;
                        if(k==childrenDataLength-1){
                            treeHtml += "<span class='childrenLine' style='background-position: -56px -45px;'></span>";
                            treeHtml += "<input type='checkbox' class='tree_node_child_checkbox'  value='"+Cid+"'><span>"+Cname+"</span><br />";
                        }else {
                            treeHtml += "<span class='childrenLine'></span>";
                            treeHtml += "<input type='checkbox' class='tree_node_child_checkbox' value='"+Cid+"'><span>"+Cname+"</span><br />";
                        }
                    }

                    treeHtml += "</div>";
                    treeHtml += "</div>";
                    treeHtml += "</div>";

                    $(".tree_content").append(treeHtml);
                }

                // 为所有的父节点添加点击事件
                $(".tree_node_parent_checkbox").click(function(){
                    // 获取父节点是否选中
                    var isChange = $(this).prop("checked");
                    if(isChange){ // 如果选中,则父节点下的所有的子节点都选中
                        // 获取当前checkbox节点的兄弟节点下的所有的checkbox子节点选中
                        $(this).next().find(".tree_node_child_checkbox").prop("checked", true);
                    }else{ // 未选中，取消全选
                        // 获取当前checkbox节点的兄弟节点下的所有的checkbox子节点选中
                        $(this).next().find(".tree_node_child_checkbox").removeAttr("checked");
                    }
                });

                // 为所有的子节点添加点击事件
                $(".tree_node_child_checkbox").click(function () {
                    // 获取选中的节点的父节点下的所有子节点选中的数量
                    var length = $(this).parent().find(".tree_node_child_checkbox:checked").length;
                    // 判断当前结点是否选中
                    if($(this).prop("checked")){ // 选中
                        // 如果当前节点选中后,所有的选中节点数量1，选中父节点
                        if(length == 1){
                            // 选中父节点
                            $(this).parent().prev().prop("checked", true);
                        }
                    }else{ // 节点未选中
                        if(length == 0){
                            // 取消父节点的选中状态
                            $(this).parent().prev().removeAttr("checked");
                        }
                    }
                });

                // 为所有的切换按钮添加点击事件
                $(".tree_node_toggle_button").click(function () {
                    // 获取需要隐藏或显示的节点
                    var $toggle_node = $(this).parent().next().find(".tree_node_child");
                    $toggle_node.toggle(); // 切换隐藏或显示
                    // 切换按钮的显示
                    if($toggle_node.is(":visible")){
                        $(this).css("background-position"," -110px -25px");
                        $(this).parent().parent().css("margin-bottom","0");
                    }else{
                        $(this).css("background-position"," -110px -4px");
                        $(this).parent().parent().css("margin-bottom","15px");
                    }
                });
            }
        });
        //选中已经设置的权限
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/role/queryRoleResource', //目标地址
            data : {
                roleId : roleId
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retData=retInfo.data;
                for(var i=0;i<retData.length;i++){
                    var value= retData[i].resourceId;
                    $('#setPermissionsModal input:checkbox[value='+value+']').attr('checked','true');
                }
            }
        });
    };

    //改变提示窗位置
    function changeToastr() {
        var toscrollTop=$(window.parent).scrollTop();//滚动距离
        var documentHeight=$(document).height();//当前iframe总高度
        var percent;
        if(toscrollTop<80){
            percent=(((toscrollTop+170)/documentHeight)*100)+"%";
        }else {
            percent=(((toscrollTop+110)/documentHeight)*100)+"%";
        }
        /* alert(documentHeight)
         alert(percent)*/
        $("#toast-container").css("top",percent);
    }

</script>