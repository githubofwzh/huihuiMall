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
        <script src="${bath}/js/register.js" type="text/javascript"></script>
        <script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
        <script src="${bath}/js/jquery-validate.js" type="text/javascript"></script>
            <script src="${bath}/js/JIC.min.js" type="text/javascript"></script>
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
							注册企业账号
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
							<button type="button" class="btn nextstep" data-loading-text="加载中...">下一步</button>
						</li>
					</ul>
				</div>
			</div>
			<#--完善信息-->
            <div class="col-lg-12 col-md-12 perfectInfo">
                <!--头部-->
                <div class="col-lg-10 col-md-10 col-lg-offset-2 maintitle">
                    <p class="title">
						<span class="title_content">
							完善企业信息
						</span>
                    </p>

                    <ul class="col-lg-5 col-md-5 moreBody">
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">企业名称</label><b>*</b>
                            <input type="text" name="" id="enterPrisename" value="" class="required" data-tip="请输入企业名称" data-valid="isNonEmpty" data-error="企业名称不能为空" />
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">企业地址</label>
                            <input type="text" name="" id="registerAdress" value=""  />
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">法人姓名</label><b>*</b>
                            <input type="text" name="" id="legalPersonname" value=""  class="required" data-tip="请输入法人姓名" data-valid="isNonEmpty" data-error="法人姓名不能为空"/>
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">法人联系方式</label><b>*</b>
                            <input type="text" name="" id="legalPersonphone" value="" class="required" data-tip="请输入法人联系方式" data-valid="isNonEmpty||isMobile" data-error="法人联系方式不能为空||请正确输入手机号" />
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">法人身份证号</label>
                            <input type="text" name="" maxlength="18" id="legalPersonID" value="" class="required"  data-valid="isIDcard" data-error="请正确输入身份证号" />
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">营业执照号</label><b>*</b>
                            <input type="text" name="" id="businessLicensenum" value="" class="required" data-tip="请输入营业执照号" data-valid="isNonEmpty" data-error="营业执照号不能为空" />
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">联系人姓名</label><b>*</b>
                            <input type="text" name="" id="contactPersonname" value="" class="required" data-tip="请输入联系人姓名" data-valid="isNonEmpty" data-error="联系人姓名不能为空"/>
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">联系人电话</label><b>*</b>
                            <input type="text" name="" id="contactPersonphone" value="" class="required" data-tip="请输入联系人电话" data-valid="isNonEmpty||isMobile" data-error="联系人电话不能为空||请正确输入电话" />
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">邮政编码</label>
                            <input type="text" name="" maxlength="6" id="zipCode" value="" />
                        </li>
                        <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                            <label for="">联系人邮箱</label>
                            <input type="text" name="" id="email" value=""  />
                        </li>
                    </ul>

                    <div class="col-lg-6 col-md-6 picturesee">
                        <!--身份证正面选择-->
                        <div class="col-lg-12 col-md-12">
                            <div class="col-lg-6 col-md-6" style=height: 161px;">
                                <span class="picture_title">身份证正面</span><b style="color: #ff0000;font-size: 18px">*</b>
                                <ul id="idfrontShowBox" class="showBox">
                                    <p class="init-img">
                                        <label for="idfrontBtn">
                                            <img class="sfzzm" src="${bath}/images/IDcardfront.png"/>
                                        </label>
                                        <input type="file" id="idfrontBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn required" data-valid="isNoEmpty" data-error="请上传身份证正面照片"/>
                                    </p>
                                </ul>
                            </div>
                            <!--营业执照选择-->
                            <div class="col-lg-6 col-md-6" style="height: 161px;">
                                <span class="picture_title">营业执照照片</span><b style="color: #ff0000;font-size: 18px">*</b>
                                <ul id="licenseShowBox" class="showBox">
                                    <p class="init-img">
                                        <label for="licenseBtn">
                                            <img class="yyzz" src="${bath}/images/businessLicense.png"/>
                                        </label>
                                        <input type="file" id="licenseBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn required" data-valid="isNoEmpty" data-error="请上传营业执照照片"/>
                                    </p>
                                </ul>
                            </div>
                        </div>
                        <!--身份证反面选择-->
                        <div class="col-lg-12 col-md-12 _inline" style="padding-left: 30px;height: 161px;">
                            <span class="picture_title">身份证反面</span><b style="color: #ff0000;font-size: 18px;">*</b>
                            <ul id="IDcardshowBox" class="showBox">
                                <p class="init-img">
                                    <label for="IDcardBtn" style="width: 50%;">
                                        <img class="sfzfmId" src="${bath}/images/IDcardbase.png"/>
                                    </label>
                                    <input type="file" id="IDcardBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn required" data-valid="isNoEmpty" data-error="请上传身份证反面照片"/>
                                </p>
                            </ul>
                        </div>

                        <!--示例图片-->
                        <div class="col-lg-9 col-md-9 sample">
                            <div class="col-lg-12 col-md-12 _padding">
                                <span class="col-lg-1 col-md-1"><img src="${bath}/images/sample.png"/></span>
                                <div class="col-lg-5 col-md-5 idShow">
                                    <img src="${bath}/images/IDcardfrontSample.png" class="_marginbase"/>
                                    <img src="${bath}/images/IDcardbaseSamole.png" class="_marginbase"/>
                                </div>
                                <div class="col-lg-5 col-md-5 licenseShow">
                                    <img src="${bath}/images/businessLicenseSample.png" class="_marginbase"/>
                                </div>
                            </div>
                        </div>
                        <!--立即注册-->
                        <div class="col-lg-12 col-md-12 _inline">
                            <div class="col-lg-8 col-md-8 col-md-offset-1">
                                <button type="button" class="btn nextbtn">提交验证</button>
                            </div>
                        </div>
                    </div>
                </div>
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
        $(function(){
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
            $('.nextstep').click(function(event){
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

                var checkCode=$("#checkCode").val();

                $(".nextstep").button('loading');

                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");

                $.ajax({
                    type : "POST", //用POST方式传输
                    url : '${bath}/account/addAcount', //目标地址
                    data : {
                        username:userName,
                        password:passWord,
                        checkcode:checkCode
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
                            $(".register").css("display","none")
                            $(".perfectInfo").css("display","block")

                        }else {
                            toastr.error("验证码错误");
                            //改变提示窗位置
                            changeToastr();
                            return false;
                        }
                    }
                });
            })
        })
        //重载验证码
        function refresh(){
            var time = new Date().getTime();
            document.getElementById('changeCode').src= '${bath}/checkcode?'+time;
        }

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
        }
    </script>

    <#--<script src="/js/common/check.js" type="text/javascript"></script>-->

</html>