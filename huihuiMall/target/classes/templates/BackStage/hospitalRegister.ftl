<!DOCTYPE html>
<html>

<head>
<#assign bath=request.getContextPath()>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>

    <title>注册</title>
    <!-- Bootstrap Core CSS -->
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${bath}/css/register.css"/>
    <!-- Custom Fonts -->
    <link href="${bath}/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/checkBox_radio.css" rel="stylesheet" type="text/css" />

    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css" />

    <!-- jQuery -->

    <script src="${bath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <#--<script src="${bath}/js/register.js" type="text/javascript"></script>-->
    <script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery-validate.js" type="text/javascript"></script>
    <script src="${bath}/js/JIC.min.js" type="text/javascript"></script>
    <style>
        .submit{
            width: 260px;
            height: 50px;
            background-color: #3c67c0;
            color: #FFFFFF;
        }
    </style>
</head>

<body>
<!--页面开始-->
<div class="col-lg-12 col-md-12 container">
    <!--头部-->
    <div class="col-lg-12 col-md-12 mainheader">
        <div class="col-lg-8 col-md-8 col-lg-offset-2 header">
            <div class="logo">
                <div class="logo_img">
                    <img src="${bath}/images/common/logo.png" />
                </div>
                <p>中药材产业扶贫信息系统</p>
            </div>
            <span id="gologin" class="tologin">返回首页</span>
        </div>
    </div>
    <label for="" id="userId" style="display: none"></label>
    <!--主体-->
    <div class="col-lg-12 col-md-12 register">
        <!--头部-->
        <div class="col-lg-8 col-md-8 col-lg-offset-2 maintitle">
            <p class="title">
                <span class="title_content">
                    注册中医院账号
                </span>
            </p>

            <lable id="type" style="display:none">${type!''}</lable>

            <ul class="col-lg-12 col-md-12 _body" id="_body">
                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">用户名</label>
                    <input type="text" class="required" name="" id="userName" maxlength="16" value="" data-tip="请输入您的用户名（字母、数字、下划线组成，4-16位）" data-valid="isNonEmpty||isUserName" data-error="用户名不能为空||字母、数字、下划线组成，字母开头，4-16位" />
                    <span class="tipInfo">请输入您的用户名（字母、数字、下划线组成，4-16位）</span>
                </li>
                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">密码</label>
                    <input type="password" class="required"  name="" maxlength="12" id="passWord" value="" data-tip="请输入您的密码(6-12位字母或数字)" data-valid="isNonEmpty||between:6-16" data-error="密码不能为空||密码长度6-16位"  />
                    <span class="tipInfo">请填写长度6-12的字母或数字</span>
                </li>
                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">确认密码</label>
                    <input type="password" name="" class="required"   maxlength="12" id="nextpassWord" value="" data-tip="请再次输入您的密码" data-valid="isNonEmpty||isRegisterSame" data-error="密码不能为空||两次密码输入不一致" />
                    <span class="tipInfo">请再次输入密码</span>
                </li>

                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">中医院名称</label>
                    <input type="text" class="required" name="" id="hospitalName" value="" data-tip="请输入中医院名称" data-valid="isNonEmpty" data-error="中医院名称不能为空"/>
                    <span class="tipInfo">请输入中医院名称</span>
                </li>

                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">选择省市</label>
                    <select class="form-control required" name="" value="" style="width:240px;display: inline-block; margin-left: 20px" id="province" data-tip="请选择省市" data-valid="isNonEmpty" data-error="省市不能为空">

                    </select>
                    <span class="tipInfo">请选择省市</span>
                </li>

                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">法人</label>
                    <input type="text" class="required" name="" id="legalPerson" value="" data-tip="请输入法人姓名" data-valid="isNonEmpty" data-error="法人姓名不能为空"/>
                    <span class="tipInfo">请输入法人姓名</span>
                </li>

                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">联系人</label>
                    <input type="text" class="required" name="" id="linkMan" value="" data-tip="请输入联系人姓名" data-valid="isNonEmpty" data-error="联系人姓名不能为空"/>
                    <span class="tipInfo">请输入联系人姓名</span>
                </li>

                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">电话</label>
                    <input type="text" class="required" name="" id="telephone" value="" data-tip="请输入联系电话" data-valid="isNonEmpty" data-error="电话不能为空"/>
                    <span class="tipInfo">请输入联系电话</span>
                </li>

                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">地址</label>
                    <input type="text" class="required" name="" id="address" value="" data-tip="请输入地址" data-valid="isNonEmpty" data-error="地址不能为空" style="width:370px"/>
                    <span class="tipInfo">请输入地址</span>
                </li>

                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">电子邮箱</label>
                    <input type="text" class="required" name="" id="email" value="" data-tip="请输入电子邮箱" data-valid="isNonEmpty" data-error="电子邮箱不能为空"/>
                    <span class="tipInfo">请输入电子邮箱</span>
                </li>

                <li class="col-lg-12 col-md-12 _margintop">
                    <label for="">验证码</label>
                    <input type="text" name=""  class="required"    maxlength="5" id="checkCode" value="" data-tip="请输入验证码" data-valid="isNonEmpty||between:5-5" data-error="验证码不能为空||验证码长度5位"  style="width: 150px;"/>
                    <img src="${bath}/checkcode" id="changeCode"/>
                    <span class="notsee" onclick="refresh()">看不清？换一张</span>
                </li>
                <li class="col-lg-10 col-md-10 col-lg-offset-1" style="margin-top: 20px;">
                    <input type="checkbox" name="" id="accept" value="" checked="checked" style="vertical-align: middle;"/>
                    <p class="hasread"><label for="accept">我已阅读并接受</label><span>《用户许可协议》</span></p>
                </li>
                <li class="col-lg-10 col-md-10 col-lg-offset-1 _margintop">
                    <button type="button" class="btn submit" data-loading-text="提交中...">完成注册</button>
                </li>
            </ul>
        </div>
    </div>
<#--完善信息-->
</div>
<!--成功蒙版-->
<div id="fade" class="black_overlay">
    <div id="success" class="_success">
        <p><img src="${bath}/images/successicon.png"/></p>
        <span class="success_title"><b>您已成功注册网站后台管理系统！</b></span>
        <ul class="content">
            <#--<li><span class="trueinfo">企业代码</span>:<span class="trueinfoContent"></span>-->
            <#--<span style="color: #000;">(请您牢记！！)</span>--></li>
            <li><span class="trueinfo">用户名</span>:<span class="trueinfoUsetName"></span></li>
            <li><span class="trueinfo">密码</span>:<span class="trueinfoPassWord"></span></li>
        </ul>
        <div style="width: 100%;text-align: center">
            <button type="button" class="btn gologin tologin">去登录</button>
        </div>
    </div>
</div>
</div>

</body>

<script type="text/javascript">

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $(function(){

        getProvinceInfo();

        /*去登录、返回首页*/
        $('.tologin').click(function(){
            var url="${bath}/account/login";
            window.open(url,"_self");
        });

        /*验证注册信息*/
        $('#_body').validate({
            onFocus: function() {
                this.parent().addClass('active');
                $(this).next('span').css("display","none");
                return false;
            },

            onBlur: function() {
                var $parent = this.parent();
                var _status = parseInt(this.attr('data-status'));
                $parent.removeClass('active');
                if (!_status) {
                    $parent.addClass('error');
                }
                return false;

            }
        });

        /*完善信息*/
        $('.submit').click(function(event){
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            if (! $('#_body').validate('submitValidate')){
                return false;
            }
            var userName=$("#userName").val();

            var passWord=$("#passWord").val();

            var nextpassWord=$("#nextpassWord").val();

            var hospitalName = $("#hospitalName").val();

            var legalPerson = $("#legalPerson").val();

            var linkMan = $("#linkMan").val();

            var telephone = $("#telephone").val();

            var address = $("#address").val();

            var email = $("#email").val();

            var checkCode=$("#checkCode").val();

            var province_Id = $("#province").find("option:selected").val();
            var provinceId = province_Id;
            console.log(provinceId);

            $(".submit").button('loading');

            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/account/addHospitalAcount', //目标地址
                data : {
                    username : userName,
                    password : passWord,
                    checkcode : checkCode,
                    name : hospitalName,
                    provinceId : provinceId,
                    legalPerson : legalPerson,
                    address : address,
                    telephone : telephone,
                    linkman : linkMan,
                    email : email
                },
                beforeSend: function(jqXHR) {
                    if (undefined != header){
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                    $(".nextstep").button('reset');
                    if (retInfo.retCode==10007){
                        toastr.error("用户名已存在");
                        //改变提示窗位置
                        changeToastr();
                        return false;
                    }else if (retInfo.retCode==0){
                        $("input").val("")
                        /*获取entcode*/
                        $("#userId").val(retInfo.data);
                        $(".trueinfoUsetName")[0].innerHTML=userName
                        $(".trueinfoPassWord")[0].innerHTML=passWord;
                        $(".black_overlay").css("display","block");

                    }else {
                        toastr.error("验证码错误");
                        //改变提示窗位置
                        changeToastr();
                        return false;
                    }
                }
            });
        })
    });

    //重载验证码
    function refresh(){
        var time = new Date().getTime();
        document.getElementById('changeCode').src= '${bath}/checkcode?'+time;
    };

    //改变提示窗位置
    function changeToastr() {
        var toscrollTop=$(window.parent).scrollTop();//滚动距离
        var documentHeight=$(document).height();//当前iframe总高度
        var percent;
        if(toscrollTop<80){
            percent=(((toscrollTop+170)/documentHeight)*100)+"%";
        }else {
            percent=(((toscrollTop+110)/documentHeight)*100)+"%";
        }
        /* alert(documentHeight)
         alert(percent)*/
        $("#toast-container").css("top",percent);
    };

    //获取省市列表
    function getProvinceInfo(){
        $.ajax({
            type : "GET", //用POST方式传输
            url : '${bath}/provinceInfo/getProviceList', //目标地址
            data : {},
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);

                var retData = retInfo.data;
                var retDataLength = retData.length;

                for(var i = 0; i < retDataLength; i ++){
                    var provinceId = retData[i].id;
                    var provinceName = retData[i].provinceName;

                    var optionHtml = "<option value='"+provinceId+"'>"+provinceName+"</option>";
                    $("#province").append(optionHtml);

                }
            }
        });
    };
</script>

<#--<script src="/js/common/check.js" type="text/javascript"></script>-->

</html>