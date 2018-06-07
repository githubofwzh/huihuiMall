<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>我的购物车</title>

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/goodssettlement.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

</head>
<body>
<label style="display: none" class="faceAddress"></label>
<label style="display: none" class="faceId"></label>
<label style="display: none" class="faceShopkeeper_id"></label>
<label style="display: none" class="retuserId"></label>
<label style="display: none" class="MdId"></label>
<label style="display: none" class="storageroomId"></label>
<label style="display: none" Id="labelStoreName"></label>
<container>
    <section>
        <div class="container-fluid top-panel">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 mine-shoppingcart-panel">
                        <div class="col-lg-12 col-md-12 col-xs-12 choose-store-panel">
                            <div class="col-lg-3 col-md-3 col-xs-3 choose-store">
                                <span>配送门店：</span>
                            </div>
                            <div class="col-lg-5 col-md-5 col-xs-5" style="padding:10px 0px">
                                <span id="choosedStoreName"></span>
                            </div>
                            <div class="col-lg-3 col-md-3 col-xs-3 choose-btn" style="padding:10px 0px">
                                <a href="#" data-toggle="modal" data-target="#chooseStoreModal" onclick="openChooseStoreModal();" style="outline: none;">选择门店<i class="fa fa-angle-right fa-fw"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-12 col-md-12 col-xs-12 settlement-panel">
                            <div class="col-lg-2 col-md-2 col-xs-2 sum">
                                <span>合计：</span>
                            </div>
                            <div class="col-lg-6 col-md-6 col-xs-6 sum-price">
                                <span><i class="fa fa-cny fa-fw"></i><span class="money_number"></span></span>
                            </div>
                            <div class="col-lg-4 col-md-4 col-xs-4 settlement-btn">
                                <span>去结算</span>
                            </div>
                        </div>
                </div>
            </div>
        </div>

        <!--选择门店弹出面板开始-->
        <div class="panel-body">
            <div class="modal fade" data-backdrop="true" id="chooseStoreModal" tabindex="-1" role="dialog" aria-labelledby="chooseStoreModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="chooseStoreModalLabel">
                                选择门店</h4>
                        </div>
                        <div class="modal-body">
                            <section>
                                <select class="sheng" onchange="changeSheng()">
                                    <#--onclick="openPaySheng();"-->
                                </select>
                                <select class="shi" onchange="changeShi()">
                                </select>
                                <select class="qu" onchange="changeQu()">
                                </select>
                            </section>
                            <section>
                                <select class="jiedao" onchange="changeJd()">
                                </select>
                            </section>
                            <section>
                                <select class="mendian" onclick="changeMd()">
                                </select>
                            </section>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default confirm-btn" style="margin-top: 0px" id="SaveAddress" data-loading-text="保存中..." autocomplete="off">
                                确认</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--选择门店面板结束-->

        <!--支付弹出面板开始-->
        <div class="panel-body">
            <div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body text-center" id="payModalBody">
                            <img src="" />
                            <p></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default confirm-btn" style="margin-top: 0px" id="payModal_btn" data-dismiss="modal" style="cursor:pointer;">
                                确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--支付面板结束-->

    <#include "nav.ftl">
    </section>


</container>
</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ready(function() {
        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var chooseStorePanelHeight = $(".choose-store-panel").height();
        var settlementPanelHeight = $(".settlement-panel").height();

        var goodsHeight = screenHeight - navPanelHeight - chooseStorePanelHeight - settlementPanelHeight + "px";

        $(".mine-shoppingcart-panel").css("height",goodsHeight);

        var faceIdParam = $(".faceId").text(); //门店id
        if(faceIdParam != null || faceIdParam !=""){
            $(".faceId").text("");
        }

        var faceShopkeeperIdParam = $(".faceShopkeeper_id").text();//门店负责人id
        if(faceShopkeeperIdParam != null || faceShopkeeperIdParam !=""){
            $(".faceShopkeeper_id").text("");
        }

        var retuserIdParam = $(".retuserId").text();//用户id
        if(retuserIdParam != null || retuserIdParam !=""){
            $(".retuserId").text("");
        }

        var storageroomIdParam = $(".storageroomId").text();//仓库id
        if(storageroomIdParam != null || storageroomIdParam !=""){
            $(".storageroomId").text("");
        }

        var doorTextParam = $(".faceAddress").text();
        if(doorTextParam != null || doorTextParam !=""){
            $(".faceAddress").text("");
        }

        var cookie = $.cookie("commodity");
        var JsonCookie = $.parseJSON(cookie);

        if ($.cookie("commodity") == "" || $.cookie("commodity") == null || $.cookie("commodity") == undefined){
            $(".money_number").text("0");
            toastr.error("请先选择商品在结算！");
            return false;
        }else {
            var jsonObj = eval('(' + $.cookie("commodity") + ')');
            var cookieJsonData = jsonObj.length;
            var moneyNumber = 0;
            for (var i = 0; i < cookieJsonData; i++){
                var commodityMoney = Number(jsonObj[i].commodity_money);
                var commodityNumber = parseInt(jsonObj[i].commodity_number);
                moneyNumber += Number(commodityMoney*commodityNumber);
            }
            $(".money_number").text(moneyNumber.toFixed(2));
            shoppingCarList();
        };

        //选择门店modal展示
        $("#chooseStoreModal").on("show.bs.modal",function(){
            openPaySheng();
        });

        //确认门店地址
        $("#SaveAddress").click(function () {
            if($(".sheng").find("option:selected").text() != "" && $(".shi").find("option:selected").text() != "" && $(".qu").find("option:selected").text() != "" && $(".jiedao").find("option:selected").text() != "" && $(".mendian").find("option:selected").text() != "" && $(".mendian").find("option:selected").text() != "请选择"){
                $(".faceId").text($(".mendian").val());
                $(".storageroomId").text($(".mendian").find("option:selected").attr("id"));
                $(".faceAddress").text($(".mendian").find("option:selected").attr("name"));
                $(".faceShopkeeper_id").text($(".mendian").find("option:selected").attr("class"));
                //toastr.success("保存成功！");
            }else {
                toastr.error("请把信息填写完整！");
            }
            $("#chooseStoreModal").modal("hide");
            var shengText = $(".sheng").find("option:selected").text();
            var shiText = $(".shi").find("option:selected").text();
            var quText = $(".qu").find("option:selected").text();
            var streetText = $(".jiedao").find("option:selected").text();
            var doorText = $(".faceAddress").text();
            var checkText = $(".mendian").find("option:selected").text();//门店名
            var faceAllAddress = shengText + shiText + quText + streetText + doorText + checkText;
            console.log(faceAllAddress.length);
            $("#labelStoreName").text(faceAllAddress);
            if(faceAllAddress.length > 10){
                var subFaceAllAddress = faceAllAddress.substring(0,8);
                $("#choosedStoreName").html(subFaceAllAddress+"...");
            }else{
                $("#choosedStoreName").html(faceAllAddress);
            }

        });

        //结算按钮
        $(".settlement-btn").click(function(){

            //获取cookie
            var jsonObj = eval('(' + $.cookie("commodity") + ')');
            var jsonObjLength = jsonObj.length;
            var goodsPanelLength = $(".goods-panel").length;
            if(jsonObjLength <= 0 || goodsPanelLength <= 0){
                toastr.error("请先挑选商品！");
                return false;
            }else{
                if($(".goods-type[0] span").text() == "惠惠自营"){
                    JsonCookie[0].Sj_type = 1;
                }else {
                    JsonCookie[0].Sj_type = 2;
                };
                var dataCookie = JSON.stringify(jsonObj);
                var checkText = $(".mendian").find("option:selected").text();//门店名
                if(checkText == "" || checkText == null || checkText == "请选择"){
                    toastr.error("请把信息填写完整！");
                    return false;
                }else {
                    openPayModal(dataCookie);
                };
            }

        });

    });

    //支付弹窗
    function openPayModal(dataCookie){

        var dataCookieParam = dataCookie;
        console.log(dataCookieParam);

        var faceId = $(".faceId").text(); //门店id

        var faceShopkeeper_id = $(".faceShopkeeper_id").text();//门店负责人id

        var retuserId = $(".retuserId").text();//用户id

        var storageroomId = $(".storageroomId").text();//仓库id

        var shengText = $(".sheng").find("option:selected").text();
        /*if(shengText == null || shengText ==""){
            $("#payModal").modal("hide");
            toastr.error("请先选择门店！");
            return false;
        }*/

        var shiText = $(".shi").find("option:selected").text();
        /*if(shiText == null || shiText ==""){
            toastr.error("请先选择门店！");
            return false;
        }*/

        var quText = $(".qu").find("option:selected").text();
        /*if(quText == null || quText ==""){
            toastr.error("请先选择门店！");
            return false;
        }*/

        var streetText = $(".jiedao").find("option:selected").text();
        /*if(streetText == null || streetText ==""){
            toastr.error("请先选择门店！");
            return false;
        }*/

        var doorText = $(".faceAddress").text();
        /*if(doorText == null || doorText ==""){
            toastr.error("请先选择门店！");
            return false;
        }*/

        var checkText = $(".mendian").find("option:selected").text();//门店名
        //console.log(checkText);
        /*if(checkText == null || checkText ==""){
            toastr.error("请先选择门店！");
            return false;
        }*/

        var faceAddress = $("#labelStoreName").text();
        console.log(faceAddress);
        if(checkText != "请选择" && faceAddress != ""){
            $.ajax({
                type : "POST", //用POST方式请求
                url : '${bath}/ProtalStoreOrder/OrderSplit', //目标地址
                data : {
                    StoreOder : dataCookieParam,  //订单商品信息
                    commodity_Address : faceAddress,
                    commodity_faceId : faceId,
                    commodity_faceShopkeeperId : faceShopkeeper_id,
                    commodity_retuserId : retuserId,
                    commodity_faceName : checkText,
                    commodity_Orderstate: 1,
                    commodity_StorageRoomId : storageroomId,
                    commodity_RefereeId : faceShopkeeper_id
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
                    if(retCode != 0){
                        toastr.error('获取支付失败！');
                    }else {
                        var moneyNumber = $(".money_number").text();
                        WXRqcode(retData,moneyNumber);
                    }


                    /*if(retCode != 0){
                        $("#payModalBody img").attr("src","${bath}/images/frontpages/common/error.png");
                        $("#payModalBody p").text("支付失败，请重新支付");
                        return false;
                    }else{

                    }*/
                },
                error:function(XMLHttpRequest, textStatus){
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $("#loading").css("display","none");
                    toastr.error('操作失败！');
                    return false;
                }
            });
        }else {
            toastr.error('请把地址填写完整！');
            $("#payModal").css("display","none");
        }
    }

    //微信支付
    function WXRqcode(retDataCode,moneyNumber) {
        var retOutTradeNo = retDataCode;
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/weChatPublicPay', //目标地址
            data : {
                money : 0.01,//价格
                orderNumber : retOutTradeNo//订单号
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                var retData = retInfo.data;
                var retNonceStr = retData.nonceStr;//随机字符串
                var retAppId = retData.appid;//公众号Id
                var retTimeStamp = retData.timeStamp;//prepay_id
                var retSign = retData.paySign;//
                var PrepayId = retData.packageValue;
                var success = retData.success;//信息成功
                if (success == "ok"){
                    toastr.success('请求支付成功！');
                    callPay(retAppId,retTimeStamp,retNonceStr,PrepayId,retSign,retOutTradeNo,moneyNumber);
                }else {
                    toastr.error('请求支付失败！');
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

    function callPay(retAppId,retTimeStamp,retNonceStr,PrepayId,retSign,retOutTradeNo,moneyNumber) {
        if (typeof WeixinJSBridge == "undefined") {
            if (document.addEventListener) {
                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
            } else if (document.attachEvent) {
                document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
            }
        } else {
            onBridgeReady(retAppId,retTimeStamp,retNonceStr,PrepayId,retSign,retOutTradeNo,moneyNumber);
        }
    }

    //请求支付
    function onBridgeReady(retAppId,retTimeStamp,retNonceStr,PrepayId,retSign,retOutTradeNo,moneyNumber) {
            WeixinJSBridge.invoke('getBrandWCPayRequest', {
                "appId" : retAppId,
                "timeStamp" : retTimeStamp,
                "nonceStr" : retNonceStr,
                "package" : PrepayId,
                "signType" : "MD5",
                "paySign" : retSign
            }, function(res) {
                if (res.err_msg == "get_brand_wcpay_request:ok" ) {
                    toastr.success('支付成功！');
                    WXQueryOrder(retOutTradeNo);
                    var Type = 3;
                    UpOrderType(retOutTradeNo,Type);
                    WXViewTheResults(retOutTradeNo,moneyNumber);
                    $("#payModal").modal('show');
                    $("#payModalBody img").attr("src","${bath}/images/frontpages/common/adopt.png");
                    $("#payModalBody p").text("支付成功！");
                    $.cookie('commodity',null,{expires: -1});
                    $(".mine-shoppingcart-panel").empty();
                    $("#payModal").modal('hide',function () {
                        var navTypeParam = 3;
                        var url = "${bath}/portalLink/linkToMineOrders?navType="+navTypeParam;
                        window.open(url,"_self");
                    });
                    $("#payModal_btn").on("click",function () {
                        $("#payModal").modal("hide");
                        var navTypeParam = 3;
                        var url = "${bath}/portalLink/linkToMineOrders?navType="+navTypeParam;
                        window.open(url,"_self");
                    });
                        setTimeout(function () {
                            var navTypeParam = 3;
                            var url = "${bath}/portalLink/linkToMineOrders?navType="+navTypeParam;
                            window.open(url,"_self");
                        },2000);
                } else {//这里支付失败和支付取消统一处理
                    var Type = 2;
                    UpOrderType(retOutTradeNo,Type);
                    toastr.error('支付失败！');
                    $("#payModal").modal('show');
                    $("#payModalBody img").attr("src","${bath}/images/frontpages/common/error.png");
                    $("#payModalBody p").text("支付失败，请重新支付");
                }
            });
    };

    //微信支付查询结果
    function WXQueryOrder(retOutTradeNo){
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

    //支付成功后把订单状态更新
    function UpOrderType(retOutTradeNo,Type) {
        $.ajax({
            type : "POST",
            url : "${bath}/ProtalStoreOrder/CompletePayment",
            data : {
                parentId : retOutTradeNo,
                orderstatus : Type
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



    //购物车列表
    function shoppingCarList() {
        var cookie = $.cookie("commodity");
        var JsonCookie = $.parseJSON(cookie);
        console.log(JsonCookie);
        for (var i = 0; i < JsonCookie.length; i++){
            var JsonCookieType = JsonCookie[i].Sj_type;  //商品类型   第三方   自营
            var JsonCookieName = JsonCookie[i].commodity_name; //商品名称
            var JsonCookieMoney = Number(JsonCookie[i].commodity_money);    //商品价格
            var JsonCookieNumber = parseInt(JsonCookie[i].commodity_number); //商品数量
            var JsonCookieId = JsonCookie[i].commodity_Id;   //商品ID
            var type_Sj = "";
            var how_Money = Number(JsonCookieMoney*JsonCookieNumber);
            var JsonCookieshopName = JsonCookie[i].commodity_shopName;//商品商家
            var JsonCookieImg = JsonCookie[i].commodity_Img;//商品商家
            if(JsonCookieType == 1){
                type_Sj = "第三方商家";
            }else {
                type_Sj = "惠惠自营";
            }
            var firstClassifyHtml = "<div class='col-lg-12 col-md-12 col-xs-12 goods-panel' id='"+JsonCookieId+"'>";
            firstClassifyHtml += "<label style='display: none;' class='JsonCookieshopName'>"+JsonCookieshopName+"</label>";
            firstClassifyHtml += "<div class='col-lg-3 col-md-3 col-xs-3 goods-img'>";
            firstClassifyHtml += "<img src='${bath}"+JsonCookieImg+"' alt='' class='img-responsive' />";
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "<div class='col-lg-8 col-md-8 col-xs-8 goods-info-panel'>";
            firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-name-del'>";
            firstClassifyHtml += "<div class='col-lg-11 col-md-11 col-xs-11 goods-name'>";
            firstClassifyHtml += "<span>"+JsonCookieName+"</span>";
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "<div class='col-lg-1 col-md-1 col-xs-1 del' onclick='DeleteParent("+JsonCookieId+");'>";
            firstClassifyHtml += "<img src='${bath}/images/frontpages/common/del-icon.png' alt='' />";
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-type'>";
            firstClassifyHtml += "<span>"+type_Sj+"</span>";
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "<div class='col-lg-12 col-md-12 col-xs-12 goods-price-count'>";
            firstClassifyHtml += "<div class='col-lg-4 col-md-4 col-xs-4 goods-price'>";
            firstClassifyHtml += "<span><i class='fa fa-cny fa-fw'></i><label>"+JsonCookieMoney+"</label></span>";
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "<div class='col-lg-5 col-md-5 col-xs-5 number-input-panel'>";
            firstClassifyHtml += "<div class='input-group'>";
            firstClassifyHtml += "<span class='input-group-addon minus' onclick='minusCounts("+JsonCookieId+")'>-</span><input type='text' class='number form-control input-sm count' value='"+JsonCookieNumber+"' /><span class='input-group-addon plus' onclick='plusCounts("+JsonCookieId+")'>+</span>"
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "</div>";
            firstClassifyHtml += "</div>";
            $(".mine-shoppingcart-panel").append(firstClassifyHtml);
        }
    }

    //微信支付查询结果 后台更新
   function WXViewTheResults(retOutTradeNo,moneyNumber){
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/pay/updatePayInfo', //目标地址
            data : {
                orderNumber : retOutTradeNo,
                money : moneyNumber,
                paytype : 2

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

    //获取省列表方法
    function openPaySheng() {

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalksArea/getProvince', //目标地址
            data : {

            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                var retData = retInfo.data.list;
                var retDataLength = retData.length;

                $(".sheng").empty();
                $(".shi").empty();
                $(".qu").empty();
                $(".jiedao").empty();
                $(".mendian").empty();

                var defaultShengSelectedHtml = "<option value=''>请选择</option>";
                $(".sheng").append(defaultShengSelectedHtml);

                var defaultShiSelectedHtml = "<option value=''>请选择</option>";
                $(".shi").append(defaultShiSelectedHtml);

                var defaultQuSelectedHtml = "<option value=''>请选择</option>";
                $(".qu").append(defaultQuSelectedHtml);

                var defaultJiedaoSelectedHtml = "<option value=''>请选择</option>";
                $(".jiedao").append(defaultJiedaoSelectedHtml);

                var defaultMendianSelectedHtml = "<option value=''>请选择</option>";
                $(".mendian").append(defaultMendianSelectedHtml);

                for (var i = 0; i < retDataLength; i++){

                    var retId = retData[i].id1;
                    var retName = retData[i].name;
                    var shengSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";

                    $(".sheng").append(shengSelectedHtml);
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

    //市级列表
    function openPayShi(shengId) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalksArea/getkscity', //目标地址
            data : {
                prId : shengId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                var retData = retInfo.data.list;
                var retDataLength = retData.length;

                $(".shi").empty();

                var defaultShiSelectedHtml = "<option value=''>请选择</option>";
                $(".shi").append(defaultShiSelectedHtml);

                var retBjId = retData[0].id2;
                if (retBjId == 110100){
                    var retId = retData[0].id2;
                    var retName = retData[0].name;
                    var shiSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".shi").append(shiSelectedHtml);
                }else {
                    for (i = 0; i < retDataLength; i++){
                        var retId = retData[i].id2;
                        var retName = retData[i].name;
                        var shiSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                        $(".shi").append(shiSelectedHtml);
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

        $(".shi").empty();
    }

    //区列表
    function openPayQu(shiId,shengId) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalksArea/getksrain', //目标地址
            data : {
                prId : shengId,
                ciId : shiId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                var retData = retInfo.data.list;
                var retDataLength = retData.length;


                $(".qu").empty();

                var defaultQuSelectedHtml = "<option value=''>请选择</option>";
                $(".qu").append(defaultQuSelectedHtml)

                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id;
                    var retName = retData[i].name;
                    var quSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".qu").append(quSelectedHtml);
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

    //街道列表
    function openPayJD(shiId,shengId,quId) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalksArea/getkstreet', //目标地址
            data : {
                prId : shengId,
                ciId : shiId,
                raId : quId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);

                var retData = retInfo.data.list;
                var retDataLength = retData.length;


                $(".jiedao").empty();

                var defaultJiedaoSelectedHtml = "<option value=''>请选择</option>";
                $(".jiedao").append(defaultJiedaoSelectedHtml);


                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id4;
                    var retName = retData[i].name;
                    var jiedaoSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".jiedao").append(jiedaoSelectedHtml);
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

    //门店列表
    function openPayMd(shiId,shengId,quId) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalksArea/getkstrore', //目标地址
            data : {
                prId : shengId,
                ciId : shiId,
                raId : quId
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);

                var retData = retInfo.data.list;
                var retDataLength = retData.length;
                var retuserId = retInfo.data.userInfo.userId;

                $(".mendian").empty();

                var defaultMendianSelectedHtml = "<option>请选择</option>";
                $(".mendian").append(defaultMendianSelectedHtml);


                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id; // 商家ID
                    var retDoor = retData[i].address_door; //地址
                    var retName = retData[i].store_name;  //商店名称
                    var retShopKeeperId = retData[i].shopkeeper_id;  //商店负责人ID
                    var retStorageroomId = retData[i].storehouse_id; //仓库ID
                    var retStatus = retData[i].status; //商店1开店 0关店
                    var mendianSelectedHtml = "<option value='"+retId+"' name='"+retDoor+"' class='"+retShopKeeperId+"' id='"+retStorageroomId+"'>"+retName+"</option>";
                    $(".mendian").append(mendianSelectedHtml);
                }
                console.log(retuserId);
                $(".retuserId").text(retuserId);
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

    //省发生change
    function changeSheng() {
        var shengId = $(".sheng").val();
        openPayShi(shengId);
    }

    //市发生change
    function changeShi() {
        var shengId = $(".sheng").val();
        var shiId = $(".shi").val();
        openPayQu(shiId,shengId);
    }

    //区发生change
    function changeQu() {
        var shengId = $(".sheng").val();
        var shiId = $(".shi").val();
        var quId = $(".qu").val();
        openPayJD(shiId,shengId,quId);
    }

    //街道发生change
    function changeJd() {
        var shengId = $(".sheng").val();
        var shiId = $(".shi").val();
        var quId = $(".qu").val();
        openPayMd(shiId,shengId,quId);
    }

    //门店change
    function changeMd(){
        var thisText = $(this).text();
        $(".MdId").text(thisText);
    }

    //选怎门店modal显示
    function openChooseStoreModal(){
        $("#chooseStoreModal").toggle();
        $("#choosedStoreName").text("");
    }

    //商品减
    function minusCounts(JsonCookieId){

        var JsonCookieIdParam = JsonCookieId;

        var buyCountNumber = $(".buy-count").text();
        buyCountNumber = parseInt(buyCountNumber) - 1;
        $(".buy-count").text(buyCountNumber);

        var number = parseInt($("#"+JsonCookieIdParam).find("input").val()) - 1;
        if(number == 0){
            return false;
        }

        $("#"+JsonCookieIdParam).find("input").val(number);

        var newMinusNumber = $("#"+JsonCookieIdParam).find("input").val(number).val();

        var price = Number($("#"+JsonCookieId).find(".goods-price").find("span").find("label").text());
        var moneySum = Number($(".money_number").text());
        var changeMoneySum = Number(moneySum - price).toFixed(2);
        $(".money_number").text(changeMoneySum);

        var item = $.cookie("commodity");
        var JsonCookie = $.parseJSON(item);
        var JsonCookieLength = JsonCookie.length;

        for(var m = 0; m < JsonCookieLength; m++){
            var commodityId = JsonCookie[m].commodity_Id;
            if(JsonCookieIdParam == commodityId){
                var commodityNumber = newMinusNumber;
                console.log(commodityNumber);
                JsonCookie[m].commodity_number = parseInt(commodityNumber).toString();
            }
        }
        var newJsonCookieParam = JSON.stringify(JsonCookie);
        $.cookie("commodity",newJsonCookieParam);
        var aa = $.cookie("commodity");
        console.log(aa);
    }

    //商品加
    function plusCounts(JsonCookieId){
        var JsonCookieIdParam = JsonCookieId;

        var buyCountNumber = $(".buy-count").text();
        buyCountNumber = parseInt(buyCountNumber) + 1;
        $(".buy-count").text(buyCountNumber);

        var number = parseInt($("#"+JsonCookieIdParam).find("input").val()) + 1;
        $("#"+JsonCookieIdParam).find("input").val(number);
        var newPlusNumber = $("#"+JsonCookieIdParam).find("input").val(number).val();

        var price = Number($("#"+JsonCookieId).find(".goods-price").find("span").find("label").text());
        var moneySum = Number($(".money_number").text());
        var changeMoneySum = Number(moneySum + price).toFixed(2);
        $(".money_number").text(changeMoneySum);

        var item = $.cookie("commodity");
        var JsonCookie = $.parseJSON(item);
        var JsonCookieLength = JsonCookie.length;

        for(var m = 0; m < JsonCookieLength; m++){
            var commodityId = JsonCookie[m].commodity_Id;
            if(JsonCookieIdParam == commodityId){
                var commodityNumber = newPlusNumber;
                console.log(commodityNumber);
                JsonCookie[m].commodity_number = parseInt(commodityNumber).toString();
            }
        }
        var newJsonCookieParam = JSON.stringify(JsonCookie);
        $.cookie("commodity",newJsonCookieParam);
        var aa = $.cookie("commodity");
        console.log(aa);
    }

    //删除商品
    function DeleteParent(JsonCookieId) {

        var delJsonCookieIdParam = JsonCookieId;

        var price = Number($("#"+delJsonCookieIdParam).find(".goods-price").find("span").find("label").text());
        var count = parseInt($("#"+delJsonCookieIdParam).find(".count").val());

        var buyCountNumber = $(".buy-count").text();
        buyCountNumber = parseInt(buyCountNumber) - count;
        if (buyCountNumber == 0){
            $(".buy-count").hide();
        }
        $(".buy-count").text(buyCountNumber);

        var moneySum = Number($(".money_number").text());
        console.log(price);
        console.log(count);
        console.log(moneySum);
        var changeMoneySum = Number(moneySum - price * count);
        $(".money_number").text(changeMoneySum);

        var dataCookieParam = $.cookie("commodity");
        var jsonDataCookieParam = JSON.parse(dataCookieParam);
        console.log(jsonDataCookieParam);
        var dataCookieParamLength = jsonDataCookieParam.length;
        console.log(dataCookieParamLength);

        for(var c = 0; c < dataCookieParamLength; c++){
            var commodityId = jsonDataCookieParam[c].commodity_Id;
            if(delJsonCookieIdParam == commodityId){
                delete jsonDataCookieParam[c];
            }
        }

        for(var t = 0 ; t < jsonDataCookieParam.length; t++)
        {
            if(jsonDataCookieParam[t] == "" || typeof(jsonDataCookieParam[t]) == "undefined" || typeof(jsonDataCookieParam[t]) == "empty")
            {
                jsonDataCookieParam.splice(t,1);
                t = t - 1;
            }
        }
        var newJsonDataCookieParam = JSON.stringify(jsonDataCookieParam);
        console.log(newJsonDataCookieParam);
        $.cookie("commodity",newJsonDataCookieParam);
        $("#"+JsonCookieId).remove();
    }
</script>