<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>惠惠网店</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/shoppingCar.css" rel="stylesheet" type="text/css"/>
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
<div class="container-fluid minute">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 shoppingCar_Main">
            <p class="col-lg-12 col-sm-12 col-xs-12 padding_zero">我的购物车</p>
            <div class="col-lg-12 col-sm-12 col-xs-12 padding_zero shoppingCar_List" >
                <div class="col-lg-12 col-sm-12 col-xs-12 shopCarTitle">
                    <div class="col-lg-4 col-sm-4 col-xs-4 padding_zero">商品</div>
                    <div class="col-lg-3 col-sm-3 col-xs-3 padding_zero">单价（元）</div>
                    <div class="col-lg-4 col-sm-4 col-xs-4 padding_zero">数量</div>
                    <div class="col-lg-1 col-sm-1 col-xs-1 padding_zero"></div>
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 padding_zero shoppingCar_ListData">




                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 padding_zero Settlement">
                    <div class="pull-right">
                        <span>总计：<i class="fa fa-yen color_red"></i></span>
                        <span class="color_red shoppingCar_howMoney">0</span>
                        <span class="color_red"></span>
                        <button class="goShopping" onclick="goShopping();">去结算</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
</body>
<#include "footer.ftl">
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function() {
        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var footerHeight = $(".footer").height();
        var goodsHeight = screenHeight - navPanelHeight - footerHeight + 110 + "px";

        $(".minute").css("height",goodsHeight);

        //算价格
        if ($.cookie("commodity") == null) {
            $(".shoppingCar_howMoney").text("0");
        }else {
            var jsonObj = eval('(' + $.cookie("commodity") + ')');
            var cookieJsonData = jsonObj.length;
            var moneyNumber = 0;
            for (var i = 0; i < cookieJsonData; i++){
                var commodityMoney = Number(jsonObj[i].commodity_money);
                var commodityNumber = parseInt(jsonObj[i].commodity_number);
                moneyNumber += Number(commodityMoney*commodityNumber);
            }
            $(".shoppingCar_howMoney").text(moneyNumber.toFixed(2));
        }

        ObtainNumber();
        if ($.cookie("commodity") == "" || $.cookie("commodity") == null || $.cookie("commodity") == undefined){
            toastr.error("请先选择商品在结算！");
            return false;
        }else {
            shoppingCarList();
        }




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

    //购物车列表
    function shoppingCarList() {
        var cookie = $.cookie("commodity");
        var JsonCookie = $.parseJSON(cookie);
        console.log(JsonCookie);
        for (var i = 0; i < JsonCookie.length; i++){
            var shopping_type = JsonCookie[i].Sj_type; // 第三方 自营
            var shopping_ID = JsonCookie[i].commodity_Id; // 商品ID
            var shopping_Img = JsonCookie[i].commodity_Img; // 商品图片
            var shopping_Merid = JsonCookie[i].commodity_merId; // 商家ID
            var shopping_Money = Number(JsonCookie[i].commodity_money); // 单价
            var shopping_Name = JsonCookie[i].commodity_name; // 商品名称
            var shopping_Number = parseInt(JsonCookie[i].commodity_number); // 商品数量
            var shopping_Code = JsonCookie[i].commodity_shopCode; // 商品编码
            var shopping_shopName = JsonCookie[i].commodity_shopName; // 商家名称
            var type_Sj = "";
            if(shopping_type == 1){
                type_Sj = "第三方商家";
            }else {
                type_Sj = "惠惠自营";
            }
            var shoppingCarList = "<div class='col-lg-12 col-sm-12 col-xs-12 shoppingCar_for' id='"+shopping_ID+"' name='"+shopping_Code+"'>";
                    shoppingCarList += "<div class='col-lg-4 col-sm-4 col-xs-4 shangpin' name='"+shopping_shopName+"'>";
                        shoppingCarList += "<div class='col-lg-5 col-sm-5 col-xs-5 padding_zero shoppingCar_Img' name='"+shopping_Merid+"'>";
                             shoppingCarList += "<img src='${bath}/"+shopping_Img+"' />";
                        shoppingCarList += "</div>";
                             shoppingCarList += "<div class='col-lg-7 col-sm-7 col-xs-7 padding_zero' style='padding-left: 30px; margin-top: 30px'>";
                                 shoppingCarList += "<p class='shopName'>"+shopping_Name+"</p>";
                                 shoppingCarList += "<div class='shopType'>"+type_Sj+"</div>";
                              shoppingCarList += "</div>";
                        shoppingCarList += "</div>";
            shoppingCarList += "<div class='col-lg-3 col-sm-3 col-xs-3 padding_zero text-center'>";
            shoppingCarList += "<div class='shoppingCar_money'><span><i class='fa fa-yen'></i></span><span class='shoppingCar_moneyNumber'>"+shopping_Money+"<label></label></div>";
            shoppingCarList += "</div>";
            shoppingCarList += "<div class='col-lg-4 col-sm-4 col-xs-4 padding_zero'>";
            shoppingCarList += "<div class='input-group'>";
            shoppingCarList += "<span class='input-group-addon minus' onclick='reduce("+shopping_ID+");'>-</span>";
            shoppingCarList += "<input type='text' class='number form-control input-sm count' value='"+shopping_Number+"' />";
            shoppingCarList += "<span class='input-group-addon plus' onclick='increase("+shopping_ID+");'>+</span>";
            shoppingCarList += "</div>";
            shoppingCarList += "</div>";
            shoppingCarList += "<div class='col-lg-1 col-sm-1 col-xs-1 padding_zero remove'>";
            shoppingCarList += "<div class='shoppingCar_remove' onclick='DeleteParent("+shopping_ID+","+i+");'>";
            shoppingCarList += "<img src='${bath}/images/frontpages/common/Delete_zz.png'><span>移除</span>";
            shoppingCarList += "</div>";
            shoppingCarList += "</div>";
            shoppingCarList += "</div>";
            $(".shoppingCar_ListData").append(shoppingCarList);
        }
    }
    
    //去结算
    function goShopping() {
        var userId = $.cookie("userId");
        if(userId != undefined){

            var item = $.cookie("commodity");
            var JsonCookie = $.parseJSON(item);
            var JsonCookieLength = JsonCookie.length;
            var shoppingCarLength = $(".shoppingCar_for").length;
            if(JsonCookieLength <= 0  || shoppingCarLength <= 0){
                $(".buy-count").hide();
                toastr.error("请先挑选商品！");
                return false;
            }else {
                var jsonObj = eval('(' + $.cookie("commodity") + ')');
                var dataCookie = JSON.stringify(jsonObj);
                var userId = $.cookie("userId");
                var dataCookieParam = dataCookie;
                var Address = $(".Address").text();
                var faceId = $(".faceId").text();
                var faceShopkeeper_id = $(".faceShopkeeper_id").text();
                var faceName = $(".faceName").text();
                var storeHouseId = $(".storeHouseId").text();
                var RefereeId = $(".RefereeId").text();
                $.ajax({
                    type : "POST", //用POST方式请求
                    url : '${bath}/ProtalStoreOrder/OrderSplit', //目标地址
                    data : {
                        StoreOder : dataCookieParam,  //订单商品信息
                        commodity_Address : Address,
                        commodity_faceId : faceId,
                        commodity_faceShopkeeperId : faceShopkeeper_id,
                        commodity_retuserId : userId,
                        commodity_faceName : faceName,
                        commodity_Orderstate: 1,
                        commodity_StorageRoomId : storeHouseId,
                        commodity_RefereeId : RefereeId
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
                            var money = $(".shoppingCar_howMoney").text();
                            var navTypeParam = 10;
                            var url = "${bath}/portalLink/linkToCheckout?navType="+navTypeParam+"&money="+money+"&orderNumber="+retData+"&itemId="+0+"&orderCode="+0;
                            window.open(url,"_self");
                        };
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
        }else{
            toastr.error('请先登录！');
            setTimeout(function () {
                var navTypeParam = 0;
                var url ="${bath}/portalLink/linkToSignin?navType="+navTypeParam;
                window.open(url,"_self");
            },2000)
        }
    }
    //增加
    function increase(shopping_ID) {

        var JsonCookieIdParam = shopping_ID;
        var buyCountNumber = $(".buy-count").text();
        buyCountNumber = parseInt(buyCountNumber) + 1;
        $(".buy-count").text(buyCountNumber);
        var number = parseInt($("#"+JsonCookieIdParam).find("input").val()) + 1;
        $("#"+JsonCookieIdParam).find("input").val(number);
        var newPlusNumber = $("#"+JsonCookieIdParam).find("input").val(number).val();

        var price = Number($("#"+JsonCookieIdParam).find(".shoppingCar_moneyNumber").text());
        var moneySum = Number($(".shoppingCar_howMoney").text());
        var changeMoneySum = Number(moneySum + price).toFixed(2);
        $(".shoppingCar_howMoney").text(changeMoneySum);

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

    //减少
    function reduce(shopping_ID) {

        var JsonCookieIdParam = shopping_ID;
        var buyCountNumber = $(".buy-count").text();
        buyCountNumber = parseInt(buyCountNumber) - 1;
        $(".buy-count").text(buyCountNumber);
        var number = parseInt($("#"+JsonCookieIdParam).find("input").val()) - 1;
        if(number == 0){
            return false;
        }

        $("#"+JsonCookieIdParam).find("input").val(number);

        var newMinusNumber = $("#"+JsonCookieIdParam).find("input").val(number).val();

        var price = Number($("#"+JsonCookieIdParam).find(".shoppingCar_moneyNumber").text());
        var moneySum = Number($(".shoppingCar_howMoney").text());
        var changeMoneySum = Number(moneySum - price).toFixed(2);
        $(".shoppingCar_howMoney").text(changeMoneySum);

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

    //删除商品
    function DeleteParent(shopping_ID) {
        var delJsonCookieIdParam = shopping_ID;

        var price = Number($("#"+delJsonCookieIdParam).find(".shoppingCar_moneyNumber").text());
        var count = parseInt($("#"+delJsonCookieIdParam).find(".count").val());

        var buyCountNumber = $(".buy-count").text();
        buyCountNumber = parseInt(buyCountNumber) - count;
        if (buyCountNumber == 0){
            $(".buy-count").hide();
        }
        $(".buy-count").text(buyCountNumber);

        var moneySum = Number($(".shoppingCar_howMoney").text());
        console.log(price);
        console.log(count);
        console.log(moneySum);
        var changeMoneySum = Number(moneySum - price * count);
        $(".shoppingCar_howMoney").text(changeMoneySum);

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
        $("#"+shopping_ID).remove();
    }



</script>
