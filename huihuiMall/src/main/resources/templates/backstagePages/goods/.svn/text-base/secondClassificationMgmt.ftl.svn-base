<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>二级分类管理</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/form/form.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/table/table.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/upload/uploadpic.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/checkbox_radio_select.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pagination.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/button.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/imgJS/swipebox/swipebox.min.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common.js" type="text/javascript" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/imgJS/JIC.min.js" type="text/javascript"></script>
    <script src="${bath}/js/imgJS/swipebox/jquery.swipebox.min.js" type="text/javascript"></script>

</head>
<body>

<div class="container-fluid btn-operation-panel" style="margin: 20px 0px">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span>一级分类名称：</span>
            <select style="width: 10%" id="classifySelected">

            </select>

            <#--暂时隐藏搜索功能-->
            <#--<span style="margin-left: 10px">二级分类名称：</span>
            <input type="text" id="searchKey" placeholder="请输入二级分类名称">

            <button type="button" class="btn btn-default" id="searchBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>-->

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">

            <div class="col-lg-12 col-md-12 col-xs-12 btn-group-panel">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editModal" id="addBtn">
                    <i class="fa fa-plus fa-fw"></i> 添加</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editModal" id="modifyBtn">
                    <i class="fa fa-edit fa-fw"></i> 修改</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteModal" id="deleteBtn">
                    <i class="fa fa-trash-o fa-fw"></i> 删除</button>
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
                        二级分类名称
                    </th>
                    <th>
                        所属一级分类
                    </th>
                    <th>
                        排序
                    </th>
                    <th width="200">
                        二级分类图片
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

<!--添加、修改弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="editModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">所属一级分类：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="editFirstClassify">

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">二级分类名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="editSecondClassifyName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">排序：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="editSort">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">二级分类图片：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <div class="col-lg-12 col-md-12 col-xs-12 upload-panel" >
                                            <div class="col-lg-12 col-md-12 col-xs-12 upload">
                                                <div class="col-lg-3 col-md-3 col-xs-3" id="uploadForm" style="padding: 0px">
                                                    <a class="col-lg-3 col-md-3 col-xs-3 pic-upload-gp" href="javascript:void(0);">
                                                        <span></span>
                                                        <input id="uploadPic" name="upfile"  type="file" accept="image/*" >
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmEdit" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加、修改弹出面板结束-->

<!--删除弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="deleteModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 删除</h4>
                </div>
                <div class="modal-body">
                    确定要删除选中的1项记录？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmDelete" data-loading-text="删除中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--删除面板结束-->

<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var imagePath = "";

    //分页方法
    var pageCount=20;   //每页条数
    var currentPageNum=1;  //当前页数,默认首页为第一页

    $(document).ready(function() {

        $("#loading").css("display","block");

        //获取一级分类信息
        getFirstClassifyList();

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getSecondClassifyInfos(pageCount,1);
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
                getSecondClassifyInfos(pageCount,currentPageNum);
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
                getSecondClassifyInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //添加modal打开
        $("#addBtn").click(function(){
            var addParam = 0;
            addOrEdit(addParam);
        });

        //修改modal打开
        $("#modifyBtn").click(function(){

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                toastr.error("请选择一条要修改的记录！");
                return false;
            }
            else{
                /*$("#editModal").toggle();
                $("#confirmEdit").attr("onclick","addOrEdit("+checkboxSelectedID+");");*/
                var editParam = checkboxSelectedID;
                addOrEdit(editParam);
            }
        });

        //新增、修改Modal关闭清空未提交数据
        $("#editModal").on("hide.bs.modal", function () {
            $("input").val("");
            $("#editFirstClassify option:first").prop("selected", "selected");
            $(".item-pic").remove();
            uploadForm.show();
            imagePath = "";
        });

        //删除点击
        $("#deleteBtn").click(function(){

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                toastr.error("请选择一条要删除的记录！");
                return false;
            }
            else{
                $("#deleteModal").toggle();
                $("#confirmDelete").attr("onclick","delRecord("+checkboxSelectedID+");");
            }
        });

        //一级分类变化事件
        $("#classifySelected").change(function(){
            //获取二级分类信息
            getSecondClassifyInfos(pageCount,currentPageNum);
        });
    });

    //获取信息方法
    function getSecondClassifyInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var searchKeyParam = $("#searchKey").val();
        var classifySelectedParam = $("#classifySelected").find("option:selected").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/queryAllCategoryTwo', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                name : searchKeyParam,
                parentId : classifySelectedParam
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
                        var name = retData[i].name;
                        var sort = retData[i].sort;
                        var pname = retData[i].oneName;
                        var imagePath = retData[i].image;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox'' id='"+id+"' class='mycheckbox'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+name+"</td>";
                        tbodyHtml += "<td>"+pname+"</td>";
                        tbodyHtml += "<td>"+sort+"</td>";
                        tbodyHtml += "<td><a href='${bath}/"+imagePath+"' class='swipebox'><img src='${bath}/"+imagePath+"' alt='' style='width:80px;height:80px'/></a></td>";
                        tbodyHtml += "</tr>";

                        $("#Tbody").append(tbodyHtml);
                    }

                    $(".swipebox").swipebox();

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

    //添加、修改方法
    function addOrEdit(editType){

        var editTypeParam = editType;

        if(editTypeParam == 0){
            $("#editModalLabel").html("<i class='fa fa-plus fa-fw'></i> 添加");
            editGetFirstClassifyList(0);
            $("#confirmEdit").attr("onclick","addSecondClassify();");
        }else{

            $("#editModalLabel").html("<i class='fa fa-edit fa-fw'></i> 修改");

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/productMgmt/getCategoryDetailById', //目标地址
                data : {
                    id : editTypeParam
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
                        var retData = retInfo.data;
                        console.log(retData);
                        var firstClassifyId = retData.categoryOne.id;
                        console.log(firstClassifyId);

                        var secondClassifyInfo = retData.categoryTwo;
                        var secondClassName = secondClassifyInfo.name;
                        var secondClassSort = secondClassifyInfo.sort;
                        var secondClassImagePath = secondClassifyInfo.image;

                        editGetFirstClassifyList(firstClassifyId);

                        $("#editSecondClassifyName").val(secondClassName);
                        $("#editSort").val(secondClassSort);

                        uploadForm.hide();

                        var imgsHtml = "";
                        if(secondClassImagePath == "" || secondClassImagePath == null){
                            imgsHtml += "<span class='col-lg-3 col-md-3 col-xs-3 item-pic' id='imgbox0' style='width:80px;height:80px'>";
                            imgsHtml += "<img class='' src='${bath}"+"/images/common/default-pic.png' id='0'><span class='pic-del'></span>";
                            imgsHtml += "</span>";

                            $(".upload").append(imgsHtml);

                            imagePath = "";
                        }else{
                            imgsHtml += "<span class='col-lg-3 col-md-3 col-xs-3 item-pic' id='imgbox0' style='width:80px;height:80px'>";
                            imgsHtml += "<img class='' src='${bath}/"+secondClassImagePath+"' id='0'><span class='pic-del'></span>";
                            imgsHtml += "</span>";

                            $(".upload").append(imgsHtml);

                            imagePath = secondClassImagePath;
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

            $("#confirmEdit").attr("onclick","editSecondClassify("+editTypeParam+");");
        }
    }

    //添加实现方法
    function addSecondClassify(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var addFirstClassifyIdParam = $("#editFirstClassify").find("option:selected").val();

        var addSecondClassifyNameParam = $("#editSecondClassifyName").val();
        if(addSecondClassifyNameParam == ""){
            toastr.error("二级分类名称不能为空！");
            return false;
        }

        var addSortParam = $("#editSort").val();
        if(addSortParam == ""){
            toastr.error("排序不能为空！");
            return false;
        }

        var addImagePathParam = imagePath;
        if(addImagePathParam == ""){
            toastr.error("二级分类图片不能为空！");
            return false;
        }

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/addCategoryTwo', //目标地址
            data : {
                parentId : addFirstClassifyIdParam,
                name : addSecondClassifyNameParam,
                sort : addSortParam,
                image : addImagePathParam
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
                    $("#confirmEdit").button("reset");
                    toastr.error("添加失败！");
                    return false;
                }else{
                    $("#confirmEdit").button("reset");
                    $("input").val("");
                    $("#editFirstClassify option:first").prop("selected", "selected");
                    $("#editModal").modal("hide");
                    toastr.success("添加成功！");
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

    //修改实现方法
    function editSecondClassify(recordId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var recordIdParam = recordId;
        console.log(recordIdParam);

        var modifyFirstClassifyIdParam = $("#editFirstClassify").find("option:selected").val();

        var modifySecondClassifyNameParam = $("#editSecondClassifyName").val();
        if(modifySecondClassifyNameParam == ""){
            toastr.error("二级分类名称不能为空！");
            return false;
        }

        var modifySortParam = $("#editSort").val();
        if(modifySortParam == ""){
            toastr.error("排序不能为空！");
            return false;
        }

        var modifyImagePathParam = imagePath;
        if(modifyImagePathParam == ""){
            toastr.error("二级分类图片不能为空！");
            return false;
        }

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/updateCategoryTwo', //目标地址
            data : {
                id : recordIdParam,
                parentId : modifyFirstClassifyIdParam,
                name : modifySecondClassifyNameParam,
                sort : modifySortParam,
                image : modifyImagePathParam
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
                    $("#confirmEdit").button("reset");
                    toastr.error("修改失败！");
                    return false;
                }else{
                    $("#confirmEdit").button("reset");
                    $("input").val("");
                    $("#editFirstClassify option:first").prop("selected", "selected");
                    $("#editModal").modal("hide");
                    toastr.success("修改成功！");
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

    //删除二级分类实现方法
    function delRecord(recordId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var recordIdParam = recordId;

        $("#confirmDelete").button("loading");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/deleteCategoryTwo', //目标地址
            data : {
                id : recordIdParam
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
                    toastr.error("删除失败！");
                    return false;
                }
                else{
                    $("#confirmDelete").button('reset');
                    $("#deleteModal").modal("hide");
                    toastr.success("删除成功！");
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

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#classifySelected option:first").prop("selected", "selected");
        $("#checkboxSelected").text("");
        $("#loading").css("display","block");
        getSecondClassifyInfos(pageCount,currentPageNum);
    }

    //获取一级分类列表方法
    function getFirstClassifyList(){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getCategoryOneList', //目标地址
            data : {},
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

                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#classifySelected").empty();

                    /*var defaultClassifySelectedHtml = "<option value=''>请选择</option>";
                    $("#classifySelected").append(defaultClassifySelectedHtml);*/

                    for(var fc = 0; fc < retDataLength; fc++){

                        var id = retData[fc].id;
                        var name = retData[fc].name;

                        var classifySelectedHtml = "<option value='"+id+"'>"+name+"</option>";

                        $("#classifySelected").append(classifySelectedHtml);
                    }

                    //获取二级分类信息
                    getSecondClassifyInfos(pageCount,currentPageNum);
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

    //添加、编辑获取一级分类列表方法
    function editGetFirstClassifyList(classifyId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var classifyIdParam = classifyId;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getCategoryOneList', //目标地址
            data : {},
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

                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#editFirstClassify").empty();

                    for(var efc = 0; efc < retDataLength; efc++){

                        var id = retData[efc].id;
                        var name = retData[efc].name;

                        if(classifyIdParam == 0){
                            var selectedForAddHtml = "<option value='"+id+"'>"+name+"</option>";
                            $("#editFirstClassify").append(selectedForAddHtml);
                        }else{
                            var selectedForEditHtml = "";
                            if(classifyIdParam == id){
                                selectedForEditHtml += "<option value='"+id+"' selected='selected'>"+name+"</option>";
                            }else{
                                selectedForEditHtml += "<option value='"+id+"'>"+name+"</option>";
                            }
                            $("#editFirstClassify").append(selectedForEditHtml);
                        }

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

    //上传图片
    var upload = $(".upload");
    var uploadBtn = $("#uploadPic");
    var uploadForm = $("#uploadForm");
    var picHtml = "";

    uploadBtn.change(function() {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var file = document.getElementById('uploadPic').files[0];  //获取到上传控件对象files

        if (file) {

            var reader = new FileReader();  //创建一个FileReader对象

            reader.readAsDataURL(file);      //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
            reader.onload = function(e){      //当文件成功读取后

                var imgId = $(".upload").find("span").find("img").length;
                picHtml = "<span class='col-lg-3 col-md-3 col-xs-3 item-pic' id='imgbox"+imgId+"' style='width:80px;height:80px'><img class='' src='" + this.result + "' id='" + imgId + "'><span class='pic-del'></span></span>";

                if (upload.find('.item-pic').length >= 0) {
                    uploadForm.hide()
                } else {
                    uploadForm.show();
                }
                uploadForm.before(picHtml);

                $("#loading").css("display","block");

                var imgPath = "";
                var i = document.getElementById(imgId);
                i.src = event.target.result;

                setTimeout(function () {
                    var quality = 70; //图像压缩比，越小压缩越多
                    i.src = jic.compress(i, quality).src;
                    imgPath = i.src;
                    jQuery.ajax({
                        type : "POST", //用POST方式传输
                        url : '${bath}/fileUpload', //目标地址
                        data : {
                            data : imgPath
                        },
                        dataType : "json", //数据格式:JSON
                        success : function(uploadRet) {
                            console.log(uploadRet);
                            var uploadRetCode = uploadRet.retCode;
                            if(uploadRetCode !=0){

                                $("#loading").css("display","none");

                                $("#uploadPic").val("");
                                toastr.error('上传失败！');
                                return false;
                            }
                            else{

                                $("#loading").css("display","none");

                                $("#uploadPic").val("");
                                toastr.success('上传成功！');

                                var retImgPath= uploadRet.data;
                                imagePath = retImgPath;
                                console.log(imagePath);
                            }
                        },
                        error:function(XMLHttpRequest, textStatus){
                            console.log(XMLHttpRequest);
                            console.log(textStatus);
                            $("#loading").css("display","none");
                            toastr.error('上传失败！');
                            return false;
                        }
                    });
                },1000);
            }
        }
    });

    //删除上传图片
    $('.upload').delegate(".pic-del", "click", function() {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var self = $(this);
        var id = parseInt(self.parent().find("img").attr("id"));
        imagePath = "";

        self.parents(".item-pic").remove();
        uploadForm.show();

        toastr.success('删除成功！');
    });

</script>
