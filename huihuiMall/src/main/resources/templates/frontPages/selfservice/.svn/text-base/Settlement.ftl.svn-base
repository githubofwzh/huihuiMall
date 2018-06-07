<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>结算</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/Settlement.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/footer.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>

	<body>
	<#include "nav.ftl">
	<label class="Address" style="display: none"></label>
	<label class="faceId" style="display: none"></label>
	<label class="faceShopkeeper_id" style="display: none"></label>
	<label class="faceName" style="display: none"></label>
	<label class="storeHouseId" style="display: none"></label>
	<label class="RefereeId" style="display: none"></label>
    <label class="parentId" style="display: none">${orderNumber!''}</label>
    <label class="navTypeParam" style="display: none">${navType!''}</label>
    <label class="orderCode" style="display: none">${orderCode!''}</label>
    <label class="itemId" style="display: none">${itemId!''}</label>

		<div class="container-fluid minute">
			<div class="row">
				<div class="payment col-lg-12 col-sm-12 col-xs-12">
					<section class="payment_money">
						<span>支付金额：</span><a class="money_number">${money!''}</a><span>元</span>
					</section>
					<section class="payment_mode col-lg-12 col-sm-12 col-xs-12 clearfix">
						<div class="left col-lg-5 col-sm-5 col-xs-5">
							<span>请选择支付方式：</span>
							<button class="weixin"><img src="${bath}/images/frontpages/common/wx.png" />微信支付</button>
							<button class="zhifb"><img src="${bath}/images/frontpages/common/zfb.png" />支付宝支付</button>
						</div>
						<div class="payment_Scancode col-lg-7 col-sm-7 col-xs-7 left">
							<img src="${bath}/images/frontpages/common/Unselected.png" />
							<span>尚未选择支付方式</span>
						</div>
						<div class="left col-lg-7 col-sm-7 col-xs-7 Scan_code" style="display: none;">
							<p>
								请扫描右侧
								<br />二维码付款
							</p>
                            <img src="${bath}//images/frontpages/common/Here_zz.png">
                            <div class="saoma" id="code">
                                <img id="loading" style="text-align: center !important; vertical-align: middle !important;" src="${bath}//images/common/loading.gif"/>
                                <img id="QRcode" style="text-align: center; vertical-align: middle; display: none" src=""/>
                            </div>
						</div>
					</section>
				</div>

                <!--支付弹出面板开始-->
                <div class="panel-body">
                    <div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body text-center" style="padding: 35px;">
                                    <img src="" />
                                    <p></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default confirm-btn" style="margin-top: 0px; padding: 10px; font-size: 20px" id="payModal_btn" data-loading-text="保存中..." autocomplete="off">
                                        确定</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--支付面板结束-->

			</div>
		</div>
	</body>
<#include "footer.ftl">
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(".Scan_code").css("display","none");
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };
    var ParentIdNumber = $(".parentId").text();
    var navTypeParamNumber = $(".navTypeParam").text();
    var money = $(".money_number").text();
    var itemId = $(".itemId").text();
    var orderCode = $(".orderCode").text();
    $(document).ready(function() {

        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var footerHeight = $(".footer").height();
        var goodsHeight = screenHeight - navPanelHeight - footerHeight + 110 + "px";

        $(".minute").css("height",goodsHeight);


        ObtainNumber();
        $(".weixin").click(function () {
			$(".Scan_code").css("display","block");
			$(".payment_Scancode").css("display","none");
			//微信支付
            WXRqcode(ParentIdNumber);
        });
        $(".zhifb").click(function () {
            $(".Scan_code").css("display","block");
            $(".payment_Scancode").css("display","none");
            //支付宝支付
            zfuRqcode(ParentIdNumber);

        })
	});

    //设备号获取商店信息
    function ObtainNumber() {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getStoreId', //目标地址
            data : {
                deviceCode : localStorage.getItem("equipment_Number")
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retData = retInfo.data;
				var Address = retData[0].store_address;  //地址
				var faceId = retData[0].id; //门店ID
				var faceShopkeeper_id = retData[0].shopkeeper_id;   //门店负责人ID
				var faceName = retData[0].store_name; //门店名称
				var storeHouseId = retData[0].storehouse_id; //库房ID
				var RefereeId = retData[0].shopkeeper_id;

				$(".Address").text(Address);
				$(".faceId").text(faceId);
				$(".faceShopkeeper_id").text(faceShopkeeper_id);
				$(".faceName").text(faceName);
				$(".storeHouseId").text(storeHouseId);
				$(".RefereeId").text(RefereeId);
                $(".footer_center").text(faceName);
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


    <!--支付宝结算-->
    //支付宝支付
    function zfuRqcode(ParentIdNumber) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/createAliPayCode', //目标地址
            data : {
                totalAmount : 0.01,//价格
                outTradeNo : ParentIdNumber,//订单号
                subject : "惠惠网店商品",//商品名
                body : "惠惠网店商品"//备注
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
                if (retCode != 0){
                    toastr.error('支付信息有误，请重新申请支付！');
                }else {
                    var retData = retInfo.data;
                    var retDataCode = retData.code;
                    var retDataOutTradeNo = retData.out_trade_no;
                    var retDataQrCode = retData.qr_code;
                    if (retDataCode != "10000"){
                        toastr.error('支付宝支付二维码获取失败！');
                    }else {
                        $("#loading").css("display","none");
                        $("#QRcode").css("display","block");
                        $("#QRcode").attr("src","data:image/png;base64,"+retDataQrCode);
                        toastr.success('支付宝支付二维码获取成功！');
                        if(navTypeParamNumber == 11){
                            LifePay(retDataOutTradeNo,1);
                        }else if(navTypeParamNumber == 10){
                            var ZFBtime = setInterval(function () {
                                ZFBViewTheResults(retDataOutTradeNo,ZFBtime)
                            },5000);
                        };
                        setTimeout(function () {
                            clearInterval(time);
                            $("#payModal").modal('show');
                            $(".modal-body img").attr("src","${bath}/images/frontpages/common/error.png");
                            $(".modal-body p").text("支付超时，请重新选择支付方式");
                            $("#payModal_btn").click(function () {
                                $("#payModal").modal('hide');
                                $(".payment_Scancode").show();
                                $(".Scan_code").hide();
                                $("#code>img").attr("src","${bath}//images/common/loading.gif");
                            });
                        },7200000);
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
    //支付宝查询支付结果
    function ZFBViewTheResults(retDataOutTradeNo,ZFBtime) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/aliQuery', //目标地址
            data : {
                outTradeNo : retDataOutTradeNo
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
                    return false;
                }else {
                    var retdata = retInfo.data;
                    var retData = JSON.parse(retdata);
                    var retDataAlipayTradeQueryResponse = retData.alipay_trade_query_response;
                    var retTradeStatus = retDataAlipayTradeQueryResponse.trade_status;
                    if (retTradeStatus == "TRADE_SUCCESS"){
                        clearInterval(ZFBtime);
                        var type = 3;
                        var transactionId = retDataAlipayTradeQueryResponse.trade_no;
                        console.log(transactionId);
                        UpOrderType(type,retDataOutTradeNo);
                        UpOrderData(1,transactionId);
                        $("#payModal").modal('show');
                        $(".modal-body img").attr("src","${bath}/images/frontpages/common/adopt.png");
                        $(".modal-body p").text("支付成功！");
                        $.cookie('commodity',null,{expires: -1});
                        $(".mine-shoppingcart-panel").empty();
                        $("#payModal_btn").click(function () {
                            var navTypeParam = 7;
                            var url = "${bath}/portalLink/linkToMyStoreSelfHelp?navType="+navTypeParam;
                            window.open(url,"_self");
                        });
                        $("#payModal").modal('hide',function () {
                            var navTypeParam = 7;
                            var url = "${bath}/portalLink/linkToMyStoreSelfHelp?navType="+navTypeParam;
                            window.open(url,"_self");
                        });
                    }
                    /*else {
                    var type = 2;
                    UpOrderType(type);
                    }*/
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        })
    }
    <!--支付宝结算-->
    <!--微信结算-->
    //微信支付
    function WXRqcode(ParentIdNumber) {
        var retOutTradeNo = ParentIdNumber;
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/weChatUnifiedOrder', //目标地址
            data : {
                appID : "wx7d1abedddbfe625f",//商户ID
                mchID : "1502025021",//商户号
                mchKey : "764D15C57EB8A66CA8EC830A726AE090",//商户支付API密钥
                totalFee : 0.01,//价格（单位元）
                outTradeNo : retOutTradeNo,//订单号
                productName : "惠惠网店商品",//商品名称
                tradeType : "NATIVE",//扫码支付类型
                productId : "HHWD123",//产品ID
                userCode : "qwe3qwe",//
                notifyUrl : "http://www.hhwd.com.cn/huihuimall/pay/weChatNotifyUrl"//支付地址
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
                if (retCode == 0){
                    var retData = retInfo.data;
                    var retDataCodeUrl = retData.qrcode_path;
                    var retDataResultCode = retData.result_code;
                    var retDataRturnCode = retData.return_code;
                    if (retDataResultCode == "SUCCESS" && retDataRturnCode == "SUCCESS"){
                        $("#loading").css("display","none");
                        $("#QRcode").css("display","block");
                        $("#QRcode").attr("src","data:image/png;base64,"+retDataCodeUrl);
                        toastr.success('微信支付二维码获取成功！');
                        if(navTypeParamNumber == 11){
                            LifePay(retOutTradeNo,2)
                        }else if(navTypeParamNumber == 10){
                            var time = setInterval(function () {
                                WXViewTheResults(retOutTradeNo,time)
                            },5000);
                        }
                        setTimeout(function () {
                            clearInterval(time);
                            $("#payModal").modal('show');
                            $(".modal-body img").attr("src","${bath}/images/frontpages/common/error.png");
                            $(".modal-body p").text("支付超时，请重新选择支付方式");
                            $("#payModal_btn").click(function () {
                                $("#payModal").modal('hide');
                                $(".payment_Scancode").show();
                                $(".Scan_code").hide();
                                $("#code>img").attr("src","${bath}//images/common/loading.gif");
                            });
                        },7200000);
                    }else {
                        toastr.error('获取支付二维码失败！');
                    }
                } else if (retCode == 40002){
                    toastr.error('已支付成功，请不要重复支付！');
                } else {
                    toastr.error('网络请求失败！');
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
    //微信支付查询结果
    function WXViewTheResults(retOutTradeNo,time){
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/weChatOrderQuery', //目标地址
            data : {
                outTradeNo : retOutTradeNo,
                appID : "wx7d1abedddbfe625f",
                mchID : "1502025021",
                mchKey : "764D15C57EB8A66CA8EC830A726AE090"
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
                var retData = retInfo.data;
                if(retCode == 0){
                    var retDataTradeState = retData.trade_state;
                    if(retDataTradeState == "SUCCESS"){
                        clearInterval(time);
                        var type = 3;
                        var retDataOutTradeNo = "";
                        var transactionId = retData.transaction_id;
                            UpOrderType(type);
                            UpOrderData(2,transactionId);
                        $("#payModal").modal('show');
                        $(".modal-body img").attr("src","${bath}/images/frontpages/common/adopt.png");
                        $(".modal-body p").text("支付成功！");
                        $.cookie('commodity',null,{expires: -1});
                        $(".mine-shoppingcart-panel").empty();
                        $("#payModal_btn").click(function () {
                            var navTypeParam = 7;
                            var url = "${bath}/portalLink/linkToMyStoreSelfHelp?navType="+navTypeParam;
                            window.open(url,"_self");
                        });
                        $("#payModal").modal('hide',function () {
                            var navTypeParam = 7;
                            var url = "${bath}/portalLink/linkToMyStoreSelfHelp?navType="+navTypeParam;
                            window.open(url,"_self");
                        });
                    }
                    /*else {
                        var type = 2;
                        UpOrderType(type);
                    }*/
                }else {
                    return false;
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        })
    }
    <!--微信结算-->
    <!--订单状态更新-->
    //后台更新
    function UpOrderData(paytype,transactionId){
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/updatePayInfo', //目标地址
            data : {
                orderNumber : ParentIdNumber,
                paytype : paytype,
                transactionId : transactionId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                return false;
            }
        })
    }
    //支付成功后把订单状态更新
    function UpOrderType(type,retDataOutTradeNo) {
        console.log(ParentIdNumber);
        $.ajax({
            type : "POST",
            url : "${bath}/ProtalStoreOrder/CompletePayment",
            data : {
                parentId : ParentIdNumber,
                orderstatus : type,
                outTradeNo : retDataOutTradeNo
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {

            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        })
    }
    <!--订单状态更新-->

    <!--生活缴费-->
    function LifePay(retOutTradeNo,type) {
        $.ajax({
            type : "POST",
            url : "${bath}/PortalLivingPay/payinfo",
            data : {
                itemId : itemId,//商品编号
                itemNum : money,//价格
                rechargeAccount : orderCode,//缴费账户
                billCycle : 2,//账期
                outerTid : retOutTradeNo,//自己的订单号4
                type : type//支付方式  微信or支付宝
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                var retCode = retInfo.retCode;
                if(retCode == 0){
                    $("#payModal").modal('show');
                    $(".modal-body img").attr("src","${bath}/images/frontpages/common/adopt.png");
                    $(".modal-body p").text("支付成功！");
                    $("#payModal_btn").click(function () {
                        var navTypeParam = 7;
                        var url = "${bath}/portalLink/linkToMyStoreSelfHelp?navType="+navTypeParam;
                        window.open(url,"_self");
                    });
                    $("#payModal").modal('hide',function () {
                        var navTypeParam = 7;
                        var url = "${bath}/portalLink/linkToMyStoreSelfHelp?navType="+navTypeParam;
                        window.open(url,"_self");
                    });
                }else if(retCode == 1){
                    toastr.error('系统异常！');
                    return false;
                }else{
                    toastr.error('支付失败！');
                    return false;
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        })
    }
    <!--生活缴费-->
</script>