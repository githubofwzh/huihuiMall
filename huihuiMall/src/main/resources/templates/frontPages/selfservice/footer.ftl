<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title></title>
</head>
<body>
<label class="AddressShengshi" style="display: none;"></label>
<div class="container-fluid footer">
    <div class="row">
        <div class="footer col-lg-12 col-sm-12 col-xs-12 padding_zero footer_main">
            <div class="col-lg-3 col-sm-3 col-xs-3 padding_zero footer_left">
                <button class=" pull-left" onclick="returnTop();">
                    <img class="img_one" src="${bath}/images/frontpages/common/return_zz.png" />返回
                </button>
            </div>
            <span class="col-lg-6 col-sm-6 col-xs-6 padding_zero text-center footer_center"></span>
            <div class="col-lg-3 col-sm-3 col-xs-3 padding_zero footer_right">
                <button class="pull-right" onclick="goHome();">
                    <img class="img_two" src="${bath}/images/frontpages/common/GoHome.png" />回首页
                </button>
            </div>
        </div>
    </div>
</div>


<div class="goTop">
    <i class="fa fa-arrow-circle-up" id="Top"></i>
</div>

</body>
</html>
<script>
    $(document).ready(function () {

        $("#Top").click(function() {
            $("html,body").animate({scrollTop:0}, 500);
            $(".container-fluid").animate({scrollTop:0}, 500);
            $(".brand-panel").animate({scrollTop:0}, 500);
        });
        ObtainNumber();
    });


    function returnTop() {
        history.go(-1);
    }

    //跳转首页
    function goHome() {
        var navTypeParam = 1;
        var url ="${bath}/portalLink/linkToHomePage?navType="+navTypeParam;
        window.open(url,"_self");
    }


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
                var faceName = retData[0].store_name; //门店名称
                var AddressShengshi = retData[0].address_shengshi; //门店名称
                $(".footer_center").text(faceName);
                $(".AddressShengshi").text(AddressShengshi);
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

</script>