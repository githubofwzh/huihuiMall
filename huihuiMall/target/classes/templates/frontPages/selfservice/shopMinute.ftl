<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>商品详情</title>
<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/shioMinute.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/swiper/swiper.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/selfservice/footer.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/swiper/swiper.min.js" type="text/javascript"></script>
</head>
<body>

<#include "nav.ftl">
<label id="retHowl" style="display: none"></label>
<label id="commodity_Val" style="display: none"></label>
<div class="container-fluid minute">
    <div class="row padding_zero">
        <div class="col-lg-11 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-xs-offset-1 minuteTitle">
            <div class="col-lg-5 col-sm-5 col-xs-5 padding_zero minuteImg">
                <img src="" />
            </div>
            <div class="col-lg-5 col-sm-5 col-xs-5 col-lg-offset-1 col-md-offset-1 col-xs-offset-1 padding_zero minuteNews">
                <span class="minuteName"></span>
                <div class="shopType"></div>
                <p class="minuteMoney">价格：<i class="fa fa-yen"></i><span class="minuteHowMoney"></span><span></span></p>
                <p class="minuteWeigh">重量：<span class="minuteHowWeigh"></span></p>
                <p class="minuteExterior">包装：<span class="minuteMinuteExterior"></span></p>

                <div class="col-lg-6 col-md-6 col-xs-6 number-input-panel">
                    <div class="input-group">
                        <span class="input-group-addon minus">-</span>
                        <input type="text" class="number form-control input-sm count" value="1" />
                        <span class="input-group-addon plus">+</span>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 col-xs-6">
                    <button id="push_shopping">加入购物车</button>
                </div>
            </div>
        </div>

        <div class="col-lg-12 col-sm-12 col-xs-12 title_name">
            <div class="col-lg-11 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-xs-offset-1">
                <span>商品详情</span>
            </div>

        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 minuteMain">
            <div class="col-lg-12 col-sm-12 col-xs-12 minuteCenter">
                <div class="col-lg-11 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-xs-offset-1">
                    <p>商品参数：</p>
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 padding_zero padding_one">
                    <div class="col-lg-6 col-sm-6 col-xs-6 gray">
                        <label>重量：</label>
                        <span class="weight"></span>
                    </div>
                    <div class="col-lg-6 col-sm-6 col-xs-6 gray">
                        <label>产地：</label>
                        <span class="retOrigin"></span>
                    </div>
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 padding_zero">
                    <div class="col-lg-6 col-sm-6 col-xs-6 gray">
                        <label>包装：</label>
                        <span class="retPacking"></span>
                    </div>
                    <div class="col-lg-6 col-sm-6 col-xs-6 gray">
                        <label>规格：</label>
                        <span class="specifications"></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12 col-sm-12 col-xs-12 minuteImage">
            <div class="col-lg-11 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-xs-offset-1" style="padding-left: 25px">
                <p>商品介绍：</p>
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 ImageContent">

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
    var numberIf = 0;
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function() {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var footerHeight = $(".footer").height();
        var goodsHeight = screenHeight - navPanelHeight - footerHeight + 110 + "px";

        $(".minute").css("height",goodsHeight);
        $(".minus").click(function(){
            var number = $(".number");
            number.val(parseInt(number.val())-1);
            if(number.val()<=0){
                number.val(parseInt(number.val())+1); //最小值为1
            }
        });

        $(".plus").click(function(){
            var number = $(".number");
            number.val(parseInt(number.val())+1);
        });

        shopParameter();


    });


    //商品参数
    function shopParameter() {
        var shopId = ${goodsId!""};
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getProduct', //目标地址
            data : {
                productId : shopId
            },
            async: true,
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retData = retInfo.data.list;
                var retName = retData[0].pr_name;
                var retType = retData[0].merchant_type;
                var retMoney = retData[0].price;
                var retWeight = retData[0].weight;
                var retPacking = retData[0].packing;
                var retOrigin = retData[0].place_of_origin;
                var retHowl = retData[0].specifications;
                var retImgbig = retData[0].main_image_path;
                var retImgsmall = retData[0].detail_image_path;
                var jsonRetretImgsmall = JSON.parse(retImgsmall);
                var retImgSmallLength = jsonRetretImgsmall.length;
                console.log(retImgSmallLength);
                var retImg = retData[0].image;
                var retId = retData[0].id;
                var retMername = retData[0].mername;
                var merId = retData[0].merid;
                var shopCode = retData[0].code;
                var specifications = retData[0].specifications;
                var retPhoneNumber = retInfo.data.userInfo.phoneNumber;
                $(".hellowPhone").text(retPhoneNumber);
                $(".minuteName").text(retName);
                $(".specifications").text(specifications);
                if(retType == 1){
                    $(".shopType").attr('name','1');
                    $(".shopType").text("第三方商家")
                }else {
                    $(".shopType").attr('name','2');
                    $(".shopType").text("惠惠自营")
                }
                $(".minuteHowMoney").text(retMoney); //价格
                $(".minuteHowWeigh").text(retWeight); //重量
                $(".weight").text(retWeight) //详情重量
                $(".minuteMinuteExterior").text(retPacking); //包装单位
                $(".retOrigin").text(retOrigin); //产地
                $(".retPacking").text(retPacking); //详情单位
                $("#retHowl").text(retHowl); //商品编码
                $("#commodity_Val").text(retId);  //商品ID
                $(".minuteImg>img").attr("src","${bath}/"+retImgbig+"");
                for (var i = 0; i < retImgSmallLength; i++) {
                    var DetailsImgHtml = "<div class='col-lg-9 col-md-9 col-xs-9 col-lg-offset-3 col-md-offset-3 col-xs-offset-3 goods-intro-img'>";
                    DetailsImgHtml += "<img src ='${bath}/" + jsonRetretImgsmall[i] + "' alt = ''/>";
                    DetailsImgHtml += "</div>";
                    $(".ImageContent ").append(DetailsImgHtml);
                }
                $("#push_shopping").bind("click",function () {
                    var Sj_type = "";
                    if($(".goods-type span").text() == "惠惠自营"){
                        Sj_type = 1;
                    }else {
                        Sj_type = 2;
                    }
                    var commodity_name = $(".minuteName").text(); //商品名称
                    var commodity_number = $(".number").val();  //商品数量
                    var commodity_money = $(".minuteHowMoney").text();  //商品价格
                    var commodity_Id = $("#commodity_Val").text();  //商品ID
                    console.log(commodity_money);
                    if(retMername == "" || retMername == null){
                        retMername = 0;
                        merId = 0;
                        AddToShooppingCar(commodity_name , commodity_number ,commodity_money , commodity_Id , Sj_type, retMername,merId,shopCode,retImgbig);
                    }else if(merId == "" || merId == null){
                        retMername = 0;
                        merId = 0;
                        AddToShooppingCar(commodity_name , commodity_number ,commodity_money , commodity_Id , Sj_type, retMername,merId,shopCode,retImgbig);
                    }else{
                        AddToShooppingCar(commodity_name , commodity_number ,commodity_money , commodity_Id , Sj_type, retMername,merId,shopCode,retImgbig);
                    }
                });
            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                return false;
            }
        });
    }

    //购物车加入
    function AddToShooppingCar(commodity_name , commodity_number ,commodity_money , commodity_Id , Sj_type, retMername,merId,shopCode,retImgbig) {
        var buyCountNumber = $(".buy-count").text();
        var CountNumber = $(".count").val();
        var buyCountInt = parseInt(buyCountNumber);
        var CountInt = parseInt(CountNumber);
        $(".buy-count").css("display","block");
        buyCountNumber = buyCountInt + CountInt;
        if(buyCountNumber != "" || buyCountNumber != NaN){
            if (numberIf == 0){
                $(".buy-count").text(buyCountNumber);
                numberIf =  CountNumber;
            }else if (numberIf != 0){
                if(numberIf > CountNumber){
                    var Difference = numberIf - CountNumber;
                    var DifferenceInt = parseInt(Difference);
                    $(".buy-count").text(buyCountInt - DifferenceInt);
                    numberIf =  CountNumber;
                }else if(numberIf < CountNumber){
                    var Difference = CountNumber - numberIf;
                    var DifferenceInt = parseInt(Difference);
                    $(".buy-count").text(buyCountInt + DifferenceInt);
                    numberIf =  CountNumber;
                }
            }
        }else {
            $(".buy-count").text(CountInt);
            numberIf =  CountNumber;
        }

        var _num = 1;//默认商品数量为1
        //判断传进来的num是不是undefined  是的话默认为1  不是默认值=传进来的num
        if (commodity_number != undefined){
            _num = commodity_number;
        }

        // 再赋值给totalNum
        var totalNum = _num;
        var cookieSet = { expires: 7};
        var jsonStr = '[{"commodity_Id":"' + commodity_Id + '","commodity_number":"' + commodity_number + '","Sj_type":'+ Sj_type + ',"commodity_money":"' + commodity_money + '","commodity_name":"' + commodity_name + '","commodity_merId":"' + merId + '","commodity_shopCode":"' + shopCode +'","commodity_shopName":"'+retMername+'","commodity_Img":"'+retImgbig+ '"}]';
        if ($.cookie("commodity") == null) {
            $.cookie("commodity", jsonStr, cookieSet); //如果没有这个cookie就设置他
            toastr.success('加入成功！');
            Again(jsonStr,cookieSet);
        }else{
            var jsonObj = eval('(' + $.cookie("commodity") + ')'); //如果有，把json字符串转换成对象
            var findProduct = false;//是否找到产品ID,找到则为TRUE,否则为FALSH
            for(var obj in jsonObj) {
                if(jsonObj[obj].commodity_Id == commodity_Id) {
                    jsonObj[obj].commodity_number = commodity_number;
                    totalNum = jsonObj[obj].commodity_number;
                    findProduct = true;
                    break;
                }
            }
            if(findProduct == false){ //没找到,则添加
                jsonObj[jsonObj.length] = new Object();
                jsonObj[jsonObj.length - 1].commodity_Id = commodity_Id;
                jsonObj[jsonObj.length - 1].commodity_number = commodity_number;
                jsonObj[jsonObj.length - 1].Sj_type = Sj_type;
                jsonObj[jsonObj.length - 1].commodity_money = commodity_money;
                jsonObj[jsonObj.length - 1].commodity_name = commodity_name;
                jsonObj[jsonObj.length - 1].commodity_merId = merId;
                jsonObj[jsonObj.length - 1].commodity_shopCode = shopCode;
                jsonObj[jsonObj.length - 1].commodity_shopName = retMername;
                jsonObj[jsonObj.length - 1].commodity_Img = retImgbig;
            }
            $.cookie("commodity", JSON.stringify(jsonObj), cookieSet); //写入coockie  JSON需要json2.js支持
            console.log($.cookie("commodity"));
            toastr.success('加入成功！');
//                location.reload();
        }
        return totalNum;
    }




    //再次调取函数加入购物车   修改第一次购物车需要点击两次的BUG
    function Again(jsonStr,cookieSet) {
        $.cookie("commodity", jsonStr, cookieSet); //如果没有这个cookie就设置他
    }
</script>
