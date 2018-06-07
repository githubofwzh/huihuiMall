<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>商家信息管理</title>
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
            <span style="margin-left: 10px">商家名称：</span>
            <input type="text" id="searchKey" placeholder="请输入商家名称">

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
                    <i class="fa fa-edit fa-fw"></i> 修改</button>
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
                        商家名称
                    </th>
                    <th width="130">
                        商家负责人
                    </th>
                    <th width="130">
                        联系方式
                    </th>
                    <th>
                        地址
                    </th>
                    <th width="100">
                        查看详情
                    </th>
                    <th width="200">
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
                        显示<label id="itemSize">2</label>项结果，共<label id="totalItem">2</label>项，
                        当前<label id="currentPage">1</label>/<label id="totalPages">1</label>页
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


<!--通过弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="closeShopModal" tabindex="-1" role="dialog" aria-labelledby="passModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="passModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 关店</h4>
                </div>
                <div class="modal-body">
                    确定关闭该商家店面？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmPass" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--通过弹出面板结束-->


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
                                        <label class="control-label">公司名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="companyName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">公司电话：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="companyTelephone">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系人姓名：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="contactsName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系人电话：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="contactsTelephone">
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="companyAddress">
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">银行名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyBankname">
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">银行账号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyBanknumber">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">法定代表人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyLegalPersonName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系方式：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" class="form-control required" placeholder="必填" id="modifyLegalPersonContact">
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
                                        <label class="control-label">商家名称：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="storeName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">商家负责人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="storeMan">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系方式：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="storePhone">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">地址：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="storeAddress">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">申请时间：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="storeTime">
                                    </div>
                                </div>
                            </div>

                             <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">营业执照注册号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="businessLicenseNumber">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">组织机构代码证号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="institutionCodeNumber">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">开户许可证号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="accountOpeningLicense">
                                    </div>
                                </div>
                            </div>

                             <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">税务登记证号：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="taxRegistryNumber">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">法定代表人：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="legalPersonName">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">联系电话：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="legalPersonContact">
                                    </div>
                                </div>
                            </div>

                             <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">覆盖区域：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="coverageArea">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">网点数：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="numberOfBranches">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">年销售额（万元）：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <input type="text" disabled class="form-control required" placeholder="必填" id="annualSales">
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                              <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-3 col-md-3 col-xs-3 title">
                                    <label class="control-label">利润（万元）：</label>
                                </div>
                                <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                    <input type="text" disabled class="form-control required" placeholder="必填" id="retProfit">
                                </div>
                             </div>
                           </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                               <div class="col-lg-12 col-md-12 col-xs-12">
                                   <div class="col-lg-3 col-md-3 col-xs-3 title">
                                       <label class="control-label">物流类型：</label>
                                   </div>
                                   <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                       <input type="text" disabled class="form-control required" placeholder="必填" id="retLogisticsType">
                                   </div>
                               </div>
                           </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                               <div class="col-lg-12 col-md-12 col-xs-12">
                                   <div class="col-lg-3 col-md-3 col-xs-3 title">
                                       <label class="control-label">联系人姓名：</label>
                                   </div>
                                   <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                       <input type="text" disabled class="form-control required" placeholder="必填" id="retLinkmanName">
                                   </div>
                               </div>
                           </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                               <div class="col-lg-12 col-md-12 col-xs-12">
                                   <div class="col-lg-3 col-md-3 col-xs-3 title">
                                       <label class="control-label">联系人电话：</label>
                                   </div>
                                   <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                       <input type="text" disabled class="form-control required" placeholder="必填" id="linkmanMobile">
                                   </div>
                               </div>
                           </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                   <div class="col-lg-12 col-md-12 col-xs-12">
                                       <div class="col-lg-3 col-md-3 col-xs-3 title">
                                           <label class="control-label">商家经营信息：</label>
                                       </div>
                                       <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                           <input type="text" disabled class="form-control required" placeholder="必填" id="mainProduct">
                                       </div>
                                   </div>
                               </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                  <div class="col-lg-12 col-md-12 col-xs-12">
                                      <div class="col-lg-3 col-md-3 col-xs-3 title">
                                          <label class="control-label">开户银行名称：</label>
                                      </div>
                                      <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                          <input type="text" disabled class="form-control required" placeholder="必填" id="bankName">
                                      </div>
                                  </div>
                              </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                  <div class="col-lg-12 col-md-12 col-xs-12">
                                      <div class="col-lg-3 col-md-3 col-xs-3 title">
                                          <label class="control-label">银行账号：</label>
                                      </div>
                                      <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                          <input type="text" disabled class="form-control required" placeholder="必填" id="bankNumber">
                                      </div>
                                  </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">营业执照复印证件：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <img id="businessLicence" src="" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">公司或者商铺门脸照片：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <img id="companyDoorFacePhotos" src="" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">卫生许可证：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <img id="hygienicLicense" src="" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">身份证正面：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <img id="legalPersonIdcard" src="" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">身份证反面：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <img id="linkmanIdcardbasePhoto" src="" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">营业场所照片：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <img id="managementPlacePhotos" src="" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-xs-12 input-form">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <div class="col-lg-3 col-md-3 col-xs-3 title">
                                        <label class="control-label">经营场所证明：</label>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-xs-8 input-box">
                                        <img id="managementPlaceThat" src="" />
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
    var storeId = "";
    var storeType = "";
    $(document).ready(function() {
        $("#loading").css("display","none");

        //分页方法
        var pageCount=20;   //每页条数
        var currentPageNum=1;  //当前页数,默认首页为第一页

        //获取当日任务计划号
        getUserInfos(pageCount,currentPageNum);

        //搜索点击
        $("#searchBtn").click(function(){
            $("#Tbody").empty();
            $("#loading").css("display","block");
            getUserInfos(pageCount,1);
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
                getUserInfos(pageCount,currentPageNum);
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
                getUserInfos(pageCount,currentPageNum);
            }else{
                return;
            }
        });

        //关店
        $("#confirmPass").click(function () {
            OpenStore(storeId,storeType);
        })


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
                    type: "GET", //用POST方式传输
                    url: '${bath}/merchantController/getMerchantReviewDetail', //目标地址
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
                        console.log(retInfo);
                        var retData = retInfo.data;
                        var retName = retData.name;//公司名称
                        var retPhone = retData.phone;//公司电话
                        var retLinkmanName = retData.linkmanName;//联系人姓名
                        var linkmanMobile = retData.linkmanMobile;//联系人电话
                        var retRegistAddress = retData.registAddress;//地址
                        var bankName = retData.bankName;//银行名称
                        var bankNumber = retData.bankNumber;//银行账号
                        var legalPersonContact = retData.legalPersonContact;//法人联系方式
                        var legalPersonName = retData.legalPersonName;//法人
                        $("#companyName").val(retName);
                        $("#companyTelephone").val(retPhone);
                        $("#contactsName").val(retLinkmanName);
                        $("#contactsTelephone").val(linkmanMobile);
                        $("#companyAddress").val(retRegistAddress);
                        $("#modifyBankname").val(bankNumber);
                        $("#modifyBanknumber").val(bankName);
                        $("#modifyLegalPersonName").val(legalPersonName);
                        $("#modifyLegalPersonContact").val(legalPersonContact);

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
    function getUserInfos(pageCount,currentPageNum){

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var searchKeyParam = $("#searchKey").val();

        $("#currentPage").html(currentPageNum);
        var accountIdParam = sessionStorage.getItem("userId");
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/merchantController/queryMerchantMg', //目标地址
            data : {
                accountId : accountIdParam,
                name : searchKeyParam
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

                var retCode = retInfo.retCode;
                if(retCode != 0){
                    $("#loading").css("display","none");
                    toastr.error('查询失败！');
                    return false;
                }else{
                    $("#loading").css("display","none");
                    var retData = retInfo.data;
                    console.log(retData);
                    var retDataLength = retData.length;

                    $("#Tbody").empty();
                    for(var i = 0 ;i < retDataLength; i ++){
                        var index = i + 1;
                        var retName = retData[i].name;
                        var retId = retData[i].id;
                        var retLegalPersonName = retData[i].legal_person_name;
                        var retLegalPersonContact = retData[i].legal_person_contact;
                        var retRegistAddress = retData[i].regist_address;
                        var retEnableStatus = retData[i].enable_status;
                        var retText = "";
                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td><input type='checkbox' id='"+retId+"' class='mycheckbox'/></td>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+retName+"</td>";
                        tbodyHtml += "<td>"+retLegalPersonName+"</td>";
                        tbodyHtml += "<td>"+retLegalPersonContact+"</td>";
                        tbodyHtml += "<td>"+retRegistAddress+"</td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='SeeDetails("+retId+");'>查看详情</a></td>";
                        if (retEnableStatus == 0){
                            retText = "关店";
                            retEnableStatus = 1;
                        }else if(retEnableStatus == 1) {
                            retText = "开店";
                            retEnableStatus = 0;
                        }
                        tbodyHtml += "<td><button type='button' class='btn btn-default' data-toggle='modal' data-target='#closeShopModal' style='margin:0px 10px' id='' onclick='getId("+retId+","+retEnableStatus+")'>"+retText+"</button></td>";
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
    //修改实现方法
    function modifyRecord(checkboxSelectedID) {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var modifyRecordID = parseInt(checkboxSelectedID);
        console.log(modifyRecordID);


        var companyNameParam = $("#companyName").val();
        if (companyNameParam == "") {
            toastr.error("公司名称不能为空！");
            return false;
        }
        var companyTelephoneParam = $("#companyTelephone").val();
        if (companyTelephoneParam == "") {
            toastr.error("公司联系方式不能为空！");
            return false;
        }
        var contactsNameParam = $("#contactsName").val();
        if (contactsNameParam == "") {
            toastr.error("联系人姓名不能为空！");
            return false;
        }
        var contactsTelephoneParam = $("#contactsTelephone").val();
        if (contactsTelephoneParam == "") {
            toastr.error("联系人电话不能为空！");
            return false;
        }
        var companyAddressParam = $("#companyAddress").val();
        if (companyAddressParam == "") {
            toastr.error("地址不能为空！");
            return false;
        }
        var modifyBanknameParam = $("#modifyBankname").val();
        if (modifyBanknameParam == "") {
            toastr.error("银行名称不能为空！");
            return false;
        }
        var modifyBanknumberParam = $("#modifyBanknumber").val();
        if (modifyBanknumberParam == "") {
            toastr.error("银行账号不能为空！");
            return false;
        }
        var modifyLegalPersonNameParam = $("#modifyLegalPersonName").val();
        if (modifyLegalPersonNameParam == "") {
            toastr.error("法定代表人不能为空！");
            return false;
        }
        var modifyLegalPersonContactParam = $("#modifyLegalPersonContact").val();
        if (modifyLegalPersonContactParam == "") {
            toastr.error("法人联系方式不能为空！");
            return false;
        }

        $("#confirmModify").button("loading");

        $.ajax({
            type: "POST", //用POST方式传输
            url: '${bath}/merchantController/updateMerchant', //目标地址
            data: {
                id : modifyRecordID,
                name : companyNameParam,
                phone : companyTelephoneParam,
                linkmanName : contactsNameParam,
                linkmanMobile : contactsTelephoneParam,
                registAddress : companyAddressParam,
                bankName : modifyBanknameParam,
                bankNumber : modifyBanknumberParam,
                legalPersonContact : modifyLegalPersonContactParam,
                legalPersonName : modifyLegalPersonNameParam
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
                    $("input").val("");
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
    //传参
    function getId(retId,retEnableStatus) {
        storeId = retId;
        storeType = retEnableStatus;
        return storeId;
        return storeType;
    }
    //开关店
    function OpenStore(storeId,storeType) {
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/merchantController/closeMerchant', //目标地址
            data : {
                id : storeId,
                enableStatus : storeType
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    toastr.error("操作失败！");
                    return false;
                }
                else{
                    $("#closeShopModal").modal("hide");
                    toastr.success("操作成功！");
                    setTimeout(function(){
                        reset();
                    },2000);
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
    //查看详情
    function SeeDetails(retId) {
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/merchantController/MerchantDetail', //目标地址
            data : {
                id : retId
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retData = retInfo.data;
                var retName = retData.name;//公司名称
                var retPhone = retData.phone;//公司电话
                var retLinkmanName = retData.linkmanName;//联系人姓名
                var linkmanMobile = retData.linkmanMobile;//联系人电话
                var retRegistAddress = retData.registAddress;//地址
                var retKhAccount = retData.accountOpeningLicense;//开户许可证号
                var retannualSales=retData.annualSales;//年销售额
                var auditTime = retData.auditTime;//申请时间
                var bankName = retData.bankName;//银行名称
                var bankNumber = retData.bankNumber;//银行账号
                var retYyNumber = retData.businessLicenseNumber;//营业执照注册号
                var retcoverageAreas=retData.coverageArea;//覆盖区域
                var retZzNumber = retData.institutionCodeNumber;//组织机构代码证号
                var legalPersonContact = retData.legalPersonContact;//法人联系方式
                var legalPersonName = retData.legalPersonName;//法人
                var mainProduct=retData.mainProduct;//主营产品
                var taxRegistryNumber=retData.taxRegistryNumber;//税务登记证号
                var retProfit = retData.profit;//利润
                var retLogistics = retData.logisticsType;//运送方式
                var numberOfBranches = retData.numberOfBranches;//网点数
                var retLogisticsType = "";
                if(retLogistics == 0){
                    retLogisticsType = "不提供"
                }else if (retLogistics == 1){
                    retLogisticsType = "选用平台物流"
                }else if (retLogistics == 2){
                    retLogisticsType = "自营"
                };





                $("#storeName").val(retName);
                $("#storeMan").val(retLinkmanName);
                $("#storePhone").val(linkmanMobile);
                $("#storeAddress").val(retRegistAddress);
                $("#storeTime").val(auditTime);
                $("#businessLicenseNumber").val(retYyNumber);
                $("#institutionCodeNumber").val(retZzNumber);
                $("#retKhAccount").val(retKhAccount);
                $("#taxRegistryNumber").val(taxRegistryNumber);
                $("#legalPersonName").val(legalPersonName);
                $("#legalPersonContact").val(legalPersonContact);
                $("#coverageArea").val(retcoverageAreas);
                $("#numberOfBranches").val(numberOfBranches);
                $("#annualSales").val(retannualSales);
                $("#retProfit").val(retProfit);
                $("#retLogisticsType").val(retLogisticsType);
                $("#retLinkmanName").val(retLinkmanName);
                $("#linkmanMobile").val(linkmanMobile);
                $("#mainProduct").val(mainProduct);
                $("#bankName").val(bankNumber);
                $("#bankNumber").val(bankName);
                $("#accountOpeningLicense").val(retKhAccount);

                var businessLicence = retData.businessLicence;//营业执照复印证件
                var companyDoorFacePhotos = retData.companyDoorFacePhotos;//公司或者商铺门脸照片
                var hygienicLicense = retData.hygienicLicense;//卫生许可证（食品类）
                var legalPersonIdcard = retData.legalPersonIdcard;//身份证正面
                var linkmanIdcardbasePhoto = retData.linkmanIdcardbasePhoto;//身份证反面
                var managementPlacePhotos = retData.managementPlacePhotos;//经营场所照片
                var managementPlaceThat = retData.managementPlaceThat;//经营场所证明

                $("#businessLicence").attr("src","${bath}"+businessLicence);
                $("#companyDoorFacePhotos").attr("src","${bath}"+companyDoorFacePhotos);
                $("#hygienicLicense").attr("src","${bath}"+hygienicLicense);
                $("#legalPersonIdcard").attr("src","${bath}"+legalPersonIdcard);
                $("#linkmanIdcardbasePhoto").attr("src","${bath}"+linkmanIdcardbasePhoto);
                $("#managementPlacePhotos").attr("src","${bath}"+managementPlacePhotos);
                $("#managementPlaceThat").attr("src","${bath}"+managementPlaceThat);


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
    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#loading").css("display","block");
        getUserInfos(pageCount,currentPageNum);
    }
    //导出
    function excelExport(pageCount,currentPageNum){
        var accountIdParam = sessionStorage.getItem("userId");
        window.location.href="${bath}/InventoryExecel/MerchantMgExecel?accountId="+accountIdParam;
    }


</script>
