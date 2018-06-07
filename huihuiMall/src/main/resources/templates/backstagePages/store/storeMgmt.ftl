<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>门店信息管理</title>

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

            <#--<span>省：</span>
            <select style="width: 8%">
                <option>请选择</option>
                <option>北京</option>
                <option>河北省</option>
            </select>

            <span style="margin-left: 10px">市：</span>
            <select style="width: 8%">
                <option>请选择</option>
                <option>北京市</option>
                <option>石家庄市</option>
            </select>

            <span style="margin-left: 10px">区：</span>
            <select style="width: 8%">
                <option>请选择</option>
                <option>海淀区</option>
                <option>朝阳区</option>
            </select>

            <span style="margin-left: 10px">街道：</span>
            <select style="width: 8%">
                <option>请选择</option>
                <option>花园路街道</option>
                <option>朝阳门外街道</option>
            </select>-->

            <span style="margin-left: 10px">门店名称：</span>
            <input type="text" id="storeNameKey" placeholder="请输入门店名称">

            <button type="button" class="btn btn-default" id="searchBtn"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">
            <div class="col-lg-12 col-md-12 col-xs-12 btn-group-panel">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyModal" id="modifyBtn">
                    <i class="fa fa-edit fa-fw"></i> 分配仓库</button>
                <button type="button" class="btn btn-default" id="excelExport" >
                     <i class="fa fa-plus fa-fw"></i> 导出</button>
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
                        门店名称
                    </th>
                    <th width="130">
                        门店负责人
                    </th>
                    <th width="130">
                        终端设备号
                    </th>
                    <th width="130">
                        联系方式
                    </th>
                    <th>
                        门店地址
                    </th>
                    <th width="100">
                        仓库名称
                    </th>
                    <th width="130">
                        推荐客户名单
                    </th>
                    <th width="100">
                        查看详情
                    </th>
                    <th width="100">
                        操作
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

<!--开关店弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="storeModal" tabindex="-1" role="dialog" aria-labelledby="storeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="storeModalLabel"></h4>
                </div>
                <div class="modal-body" id="storeModalBody">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmStore" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--开关店弹出面板结束--

<!--查看推荐客户名单弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="customerListModal" tabindex="-1" role="dialog" aria-labelledby="customerListModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="customerListModalLabel">
                        <i class="fa fa-gear fa-fw"></i> 查看推荐客户</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid table-operation-panel" style="padding:0px;">
                        <div class="row table-row">
                            <div class="col-lg-12 col-md-12 col-xs-12 table-panel">
                                <table class="table table-bordered table-hover table-responsive" style="margin-top: 15px;">
                                    <thead>
                                    <tr>
                                        <th width="80px">
                                            序号
                                        </th>
                                        <th>
                                            手机号
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody id="customerTbody">

                                    </tbody>
                                </table>
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
<!--查看推荐客户名单弹出面板结束-->

<!--修改弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="modifyModalLabel">
                        <i class="fa fa-edit fa-fw"></i> 分配仓库</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="editStoreName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="storageroomSelected">

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店负责人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="editShopkeeper">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系方式：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="editPhone">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="editAddress">
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

<!--查看详情弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 50%">
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
                                        <label class="control-label">门店名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">终端号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeDeviceCode">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">仓库名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeStorageroomName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店负责人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeShopkeeper">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系方式：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="phone">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeAddress">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">申请时间：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="applyTime">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商户类型：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="businessType">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form" id="entNameForm" style="display: none">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">企业名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="entName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form" id="entPhoneForm" style="display: none">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">公司电话：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="entPhone">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">经营年限：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="businessYear">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">去年全年收入情况：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="income">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">主营商品1：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="mainProductOne">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">主营商品1价格：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="mainProductOnePrice">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">主营商品2：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="mainProductTwo">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">主营商品2价格：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="mainProductTwoPrice">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">日均人流量：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="dailyFlow">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">加盟申请书：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">企业三证：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">房产信息：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">身份证：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">三个月水电费缴纳凭证：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">设备摆放位置照片：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">开户许可证：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">营业场所照片：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">门店所在地商情：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="storeArea">
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

        //获取审核通过门店信息
        getAduitSuccessStoreInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getAduitSuccessStoreInfos(pageCount,1);
        });

         $("#excelExport").click(function(){
            excelExport(pageCount,1);
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
                getAduitSuccessStoreInfos(pageCount,currentPageNum);
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
                getAduitSuccessStoreInfos(pageCount,currentPageNum);
            }else{
                return;
            }
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
                    type: "GET", //用GET方式传输
                    url: '${bath}/StoreController/storeMgDetail', //目标地址
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
                        var retData = retInfo.data.list;
                        console.log(retData);
                        var storeName = retData[0].store_name;
                        var storeShopkeeper = retData[0].name;
                        var phone = retData[0].phone_number;
                        var storeAddress = retData[0].store_address;
                        var storehouseId = retData[0].storehouse_id;

                        if(storehouseId == null || storehouseId == ""){
                            getStorageroomList(0);
                        }else{
                            getStorageroomList(storehouseId);
                        }

                        $("#editStoreName").val(storeName);
                        $("#editShopkeeper").val(storeShopkeeper);
                        $("#editPhone").val(phone);
                        $("#editAddress").val(storeAddress);
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

        //开关店modal消失
        $("#storeModal").on("hide.bs.modal", function () {
            $("#confirmStore").removeAttr("onclick");
        });

    });

    //获取信息方法
    function getAduitSuccessStoreInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storeNameKeyParam = $("#storeNameKey").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/StoreController/queryStore', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                storeName : storeNameKeyParam
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
                    var retDataLength = retData.length;

                    $("#Tbody").empty();

                    for(var i = 0 ;i < retDataLength; i ++){

                        var index = i + 1;
                        var id = retData[i].id;
                        var storeName = retData[i].store_name;
                        var shopKeeperName = retData[i].name;
                        var shopKeeperPhoneNumber = retData[i].phone_number;
                        var storeAddress = retData[i].store_address;
                        var deviceCode = retData[i].device_code;
                        var storehouseName = retData[i].storehouse_name;
                        var storeStatus = retData[i].status;

                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox' id='"+id+"' class='mycheckbox'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+storeName+"</td>";
                        tbodyHtml += "<td>"+shopKeeperName+"</td>";

                        if(deviceCode == null || deviceCode == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+deviceCode+"</td>";
                        }

                        tbodyHtml += "<td>"+shopKeeperPhoneNumber+"</td>";
                        tbodyHtml += "<td>"+storeAddress+"</td>";

                        if(storehouseName == null || storehouseName == ""){
                            tbodyHtml += "<td></td>";
                        }else{
                            tbodyHtml += "<td>"+storehouseName+"</td>";
                        }

                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#customerListModal' onclick='viewCustomerList(\""+id+"\")'>查看</a></td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='viewDetail(\""+id+"\")'>查看详情</a></td>";
                        tbodyHtml += "<td>";

                        if(storeStatus == 0){
                            tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#storeModal' onclick='openStoreModal(\""+id+"\",1)' style='margin:0px 10px'>开店</button>";
                        }else{
                            tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#storeModal' onclick='openStoreModal(\""+id+"\",0)' style='margin:0px 10px'>关店</button>";
                        }

                        tbodyHtml += "</td>";
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

    //修改信息方法
    function modifyRecord(checkboxSelectedID) {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var modifyRecordID = parseInt(checkboxSelectedID);
        console.log(modifyRecordID);

        var storageroomSelectedParam = $("#storageroomSelected").find("option:selected").val();
        if(storageroomSelectedParam == null || storageroomSelectedParam ==""){
            toastr.error("仓库名称不能为空！");
            return false;
        }

        $("#confirmModify").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/StoreController/updateStore', //目标地址
            data: {
                id : modifyRecordID,
                storehouseId : storageroomSelectedParam
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
                    $("#confirmModify").button("reset");
                    toastr.error("修改失败！");
                    return false;
                }else {
                    $("#confirmModify").button("reset");
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

    }

    //开店、关店判断
    function openStoreModal(storeId,status){

        var storeIdParam = storeId;
        var statusParam = status;

        if(statusParam == 1){  //开店
            $("#storeModalLabel").html("<i class='fa fa-trash-o fa-fw'></i> 开店");
            $("#storeModalBody").html("确定要打开该门店吗？");
            $("#confirmStore").attr("onclick","openStore("+storeIdParam+")");
        }else{  //关店
            $("#storeModalLabel").html("<i class='fa fa-trash-o fa-fw'></i> 关店");
            $("#storeModalBody").html("确定要关闭该门店吗？");
            $("#confirmStore").attr("onclick","closeStore("+storeIdParam+")");
        }
    }

    //开店
    function openStore(sId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var sIdParam = sId;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/StoreController/storeOpen', //目标地址
            data : {
                id : sIdParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

                var retCode = retInfo.retCode;
                if (retCode != 0) {
                    $("#confirmStore").button("reset");
                    toastr.error("开店失败！");
                    return false;
                }
                else {
                    $("#confirmStore").button("reset");
                    $("#storeModal").modal("hide");
                    toastr.success("开店成功！");
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

    //关店
    function closeStore(sId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var sIdParam = sId;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/StoreController/storeOff', //目标地址
            data : {
                id : sIdParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

                var retCode = retInfo.retCode;
                if (retCode != 0) {
                    $("#confirmStore").button("reset");
                    toastr.error("关店失败！");
                    return false;
                }
                else {
                    $("#confirmStore").button("reset");
                    $("#storeModal").modal("hide");
                    toastr.success("关店成功！");
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

    //查看详情方法
    function viewDetail(recordId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var recordIdParam = recordId;

        $.ajax({
            type : "GET", //用GET方式传输
            url : '${bath}/StoreController/storeMgDetail', //目标地址
            data : {
                id : recordIdParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

                console.log(retInfo);

                var retCode = retInfo.retCode;
                if(retCode != 0){
                    toastr.error("查询失败！");
                    return false;
                }else{

                    var retData = retInfo.data.list;

                    var storeName = retData[0].store_name;
                    var shopkeeperName = retData[0].name;
                    var phone = retData[0].phone_number;
                    var storeAddress = retData[0].store_address;
                    var applyTime = retData[0].apply_time;
                    var businessType = retData[0].merchant_type;
                    var entName = retData[0].enterprise_name;
                    var entPhone = retData[0].company_tel;
                    var businessYear = retData[0].business_year;
                    var income = retData[0].income;
                    var mainProductOne = retData[0].product1;
                    var mainProductOnePrice = retData[0].price1;
                    var mainProductTwo = retData[0].product2;
                    var mainProductTwoPrice = retData[0].price2;
                    var dailyFlow = retData[0].daily_flow;
                    var storeArea = retData[0].store_area;
                    var deviceCode = retData[0].device_code;
                    var storehouseName = retData[0].storehouse_name;

                    if(storeName == null || storeName == ""){
                        $("#storeName").val("");
                    }else{
                        $("#storeName").val(storeName);
                    }

                    if(deviceCode == null || deviceCode == ""){
                        $("#storeDeviceCode").val("");
                    }else{
                        $("#storeDeviceCode").val(deviceCode);
                    }

                    if(storehouseName == null || storehouseName == ""){
                        $("#storeStorageroomName").val("");
                    }else{
                        $("#storeStorageroomName").val(storehouseName);
                    }

                    if(shopkeeperName == null || shopkeeperName == ""){
                        $("#storeShopkeeper").val("");
                    }else{
                        $("#storeShopkeeper").val(shopkeeperName);
                    }

                    if(phone == null || phone == ""){
                        $("#phone").val("");
                    }else{
                        $("#phone").val(phone);
                    }

                    if(storeAddress == null || storeAddress == ""){
                        $("#storeAddress").val("");
                    }else{
                        $("#storeAddress").val(storeAddress);
                    }

                    if(applyTime == null || applyTime == ""){
                        $("#applyTime").val("");
                    }else{
                        $("#applyTime").val(applyTime);
                    }

                    if(businessType == 0){
                        $("#businessType").val("企业");
                    }else{
                        $("#businessType").val("个体户");
                    }

                    if(businessType == 0){
                        $("#entNameForm").css("display","block");
                        $("#entPhoneForm").css("display","block");
                        $("#entName").val(entName);
                        $("#entPhone").val(entPhone);
                    }

                    if(businessYear == null || businessYear == ""){
                        $("#businessYear").val("");
                    }else{
                        $("#businessYear").val(businessYear);
                    }

                    if(income == null || income == ""){
                        $("#income").val("");
                    }else{
                        $("#income").val(income);
                    }

                    if(mainProductOne == null || mainProductOne == ""){
                        $("#mainProductOne").val("");
                    }else{
                        $("#mainProductOne").val(mainProductOne);
                    }

                    if(mainProductOnePrice == null || mainProductOnePrice == ""){
                        $("#mainProductOnePrice").val("");
                    }else{
                        $("#mainProductOnePrice").val(mainProductOnePrice);
                    }

                    if(mainProductTwo == null || mainProductTwo == ""){
                        $("#mainProductTwo").val("");
                    }else{
                        $("#mainProductTwo").val(mainProductTwo);
                    }

                    if(mainProductTwoPrice == null || mainProductTwoPrice == ""){
                        $("#mainProductTwoPrice").val("");
                    }else{
                        $("#mainProductTwoPrice").val(mainProductTwoPrice);
                    }

                    if(dailyFlow == null || dailyFlow == ""){
                        $("#dailyFlow").val("");
                    }else{
                        $("#dailyFlow").val(dailyFlow);
                    }

                    if(storeArea == 0){
                        $("#storeArea").val("商场超市");
                    }else if(storeArea == 1){
                        $("#storeArea").val("住宅区");
                    }else if(storeArea == 2){
                        $("#storeArea").val("写字楼");
                    }else{
                        $("#storeArea").val("其他");
                    }
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("查询失败！");
                return false;
            }
        });
    }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#storeNameKey").val("");
        $("#checkboxSelected").text("");
        $("#loading").css("display","block");
        getAduitSuccessStoreInfos(pageCount,currentPageNum);
    }

    //查看客户推荐名单
    function viewCustomerList(storeId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storeIdParam = storeId;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/StoreController/recommendClientList', //目标地址
            data : {
                id : storeIdParam
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

                console.log(retInfo);

                var retCode = retInfo.retCode;
                if(retCode != 0){
                    toastr.error("查询失败！");
                    return false;
                }else{
                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#customerTbody").empty();

                    for(var c = 0; c < retDataLength; c++){

                        var index = c + 1;
                        var phoneNumber = retData[c].phone_number;

                        var customerTbodyHtml = "<tr>";
                        customerTbodyHtml += "<td>"+index+"</td>";
                        customerTbodyHtml += "<td>"+phoneNumber+"</td>";
                        customerTbodyHtml += "</tr>";

                        $("#customerTbody").append(customerTbodyHtml);
                    }
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("查询失败！");
                return false;
            }
        });
    }

    //获取仓库列表
    function getStorageroomList(storageroomId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var storageroomIdParam = storageroomId;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/StoreController/selectStroehouse', //目标地址
            data : {},
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

                console.log(retInfo);

                var retCode = retInfo.retCode;
                if(retCode != 0){
                    toastr.error("查询失败！");
                    return false;
                }else{

                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    $("#storageroomSelected").empty();

                    var defaultStorageroomSelectedHtml = "<option value=''>请选择</option>";
                    $("#storageroomSelected").append(defaultStorageroomSelectedHtml);

                    for(var kf = 0; kf < retDataLength; kf++){

                        var id = retData[kf].id;
                        var name = retData[kf].storehouse_name;

                        if(storageroomIdParam == 0){
                            var storageroomSelectedHtml = "<option value='"+id+"'>"+name+"</option>";
                            $("#storageroomSelected").append(storageroomSelectedHtml);
                        }else{
                            var editStorageroomSelectedHtml = "";
                            if(storageroomIdParam == id){
                                editStorageroomSelectedHtml += "<option value='"+id+"' selected='selected'>"+name+"</option>";
                            }else{
                                editStorageroomSelectedHtml += "<option value='"+id+"'>"+name+"</option>";
                            }
                            $("#storageroomSelected").append(editStorageroomSelectedHtml);
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


     function excelExport(pageCount,currentPageNum){
            var storeNameKeyParam = $("#storeNameKey").val();
            var param= { storeName : storeNameKeyParam };
            window.location.href="${bath}/InventoryExecel/StoreMgExecel?param="+param;
            }


</script>
