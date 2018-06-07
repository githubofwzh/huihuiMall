<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>自营商品管理</title>

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
    <link href="${bath}/js/laydate/theme/default/laydate.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common.js" type="text/javascript" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/imgJS/swipebox/jquery.swipebox.min.js" type="text/javascript"></script>
    <script src="${bath}/js/imgJS/JIC.min.js" type="text/javascript"></script>
    <script src="${bath}/js/laydate/laydate.js" type="text/javascript"></script>

</head>
<body>
<label id="goodsStatusCurrent" style="display:none"></label>
<div class="container-fluid btn-operation-panel">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">

            <span >商品名称：</span>
            <input type="text" id="searchKey" placeholder="请输入商品名称">

            <span style="margin-left: 10px">上下架状态：</span>
            <select style="width: 10%" id="shelfSelected">
                <option value="">请选择</option>
                <option value="0">未上架</option>
                <option value="1">已上架</option>
                <option value="2">已下架</option>
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
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editGoodsModal" id="addBtn">
                    <i class="fa fa-plus fa-fw"></i> 添加</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editGoodsModal" id="modifyBtn">
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
                    <th width="160">
                        商品名称
                    </th>
                    <th width="160">
                        商品编号
                    </th>
                    <th width="160">
                        品牌名称
                    </th>
                    <th width="100">
                        规格型号
                    </th>
                    <th width="80">
                        计量单位
                    </th>
                    <th width="160">
                        所属一级分类
                    </th>
                    <th width="160">
                        所属二级分类
                    </th>
                    <th width="100">
                        商品状态
                    </th>
                    <th width="100">
                        查看详情
                    </th>
                    <th width="100">
                        操作
                    </th>
                </tr>
                </thead>
                <tbody id="goodsTbody">

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
    <div class="modal fade" id="editGoodsModal" tabindex="-1" role="dialog" aria-labelledby="editGoodsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="editGoodsModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="editGoodsName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form" id="editGoodsCodeForm" style="display:none">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品编号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="editGoodsCode">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">一级分类名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="editFirstClassifySelected">

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
                                        <select class="form-select" id="editSecondClassifySelected" disabled="disabled">
                                            <option value="">请选择</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">品牌名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <select class="form-select" id="editBrandSelected" disabled="disabled">
                                            <option value="">请选择</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">规格型号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="editSpecifications">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">计量单位：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="editMeasurementUnit">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">包装：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="editPacking">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">毛重：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="editWeight">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">进货单价：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="editPurchasePrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">包装费：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="editPackingPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">物料费：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="editMaterialPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">运费：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="editTransportPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">产地：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="editPlace">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">零售价格：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="editPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">批发价格：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="editTradePrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">生产日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" id="editManufactureDate" style="width:100%;height:34px">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">保质期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" placeholder="必填" id="editGuarantee">
                                        <span class="input-group-addon">天</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">到期日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" id="editExpirationDate" style="width:100%;height:34px">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品展示：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box" style="padding-left: 5px">
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

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品介绍图：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box" style="padding-left: 5px">
                                        <div class="col-lg-12 col-md-12 col-xs-12 upload-panel" >
                                            <div class="col-lg-12 col-md-12 col-xs-12 uploadother">
                                                <div class="col-lg-3 col-md-3 col-xs-3" id="uploadFormOther" style="padding: 0px">
                                                    <a class="col-lg-3 col-md-3 col-xs-3 pic-upload-gp-other" href="javascript:void(0);">
                                                        <span></span>
                                                        <input id="uploadPicOther" name="upfile"  type="file" accept="image/*" multiple="multiple">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">备注：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <textarea class="form-control required" id="editRemark" rows="3"></textarea>
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

<!--查看详情弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog">
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
                                        <label class="control-label">商品名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewGoodsName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品编号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewGoodsCode">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">一级分类名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewFirstClassify">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">二级分类名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewSecondClassify">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">品牌名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewBrandName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">规格型号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewSpecifications">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">计量单位：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewMeasurementUnit">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">包装：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewPacking">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">毛重：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewWeight">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">进货单价：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewPurchasePrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">包装费：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewPackingPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">物料费：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewMaterialPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">运费：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewTransportPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">产地：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewPlace">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">零售价格：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewPrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">批发价格：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewTradePrice">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">生产日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" disabled="disabled" id="viewManufactureDate" style="width:100%;height:34px">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">保质期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" class="form-control required" disabled="disabled" id="viewGuarantee">
                                        <span class="input-group-addon">天</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">到期日期：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <input type="text" disabled="disabled" id="viewExpirationDate" style="width:100%;height:34px">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品展示：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <div class="col-lg-12 col-md-12 col-xs-12 upload-panel" id="mainImage">

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商品介绍图：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <div class="col-lg-12 col-md-12 col-xs-12 upload-panel" id="detailImage">

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">备注：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-group" style="padding-left: 15px">
                                        <textarea class="form-control required" disabled="disabled" id="viewRemark" rows="3"></textarea>
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

<!--上下架确认面板开始-->
<div class="panel-body">
    <div class="modal fade" id="shelfModal" tabindex="-1" role="dialog" aria-labelledby="shelfModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="shelfModalLabel"></h4>
                </div>
                <div class="modal-body" id="onOffshelfModalBody">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmShelf" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--上下架确认面板结束-->


<#--数据加载loading开始-->
<div id="loading" style="top:50%; left:50%; position: absolute;"></div>
<#--数据加载loading结束-->

</body>

</html>

<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var imagePath = "";

    var imagePathArray = [];

    $(document).ready(function() {

        $("#loading").css("display","block");

        //执行一个laydate实例
        laydate.render({
            elem: "#editManufactureDate",//指定元素
            theme: '#3c8dbc'
        });

        laydate.render({
            elem: "#editExpirationDate",//指定元素
            theme: '#3c8dbc'
        });

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页

        //获取自营商品信息
        getSelfGoodsInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getSelfGoodsInfos(pageCount,1);
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
                getSelfGoodsInfos(pageCount,currentPageNum);
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
                getSelfGoodsInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //上下架modal消失清除确认按钮点击事件
        $("#shelfModal").on("hide.bs.modal", function () {
            $("#confirmShelf").removeAttr("onclick");
        });

        //添加商品
        $("#addBtn").click(function(){
            $("#editGoodsModalLabel").html("<i class='fa fa-plus fa-fw'></i> 添加");
            $("#confirmEdit").attr("onclick", "editGoods(0,0);");
            $("#editGoodsCodeForm").css("display","none");
        });

        //修改商品
        $("#modifyBtn").click(function(){

            $("#editGoodsModalLabel").html("<i class='fa fa-edit fa-fw'></i> 修改");

            toastr.options = {
                "positionClass": "toast-tip-center-center", //弹出窗的位置
                "timeOut": "1000" //展现时间
            };

            var checkboxSelectedID = $("#checkboxSelected").text();
            if (checkboxSelectedID == "") {
                toastr.error("请选择一条要修改的记录！");
                return false;
            }else {

                $("#editGoodsModal").toggle();
                var modifyRecordID = parseInt(checkboxSelectedID);
                console.log(modifyRecordID);

                $("#editGoodsCodeForm").css("display","block");

                //修改前查询
                $.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/productMgmt/selectProductbyid', //目标地址
                    data : {
                        id : modifyRecordID
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
                            toastr.error("查询失败！");
                            return false;
                        }
                        else {
                            var retData = retInfo.data;
                            console.log(retData);

                            var goodsName = retData[0].name;
                            var goodsCode = retData[0].code;
                            var goodsStatus = retData[0].shelves_status;

                            var goodsCategoryOneId = retData[0].categoryone_id;
                            var goodsCategoryTwoId = retData[0].categorytwo_id;
                            var goodsBrandId = retData[0].brand_id;

                            var goodsSpecifications = retData[0].specifications;
                            var goodsMeasurementUnit = retData[0].measurement_unit;
                            var goodsPacking = retData[0].packing;
                            var goodsWeight = retData[0].weight;
                            var goodsPurchasePrice = retData[0].purchase_price;
                            var goodsPackingPrice = retData[0].packing_price;
                            var goodsMaterialPrice = retData[0].material_price;
                            var goodsTransportPrice = retData[0].transport_price;
                            var goodsPlaceOfOrigin = retData[0].place_of_origin;
                            var goodsPrice = retData[0].price;
                            var goodsTradePrice = retData[0].trade_price;
                            var goodsDateManufacture = retData[0].date_manufacture;
                            var subDateManufacture = goodsDateManufacture.substring(0,10);
                            var goodsGuaranteeDate = retData[0].guarantee_date;
                            var goodsExpirationDate = retData[0].expiration_date;
                            var subExpirationDate = goodsExpirationDate.substring(0,10);
                            var goodsRemarks = retData[0].Remarks;
                            var mainImagePath = retData[0].main_image_path;
                            var detailImagePath = retData[0].detail_image_path;

                            editGetFirstClassifyList(goodsCategoryOneId);
                            editGetSecondClassifyList(goodsCategoryTwoId);
                            editGetBrandList(goodsBrandId);

                            $("#goodsStatusCurrent").text(goodsStatus);
                            $("#editGoodsName").val(goodsName);
                            $("#editGoodsCode").val(goodsCode);
                            $("#editSpecifications").val(goodsSpecifications);
                            $("#editMeasurementUnit").val(goodsMeasurementUnit);
                            $("#editPacking").val(goodsPacking);
                            $("#editWeight").val(goodsWeight);
                            $("#editPurchasePrice").val(goodsPurchasePrice);
                            $("#editPackingPrice").val(goodsPackingPrice);
                            $("#editMaterialPrice").val(goodsMaterialPrice);
                            $("#editTransportPrice").val(goodsTransportPrice);
                            $("#editPlace").val(goodsPlaceOfOrigin);
                            $("#editPrice").val(goodsPrice);
                            $("#editTradePrice").val(goodsTradePrice);
                            $("#editManufactureDate").val(subDateManufacture);
                            $("#editGuarantee").val(goodsGuaranteeDate);
                            $("#editExpirationDate").val(subExpirationDate);
                            $("#editRemark").val(goodsRemarks);

                            uploadForm.hide();

                            var imgsHtml = "";
                            if(mainImagePath == "" || mainImagePath == null){
                                imgsHtml += "<span class='col-lg-3 col-md-3 col-xs-3 item-pic' id='imgbox0' style='width:80px;height:80px'>";
                                imgsHtml += "<img class='' src='${bath}"+"/images/common/default-pic.png' id='0'><span class='pic-del'></span>";
                                imgsHtml += "</span>";

                                $(".upload").append(imgsHtml);

                                imagePath = "";
                            }else{
                                imgsHtml += "<span class='col-lg-3 col-md-3 col-xs-3 item-pic' id='imgbox0' style='width:80px;height:80px'>";
                                imgsHtml += "<img class='' src='${bath}/"+mainImagePath+"' id='0'><span class='pic-del'></span>";
                                imgsHtml += "</span>";

                                $(".upload").append(imgsHtml);

                                imagePath = mainImagePath;
                            }

                            var jsonDetailImagePath = JSON.parse(detailImagePath);
                            var detailImagePathLength = jsonDetailImagePath.length;
                            console.log(detailImagePathLength);

                            $(".uploadother").empty();

                            for(var h = 0; h < detailImagePathLength; h++){

                                var detailImageUrl = jsonDetailImagePath[h];

                                var detailImgsHtml = "<span class='col-lg-3 col-md-3 col-xs-3 item-pic-other' id='imgotherbox"+h+"' style='width:80px;height:80px'>";
                                detailImgsHtml += "<img class='' src='${bath}/" + detailImageUrl + "' id='other" + h + "'>";
                                detailImgsHtml += "<span class='pic-del-other'></span>";
                                detailImgsHtml += "</span>";

                                $(".uploadother").append(detailImgsHtml);

                                imagePathArray.push(jsonDetailImagePath[h]);
                                console.log(imagePathArray);

                            }

                            var uploadFormOtherHtml = "<div class='col-lg-3 col-md-3 col-xs-3' id='uploadFormOther' style='padding: 0px'>";
                            uploadFormOtherHtml += "<a class='col-lg-3 col-md-3 col-xs-3 pic-upload-gp-other' href='javascript:void(0);'>";
                            uploadFormOtherHtml += "<span></span>";
                            uploadFormOtherHtml += "<input id='uploadPicOther' name='upfile'  type='file' accept='image/*'  multiple='multiple'>";
                            uploadFormOtherHtml += "</a>";
                            uploadFormOtherHtml += "</div>";

                            $(".uploadother").append(uploadFormOtherHtml);

                        }

                        var uploadother = $(".uploadother");
                        var uploadBtnOther = $("#uploadPicOther");
                        var uploadFormOther = $("#uploadFormOther");
                        var picOtherHtml = "";

                        uploadBtnOther.change(function() {

                            toastr.options = {
                                "positionClass": "toast-tip-center-center", //弹出窗的位置
                                "timeOut": "1000" //展现时间
                            };

                            var file = document.getElementById('uploadPicOther').files;  //获取到上传控件对象files
                            var fileLength = file.length;
                            if (file) {
                                if (!(CheckImgFile(document.getElementById('uploadPicOther')))){
                                    return false;
                                }
                                for(var i = 0; i < fileLength; i++){
                                    (function(i){
                                        var fileData = file[i];
                                        var reader = new FileReader();  //创建一个FileReader对象

                                        reader.readAsDataURL(fileData);      //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
                                        var fileDataName = fileData.name;
                                        reader.onload = function(e){      //当文件成功读取后

                                            var imgOtherId = $(".uploadother").find("span").find("img").length;
                                            if (uploadother.find('.item-pic-other').length >= 14) {
                                                uploadFormOther.hide()
                                            } else {
                                                uploadFormOther.show();
                                                if(fileLength > 0){
                                                    var imageId = parseInt(imgOtherId)+1;
                                                    picOtherHtml = "<span class='col-lg-3 col-md-3 col-xs-3 item-pic-other' id='imgotherbox"+imageId+"' style='width:80px;height:80px'><img class='' src='" + this.result + "' id='other" + imgOtherId + "'><span class='pic-del-other'></span></span>";
                                                }else{
                                                    var imageId = 0;
                                                    picOtherHtml = "<span class='col-lg-3 col-md-3 col-xs-3 item-pic-other' id='imgotherbox"+imageId+"' style='width:80px;height:80px'><img class='' src='" + this.result + "' id='other" + imgOtherId + "'><span class='pic-del-other'></span></span>";
                                                }
                                                $("#loading").css("display","block");

                                                uploadFormOther.before(picOtherHtml);
                                            }

                                            var imgPathOther = "";
                                            var imgId = "other"+imgOtherId;
                                            var p = document.getElementById(imgId);
                                            p.src = event.target.result;

                                            setTimeout(function () {
                                                imgPathOther = p.src;
                                                jQuery.ajax({
                                                    type : "POST", //用POST方式传输
                                                    url : '${bath}/fileUpload', //目标地址
                                                    data : {
                                                        data : imgPathOther
                                                    },
                                                    dataType : "json", //数据格式:JSON
                                                    success : function(uploadRet) {
                                                        console.log(uploadRet);
                                                        var uploadRetCode = uploadRet.retCode;
                                                        if(uploadRetCode !=0){

                                                            $("#loading").css("display","none");

                                                            $("#uploadPicOther").val("");
                                                            toastr.error('上传失败！');
                                                            return false;
                                                        }
                                                        else{

                                                            $("#loading").css("display","none");

                                                            $("#uploadPicOther").val("");
                                                            toastr.success('上传成功！');

                                                            var retImgPath = uploadRet.data;
                                                            imagePathArray.push(retImgPath);
                                                            console.log(imagePathArray);
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
                                            },2000);
                                        }
                                    })(i);
                                }
                            }
                        });

                        //删除商品详情图片
                        /*$('.uploadother').delegate(".edit-pic-del-other", "click", function() {

                            toastr.options = {
                                "positionClass": "toast-tip-center-center", //弹出窗的位置
                                "timeOut": "1000" //展现时间
                            };

                            var self = $(this);
                            var id = self.parent().find("img").attr("id");
                            var subId = parseInt(id.substring(5));
                            var index = subId;
                            imagePathArray.splice(index,1);
                            console.log(imagePathArray);

                            self.parents(".edit-pic-del-other").remove();
                            uploadFormOther.show();

                            toastr.success('删除成功！');

                        });*/

                    },
                    error:function(XMLHttpRequest, textStatus){
                        console.log(XMLHttpRequest);
                        console.log(textStatus);
                        toastr.error("查询失败！");
                        return false;
                    }
                });

                $("#confirmEdit").attr("onclick", "editGoods("+checkboxSelectedID+");");
            }
        });

        //添加、修改modal显示
        $("#editGoodsModal").on("show.bs.modal", function () {
            getFirstClassifyList();
        });

        //添加、修改modal消失
        $("#editGoodsModal").on("hide.bs.modal", function () {
            $("#confirmEdit").removeAttr("onclick");
            $("input").val("");
            $("textarea").val("");
            $("#goodsStatusCurrent").text("");

            $("#editSecondClassifySelected").empty();
            $("#editSecondClassifySelected").append("<option value=''>请选择</option>");
            $("#editSecondClassifySelected").attr("disabled","disabled");

            $("#editBrandSelected").empty();
            $("#editBrandSelected").append("<option value=''>请选择</option>");
            $("#editBrandSelected").attr("disabled","disabled");

            $(".item-pic").remove();
            uploadForm.show();
            imagePath = "";

            $(".item-pic-other").remove();
            uploadFormOther.show();
            imagePathArray = [];
        });

        //一级分类点击获取二级分类
        $("#editFirstClassifySelected").change(function () {
            var pidParam = $(this).val();
            $("#editSecondClassifySelected").removeAttr("disabled");
            if(pidParam == ""){
                $("#editSecondClassifySelected").empty();
                $("#editSecondClassifySelected").append("<option value=''>请选择</option>");
                $("#editSecondClassifySelected").attr("disabled","disabled");

                $("#editBrandSelected").empty();
                $("#editBrandSelected").append("<option value=''>请选择</option>");
                $("#editBrandSelected").attr("disabled","disabled");
                return false;
            }
            getSecondClassifyList(pidParam);
        });

        //二级分类点击获取品牌
        $("#editSecondClassifySelected").change(function () {
            var sPidParam = $(this).val();
            $("#editBrandSelected").removeAttr("disabled");
            if(sPidParam == ""){
                $("#editBrandSelected").empty();
                $("#editBrandSelected").append("<option value=''>请选择</option>");
                $("#editBrandSelected").attr("disabled","disabled");
                return false;
            }
            getBrandList(sPidParam);
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

    //获取信息方法
    function getSelfGoodsInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var searchKeyParam = $("#searchKey").val();
        var shelfSelectedParam = $("#shelfSelected").find("option:selected").val();

        $("#currentPage").html(currentPageNum);

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/queryAllProduct', //目标地址
            data : {
                PageNum : currentPageNum,
                PageSize : pageCount,
                name : searchKeyParam,
                ShelvesStatus : shelfSelectedParam
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

                    $("#goodsTbody").empty();

                    for(var i = 0 ;i < retDataLength; i ++){

                        var index = i + 1;
                        var id = retData[i].id;
                        var goodsName = retData[i].name;
                        var goodsCode = retData[i].code;
                        var brandName = retData[i].brandname;
                        var measurementUnit = retData[i].measurement_unit;
                        var specifications = retData[i].specifications;
                        var categoryOneName = retData[i].categoryonename;
                        var categoryTwoName = retData[i].categorytwoname;
                        var shelvesStatus = retData[i].shelves_status;

                        var goodsTbodyHtml = "<tr>";
                        goodsTbodyHtml += "<td><input type='checkbox' id='"+id+"' class='mycheckbox'/></td>";
                        goodsTbodyHtml += "<td>"+index+"</td>";
                        goodsTbodyHtml += "<td>"+goodsName+"</td>";
                        goodsTbodyHtml += "<td>"+goodsCode+"</td>";
                        goodsTbodyHtml += "<td>"+brandName+"</td>";
                        goodsTbodyHtml += "<td>"+measurementUnit+"</td>";
                        goodsTbodyHtml += "<td>"+specifications+"</td>";
                        goodsTbodyHtml += "<td>"+categoryOneName+"</td>";
                        goodsTbodyHtml += "<td>"+categoryTwoName+"</td>";
                        if(shelvesStatus == 0){
                            goodsTbodyHtml += "<td class='un-shelf'>未上架</td>";
                        }else if(shelvesStatus == 1){
                            goodsTbodyHtml += "<td class='on-shelf'>已上架</td>";
                        }else{
                            goodsTbodyHtml += "<td class='off-shelf'>已下架</td>";
                        }

                        goodsTbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='viewDetail(\""+id+"\");'>查看详情</a></td>";
                        goodsTbodyHtml += "<td>";
                        if(shelvesStatus == 0 || shelvesStatus == 2){
                            goodsTbodyHtml += "<button type='button' class='btn btn-default on-off-shelf-btn' data-toggle='modal' data-target='#shelfModal' onclick='onshelf(\""+id+"\")'>上架</button>";
                        }else{
                            goodsTbodyHtml += "<button type='button' class='btn btn-default on-off-shelf-btn' data-toggle='modal' data-target='#shelfModal' onclick='offshelf(\""+id+"\")'>下架</button>";
                        }

                        goodsTbodyHtml += "</td>";
                        goodsTbodyHtml += "</tr>";

                        $("#goodsTbody").append(goodsTbodyHtml);
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

    //商品上架
    function onshelf(id){
        var idParam = id;
        var shelfStatus = 1;
        $("#shelfModalLabel").html("<i class='fa fa-trash-o fa-fw'></i> 上架");
        $("#onOffshelfModalBody").html("确定要上架这件商品吗？");
        $("#confirmShelf").attr("onclick","onOrOffShelf("+idParam+","+shelfStatus+")");
    }

    //商品下架
    function offshelf(id){
        var idParam = id;
        var shelfStatus = 2;
        $("#shelfModalLabel").html("<i class='fa fa-trash-o fa-fw'></i> 下架");
        $("#onOffshelfModalBody").html("确定要下架这件商品吗？");
        $("#confirmShelf").attr("onclick","onOrOffShelf("+idParam+","+shelfStatus+")");
    }

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#shelfSelected option:first").prop("selected", "selected");
        $("#loading").css("display","block");
        $("#checkboxSelected").text("");
        getSelfGoodsInfos(pageCount,currentPageNum);
    }

    //商品上、下架方法
    function onOrOffShelf(goodsId,status){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var goodsIdParam = goodsId;
        var statusParam = status;

        if(statusParam == 1){
            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/productMgmt/putOnTheShelfSelf', //目标地址
                data : {
                    id : goodsIdParam
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
                        $("#confirmShelf").button("reset");
                        toastr.error("商品上架失败！");
                        return false;
                    }
                    else {
                        $("#confirmShelf").button("reset");
                        $("#shelfModal").modal("hide");
                        toastr.success("商品上架成功！");
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
        }else{
            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/productMgmt/putOffTheShelf', //目标地址
                data : {
                    id : goodsIdParam
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
                        $("#confirmShelf").button("reset");
                        toastr.error("商品下架失败！");
                        return false;
                    }
                    else {
                        $("#confirmShelf").button("reset");
                        $("#shelfModal").modal("hide");
                        toastr.success("商品下架成功！");
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

    }




    //商品添加修改方法
    function editGoods(goodId,goodsStatus){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var goodIdParam = goodId;
        var idParam = "";
        if(goodIdParam == 0){
            idParam = "";
        }else{
            idParam = goodIdParam;
        }
        console.log(idParam);

        var goodsStatusCurrentParam = $("#goodsStatusCurrent").text();
        var goodsStatusParam = "";
        if(goodsStatusCurrentParam == ""){
            goodsStatusParam = 0;
        }else{
            goodsStatusParam = goodsStatusCurrentParam;
        }

        var editGoodsCodeParam = "";
        if(goodIdParam != 0){
            editGoodsCodeParam = $("#editGoodsCode").val();
        }

        var editGoodsNameParam = $("#editGoodsName").val();
        if(editGoodsNameParam == ""){
            toastr.error("商品名称不能为空！");
            return false;
        }

        var firstClassifyIdParam = $("#editFirstClassifySelected").find("option:selected").val();
        if(firstClassifyIdParam == ""){
            toastr.error("一级分类不能为空！");
            return false;
        }

        var secondClassifyIdParam = $("#editSecondClassifySelected").find("option:selected").val();
        if(secondClassifyIdParam == ""){
            toastr.error("二级分类不能为空！");
            return false;
        }

        var brandIdParam = $("#editBrandSelected").find("option:selected").val();
        if(brandIdParam == ""){
            toastr.error("品牌不能为空！");
            return false;
        }

        var editSpecificationsParam = $("#editSpecifications").val();
        if(editSpecificationsParam == ""){
            toastr.error("规格型号不能为空！");
            return false;
        }

        var editMeasurementUnitParam = $("#editMeasurementUnit").val();
        if(editMeasurementUnitParam == ""){
            toastr.error("计量单位不能为空！");
            return false;
        }

        var editPackingParam = $("#editPacking").val();
        if(editPackingParam == ""){
            toastr.error("包装不能为空！");
            return false;
        }

        var editWeightParam = $("#editWeight").val();
        if(editWeightParam == ""){
            toastr.error("毛重不能为空！");
            return false;
        }

        var editPurchasePriceParam = $("#editPurchasePrice").val();
        if(editPurchasePriceParam == ""){
            toastr.error("进货单价不能为空！");
            return false;
        }

        var editPackingPriceParam = $("#editPackingPrice").val();
        if(editPackingPriceParam == ""){
            toastr.error("包装费不能为空！");
            return false;
        }

        var editMaterialPriceParam = $("#editMaterialPrice").val();
        if(editMaterialPriceParam == ""){
            toastr.error("物料费不能为空！");
            return false;
        }

        var editTransportPriceParam = $("#editTransportPrice").val();
        if(editTransportPriceParam == ""){
            toastr.error("运费不能为空！");
            return false;
        }

        var editPlaceParam = $("#editPlace").val();
        if(editPlaceParam == ""){
            toastr.error("产地不能为空！");
            return false;
        }

        var editPriceParam = $("#editPrice").val();
        if(editPriceParam == ""){
            toastr.error("零售价格不能为空！");
            return false;
        }

        var editTradePriceParam = $("#editTradePrice").val();
        if(editTradePriceParam == ""){
            toastr.error("批发价格不能为空！");
            return false;
        }

        var editManufactureDateParam = $("#editManufactureDate").val();
        if(editManufactureDateParam == ""){
            toastr.error("生产日期不能为空！");
            return false;
        }

        var editGuaranteeParam = $("#editGuarantee").val();
        if(editGuaranteeParam == ""){
            toastr.error("保质期不能为空！");
            return false;
        }

        var editExpirationDateParam = $("#editExpirationDate").val();
        if(editExpirationDateParam == ""){
            toastr.error("到期日期不能为空！");
            return false;
        }

        var mainImagePathParam = imagePath;
        if(mainImagePathParam == ""){
            toastr.error("商品展示图不能为空！");
            return false;
        }

        var detailImagePath = imagePathArray;
        var detailImagePathLength = detailImagePath;
        if(detailImagePathLength <= 0){
            toastr.error("商品介绍图不能为空！");
            return false;
        }
        var jsonDetailImagePath = JSON.stringify(detailImagePath);

        var editRemarkParam = $("#editRemark").val();

        var MerchantTypeParam = 2;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/ProductInsert', //目标地址
            data : {
                id : idParam,
                Code : editGoodsCodeParam,
                Name : editGoodsNameParam,
                BrandId : brandIdParam,
                ShelvesStatus : goodsStatusParam,
                CategoryoneId : firstClassifyIdParam,
                CategorytwoId : secondClassifyIdParam,
                DateManufacture : editManufactureDateParam,
                DetailImagePath : jsonDetailImagePath,
                ExpirationDate : editExpirationDateParam,
                GuaranteeDate : editGuaranteeParam,
                MainImagePath : mainImagePathParam,
                MaterialPrice : editMaterialPriceParam,
                MeasurementUnit : editMeasurementUnitParam,
                Packing : editPackingParam,
                MerchantType : MerchantTypeParam,
                PlaceOfOrigin : editPlaceParam,
                Price : editPriceParam,
                PackingPrice : editPackingPriceParam,
                Remarks : editRemarkParam,
                PurchasePrice : editPurchasePriceParam,
                TradePrice : editTradePriceParam,
                Specifications : editSpecificationsParam,
                Weight : editWeightParam,
                TransportPrice : editTransportPriceParam
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
                    if(goodIdParam == 0){
                        toastr.error("添加失败！");
                        return false;
                    }else{
                        toastr.error("修改失败！");
                        return false;
                    }
                }else{
                    $("#confirmAdd").button("reset");
                    $("input").val("");
                    $("#editGoodsModal").modal("hide");

                    if(goodIdParam == 0){
                        toastr.success("添加成功！");
                    }else{
                        toastr.success("修改成功！");
                    }
                    setTimeout(function () {
                        reset();
                    }, 2000);
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#confirmEdit").button("reset");
                toastr.error("操作失败！");
                return false;
            }
        });
    }

    //查看详情
    function viewDetail(gId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var gIdParam = gId;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/selectProductbyid', //目标地址
            data : {
                id : gIdParam
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
                    toastr.error("查询失败！");
                    return false;
                }
                else {
                    var retData = retInfo.data;
                    console.log(retData);

                    $("#mainImage").empty();
                    $("#detailImage").empty();

                    var goodsName = retData[0].name;
                    var goodsCode = retData[0].code;
                    var goodsCategoryOneName = retData[0].categoryonename;
                    var goodsCategoryTwoname = retData[0].categorytwoname;
                    var goodsBrandName = retData[0].brandname;
                    var goodsSpecifications = retData[0].specifications;
                    var goodsMeasurementUnit = retData[0].measurement_unit;
                    var goodsPacking = retData[0].packing;
                    var goodsWeight = retData[0].weight;
                    var goodsPurchasePrice = retData[0].purchase_price;
                    var goodsPackingPrice = retData[0].packing_price;
                    var goodsMaterialPrice = retData[0].material_price;
                    var goodsTransportPrice = retData[0].transport_price;
                    var goodsPlaceOfOrigin = retData[0].place_of_origin;
                    var goodsPrice = retData[0].price;
                    var goodsTradePrice = retData[0].trade_price;
                    var goodsDateManufacture = retData[0].date_manufacture;
                    var subDateManufacture = goodsDateManufacture.substring(0,10);
                    var goodsGuaranteeDate = retData[0].guarantee_date;
                    var goodsExpirationDate = retData[0].expiration_date;
                    var subExpirationDate = goodsExpirationDate.substring(0,10);
                    var goodsRemarks = retData[0].Remarks;
                    var mainImage = retData[0].main_image_path;
                    var detailImage = retData[0].detail_image_path;

                    $("#viewGoodsName").val(goodsName);
                    $("#viewGoodsCode").val(goodsCode);
                    $("#viewFirstClassify").val(goodsCategoryOneName);
                    $("#viewSecondClassify").val(goodsCategoryTwoname);
                    $("#viewBrandName").val(goodsBrandName);
                    $("#viewSpecifications").val(goodsSpecifications);
                    $("#viewMeasurementUnit").val(goodsMeasurementUnit);
                    $("#viewPacking").val(goodsPacking);
                    $("#viewWeight").val(goodsWeight);
                    $("#viewPurchasePrice").val(goodsPurchasePrice);
                    $("#viewPackingPrice").val(goodsPackingPrice);
                    $("#viewMaterialPrice").val(goodsMaterialPrice);
                    $("#viewTransportPrice").val(goodsTransportPrice);
                    $("#viewPlace").val(goodsPlaceOfOrigin);
                    $("#viewPrice").val(goodsPrice);
                    $("#viewTradePrice").val(goodsTradePrice);
                    $("#viewManufactureDate").val(subDateManufacture);
                    $("#viewGuarantee").val(goodsGuaranteeDate);
                    $("#viewExpirationDate").val(subExpirationDate);
                    $("#viewRemark").val(goodsRemarks);

                    var mainImagePath = "${bath}/"+mainImage;
                    var mainImagePathHtml = "<a href='"+mainImagePath+"' class='swipebox'>";
                    mainImagePathHtml += "<img src='"+mainImagePath+"' style='width:80px;height:80px' alt=''/>";
                    mainImagePathHtml += "</a>";
                    $("#mainImage").append(mainImagePathHtml);

                    var jsonDetailImage = JSON.parse(detailImage);
                    var jsonDetailImageLength = jsonDetailImage.length;

                    for(var dimg = 0; dimg < jsonDetailImageLength; dimg++){
                        var dimgPath = "${bath}/"+jsonDetailImage[dimg];
                        var dimgPathHtml = "<a href='"+dimgPath+"' class='swipebox'>";
                        dimgPathHtml += "<img src='"+dimgPath+"' style='width:80px;height:80px; margin:10px 10px 0px 0px' alt=''/>";
                        dimgPathHtml += "</a>";
                        $("#detailImage").append(dimgPathHtml);
                    }

                    $(".swipebox").swipebox();
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

    //删除商品方法
    function delRecord(recordId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var recordIdParam = recordId;

        $("#confirmDelete").button("loading");

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/ProductDelete', //目标地址
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

                    $("#editFirstClassifySelected").empty();

                    var defaultFirstClassifySelectedHtml = "<option value=''>请选择</option>";
                    $("#editFirstClassifySelected").append(defaultFirstClassifySelectedHtml);

                    for(var fc = 0; fc < retDataLength; fc++){

                        var id = retData[fc].id;
                        var name = retData[fc].name;

                        var firstClassifySelectedHtml = "<option value='"+id+"'>"+name+"</option>";

                        $("#editFirstClassifySelected").append(firstClassifySelectedHtml);
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

    //根据一级分类id获取二级分类列表方法
    function getSecondClassifyList(pid){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var selectedPidParam = pid;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getCategoryTwoListByPId', //目标地址
            data : {
                parentId : selectedPidParam
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
                    var retDataLength = retData.length;

                    $("#editSecondClassifySelected").empty();

                    var defaultSecondClassifySelectedHtml = "<option value=''>请选择</option>";
                    $("#editSecondClassifySelected").append(defaultSecondClassifySelectedHtml);

                    for(var scf = 0; scf < retDataLength; scf++){

                        var secondClassifyId = retData[scf].id;
                        var secondClassifyName = retData[scf].name;

                        var secondClassifyHtml = "<option value='"+secondClassifyId+"'>"+secondClassifyName+"</option>";

                        $("#editSecondClassifySelected").append(secondClassifyHtml);
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

    //根据二级分类id获取品牌列表方法
    function getBrandList(sPid){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var selectedSecondPidParam = sPid;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getBrandByCTId', //目标地址
            data : {
                id : selectedSecondPidParam
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
                    var retDataLength = retData.length;

                    $("#editBrandSelected").empty();

                    var defaultBrandSelectedHtml = "<option value=''>请选择</option>";
                    $("#editBrandSelected").append(defaultBrandSelectedHtml);

                    for(var b = 0; b < retDataLength; b++){

                        var brandId = retData[b].brandId;
                        var brandName = retData[b].name;

                        var brandHtml = "<option value='"+brandId+"'>"+brandName+"</option>";

                        $("#editBrandSelected").append(brandHtml);
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

    //修改状态获取一级分类列表方法
    function editGetFirstClassifyList(firstClassifyId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var firstClassifyIdParm = firstClassifyId;

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

                    $("#editFirstClassifySelected").empty();

                    var defaultFirstClassifySelectedHtml = "<option value=''>请选择</option>";
                    $("#editFirstClassifySelected").append(defaultFirstClassifySelectedHtml);

                    for(var fc = 0; fc < retDataLength; fc++){

                        var id = retData[fc].id;
                        var name = retData[fc].name;

                        var firstClassifySelectedHtml = "";
                        if(firstClassifyIdParm == id){
                            firstClassifySelectedHtml += "<option value='"+id+"' selected='selected'>"+name+"</option>";
                        }else{
                            firstClassifySelectedHtml = "<option value='"+id+"'>"+name+"</option>";
                        }

                        $("#editFirstClassifySelected").append(firstClassifySelectedHtml);
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

    //修改状态获取二级分类列表方法
    function editGetSecondClassifyList(secondClassifyId){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var secondClassifyIdParam = secondClassifyId;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getCategoryTwoList', //目标地址
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

                    $("#editSecondClassifySelected").empty();

                    var defaultSecondClassifySelectedHtml = "<option value=''>请选择</option>";
                    $("#editSecondClassifySelected").append(defaultSecondClassifySelectedHtml);

                    for(var scf = 0; scf < retDataLength; scf++){

                        var secondClassifyId = retData[scf].id;
                        var secondClassifyName = retData[scf].name;

                        var secondClassifyHtml = "";

                        if(secondClassifyIdParam == secondClassifyId){
                            secondClassifyHtml += "<option value='"+secondClassifyId+"' selected='selected'>"+secondClassifyName+"</option>";
                        }else{
                            secondClassifyHtml += "<option value='"+secondClassifyId+"'>"+secondClassifyName+"</option>";
                        }

                        $("#editSecondClassifySelected").append(secondClassifyHtml);
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

    //修改状态获取品牌列表方法
    function editGetBrandList(brandId){
        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var brandIdParam = brandId;

        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/productMgmt/getBrandList', //目标地址
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

                    $("#editBrandSelected").empty();

                    var defaultBrandSelectedHtml = "<option value=''>请选择</option>";
                    $("#editBrandSelected").append(defaultBrandSelectedHtml);

                    for(var b = 0; b < retDataLength; b++){

                        var brandId = retData[b].id;
                        var brandName = retData[b].name;

                        var brandHtml = "";
                        if(brandIdParam == brandId){
                            brandHtml += "<option value='"+brandId+"' selected='selected'>"+brandName+"</option>";
                        }else{
                            brandHtml += "<option value='"+brandId+"'>"+brandName+"</option>";
                        }
                        $("#editBrandSelected").append(brandHtml);
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

    //商品展示上传图片
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
                    imgPath = i.src;
                    console.log(imgPath);
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

    //删除商品展示图片
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

    //商品详情上传图片
    var uploadother = $(".uploadother");
    var uploadBtnOther = $("#uploadPicOther");
    var uploadFormOther = $("#uploadFormOther");
    var picOtherHtml = "";

    uploadBtnOther.change(function() {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var file = document.getElementById('uploadPicOther').files;  //获取到上传控件对象files
        var fileLength = file.length;
        if (file) {
            if (!(CheckImgFile(document.getElementById('uploadPicOther')))){
                return false;
            }
            for(var i = 0; i < fileLength; i++){
                (function(i){
                    var fileData = file[i];
                    var reader = new FileReader();  //创建一个FileReader对象

                    reader.readAsDataURL(fileData);      //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
                    var fileDataName = fileData.name;
                    reader.onload = function(e){      //当文件成功读取后

                        var imgOtherId = $(".uploadother").find("span").find("img").length;
                        if (uploadother.find('.item-pic-other').length >= 14) {
                            uploadFormOther.hide()
                        } else {
                            uploadFormOther.show();
                            if(fileLength > 0){
                                var imageId = parseInt(imgOtherId)+1;
                                picOtherHtml = "<span class='col-lg-3 col-md-3 col-xs-3 item-pic-other' id='imgotherbox"+imageId+"' style='width:80px;height:80px'><img class='' src='" + this.result + "' id='other" + imgOtherId + "'><span class='pic-del-other'></span></span>";
                            }else{
                                var imageId = 0;
                                picOtherHtml = "<span class='col-lg-3 col-md-3 col-xs-3 item-pic-other' id='imgotherbox"+imageId+"' style='width:80px;height:80px'><img class='' src='" + this.result + "' id='other" + imgOtherId + "'><span class='pic-del-other'></span></span>";
                            }
                            $("#loading").css("display","block");

                            uploadFormOther.before(picOtherHtml);
                        }

                        var imgPathOther = "";
                        var imgId = "other"+imgOtherId;
                        var p = document.getElementById(imgId);
                        p.src = event.target.result;

                        setTimeout(function () {
                            imgPathOther = p.src;
                            jQuery.ajax({
                                type : "POST", //用POST方式传输
                                url : '${bath}/fileUpload', //目标地址
                                data : {
                                    data : imgPathOther
                                },
                                dataType : "json", //数据格式:JSON
                                success : function(uploadRet) {
                                    console.log(uploadRet);
                                    var uploadRetCode = uploadRet.retCode;
                                    if(uploadRetCode !=0){

                                        $("#loading").css("display","none");

                                        $("#uploadPicOther").val("");
                                        toastr.error('上传失败！');
                                        return false;
                                    }
                                    else{

                                        $("#loading").css("display","none");

                                        $("#uploadPicOther").val("");
                                        toastr.success('上传成功！');

                                        var retImgPath = uploadRet.data;
                                        imagePathArray.push(retImgPath);
                                        console.log(imagePathArray);
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
                        },2000);
                    }
                })(i);
            }
        }
    });

    //删除商品详情图片
    $('.uploadother').delegate(".pic-del-other", "click", function() {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var self = $(this);
        var id = self.parent().find("img").attr("id");
        var subId = parseInt(id.substring(5));
        var index = subId;
        imagePathArray.splice(index,1);
        console.log(imagePathArray);

        self.parents(".item-pic-other").remove();
        uploadFormOther.show();

        toastr.success('删除成功！');

    });

    /* 检查图片上传的文件类型 */
    function CheckImgFile(obj) {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var objName = obj.value;
        if (!objName.match(/.jpg|.JPG|.JPEG|.jpeg|.GIF|.PNG|.gif|.png|.bmp/i))
        {
            toastr.error('上传文件类型不正确!');
            return false;
        }else{
            return true;
        }
    }
</script>
