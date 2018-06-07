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

    <title>企业账号审核管理</title>
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="${bath}/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<#--common CSS-->
    <link href="${bath}/css/common/checkBox_radio.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/zoomify.min.css" rel="stylesheet" type="text/css" />
<#--tip CSS-->
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css" />

    <!-- jQuery -->
    <script src="${bath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common/zoomify.js" type="text/javascript"></script>
    <style>
        #auditModal .modal-dialog {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
        }

        #auditModal .modal-content {
            /*overflow-y: scroll;*/
            position: absolute;
            top: 0;
            bottom: 80px;
            width: 100%;
        }

        #auditModal .modal-body {
            overflow-y: scroll;
            position: absolute;
            top: 55px;
            bottom: 72px;
            width: 100%;
        }

        #auditModal .modal-footer {
            position: absolute;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

<!--顶部title与面包屑开始-->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-9 col-md-9" style="padding-left: 0px">
                <h3 class="page-header">
                    审核管理
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;企业管理</li>
                    <li class="active">审核管理</li>
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
            <div class="col-lg-2 col-md-3" style="margin: 20px 0px; float: right">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="请输入企业名称" id="searchKey">
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
                                            <lable id="checkboxSelected" style="display:none"></lable>
                                            <lable id="forUserId" style="display:none"></lable>
                                            <thead>
                                            <tr role="row">
                                                <th style="width: 20px;">
                                                </th>
                                                <th style="width: 50px;">
                                                    序号
                                                </th>
                                                <th style="width: 120px;">
                                                    账号
                                                </th>
                                                <th style="width: 220px;">
                                                    企业名称
                                                </th>
                                                <th style="width: 120px">
                                                    联系电话
                                                </th>
                                                <th style="width: 250px;">
                                                    地址
                                                </th>
                                                <th style="width: 70px;">
                                                    查看详情
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
                                        <#--<label>
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
                                            显示<lable id="itemSize"></lable>项结果，共<label id="totalItem"></label>项，
                                            当前<label id="currentPage"></label>/<label id="totalPages"></label>页
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

<!--审核弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="auditModal" tabindex="-1" role="dialog" aria-labelledby="auditModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="modifyModalLabel">
                        <i class="fa fa-check-square-o fa-fw"></i>审核</h4>
                </div>
                <label for="" id="entCode" style="display: none;"></label>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            账户名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" disabled="disabled" id="modifyaccountName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            联系邮箱：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="modifyemail" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            企业名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="modifyenterPrisename" disabled="disabled">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            注册地址：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="modifyregisterAdress" disabled="disabled" >
                                    </div>
                                </div>
                            </div>
                        <#--<div class="col-lg-12 col-md-12 input-form">
                            <div class="col-lg-12 col-md-12 _padding">
                                <div class="col-lg-3 col-md-3 title">
                                    <label class="control-label">
                                        注册金额：</label>
                                </div>
                                <div class="col-lg-7 col-md-7 input-box">
                                    <input type="text" class="form-control" placeholder="必填" id="modifyregisterMoney">
                                </div>
                            </div>
                        </div>-->
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            营业执照号：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="modifybusinessLicensenum"disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            法人姓名：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="modifylegalPersonname" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            法人联系方式：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="modifylegalPersonphone" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            联系人姓名：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="modifycontactPersonname" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            联系人电话：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control required" id="modifycontactPersonphone"disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12">
                                    <!--身份证正面选择-->
                                    <div class="col-lg-6 col-md-6 padding_left">
                                        <span class="picture_title">身份证正面：</span>
                                        <ul id="idfrontShowBox" class="showBox">
                                            <p class="init-img">
                                                <label for="idfrontBtn">
                                                    <img class="sfzzm" src="${bath}/images/IDcardfront.png"/>
                                                </label>
                                            </p>
                                        </ul>
                                        <input type="file" id="idfrontBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn" disabled="disabled"/>
                                    </div>
                                    <!--营业执照选择-->
                                    <div class="col-lg-5 col-md-5">
                                        <span class="picture_title">营业执照照片：</span>
                                        <ul id="licenseShowBox" class="showBox">
                                            <p class="init-img">
                                                <label for="licenseBtn">
                                                    <img class="yyzz" src="${bath}/images/businessLicense.png"/>
                                                </label>
                                            </p>
                                        </ul>
                                        <input type="file" id="licenseBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn" disabled="disabled"/>
                                    </div>
                                    <!--身份证反面选择-->
                                    <div class="col-lg-11 col-md-11 padding_left">
                                        <span class="picture_title">身份证反面：</span>
                                        <ul id="IDcardshowBox" class="showBox">
                                            <p class="init-img">
                                                <label for="IDcardBtn">
                                                    <img class="sfzfmId" src="${bath}/images/IDcardbase.png"/>
                                                </label>
                                            </p>
                                        </ul>
                                        <input type="file" id="IDcardBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn" disabled="disabled"/>
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
                    <button type="button" class="btn btn-default" data-loading-text="拒绝中..." id="confirmNo"  style="
                            margin-top: 0">
                        不通过</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmYes" data-loading-text="通过中..." autocomplete="off">
                        通过</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--审核面板结束-->

<#--数据加载loading开始-->
<div id="loading" class="loading">数据加载中...</div>
<#--数据加载loading结束-->

</body>
</html>

<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ready(function() {
        //审核时点击查看大图
        $('#auditModal').on('shown.bs.modal', function (e) {
            $('.imgs img').zoomify();
        });

        /*$("#loading").css("display","block");*/

        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页
        var search_key = $("#searchKey").val();

        //获取企业账号信息
        getAuditcount(pageCount,currentPageNum,search_key);


        //搜索点击
        $("#searchBtn").click(function(){
            var search_key = $("#searchKey").val();
            $("#tbody").empty();
            $("#loading").css("display","block");
            getAuditcount(pageCount,1,search_key);
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
                getAuditcount(pageCount,currentPageNum,search_key);
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
                getAuditcount(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });

    });

    //获取审核信息方法
    function getAuditcount(pageCount,currentPageNum,search_key){
        $("#currentPage").html(currentPageNum);
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/queryNotAuditCompanies', //目标地址
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

                var retData = retInfo.data;
                if(retData == null){
                    toastr.error('获取数据失败！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }else{
                    $("#tbody").empty();
                    var retDataLength = retData.length;
                    for(var i = 0; i < retDataLength; i++){
                        var index = i + 1;
                        var accountID = retData[i].id;
                        var account = retData[i].userAcount;
                        var accountNmae = retData[i].name;
                        var accountLinkman_mobile = retData[i].linkmanMobile;
                        var accountRegist_address = retData[i].registAddress;
                        var accountEnable=retData[i].enable;
                        var accountUserId=retData[i].userId;
                        var accountauditStatus=retData[i].auditStatus;

                        var trHtml = "<tr class='gradeA odd' role='row' id='tr"+accountID+"'>";
                        trHtml += "<td><input type='checkbox' class='checkbox' id='"+accountID+"' name='"+accountUserId+"' /></td>";
                        trHtml += "<td>"+index+"</td>";
                        if(account != null){
                            trHtml += "<td>"+account+"</td>";
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(accountNmae != null){
                            if(accountNmae.length > 14){
                                var subAccountName = accountNmae.substring(0,14);
                                trHtml += "<td>"+subAccountName+"...</td>";
                            }else{
                                trHtml += "<td>"+accountNmae+"</td>";
                            }

                        }else{
                            trHtml += "<td></td>";
                        }
                        if(accountLinkman_mobile != null){
                            trHtml += "<td>"+accountLinkman_mobile+"</td>";
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(accountRegist_address != null){
                            if(accountRegist_address.length > 16){
                                var subAccountRegistAddress = accountRegist_address.substring(0,16);
                                trHtml += "<td>"+subAccountRegistAddress+"...</td>";
                            }else{
                                trHtml += "<td>"+accountRegist_address+"</td>";
                            }
                        }else{
                            trHtml += "<td></td>";
                        }
                        if(accountauditStatus != null){
                            if(accountauditStatus==2){
                                trHtml += "<td><a href='javascript:void(0)' class='aLink' disabled='disabled'>已拒绝</a></td>";
                            }else{
                                trHtml += "<td><a href='javascript:void(0)' class='aLink' onclick='toAudit("+accountID+")'>审核</a></td>";
                            }
                        }else{
                            trHtml += "<td></td>";
                        }
                        trHtml += "</tr>";

                        $("#tbody").append(trHtml);

                        //获取表格中checkbox的选中值
                        $(".checkbox").on("click", function() {
                            if ($(this).prop("checked")) {
                                $(".checkbox").prop("checked", false);
                                $(this).prop("checked", true);
                                var checkboxID = $(this).attr("id");
                                var userId=$(this).attr("name");
                                $("#checkboxSelected").text(checkboxID);
                                $("#forUserId").text(userId);
                            }
                            else {
                                $("#checkboxSelected").text("");
                                $("#forUserId").text("");
                            }
                        });
                    }
                }
            }
        });
    };

    /*点击审核*/
    function toAudit(infoID) {
        $('#auditModal').modal('show');
        $("#auditId").text(infoID);
        //信息查询
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/viewCompany', //目标地址
            data : {
                id : infoID
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                var retData=retInfo.data;
                console.log(retInfo);
                $("#modifyaccountName").val(retData.userAcount)
                $("#_modifypassword").val(retData.userPassword);
                $("#modifyemail").val(retData.email);
                $("#modifyenterPrisename").val(retData.name);
                $("#entCode").text(retData.entCode);
                $("#modifyregisterAdress").val(retData.registAddress);
                /*$("#modifyregisterMoney").val(retData.registAmount);*/
                $("#modifybusinessLicensenum").val(retData.businessLicence);
                $("#modifylegalPersonname").val(retData.legalPersonName);
                $("#modifylegalPersonphone").val(retData.legalPersonContact);
                $("#modifycontactPersonname").val(retData.linkmanName);
                $("#modifycontactPersonphone").val(retData.linkmanMobile);

                var idCardFrontHtml = '<li> <p class="imgs"><img src="${bath}' + retData.linkmanIdcardfrontPhoto + '" alt=""/></p> </li>';
                $('#idfrontShowBox').find('.init-img').hide();
                $('#idfrontShowBox').find("li").remove();
                $('#idfrontShowBox').append(idCardFrontHtml);

                var idCardBaseHtml = '<li> <p class="imgs"><img src="${bath}' + retData.linkmanIdcardbasePhoto + '" alt=""/></p> </li>';
                $('#IDcardshowBox').find('.init-img').hide();
                $('#IDcardshowBox').find("li").remove();
                $('#IDcardshowBox').append(idCardBaseHtml);

                var BusinesslicenseHtml = '<li> <p class="imgs"><img src="${bath}' + retData.businessLicensePhoto + '" alt=""/></p> </li>';
                $('#licenseShowBox').find('.init-img').hide();
                $('#licenseShowBox').find("li").remove();
                $('#licenseShowBox').append(BusinesslicenseHtml);
            }
        });
        $("#confirmNo").attr("onclick","auditSend("+infoID+",'2');");
        $("#confirmYes").attr("onclick","auditSend("+infoID+",'1');");
    }
    /*通过或者拒绝*/
    function auditSend(infoID,status) {
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/updateCompanyAuditStatus', //目标地址
            data : {
                id : infoID,
                auditStatus:status,
                entCode:$("#entCode").text()
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                var retData=retInfo.data;
                console.log(retInfo);
                $('#auditModal').modal('hide');

                if (status==2){
                    toastr.error('已拒绝！');
                    //改变提示窗位置
                    changeToastr();
                }else{
                    toastr.success('已通过！');
                    //改变提示窗位置
                    changeToastr();
                }
                setTimeout(function () {
                    refresh();
                },2000)

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
        getAuditcount(pageCount,currentPageNum,search_key);
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


    //分页选择显示几条结果触发开始
    /*$("#selectPageSize").change(function(){
        selectChange();
    });*/

    //分页选择显示几条结果方法开始
    /*function selectChange() {
        var selectText = $("#selectPageSize").find("option:selected").text();
        console.log(selectText);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '', //目标地址
            data : {

            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
            }
        });
    };*/

</script>