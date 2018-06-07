<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>退/换货</title>

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/userPagesCss/saleservicecommit.css" rel="stylesheet" type="text/css"/>
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
<label style="display: none;" class="returnGoods">0</label>
<container>
    <section>
        <div class="container-fluid top-panel">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 saleservice-panel">
                    <div class="col-lg-12 col-md-12 col-xs-12 goods-info-panel">
                        <div class="col-lg-12 col-md-12 col-xs-12 goods-list">
                            <div class="col-lg-2 col-md-2 col-xs-2 goods-intro-img">
                                <img src="" alt="" class="img-responsive retImg"/>
                            </div>
                            <div class="col-lg-9 col-md-9 col-xs-9 goods-intro">
                                <div class="col-lg-12 col-md-12 col-xs-12 goods-name">
                                    <span class="retName"></span>
                                </div>
                                <div class="col-lg-12 col-md-12 col-xs-12 goods-count">
                                    <span>数量：</span><span class="retNumber"></span>
                                </div>
                                <div class="col-lg-12 col-md-12 col-xs-12 goods-price">
                                    <span><i class="fa fa-cny fa-fw"></i><label class="retMoney"></label></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-xs-12 input-saleservice-panel">
                        <section class="replace_type">
                            <span>请选择服务类型：</span>
                            <div class="type_TH">
                                <span class="ReturnGoods"><img src="${bath}/images/frontpages/common/yuan_active.png"/>退货</span>
                                <span class="ma_rig ExchangeGoods"><img src="${bath}/images/frontpages/common/yuan_none.png"/>换货</span>
                            </div>
                        </section>
                        <section class="reason">
                            <span class="reason_title">理由说明：</span>
                            <textarea class="reason_shuom" placeholder="请填写您的理由..."></textarea>
                            <div class="license_Photo">
                                <a class="upload text-center">
                                    <span>上传图片</span>
                                    <input type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                                </a>
                                <div class="on"></div>
                            </div>
                        </section>
                    </div>
                    <section class="text-center">
                        <button class="th_submit" onclick="Reason();">提交</button>
                    </section>
                </div>

            </div>
        </div>

    <#--<#include "nav.ftl">-->

    </section>
</container>
</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var orderNumber = ${orderNumber!""};
    var retId = ${retId!""};
    var array = [];
    console.log(retId);
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };
    $(document).ready(function() {
        ReturnGoods(retId,orderNumber);

        $(".ReturnGoods").click(function () {
            $(".ReturnGoods img").attr("src","${bath}/images/frontpages/common/yuan_active.png");
            $(".ExchangeGoods img").attr("src","${bath}/images/frontpages/common/yuan_none.png");
            $(".returnGoods").text("0");
        })
        $(".ExchangeGoods").click(function () {
            $(".ReturnGoods img").attr("src","${bath}/images/frontpages/common/yuan_none.png");
            $(".ExchangeGoods img").attr("src","${bath}/images/frontpages/common/yuan_active.png");
            $(".returnGoods").text("1");
        })


        // 单张上传照片
        $(".fileinput").change(function () {
            var file = this.files[0];
            $(this).parent().css("display","none");
            readFile(file,$(this).parent().siblings(".on"));
        });

    });

    //需要把阅读的文件传进来file element是把读取到的内容放入的容器
    function readFile(file,element) {

        if (file){
            //        新建阅读器
            var reader = new FileReader();
            //        根据文件类型选择阅读方式
            reader.readAsDataURL(file);
            //        当文件阅读结束后执行的方法
            reader.addEventListener("load",function () {

                var ImgSrc = "";
                var img = document.createElement('img');
                img.src = event.target.result;
                element.append(img);
                element.show();
                ImgSrc = img.src;
                //执行AJAX
//                    var i = element.children("img");
//                    var quality = 20;
//                    i.src = jic.compress(i, quality).src;

                ImgSrc = img.src;

                jQuery.ajax({
                    type : "POST", //用POST方式请求
                    url : '${bath}/fileUpload', //目标地址
                    data : {
                        data : ImgSrc
                    },
                    dataType : "json", //数据格式:JSON
                    success : function(retInfo) {
                        console.log(retInfo);
                        array.push(retInfo.data);
                        console.log(array);
                    },
                    error:function(XMLHttpRequest, textStatus){
                        console.log(XMLHttpRequest);
                        console.log(textStatus);
                        $("#loading").css("display","none");
                        toastr.error('查询失败！');
                        return false;
                    }
                });
            });
        }
    }

    //获取详情
    function ReturnGoods(retId,orderNumber) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalallOrder/getReturnP', //目标地址
            data : {
                orderNumber : orderNumber,
                prId : retId
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
                var retData = retInfo.data.list[0];
                var retImg = retData.main_image_path;
                var retName = retData.name;
                var retNumber = retData.number;
                var retMoney = retData.total;
                $(".retImg").attr("src","${bath}"+retImg+"");
                $(".retName").text(retName);
                $(".retNumber").text(retNumber);
                $(".retMoney").text(retMoney);
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


    //提交退换货详情
    function Reason() {
        if(array.length >= 1){
            var dataString = array.join()
            var ReasonType = $(".returnGoods").text();
            var ReturnReason = $(".reason_shuom").val();
            console.log(ReasonType);
            console.log(ReturnReason);
            $.ajax({
                type : "POST", //用POST方式请求
                url : '${bath}/PortalallOrder/AddReturn', //目标地址
                data : {
                    orderNumber : orderNumber,
                    prId : retId,
                    type : ReasonType,
                    reason : ReturnReason,
                    reasonImg : dataString
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
                    if(retInfo.retCode == 0){
                        toastr.success("退换成功！");
                        var navTypeParam = 4;
                        var url = "${bath}/portalLink/linkToSaleService?navType="+navTypeParam;
                        window.open(url,"_self");
                    }else {
                        toastr.error('退换失败！');
                    }
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
        }else {
            toastr.error('请把信息填写完整！');
        }

    }

</script>