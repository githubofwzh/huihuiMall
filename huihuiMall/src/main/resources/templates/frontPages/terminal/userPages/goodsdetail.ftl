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
    <link href="${bath}/css/frontpages/terminal/userPagesCss/goodsdetail.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/nav.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
<label id="goodsIdParam" style="display: none">${goodsId!""}</label>
<label id="commodity_Val" style="display: none"></label>
<container>
    <section>
        <div class="container-fluid top-panel">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 goods">
                    <div class="col-lg-12 col-md-12 col-xs-12 goods-panel">
                        <div class="col-lg-12 col-md-12 col-xs-12 goods-img-panel">
                            <img src="" alt="" class="img-responsive"/>
                        </div>
                        <div class="col-lg-12 col-md-12 col-xs-12 goods-name">
                            <span></span>
                        </div>
                        <div class="col-lg-12 col-md-12 col-xs-12 goods-type">
                            <span></span>
                        </div>
                        <div class="col-lg-12 col-md-12 col-xs-12 goods-price">
                            <span><i class="fa fa-cny fa-fw"></i><label></label></span>
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-xs-12 buy-goods-panel">
                        <div class="col-lg-2 col-md-2 col-xs-2 number-panel">
                            <span>数量</span>
                        </div>
                        <div class="col-lg-3 col-md-3 col-xs-3 number-input-panel">
                            <div class="input-group">
                                <span class="input-group-addon minus">-</span>
                                <input type="text" class="number form-control input-sm count" value="1" />
                                <span class="input-group-addon plus">+</span>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-xs-7 shoppingcart-btn-panel">
                            <button class="btn btn-primary into-shopping-cart pull-right" id="push_shopping">加入购物车</button>
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-xs-12 goods-detail-panel">
                        <div class="col-lg-12 col-md-12 col-xs-12 title-panel">
                            <div class="col-lg-3 col-md-3 col-xs-3 detail-title">
                                <span>商品详情</span>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-xs-12 goods-param-panel">
                            <div class="col-lg-12 col-md-12 col-xs-12 goods-param-title">
                                <span>商品参数：</span>
                            </div>
                            <div class="col-lg-12 col-md-12 col-xs-12 goods-param">
                                <div class="col-lg-6 col-md-6 col-xs-6 goods-param-detail">
                                    <span>重量：</span><span id="retWeight"></span>
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6 goods-param-detail">
                                    <span>包装：</span><span id="retPacking"></span>
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6 goods-param-detail">
                                    <span>产地：</span><span id="retOrigin"></span>
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6 goods-param-detail">
                                    <span>规格：</span><span id="retHowl"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-xs-12 goods-intro-panel">
                            <div class="col-lg-12 col-md-12 col-xs-12 goods-intro-title">
                                <span>商品介绍：</span>
                            </div>
                            <div class="col-lg-12 col-md-12 col-xs-12 goods-intro-img-panel">


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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

        var goodsHeight = screenHeight - navPanelHeight + "px";

        $(".goods").css("height",goodsHeight);
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
        console.log($("#goodsIdParam").text());
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getProduct', //目标地址
            data : {
                productId : $("#goodsIdParam").text()
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
                var retId = retData[0].id;
                var retMername = retData[0].mername;
                var merId = retData[0].merid;
                var shopCode = retData[0].code;
                $(".goods-name span").text(retName);
                if(retType == 1){
                    $(".goods-type span").attr('name','2');
                    $(".goods-type span").text("第三方商家")
                }else {
                    $(".goods-type span").attr('name','1');
                    $(".goods-type span").text("惠惠自营")
                }
                $(".goods-price span label").text(retMoney);
                $("#retWeight").text(retWeight);
                $("#retPacking").text(retPacking);
                $("#retOrigin").text(retOrigin);
                $("#retHowl").text(retHowl);
                $("#commodity_Val").text(retId);
                $(".goods-img-panel img").attr("src","${bath}"+retImgbig+"");
                $(".goods-intro-img-panel").empty();

                var jsonRetretImgsmall = JSON.parse(retImgsmall);
                var retImgSmallLength = jsonRetretImgsmall.length;
                console.log(retImgSmallLength);

                for (var i = 0; i < retImgSmallLength; i++) {
                    var retImgSmallPath = jsonRetretImgsmall[i];
                    var DetailsImgHtml = "<div class='col-lg-12 col-md-12 col-xs-12 goods-intro-img'>";
                    DetailsImgHtml += "<img src ='${bath}/"+retImgSmallPath+"' alt = '' class='img-responsive'/>";
                    DetailsImgHtml += "</div>";
                    $(".goods-intro-img-panel").append(DetailsImgHtml);
                }

                $("#push_shopping").bind("click",function () {
                    var Sj_type = "";
                    if($(".goods-type span").text() == "惠惠自营"){
                        Sj_type = 2;
                    }else {
                        Sj_type = 1;
                    }
                    var commodity_name = $(".goods-name span").text();
                    var commodity_number = $(".number").val();
                    var commodity_money = $(".goods-price span label").text();
                    var commodity_Id = $("#commodity_Val").text();

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

        //购物车加入
        function AddToShooppingCar(commodity_name , commodity_number ,commodity_money , commodity_Id , Sj_type, retMername,merId,shopCode,retImgbig) {
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

    });


    //再次调取函数加入购物车   修改第一次购物车需要点击两次的BUG
    function Again(jsonStr,cookieSet) {
        $.cookie("commodity", jsonStr, cookieSet); //如果没有这个cookie就设置他
    }
</script>