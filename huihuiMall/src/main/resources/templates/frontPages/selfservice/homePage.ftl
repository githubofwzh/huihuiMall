<!DOCTYPE html>
<html lang="en">
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
    <link href="${bath}/css/frontpages/selfservice/homePage.css" rel="stylesheet" type="text/css"/>
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


<label id="uid" style="display: none">${uid!''}</label>
<label id="phone_number" style="display: none">${phone!''}</label>
<#include "nav.ftl">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-xs-12 col-sm-12 theme">
            <div class="main_left left col-lg-2 col-xs-2 col-sm-2">

            </div>
            <div class="main_right col-lg-10 col-xs-10 col-sm-10 left">
                <div class="text-center clearfix col-lg-12 col-xs-12 col-sm-12 shopping_two">


                </div>
            </div>
        </div>


        <!---->
        <div class="panel-body">
            <div class="modal fade" id="identifier" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="chooseStoreModalLabel">
                                请输入设备号
                            </h4>
                        </div>
                        <div class="modal-body text-center">
                            <input class="input" type="text" id="deviceCode" placeholder="请输入设备号"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default confirm-btn localStorage" style="margin-top: 0px" id="payModal" data-loading-text="保存中..." autocomplete="off">
                                确定
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->



    </div>
</div>
</body>
</html>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var storage=window.localStorage;
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function() {
        var screenHeight = $(window).height();
        var navPanelHeight = $(".nav-panel").height();
        var themeHeight = screenHeight + "px";
        var leftNavHeight = screenHeight - 110 + "px";
        var rightPanelHeight = screenHeight - 110 + "px";
        console.log(navPanelHeight);
        console.log(themeHeight);
        $(".theme").css("height",themeHeight);
        $(".main_left").css("height",leftNavHeight);
        $(".main_right").css("height",rightPanelHeight);
        //一级列表
        getToOneList();


        if (storage == null || storage == "" || storage.length == 0) {
            $('#identifier').modal('show');
        }

        $(".localStorage").click(function () {
            if ($("#deviceCode").val() == ""){
                toastr.error("请输入设备号！");
            }else {
                var localStorageData = $("#deviceCode").val();
                localStorage.setItem("equipment_Number", localStorageData);
                toastr.success("设备号输入成功！");
                $('#identifier').modal('hide');
            }
        });

    });




    //一级列表
    function getToOneList() {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getAll', //目标地址
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
                console.log(retInfo);
                var retUserInfo = retInfo.data.userInfo;
                console.log(retUserInfo);
                if(retUserInfo != null){
                    var retUserId= retUserInfo.userId;
                    var retUserNumber = retUserInfo.phoneNumber;
                    $(".hellowPhone").text("欢迎您，"+retUserNumber);
                }else{
                    $(".hellowPhone").css("display","none");
                }

                var retDataLength = retData.length;
                //排序
                retData.sort(function(a,b){
                    return a.sort - b.sort;
                });
                for (var i = 0; i < retDataLength; i++){
                    var retName = retData[i].name;
                    var retStor = retData[i].stor;
                    var retId = retData[i].id;
                    var mainLeftHtml = "<div name='"+retStor+"' id='"+retId+"'><i class='fa fa-angle-right'></i><span>"+retName+"</span></div>";
                    $(".main_left").append(mainLeftHtml);
                };


				//点击背景变白色
                $(".main_left div").eq(0).addClass('active');
                $(".main_left div").click(function() {
                    $(this).addClass('active').siblings('div').removeClass('active');
                    var classifyId = $(this).attr("id");
                    getSecondClassifyInfo(classifyId);
                });
                var Aid = $(".main_left div").eq(0).attr("id");
                console.log(Aid);
                getToDefaultList(Aid);
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

    //进首页调取默认列表样式
    function getToDefaultList(Aid) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getOneAndTwo', //目标地址
            data : {
                id : Aid,
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                $("#goodsClassify").empty();
                var retData = retInfo.data.list;
                var retDataLength = retData.length;
                var retUser = retInfo.data.userInfo;
                if(retUser != null){
                    var retPhoneNumber = retUser.phoneNumber;
                    var retUserId = retUser.userId;
                }


                retData.sort(function(a,b){
                    return a.twosort - b.twosort;
                });
                for (var i = 0; i < retDataLength; i++){
                    var id = retData[i].twoid;
                    var retName = retData[i].twoname;
                    var sort =  retData[i].twosort;
                    var retImg =  retData[i].image;
                    if(retUser != null){
                        var firstClassifyHtml = "<dl class='col-lg-2 col-xs-2 col-sm-2 "+id+"' name='"+sort+"' onclick='linkToClassify("+id+","+retPhoneNumber+","+retUserId+");'>";
                    }else{
                        var firstClassifyHtml = "<dl class='col-lg-2 col-xs-2 col-sm-2 "+id+"' name='"+sort+"' onclick='linkToClassify("+id+");'>";
                    }
                    firstClassifyHtml += "<dt class='dt_img'><img src='${bath}"+retImg+"' class='img-responsive'></dt>";
                    firstClassifyHtml += "<dd>"+retName+"</dd>";
                    firstClassifyHtml += "</dl>";

                    $(".shopping_two").append(firstClassifyHtml);


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

    //跳转商品列表
    function linkToClassify(id,retPhoneNumber,retUserId){
        if(retPhoneNumber == undefined){
            retPhoneNumber = "";
        }
        if(retUserId == undefined){
            retUserId = "";
        }
        var navTypeParam = 1;
        var classifyIdParam = id;
        var url = "${bath}/portalLink/linkToChoiceOfGoods?navType="+navTypeParam+"&classifyId="+classifyIdParam+"&phone="+retPhoneNumber+"&uid="+retUserId;
        window.open(url,"_self");
    }

    //获取二级分类方法
    function getSecondClassifyInfo(erjiId) {
        var erjiIdParam = erjiId;

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/PortalCategoryOne/getOneAndTwo', //目标地址
            data : {
                id : erjiIdParam,
            },
            beforeSend: function (jqXHR) {
                if (undefined != header) {
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                $(".shopping_two").empty();
                var retData = retInfo.data.list;
                var retDataLength = retData.length;
              var retUser = retInfo.data.userInfo;
                if(retUser != null){
                    var retPhoneNumber = retUser.phoneNumber;
                    var retUserId = retUser.userId;
                }
                if (retData[0].twoid == null){
                    $(".shopping_two").empty();
                }else {
                    retData.sort(function(a,b){
                        return a.twosort - b.twosort;
                    });


                    for (var i = 0; i < retDataLength; i++){
                        var id = retData[i].twoid;
                        var retName = retData[i].twoname;
                        var sort =  retData[i].twosort;
                        var retImg =  retData[i].image;
                        if(retUser != null){
                            var firstClassifyHtml = "<dl class='col-lg-2 col-xs-2 col-sm-2 "+id+"' name='"+sort+"' onclick='linkToClassify("+id+","+retPhoneNumber+","+retUserId+");'>";
                        }else{
                            var firstClassifyHtml = "<dl class='col-lg-2 col-xs-2 col-sm-2 "+id+"' name='"+sort+"' onclick='linkToClassify("+id+");'>";
                        }
                        firstClassifyHtml += "<dt class='dt_img'><img src='${bath}"+retImg+"' class='img-responsive'></dt>";
                        firstClassifyHtml += "<dd>"+retName+"</dd>";
                        firstClassifyHtml += "</dl>";

                        $(".shopping_two").append(firstClassifyHtml);


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

        $("#goodsClassify").empty();
    }

</script>
