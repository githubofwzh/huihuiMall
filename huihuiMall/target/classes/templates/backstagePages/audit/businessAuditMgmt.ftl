<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>商家审核管理</title>
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

            <span>商家名称：</span>
            <input type="text" id="searchKey" placeholder="请输入商家名称">

            <button type="button" class="btn btn-default" id="searchBtn" onclick="searchStore();"><i class="fa fa-search fa-fw"></i> 搜索</button>
            <button type="button" class="btn btn-default" id="resetBtn"><i class="fa fa-undo fa-fw"></i> 重置</button>

        </div>
    </div>
</div>

<div class="container-fluid table-operation-panel">
    <div class="row table-row">
        <div class="col-lg-12 col-md-12 col-xs-12 table-panel">

            <table class="table table-bordered table-hover table-responsive" style="margin-top: 20px;">
                <thead>
                <tr>
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
                        申请时间
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

<!--通过弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="passModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="passModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 通过</h4>
                </div>
                <div class="modal-body">
                    确定该商家商品通过审核可以上架？
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

<!--打回弹出面板开始-->
<div class="panel-body">
    <div class="modal fade" id="notPassModal" tabindex="-1" role="dialog" aria-labelledby="notPassModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="notPassModalLabel">
                        <i class="fa fa-trash-o fa-fw"></i> 打回</h4>
                </div>
                <div class="modal-body">
                    确定该商家商品未通过审核？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #ccc;
                            color: #444444">
                        取消</button>
                    <button type="button" class="btn btn-default" style="margin-top: 0px" id="confirmNotpass" data-loading-text="操作中..." autocomplete="off">
                        确定</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--打回弹出面板结束-->

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
    var storeId = "";
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

        //通过
        $("#confirmPass").click(function () {
            ToExamine(storeId,1);
        });
        //打回
        $("#confirmNotpass").click(function () {
            ToExamine(storeId,2);
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

        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/merchantController/queryMerchantReview', //目标地址
            data : {
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


                    for(var i = 0; i < retDataLength; i++){
                        var index = i + 1;
                        var retStoreName = retData[i].name;//商店名称
                        var retId = retData[i].id;//商店ID
                        var retRegistAddress = retData[i].regist_address;//地址
                        var retLegalPersonName = retData[i].legal_person_name;//负责人
                        var retLegalPersonContact = retData[i].legal_person_contact;//负责人电话
                        var retAuditTime = retData[i].audit_time;//时间
//                        var retTime = retAuditTime.substring(0,10);
                        console.log(typeof (retAuditTime));
                        var tbodyHtml = "<tr>";
                        tbodyHtml += "<td>"+index+"</td>";
                        tbodyHtml += "<td>"+retStoreName+"</td>";
                        tbodyHtml += "<td>"+retLegalPersonName+"</td>";
                        tbodyHtml += "<td>"+retLegalPersonContact+"</td>";
                        tbodyHtml += "<td>"+retRegistAddress+"</td>";
                        tbodyHtml += "<td>"+retAuditTime+"</td>";
                        tbodyHtml += "<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='SeeDetails("+retId+");'>查看详情</a></td>";
                        tbodyHtml += "<td>";
                        tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#passModal' style='margin:0px 10px' id='' onclick='adopt("+retId+")'>通过</button>";
                        tbodyHtml += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#notPassModal' style='margin:0px 10px' id='' onclick='adopt("+retId+")'>打回</button>";
                        tbodyHtml += "</td>";
                        tbodyHtml += "</tr>";
                        $("#Tbody").append(tbodyHtml);
                    }
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
            type : "GET", //用POST方式传输
            url : '${bath}/merchantController/getMerchantReviewDetail', //目标地址
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
                $("#bankName").val(bankName);
                $("#bankNumber").val(bankNumber);
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
    
    //传参商品ID
    function adopt(retId) {
        storeId = retId;
        return storeId;
    }
    
    //审核接口
    function ToExamine(storeId,type) {
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/merchantController/passMerchantReview', //目标地址
            data : {
                id : storeId,
                auditStatus : type
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retCode = retInfo.retCode;
                if(retCode != 0){
                    $("#passModal").modal("hide");
                    $("#notPassModal").modal("hide");
                    toastr.error("审核失败！");
                    return false;
                }
                else{
                    $("#passModal").modal("hide");
                    $("#notPassModal").modal("hide");
                    toastr.success("审核成功！");
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

    //重置实现方法
    function reset(){
        var currentPageNum = 1;
        var pageCount = 20;
        $("#searchKey").val("");
        $("#loading").css("display","block");
        getUserInfos(pageCount,currentPageNum);
    }

</script>
