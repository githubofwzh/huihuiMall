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

    <title>企业账号</title>
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
    <script src="${bath}/js/jquery-validate.js" type="text/javascript"></script>
    <script src="${bath}/js/JIC.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common/zoomify.js" type="text/javascript"></script>
    <style>
        #modifyModal .modal-dialog {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
        }

        #modifyModal .modal-content {
            /*overflow-y: scroll;*/
            position: absolute;
            top: 0;
            bottom: 80px;
            width: 100%;
        }

        #modifyModal .modal-body {
            overflow-y: scroll;
            position: absolute;
            top: 55px;
            bottom: 72px;
            width: 100%;
        }

        #modifyModal .modal-footer {
            position: absolute;
            width: 100%;
            bottom: 0;
        }

        #seeModal .modal-dialog {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
        }

        #seeModal .modal-content {
            /*overflow-y: scroll;*/
            position: absolute;
            top: 0;
            bottom: 80px;
            width: 100%;
        }

        #seeModal .modal-body {
            overflow-y: scroll;
            position: absolute;
            top: 55px;
            bottom: 72px;
            width: 100%;
        }

        #seeModal .modal-footer {
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
                    企业账号管理
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;企业管理</li>
                    <li class="active">企业账号</li>
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
               <#-- <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal">
                    <i class="fa fa-plus fa-fw"></i>添加</button>-->
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyModal" id="modifyBtn">
                    <i class="fa fa-edit fa-fw"></i>修改</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#stopModal" id="stopBtn">
                    <i class="fa fa-ban"></i> 禁用</button>
                   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#startModal" id="startBtn">
                       <i class="fa fa-play"></i> 启用</button>
                <button type="button" class="btn btn-default" onclick="refresh();">
                    <i class="fa fa-refresh fa-fw"></i>刷新</button>
            </div>
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
                                                    状态
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
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            账户名称：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="accountName">
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
                                        <input type="text" class="form-control" placeholder="必填" id="email">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            密码：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="_password">
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
                                        <input type="text" class="form-control" placeholder="必填" id="enterPrisename">
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
                                        <input type="text" class="form-control" placeholder="必填" id="registerAdress">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            注册金额：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="registerMoney">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            营业执照号：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" placeholder="必填" id="businessLicensenum">
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
                                        <input type="text" class="form-control" placeholder="必填" id="legalPersonname">
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
                                        <input type="text" class="form-control" placeholder="必填" id="legalPersonphone">
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
                                        <input type="text" class="form-control" placeholder="必填" id="contactPersonname">
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
                                        <input type="text" class="form-control" placeholder="必填" id="contactPersonphone">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            营业执照照片：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="col-lg-9 col-md-9 title">
                                            <input type="text" class="form-control" placeholder="必填" id="businessLicensepicture">
                                        </div>
                                        <div class="col-lg-2 col-md-2" style="border: 0;">
                                            <input type="file"  id="" name="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-6 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            企业logo：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="col-lg-9 col-md-9 title">
                                            <input type="text" class="form-control" placeholder="必填" id="enterPriselogo">
                                        </div>
                                        <div class="col-lg-2 col-md-2" style="border: 0">
                                            <input type="file"  id="" name="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            联系人身份证照片：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="col-lg-9 col-md-9 title">
                                            <input type="text" class="form-control" placeholder="必填" id="contactPersonIDpicture">
                                        </div>
                                        <div class="col-lg-2 col-md-2" style="border: 0;">
                                            <input type="file"  id="" name="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-12 col-md-3 title">
                                        <label class="control-label">
                                            联系人手持身份证：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <div class="col-lg-9 col-md-9 title">
                                            <input type="text" class="form-control" placeholder="必填" id="contactPersonhaspicture">
                                        </div>
                                        <div class="col-lg-2 col-md-2" style="border: 0;">
                                            <input type="file"  id="" name="">
                                        </div>
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
                    <button type="button" class="btn btn-default" id="confirmAdd" style="margin-top: 0px" data-loading-text="提交中..." autocomplete="off" onclick="addEnteraccount();">
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
                <label for="" class="idFrontLabel" style="display: none;"></label>
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
                                        <input type="text" class="form-control" placeholder="必填" id="modifyemail" data-valid="isNonEmpty||isEmail" data-error="联系人邮箱不能为空||请正确输入邮箱">
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
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyenterPrisename" data-valid="isNonEmpty" data-error="企业名称不能为空" >
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
                                        <input type="text" class="form-control" placeholder="必填" id="modifyregisterAdress" data-valid="isNonEmpty" data-error="注册地址不能为空" >
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
                                        <input type="text" class="form-control required" placeholder="必填" id="modifybusinessLicensenum" data-valid="isNonEmpty" data-error="营业执照号不能为空" >
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
                                        <input type="text" class="form-control required" placeholder="必填" id="modifylegalPersonname" data-valid="isNonEmpty" data-error="法人姓名不能为空" >
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
                                        <input type="text" class="form-control required" placeholder="必填" id="modifylegalPersonphone" data-valid="isNonEmpty||isMobile" data-error="法人联系方式不能为空||请正确输入手机号">
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
                                        <input type="text" class="form-control required" placeholder="必填" id="modifycontactPersonname" data-valid="isNonEmpty" data-error="联系人姓名不能为空">
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
                                        <input type="text" class="form-control required" placeholder="必填" id="modifycontactPersonphone" data-valid="isNonEmpty||isMobile" data-error="联系人电话不能为空||请正确输入电话" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <lable id="entCode" style="display:none"></lable>
                                <div class="col-lg-12 col-md-12">
                                    <!--身份证正面选择-->
                                    <div class="col-lg-6 col-md-6 padding_left">
                                        <span class="picture_title">身份证正面：</span>
                                        <ul id="idfrontShowBox" class="showBox">
                                            <p class="init-img">
                                                <label for="idfrontBtn">
                                                    <img class="sfzzm" src="images/IDcardfront.png"/>
                                                </label>
                                                <input type="file" id="idfrontBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn required" data-valid="isNoEmpty" data-error="请上传身份证正面照片"/>
                                            </p>
                                        </ul>
                                    </div>
                                    <!--营业执照选择-->
                                    <div class="col-lg-5 col-md-5">
                                        <span class="picture_title">营业执照照片：</span>
                                        <ul id="licenseShowBox" class="showBox">
                                            <p class="init-img">
                                                <label for="licenseBtn">
                                                    <img class="yyzz" src="images/businessLicense.png"/>
                                                </label>
                                                <input type="file" id="licenseBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn required" data-valid="isNoEmpty" data-error="请上传营业执照照片"/>
                                            </p>
                                        </ul>
                                    </div>
                                    <!--身份证反面选择-->
                                    <div class="col-lg-11 col-md-11 padding_left">
                                        <span class="picture_title">身份证反面：</span>
                                        <ul id="IDcardshowBox" class="showBox">
                                            <p class="init-img">
                                                <label for="IDcardBtn">
                                                    <img class="sfzfmId" src="images/IDcardbase.png"/>
                                                </label>
                                                <input type="file" id="IDcardBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn required" data-valid="isNoEmpty" data-error="请上传身份证反面照片"/>
                                            </p>
                                        </ul>
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
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmModify" data-loading-text="修改中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--修改面板结束-->

<!--禁用弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="stopModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="deleteModalLabel">
                        <i class="fa fa-ban fa-fw"></i>禁用</h4>
                </div>
                <div class="modal-body">
                    确定要禁用选中的1条记录？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmStop" data-loading-text="禁用中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--禁用面板结束-->

<!--启用弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="startModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="deleteModalLabel">
                        <i class="fa fa-play"></i>启用</h4>
                </div>
                <div class="modal-body">
                    确定要启用选中的1条记录？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmStart" data-loading-text="禁用中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--启用面板结束-->

<#--查看面板-->
<div class="panel-body">
    <div class="modal fade" id="seeModal" tabindex="-1" role="dialog" aria-labelledby="seeModal"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <label for="" class="idFrontLabel" style="display: none;"></label>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="modifyModalLabel">
                        <i class="fa fa-eye fa-fw"></i>查看详情</h4>
                </div>
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
                                        <input type="text" class="form-control" disabled="disabled" id="seeaccountName" disabled>
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
                                        <input type="text" class="form-control"  id="seeemail" disabled />
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
                                        <input type="text" class="form-control" id="seeenterPrisename"  disabled/>
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
                                        <input type="text" class="form-control"  id="seeregisterAdress"  disabled/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-12 col-md-12 _padding">
                                    <div class="col-lg-3 col-md-3 title">
                                        <label class="control-label">
                                            营业执照号：</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 input-box">
                                        <input type="text" class="form-control" id="seebusinessLicensenum"  disabled/>
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
                                        <input type="text" class="form-control"  id="seelegalPersonname" disabled/>
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
                                        <input type="text" class="form-control"  id="seelegalPersonphone" disabled/>
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
                                        <input type="text" class="form-control"  id="seecontactPersonname" disabled/>
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
                                        <input type="text" class="form-control"  id="seecontactPersonphone"  disabled/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 input-form">
                                <lable id="entCode" style="display:none"></lable>
                                <div class="col-lg-12 col-md-12">
                                    <!--身份证正面选择-->
                                    <div class="col-lg-6 col-md-6 padding_left">
                                        <span class="picture_title">身份证正面：</span>
                                        <ul id="seeIdfrontShowBox" class="showBox">
                                            <p class="init-img">
                                                <img  src=""/>
                                            </p>
                                        </ul>
                                    </div>
                                    <!--营业执照选择-->
                                    <div class="col-lg-5 col-md-5">
                                        <span class="picture_title">营业执照照片：</span>
                                        <ul id="seeLicenseShowBox" class="showBox">
                                            <p class="init-img">
                                                <img  src=""/>
                                            </p>
                                        </ul>
                                    </div>
                                    <!--身份证反面选择-->
                                    <div class="col-lg-11 col-md-11 padding_left">
                                        <span class="picture_title">身份证反面：</span>
                                        <ul id="seeIDcardshowBox" class="showBox">
                                            <p class="init-img">
                                                <img src=""/>
                                            </p>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>

<#--数据加载loading开始-->
<div id="loading" class="loading">数据加载中...</div>
<#--数据加载loading结束-->

</body>
</html>

<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var idfrontBtn = "";
    var IDcardBtn = "";
    var licenseBtn = "";

    $(document).ready(function() {

        /*$("#loading").css("display","block");*/

        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页
        var search_key = $("#searchKey").val();

        //获取企业账号信息
        getEnteraccount(pageCount,currentPageNum,search_key);

        /*验证信息*/
        $('#modifyModal').validate({
            onFocus: function() {
                this.parent().addClass('active');
                $(this).next('span').css("display","none");
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
                    "background-color":"#3c67c0",
                    "color":"#FFF"
                });
                var modifyRecordID = parseInt(checkboxSelectedID);

                //修改前查询
                $.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/company/viewCompany', //目标地址
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
                        var retData=retInfo.data;
                        console.log(retInfo);
                        $("#entCode").text(retData.entCode);
                        $("#modifyaccountName").val(retData.userAcount)
                        $("#_modifypassword").val(retData.userPassword);
                        $("#modifyemail").val(retData.email);
                        $("#modifyenterPrisename").val(retData.name);
                        $("#modifyregisterAdress").val(retData.registAddress);
                        /*$("#modifyregisterMoney").val(retData.registAmount);*/
                        $("#modifybusinessLicensenum").val(retData.businessLicence);
                        $("#modifylegalPersonname").val(retData.legalPersonName);
                        $("#modifylegalPersonphone").val(retData.legalPersonContact);
                        $("#modifycontactPersonname").val(retData.linkmanName);
                        $("#modifycontactPersonphone").val(retData.linkmanMobile);

                        var idCardFrontHtml = '<li> <p class="imgs"><img src="${bath}'+retData.linkmanIdcardfrontPhoto + '" alt=""/> <span class="delete">&times;</span></p> </li>';
                        $('#idfrontShowBox').find('.init-img').hide();
                        $('#idfrontShowBox').find("li").remove();
                        $('#idfrontShowBox').append(idCardFrontHtml);

                        var idCardBaseHtml = '<li> <p class="imgs"><img src="${bath}'+retData.linkmanIdcardbasePhoto + '" alt=""/> <span class="delete">&times;</span></p> </li>';
                        $('#IDcardshowBox').find('.init-img').hide();
                        $('#IDcardshowBox').find("li").remove();
                        $('#IDcardshowBox').append(idCardBaseHtml);

                        var BusinesslicenseHtml = '<li> <p class="imgs"><img src="${bath}'+retData.businessLicensePhoto + '" alt=""/> <span class="delete">&times;</span></p> </li>';
                        $('#licenseShowBox').find('.init-img').hide();
                        $('#licenseShowBox').find("li").remove();
                        $('#licenseShowBox').append(BusinesslicenseHtml);
                    }
                });
                $("#confirmModify").attr("onclick","modifyRecord("+checkboxSelectedID+");");
            }
        });

        /*关闭前清空*/
        $('#modifyModal').on('hide.bs.modal', function () {
            $(".success").removeClass("success");
            $(".error").removeClass("error");
            $(".valid_message").css("display","none");
        });

        //禁用点击
        $("#stopBtn").click(function(){
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            var checkboxSelectedID = $("#forUserId").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                $("#confirmStop").css({
                    "background-color":"#ccc",
                    "color":"#444444"
                });
                toastr.error('请选择一条要禁用的记录！');
                //改变提示窗位置
                changeToastr();
                return false;
            }
            else{
                $("#stopModal").toggle();
                $("#confirmStop").css({
                    "background-color":"#3c67c0",
                    "color":"#FFF"
                });
                $("#confirmStop").attr("onclick","stopAccount("+checkboxSelectedID+");");
            }
        });

        //启用点击
        $("#startBtn").click(function(){
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            var checkboxSelectedID = $("#forUserId").text();
            console.log(checkboxSelectedID);
            if(checkboxSelectedID == ""){
                $("#confirmStart").css({
                    "background-color":"#ccc",
                    "color":"#444444"
                });
                toastr.error('请选择一条要禁用的记录！');
                //改变提示窗位置
                changeToastr();
                return false;
            }
            else{
                $("#startModal").toggle();
                $("#confirmStart").css({
                    "background-color":"#3c67c0",
                    "color":"#FFF"
                });
                $("#confirmStart").attr("onclick","startAccount("+checkboxSelectedID+");");
            }
        });

        //搜索点击
        $("#searchBtn").click(function(){
            var search_key = $("#searchKey").val();
            $("#tbody").empty();
            $("#loading").css("display","block");
            getEnteraccount(pageCount,1,search_key);
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
                getEnteraccount(pageCount,currentPageNum,search_key);
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
                getEnteraccount(pageCount,currentPageNum,search_key);
            }
            else{
                return;
            }
        });

        //上传身份证正面图片
        /*var idfrontBtn = $('#idfrontBtn'),
                idfrontShowBox = $('#idfrontShowBox');*/

        $('#idfrontBtn').change(function() {
            var self = $(this),
                    file = document.getElementById('idfrontBtn').files[0]; //获取到上传控件对象files
            if(file) {

                fileSize(file);
                toastr.options = {
                    "positionClass": "toast-login-center-center", //弹出窗的位置
                    "timeOut": "1000", //展现时间
                };
                if ( fileSize(file)==false){
                    $("#idfrontBtn").val("");
                    toastr.error('每张不得超过5M！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
                var reader = new FileReader(); //创建一个FileReader对象

                reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
                reader.onload = function(e) { //当文件成功读取后
                    var temp = '<li> <p class="id_front_imgs"><img src="' + this.result + '" alt="" id="idFrontImg"/> <span class="delete">&times;</span></p> </li>';

                    //$(".idFrontLabel").text(this.result);
                    /* 最多上传一张 */

                    maxNum($('#idfrontBtn'), $('#idfrontShowBox'), 1);
                    $('#idfrontShowBox').find('.init-img').hide();
                    $('#idfrontShowBox').append(temp);

                    //图片压缩方法
                    var i = document.getElementById("idFrontImg");
                    i.src = event.target.result;
                    setTimeout(function () {
                        var quality = 50; //图像压缩比，越小压缩越多
                        idfrontBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                    }, 10);
                    //idfrontBtn = i.src;
                }
            }

        });

        /* 身份证正面点击delete 删除图片 */
        $('#idfrontShowBox').on('click', ".delete", function(e) {
            $(this).parent().parent('li').remove();
            $('#idfrontShowBox').find('.init-img').show();
            $('#idfrontBtn').val("");
            $('#idfrontBtn').removeProp('disabled');
            console.log()
        });
        /*身份证正面鼠标移入移出*/
        $('.sfzzm').hover(function(e) {
            $(this).attr("src", "${bath}/images/IDcardfront_mo.png")
        }, function() {
            $(this).attr("src", "${bath}/images/IDcardfront.png")
        });

        /*身份证反面上传图片*/
        $("#IDcardBtn").change(function() {
            var self = $(this),
                    file = document.getElementById('IDcardBtn').files[0]; //获取到上传控件对象files
            if(file) {

                fileSize(file);
                toastr.options = {
                    "positionClass": "toast-login-center-center", //弹出窗的位置
                    "timeOut": "1000", //展现时间
                };
                if ( fileSize(file)==false){
                    $("#IDcardBtn").val("");
                    toastr.error('每张不得超过5M！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
                var reader = new FileReader(); //创建一个FileReader对象

                reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
                reader.onload = function(e) { //当文件成功读取后
                    var temp = '<li> <p class="id_tails_imgs"><img src="' + this.result + '" alt="" id="idTailsImg"/><span class="delete">&times;</span></p></li>';

                    /* 最多上传一张 */

                    maxNum($("#IDcardBtn"), $("#IDcardshowBox"), 1);
                    $("#IDcardshowBox").find('.init-img').hide();
                    $("#IDcardshowBox").append(temp);

                    //图片压缩方法
                    var i = document.getElementById("idTailsImg");
                    i.src = event.target.result;
                    setTimeout(function () {
                        var quality = 50; //图像压缩比，越小压缩越多
                        IDcardBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                    }, 10);
                    //IDcardBtn = i.src;
                }
            }

        });

        /* 身份证反面点击delete 删除图片 */
        $('#IDcardshowBox').on('click', ".delete", function(e) {
            $(this).parent().parent('li').remove();
            $("#IDcardshowBox").find('.init-img').show();
            $("#IDcardBtn").val("");
            $('#IDcardBtn').removeProp('disabled');
            console.log()

        });

        /*身份证反面鼠标移入移出*/
        $('.sfzfmId').hover(function(e) {
            $(this).attr("src", "${bath}/images/IDcardbase_mo.png")
        }, function() {
            $(this).attr("src", "${bath}/images/IDcardbase.png")
        });

        /*营业执照上传*/
        $("#licenseBtn").change(function() {
            var self = $(this),
                    file = document.getElementById('licenseBtn').files[0]; //获取到上传控件对象files
            if(file) {

                fileSize(file);
                toastr.options = {
                    "positionClass": "toast-login-center-center", //弹出窗的位置
                    "timeOut": "1000", //展现时间
                };
                if ( fileSize(file)==false){
                    $("#licenseBtn").val("");
                    toastr.error('每张不得超过5M！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
                var reader = new FileReader(); //创建一个FileReader对象

                reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
                reader.onload = function(e) { //当文件成功读取后
                    var temp = '<li> <p class="license_imgs"><img src="' + this.result + '" alt="" id="licenseImg"/><span class="delete">&times;</span></p></li>';

                    /* 最多上传一张 */

                    maxNum($("#licenseBtn"), $("#licenseShowBox"), 1);
                    $("#licenseShowBox").find('.init-img').hide();
                    $("#licenseShowBox").append(temp);

                    //图片压缩方法
                    var i = document.getElementById("licenseImg");
                    i.src = event.target.result;
                    setTimeout(function () {
                        var quality = 50; //图像压缩比，越小压缩越多
                        licenseBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                    }, 10);
                    //licenseBtn = i.src;
                }
            }

        });

        /* 执照点击delete 删除图片 */
        $('#licenseShowBox').on('click', ".delete", function(e) {
            $(this).parent().parent('li').remove();
            $("#licenseShowBox").find('.init-img').show();
            $("#licenseBtn").val("");
            $('#licenseBtn').removeProp('disabled');
            console.log()

        });

        /*营业执照鼠标移入移出*/
        $('.yyzz').hover(function(e) {
            $(this).attr("src", "${bath}/images/businessLicense_mo.png")
        }, function() {
            $(this).attr("src", "${bath}/images/businessLicense.png")
        });

        //点击查看时查看大图
        $('#seeModal').on('shown.bs.modal', function (e) {
            $('#seeModal .init-img img').zoomify();
        });
    });

    //获取企业账号信息方法
    function getEnteraccount(pageCount,currentPageNum,search_key){
        $("#currentPage").html(currentPageNum);
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/queryCompany', //目标地址
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
                    for(var i = 0; i < retDataLength; i++){
                        var index = i + 1;
                        var accountID = retData[i].id;
                        var account = retData[i].userAcount;
                        var accountNmae = retData[i].name;
                        var accountLinkman_mobile = retData[i].linkmanMobile;
                        var accountRegist_address = retData[i].registAddress;
                        var accountEnable=retData[i].enable;
                        var accountUserId=retData[i].userId;

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
                        if(accountEnable != null){
                            if (accountEnable==0){
                                trHtml += "<td>已启用</td>";
                            }else{
                                trHtml += "<td>已禁用</td>";
                            }
                        }else{
                            trHtml += "<td></td>";
                        }
                        trHtml += "<td><a href='javascript:void(0)' class='aLink' onclick='seeDetails("+accountID+")'>查看</a></td>";
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

    //刷新实现方法
    function refresh(){
        var search_key = $("#searchKey").val();
        var currentPageNum = parseInt($("#currentPage").text());
        var pageCount=20;
        $("#checkboxSelected").text("");
        $("#tbody").empty();
        $("#loading").css("display","block");
        getEnteraccount(pageCount,currentPageNum,search_key);
    };

    //新增实现方法
/*    function addEnteraccount(){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        var accountName = $("#accountName").val();
        if(accountName == ""){
            toastr.error('账户名称不能为空！');
            return false;
        };

        var _password = $("#_password").val();
        if(_password == ""){
            toastr.error('密码不能为空！');
            return false;
        };

        var email = $("#email").val();
        if(email == ""){
            toastr.error('邮箱不能为空！');
            return false;
        }
        var enterPrisename = $("#enterPrisename").val();
        if(enterPrisename == ""){
            toastr.error('企业名称不能为空！');
            return false;
        }
        var registerAdress = $("#registerAdress").val();
        if(registerAdress == ""){
            toastr.error('注册地址不能为空！');
            return false;
        }
        var registerMoney = $("#registerMoney").val();
        if(registerMoney == ""){
            toastr.error('注册金额不能为空！');
            return false;
        }
        var businessLicensenum = $("#businessLicensenum").val();
        if(businessLicensenum == ""){
            toastr.error('营业执照号不能为空！');
            return false;
        }
        var legalPersonname = $("#legalPersonname").val();
        if(legalPersonname == ""){
            toastr.error('法人姓名不能为空！');
            return false;
        }
        var legalPersonphone = $("#legalPersonphone").val();
        if(legalPersonphone == ""){
            toastr.error('法人联系方式不能为空！');
            return false;
        }
        var contactPersonname = $("#contactPersonname").val();
        if(contactPersonname == ""){
            toastr.error('联系人姓名不能为空！');
            return false;
        }
        var contactPersonphone = $("#contactPersonphone").val();
        if(contactPersonphone == ""){
            toastr.error('联系人电话不能为空！');
            return false;
        }

        $("#confirmAdd").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '/company/addCompany', //目标地址
            data : {
                account : accountName,
                password : _password,
                email:email,
                name : enterPrisename,
                registAddress : registerAdress,
                registAmount : registerMoney,
                businessLicence : businessLicensenum,
                legalPersonName : legalPersonname,
                legalPersonContact : legalPersonphone,
                linkmanName : contactPersonname,
                linkmanMobile:contactPersonphone
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                console.log(retCode);
                if(retCode != 0){
                    toastr.error('添加失败！');
                }
                else{
                    $("#confirmAdd").button('reset');
                    $("input").val("");
                    $('#addModal').modal('hide');
                    toastr.success('添加成功！');
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });
    };*/

    //新增addModal关闭清空未提交数据
    $(function() {
        $('#addModal').on('hide.bs.modal', function () {
            $("input").val("");
        });
    });

    //修改实现方法
    function modifyRecord(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        if (! $('#modifyModal').validate('submitValidate')){
            return false;
        }

        var modifyRecordID = parseInt(checkboxSelectedID);


        var _modifypassword = $("#_modifypassword").val();

        var modifyemail = $("#modifyemail").val();
        var modifyenterPrisename = $("#modifyenterPrisename").val();
        var modifyregisterAdress = $("#modifyregisterAdress").val();
        /*var modifyregisterMoney = $("#modifyregisterMoney").val();
        if(modifyregisterMoney == ""){
            toastr.error('注册金额不能为空！');
            return false;
        }*/
        var modifybusinessLicensenum = $("#modifybusinessLicensenum").val();
        var modifylegalPersonname = $("#modifylegalPersonname").val();
        var modifylegalPersonphone = $("#modifylegalPersonphone").val();
        var modifycontactPersonname = $("#modifycontactPersonname").val();
        var modifycontactPersonphone = $("#modifycontactPersonphone").val();
        /*身份证正面url*/

        /*var idFrontPicture = $("#idfrontShowBox").find("li").find(".id_front_imgs").find("img").attr("src");*/
        var idFrontPicture = idfrontBtn;

        /*var IDcardPicture = $("#IDcardshowBox").find("li").find(".id_tails_imgs").find("img").attr("src");*/
        var IDcardPicture = IDcardBtn;

        /*var licensePicture = $("#licenseShowBox").find("li").find(".license_imgs").find("img").attr("src");*/
        var licensePicture = licenseBtn;

        var entCode = $("#entCode").text();

        $("#confirmModify").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/updateCompany', //目标地址
            data : {
                id:modifyRecordID,
                password : _modifypassword,
                email:modifyemail,
                name : modifyenterPrisename,
                registAddress : modifyregisterAdress,
                /*registAmount : modifyregisterMoney,*/
                businessLicence : modifybusinessLicensenum,
                legalPersonName : modifylegalPersonname,
                legalPersonContact : modifylegalPersonphone,
                linkmanName : modifycontactPersonname,
                linkmanMobile:modifycontactPersonphone,
                linkmanIdcardfrontPhoto:idFrontPicture,
                linkmanIdcardbasePhoto:IDcardPicture,
                businessLicensePhoto:licensePicture,
                model:entCode + "Company"
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
                    toastr.error('修改失败！');
                    //改变提示窗位置
                    changeToastr();
                }
                else{
                    $("#confirmModify").button('reset');
                    $("input").val("");
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
    };

    //禁用实现方法
    function stopAccount(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var stopAccountID = parseInt(checkboxSelectedID);

        $("#confirmStop").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/updateAccount', //目标地址
            data : {
                id : stopAccountID,
                enable:1
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
                    $("#confirmStop").button('reset');
                    $('#stopModal').modal('hide');
                    toastr.error('禁用失败！');
                    //改变提示窗位置
                    changeToastr();
                }
                else{
                    $("#confirmStop").button('reset');
                    $('#stopModal').modal('hide');
                    toastr.success('禁用成功！');
                    //改变提示窗位置
                    changeToastr();
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });
    }

    //启用实现方法
    function startAccount(checkboxSelectedID){
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };

        var startAccountID = parseInt(checkboxSelectedID);

        $("#confirmStart").button('loading');

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/updateAccount', //目标地址
            data : {
                id : startAccountID,
                enable:0
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
                    $("#confirmStart").button('reset');
                    $('#startModal').modal('hide');
                    toastr.error('启用失败！');
                    //改变提示窗位置
                    changeToastr();
                }
                else{
                    $("#confirmStart").button('reset');
                    $('#startModal').modal('hide');
                    toastr.success('启用成功！');
                    //改变提示窗位置
                    changeToastr();
                    setTimeout(function(){
                        refresh();
                    },2000);
                }
            }
        });
    }

    //查看详情
    function seeDetails(id) {
        $("#seeModal").modal('show');
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/company/viewCompany', //目标地址
            data : {
                id : id
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
                //$("#entCode").text(retData.entCode);
                $("#seeaccountName").val(retData.userAcount)
                //$("#_modifypassword").val(retData.userPassword);
                $("#seeemail").val(retData.email);
                $("#seeenterPrisename").val(retData.name);
                $("#seeregisterAdress").val(retData.registAddress);
                /*$("#modifyregisterMoney").val(retData.registAmount);*/
                $("#seebusinessLicensenum").val(retData.businessLicence);
                $("#seelegalPersonname").val(retData.legalPersonName);
                $("#seelegalPersonphone").val(retData.legalPersonContact);
                $("#seecontactPersonname").val(retData.linkmanName);
                $("#seecontactPersonphone").val(retData.linkmanMobile);

                $('#seeIdfrontShowBox img').attr("src","${bath}"+retData.linkmanIdcardfrontPhoto);

                $('#seeIDcardshowBox img').attr("src","${bath}"+retData.linkmanIdcardbasePhoto);

                $('#seeLicenseShowBox img').attr("src","${bath}"+retData.businessLicensePhoto);
            }
        });
    }

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

    /* 上传的图片大小 返回值为 图片大小 */
    function fileSize(file) {
        var fileSize = 0;
        if(file.size > 1024 * 1024 * 5) {
            fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
            return false;
        } else {
            fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
            return fileSize;
        }
    }

    /* 最多上传数 */
    function maxNum(btn, showBox, num) {
        if(showBox.find('li').length >= (num - 1)) {
            btn.prop('disabled', 'disabled');
            showBox.find('.init-img').hide();
        } else {
            btn.removeProp('disabled');
            showBox.find('.init-img').show();
        }
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