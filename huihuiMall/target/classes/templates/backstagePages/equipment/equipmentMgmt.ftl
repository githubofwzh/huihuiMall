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
    <title>设备管理</title>
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

            <span>终端号：</span>
            <input type="text" id="equipmentCodeKey" placeholder="请输入终端号">

            <span style="margin-left: 10px">门店名称：</span>
            <input type="text" id="storeNameKey" placeholder="请输入门店名称">

            <span style="margin-left: 10px">终端状态：</span>
            <select style="width: 10%" id="equipmentStatusSelected">
                <option value="">请选择</option>
                <option value="1">已绑定</option>
                <option value="0">未绑定</option>
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
                    <th width="120">
                        终端号
                    </th>
                    <th width="80">
                        终端状态
                    </th>
                    <th width="150">
                        门店名称
                    </th>
                    <#--<th width="80">
                        门店状态
                    </th>-->
                    <th width="150">
                        门店地址
                    </th>
                    <#--<th width="100">
                        门店注册时间
                    </th>-->
                    <th width="80">
                        店主姓名
                    </th>
                    <#--<th>
                        店主身份证号
                    </th>-->
                    <th width="100">
                        店主手机号
                    </th>
                   <#-- <th width="100">
                        店主状态
                    </th>-->
                    <#--<th width="80">
                        操作
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
                                        <label class="control-label">终端号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="addEquipmentCode">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;color: #444444">取消</button>
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="操作中..." autocomplete="off" onclick="">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--添加弹出面板结束-->

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

<!--解绑弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="unboundModal" tabindex="-1" role="dialog" aria-labelledby="unboundModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="unboundModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 解绑</h4>
                </div>
                <div class="modal-body">
                    确定要解绑选中的1项记录？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmUnbound" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--解绑面板结束-->

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
        var currentPageNum=1;  //当前页数,默认首页为第一页*/

        //获取设备信息
        getEquipmentInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getEquipmentInfos(pageCount,1);
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
                getEquipmentInfos(pageCount,currentPageNum);
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
                getEquipmentInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //添加设备号方法
        $("#confirmAdd").click(function(){

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var equipmentCodeParam = $("#addEquipmentCode").val();
            console.log(equipmentCodeParam);
            if(equipmentCodeParam == ""){
                toastr.error("终端号不能为空！");
                return false;
            }

            $("#confirmAdd").button("loading");

            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/device/addDevice', //目标地址
                data : {
                    deviceCode : equipmentCodeParam
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
                        $("#confirmAdd").button('reset');
                        toastr.error("添加失败！");
                        return false;
                    }
                    else{
                        $("#confirmAdd").button('reset');
                        $("input").val("");
                        $('#addModal').modal("hide");
                        toastr.success("添加成功！");
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
        });

        //新增窗口关闭前清空
        $("#addModal").on("hide.bs.modal", function () {
            $("input").val("");
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

    });

    //获取设备信息方法
    function getEquipmentInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var equipmentCodeKeyParam = $("#equipmentCodeKey").val();
        var storeNameKeyParam = $("#storeNameKey").val();
        var equipmentStatusSelectedParam = $("#equipmentStatusSelected").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/device/queryAllDevice', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                deviceCode : equipmentCodeKeyParam,
                name : storeNameKeyParam,
                bindingStatus : equipmentStatusSelectedParam
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
                    var retData = retInfo.data;
                    console.log(retData);
                    var retDataLength = retData.length;

                    $("#Tbody").empty();

                    for(var i = 0; i < retDataLength; i ++){
                        var index = i + 1;
                        var id = retData[i].id;
                        var deviceCode = retData[i].device_code;
                        var bindingStatus = retData[i].binding_status;
                        var storeName = retData[i].name;
                        var storeAddress = retData[i].address;
                        var shopkeeperName = retData[i].shopkeepername;
                        var shopkeeperPhone = retData[i].phone_number;

                        var tbodyHtml = "<tr>";

                        if(bindingStatus == 1){
                            tbodyHtml += "<td><input type='checkbox' class='mycheckbox' disabled='disabled'/></td>";
                        }else{
                            tbodyHtml += "<td><input type='checkbox' id='"+id+"' class='mycheckbox'/></td>";
                        }

                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+deviceCode+"</td>";
                        if(bindingStatus == 1){
                            tbodyHtml += " <td class='bindings'>已绑定</td>";
                        }else{
                            tbodyHtml += " <td class='unbound'>未绑定</td>";
                        }

                        if(bindingStatus == 1){
                            tbodyHtml += "<td>"+storeName+"</td>";
                        }else{
                            tbodyHtml += "<td></td>";
                        }

                        if(bindingStatus == 1){
                            tbodyHtml += "<td>"+storeAddress+"</td>";
                        }else{
                            tbodyHtml += "<td></td>";
                        }

                        if(bindingStatus == 1){
                            tbodyHtml += "<td>"+shopkeeperName+"</td>";
                        }else{
                            tbodyHtml += "<td></td>";
                        }

                        if(bindingStatus == 1){
                            tbodyHtml += "<td>"+shopkeeperPhone+"</td>";
                        }else{
                            tbodyHtml += "<td></td>";
                        }

                        /*tbodyHtml += "<td>";
                        if(bindingStatus == 1){
                            tbodyHtml += "<button type='button' class='btn btn-default' id='"+id+"' data-toggle='modal' data-target='#unboundModal' style='margin: 0px' onclick='openUnboundModal(id,\""+deviceCode+"\");'>解绑</button>";
                        }else{
                            tbodyHtml += "<button type='button' class='btn btn-default disabled' style='margin: 0px'>解绑</button>";
                        }

                        tbodyHtml += "</td>";*/
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

    //删除设备实现方法
    function delRecord(equipmentId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var equipmentIdParam = equipmentId;

        $("#confirmDelete").button("loading");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/device/deleteDevice', //目标地址
            data : {
                id : equipmentIdParam
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
                    $('#deleteModal').modal("hide");
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

    //解绑弹窗
    function openUnboundModal(id,deviceCode){

        var equipmentId = id;
        var equipmentCode = deviceCode;

        $("#confirmUnbound").attr("onclick","unbound('"+equipmentId+"','"+equipmentCode+"')");

    }

    //解绑方法
    function unbound(equipmentId,equipmentCode){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var equipmentIdParam = equipmentId;
        console.log(equipmentIdParam);

        var equipmentCodeParam = equipmentCode;
        console.log(equipmentCodeParam);

        var equipmentStatusParam = 0;

        $("#confirmUnbound").button("loading");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/device/updateDevice', //目标地址
            data : {
                id : equipmentIdParam,
                deviceCode : equipmentCodeParam,
                bindingStatus : equipmentStatusParam
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
                    $("#confirmUnbound").button('reset');
                    toastr.error("解绑失败！");
                    return false;
                }
                else{
                    $("#confirmUnbound").button('reset');
                    $('#unboundModal').modal("hide");
                    toastr.success("解绑成功！");
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
        $("#equipmentCodeKey").val("");
        $("#storeNameKey").val("");
        $("#equipmentStatusSelected option:first").prop("selected", "selected");
        $("#checkboxSelected").text("");
        $("#loading").css("display","block");
        getEquipmentInfos(pageCount,currentPageNum);
    }

</script>
