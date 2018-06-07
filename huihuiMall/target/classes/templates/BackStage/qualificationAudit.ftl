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

    <title>资质审核</title>
    <!-- Bootstrap Core CSS -->
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${bath}/css/register.css"/>

    <!-- Custom Fonts -->
    <link href="${bath}/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/checkBox_radio.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/zoomify.min.css" rel="stylesheet" type="text/css" />

    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css" />

    <!-- jQuery -->

    <script src="${bath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/register.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery-validate.js" type="text/javascript"></script>
    <script src="${bath}/js/JIC.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common/zoomify.js" type="text/javascript"></script>

</head>
<style>
    ._margintop{
        margin-top: 15px;
    }
    ._margintop input{
        background-color: #ffffff;
    }
    .moreBody{
        margin-left: 0;
    }
    .init-img{
        margin-top: 10px;
    }

    .init-img img{
        max-width: 162px;
        max-height: 111px;
    }
    .imgs{
        display: block;
        width: 170px;
        border: 1px solid #cdcdcd;
        box-sizing: border-box;
        text-align: center;
        padding: 5px 5px;
        position: relative;
        background-color: #f4f4f4;
        margin-top: 15px;
    }

    .imgs img{
        max-width: 162px;
        max-height: 111px;
    }
    .id_front_imgs{
        display: block;
        width: 170px;
        border: 1px solid #cdcdcd;
        box-sizing: border-box;
        text-align: center;
        padding: 5px 5px;
        position: relative;
        background-color: #f4f4f4;
        margin-top: 15px;
    }

    .id_tails_imgs{
        display: block;
        width: 170px;
        border: 1px solid #cdcdcd;
        box-sizing: border-box;
        text-align: center;
        padding: 5px 5px;
        position: relative;
        background-color: #f4f4f4;
        margin-top: 15px;
    }
    .license_imgs{
        display: block;
        width: 170px;
        border: 1px solid #cdcdcd;
        box-sizing: border-box;
        text-align: center;
        padding: 5px 5px;
        position: relative;
        background-color: #f4f4f4;
        margin-top: 15px;
    }
    .id_front_imgs img{
        max-width: 162px;
        max-height: 111px;
    }

    .id_tails_imgs img{
        max-width: 162px;
        max-height: 111px;
    }
    .license_imgs img{
        max-width: 162px;
        max-height: 111px;
    }
</style>

<body>
<!--页面开始-->
<div class="col-lg-12 col-md-12 container" style="background-color: #ffffff">
    <!--主体-->
    <div class="col-lg-12 col-md-12">
        <div class="col-lg-12 col-md-12  maintitle">
            <ul class="col-lg-5 col-md-5 moreBody">
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop" style="display: none;">
                    <label for="">企业代码</label>
                    <input type="text" name="" id="enterNum" value="${(data.entCode)!}" disabled />
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">企业名称</label>
                    <input type="text" name="" id="enterPrisename" value="${(data.name)!}" class="required" data-tip="请输入企业名称" data-valid="isNonEmpty" data-error="企业名称不能为空" />
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">企业地址</label>
                    <input type="text" name="" id="registerAdress" value="${(data.registAddress)!}"  />
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">法人姓名</label>
                    <input type="text" name="" id="legalPersonname" value="${(data.legalPersonName)!}"  class="required" data-tip="请输入法人姓名" data-valid="isNonEmpty" data-error="法人姓名不能为空"/>
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">法人联系方式</label>
                    <input type="text" name="" id="legalPersonphone" value="${(data.legalPersonContact)!}" class="required" data-tip="请输入法人联系方式" data-valid="isNonEmpty||isMobile" data-error="法人联系方式不能为空||请正确输入手机号" />
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">法人身份证号</label>
                    <input type="text" name="" maxlength="18" id="legalPersonID" value="${(data.legalPersonIdcard)!}" />
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">营业执照号</label>
                    <input type="text" name="" id="businessLicensenum" value="${(data.businessLicence)!}" />
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">联系人姓名</label>
                    <input type="text" name="" id="contactPersonname" value="${(data.linkmanName)!}" class="required" data-tip="请输入联系人姓名" data-valid="isNonEmpty" data-error="联系人姓名不能为空"/>
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">联系人电话</label>
                    <input type="text" name="" id="contactPersonphone" value="${(data.linkmanMobile)!}" class="required" data-tip="请输入联系人电话" data-valid="isNonEmpty||isMobile" data-error="联系人电话不能为空||请正确输入电话" />
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">邮政编码</label>
                    <input type="text" name="" maxlength="6" id="zipCode" value="${(data.zipCode)!}" />
                </li>
                <li class="col-lg-12 col-md-12 _margintop _moreMargintop">
                    <label for="">联系人邮箱</label>
                    <input type="text" name="" id="email" value="${(data.email)!}" />
                </li>
                <label for="" id="auditStatus" style="display: none">${(data.auditStatus)!}</label>
                <label for="" id="enterId" style="display: none">${(data.id)!}</label>
            </ul>

            <div class="col-lg-6 col-md-6 picturesee">
                <!--身份证正面选择-->
                <div class="col-lg-12 col-md-12">
                    <div class="col-lg-6 col-md-6" style="height: 161px;">
                        <span class="picture_title">身份证正面</span>
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
                        <span class="picture_title">营业执照照片</span>
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
                    <span class="picture_title">身份证反面</span>
                    <ul id="IDcardshowBox" class="showBox">
                        <p class="init-img">
                            <label for="IDcardBtn" style="width: 50%;">
                                <img class="sfzfmId" src="${bath}/images/IDcardbase.png"/>
                            </label>
                            <input type="file" id="IDcardBtn" accept="image/jpeg,image/jpg,image/png" multiple class="hide uploadBtn required" data-valid="isNoEmpty" data-error="请上传身份证反面照片"/>
                        </p>
                    </ul>
                </div>

                <!--提交审核-->
                <div class="col-lg-12 col-md-12" style="margin-top: 20px">
                    <div class="col-lg-12 col-md-12">
                        <p class="tipInfo defeat">
                        </p>
                    </div>
                    <div class="col-lg-8 col-md-8 col-md-offset-1">
                        <button type="button" class="btn confirmBtn" style="display: none;">提交审核</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var idfrontBtn = "";
    var IDcardBtn = "";
    var licenseBtn = "";

    $(function(){
        var auditStatus=$("#auditStatus").text();
        //图片处理
        var idCardFrontHtml = '<li> <p class="imgs"><img src="${bath}${(data.linkmanIdcardfrontPhoto)!}" alt=""/><span class="delete">&times;</span></p> </li>';
        $('#idfrontShowBox').find('.init-img').hide();
        $('#idfrontShowBox').find("li").remove();
        $('#idfrontShowBox').append(idCardFrontHtml);

        var idCardBaseHtml = '<li> <p class="imgs"><img src="${bath}${(data.linkmanIdcardbasePhoto)!}" alt=""/><span class="delete">&times;</span></p> </li>';
        $('#IDcardshowBox').find('.init-img').hide();
        $('#IDcardshowBox').find("li").remove();
        $('#IDcardshowBox').append(idCardBaseHtml);

        var BusinesslicenseHtml = '<li> <p class="imgs"><img src="${bath}${(data.businessLicensePhoto)!}" alt=""/><span class="delete">&times;</span></p> </li>';
        $('#licenseShowBox').find('.init-img').hide();
        $('#licenseShowBox').find("li").remove();
        $('#licenseShowBox').append(BusinesslicenseHtml);
        if (auditStatus==0){
            $(".tipInfo")[0].innerHTML="您的账号正在审核中...";
            $(".tipInfo").addClass("defeat");
            $("input").attr("disabled","disabled");
            $(".confirmBtn").css("display","none");
            $(".delete").hide();
        }else if (auditStatus==2){
            $(".tipInfo")[0].innerHTML="很遗憾，审核未通过，请更改信息再次提交审核！";
            $(".tipInfo").addClass("defeat");
            $(".confirmBtn").css("display","block");
        }else {
            $("input").attr("disabled","disabled");
            $(".tipInfo").addClass("tipSuccess");
            $(".tipInfo")[0].innerHTML="恭喜您！您的审核已经通过！";
            $(".confirmBtn").css("display","none");
            $(".delete").hide();
        }

        /*验证注册信息*/
        $('.maintitle').validate({
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

        $(".confirmBtn").click(function () {
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            if (! $('.moreBody').validate('submitValidate')){
                return false;
            }
            if (! $('.picturesee').validate('submitValidate')){
                return false;
            }

            var id=$("#enterId").text();
            var modifyemail = $("#email").val();
            var modifyenterPrisename = $("#enterPrisename").val();
            var modifyregisterAdress = $("#registerAdress").val();
            var modifybusinessLicensenum = $("#businessLicensenum").val();
            var modifylegalPersonname = $("#legalPersonname").val();
            var modifylegalPersonphone = $("#legalPersonphone").val();
            var modifylegalPersonID = $("#legalPersonID").val();
            var modifycontactPersonname = $("#contactPersonname").val();
            var modifycontactPersonphone = $("#contactPersonphone").val();
            var modifyzipCode = $("#zipCode").val();

            //var idFrontPicture = $("#idfrontShowBox").find("li").find(".id_front_imgs").find("img").attr("src");
            var idFrontPicture = idfrontBtn;
            /*if ($("#idfrontShowBox .init-img").css("display")=="block"){
                if($("#idfrontBtn").val()== ""){
                    toastr.error('请上传身份证正面照片！');
                    return false;
                }
            }else {
                if($("#idfrontShowBox img")[0].src == ""){
                    toastr.error('请上传身份证正面照片！');
                    return false;
                }
            }*/

            //var IDcardPicture = $("#IDcardshowBox").find("li").find(".id_tails_imgs").find("img").attr("src");
            var IDcardPicture = IDcardBtn;
           /* if ($("#IDcardshowBox .init-img").css("display")=="block"){
                if($("#IDcardBtn").val()== ""){
                    toastr.error('请上传身份证反面照片！');
                    return false;
                }
            }else {
                if($("#IDcardshowBox img")[0].src == ""){
                    toastr.error('请上传身份证反面照片！');
                    return false;
                }
            }*/

            //var licensePicture = $("#licenseShowBox").find("li").find(".license_imgs").find("img").attr("src");
            var licensePicture = licenseBtn;
           /* if ($("#licenseShowBox .init-img").css("display")=="block"){
                if($("#licenseBtn").val()== ""){
                    toastr.error('请上传营业执照照片！');
                    return false;
                }
            }else {
                if($("#licenseShowBox img")[0].src == ""){
                    toastr.error('请上传营业执照照片！');
                    return false;
                }
            }*/


            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/company/updateCompany', //目标地址
                data : {
                    id:id,
                    email:modifyemail,
                    name : modifyenterPrisename,
                    registAddress : modifyregisterAdress,
                    businessLicence : modifybusinessLicensenum,
                    legalPersonName : modifylegalPersonname,
                    legalPersonContact : modifylegalPersonphone,
                    linkmanName : modifycontactPersonname,
                    linkmanMobile:modifycontactPersonphone,
                    zipCode:modifyzipCode,
                    auditStatus:0,
                    linkmanIdcardfrontPhoto:idFrontPicture,
                    linkmanIdcardbasePhoto:IDcardPicture,
                    businessLicensePhoto:licensePicture,
                    model:id + "Register"
                },
                beforeSend: function(jqXHR) {
                    if (undefined != header){
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                    console.log(retInfo);
                    var retCode = retInfo.retCode;
                    if(retCode != 0){
                        toastr.error('提交失败！');
                        //改变提示窗位置
                        changeToastr();
                    }
                    else{
                        //$("#confirmModify").button('reset');
                        toastr.success('提交成功！');
                        //改变提示窗位置
                        changeToastr();
                        setTimeout(function () {
                            window.location.reload();
                        },2000)
                    }
                }
            });

        })


        //上传身份证正面图片
        /*var idfrontBtn = $('#idfrontBtn'),
                idfrontShowBox = $('#idfrontShowBox');*/

        $('#idfrontBtn').change(function() {
            var self = $(this),
                    file = document.getElementById('idfrontBtn').files[0]; //获取到上传控件对象files
            if(file) {

                fileSize(file);
                toastr.options = {
                    "positionClass": "toast-nav-center-center", //弹出窗的位置
                    "timeOut": "1000", //展现时间
                };
                if ( fileSize(file)==false){
                    $("#idfrontBtn").val("");
                    toastr.error('每张不得超过5M！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
                var reader = new FileReader(); //创建一个FileReader对象

                reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
                reader.onload = function(e) { //当文件成功读取后
                    var temp = '<li> <p class="id_front_imgs"><img src="' + this.result + '" alt="" id="idFrontImg"/> <span class="delete">&times;</span></p> </li>';

                    //$(".idFrontLabel").text(this.result);
                    /* 最多上传一张 */

                    maxNum($('#idfrontBtn'), $('#idfrontShowBox'), 1);
                    $('#idfrontShowBox').find('.init-img').hide();
                    $('#idfrontShowBox').find("li").remove();
                    $('#idfrontShowBox').append(temp);

                    //图片压缩方法
                    var i = document.getElementById("idFrontImg");
                    i.src = event.target.result;
                    setTimeout(function () {
                        var quality = 50; //图像压缩比，越小压缩越多
                        idfrontBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                    }, 10);
                    //idfrontBtn = i.src;
                }
            }

        });

        /* 身份证正面点击delete 删除图片 */
        $('#idfrontShowBox').on('click', ".delete", function(e) {
            $(this).parent().parent('li').remove();
            $('#idfrontShowBox').find('.init-img').show();
            $('#idfrontBtn').val("");
            $('#idfrontBtn').removeProp('disabled');
            console.log()
        });
        /*身份证正面鼠标移入移出*/
        $('.sfzzm').hover(function(e) {
            $(this).attr("src", "${bath}/images/IDcardfront_mo.png")
        }, function() {
            $(this).attr("src", "${bath}/images/IDcardfront.png")
        });

        /*身份证反面上传图片*/
        $("#IDcardBtn").change(function() {
            var self = $(this),
                    file = document.getElementById('IDcardBtn').files[0]; //获取到上传控件对象files
            if(file) {

                fileSize(file);
                toastr.options = {
                    "positionClass": "toast-nav-center-center", //弹出窗的位置
                    "timeOut": "1000", //展现时间
                };
                if ( fileSize(file)==false){
                    $("#IDcardBtn").val("");
                    toastr.error('每张不得超过5M！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
                var reader = new FileReader(); //创建一个FileReader对象

                reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
                reader.onload = function(e) { //当文件成功读取后
                    var temp = '<li> <p class="id_tails_imgs"><img src="' + this.result + '" alt="" id="idTailsImg"/><span class="delete">&times;</span></p></li>';

                    /* 最多上传一张 */

                    maxNum($("#IDcardBtn"), $("#IDcardshowBox"), 1);
                    $("#IDcardshowBox").find('.init-img').hide();
                    $("#IDcardshowBox").find("li").remove();
                    $("#IDcardshowBox").append(temp);

                    //图片压缩方法
                    var i = document.getElementById("idTailsImg");
                    i.src = event.target.result;
                    setTimeout(function () {
                        var quality = 50; //图像压缩比，越小压缩越多
                        IDcardBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                    }, 10);
                    //IDcardBtn = i.src;
                }
            }

        });

        /* 身份证反面点击delete 删除图片 */
        $('#IDcardshowBox').on('click', ".delete", function(e) {
            $(this).parent().parent('li').remove();
            $("#IDcardshowBox").find('.init-img').show();
            $("#IDcardBtn").val("");
            $('#IDcardBtn').removeProp('disabled');
            console.log()

        });

        /*身份证反面鼠标移入移出*/
        $('.sfzfmId').hover(function(e) {
            $(this).attr("src", "${bath}/images/IDcardbase_mo.png")
        }, function() {
            $(this).attr("src", "${bath}/images/IDcardbase.png")
        });

        /*营业执照上传*/
        $("#licenseBtn").change(function() {
            var self = $(this),
                    file = document.getElementById('licenseBtn').files[0]; //获取到上传控件对象files
            if(file) {

                fileSize(file);
                toastr.options = {
                    "positionClass": "toast-nav-center-center", //弹出窗的位置
                    "timeOut": "1000", //展现时间
                };
                if ( fileSize(file)==false){
                    $("#licenseBtn").val("");
                    toastr.error('每张不得超过5M！');
                    //改变提示窗位置
                    changeToastr();
                    return false;
                }
                var reader = new FileReader(); //创建一个FileReader对象

                reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
                reader.onload = function(e) { //当文件成功读取后
                    var temp = '<li> <p class="license_imgs"><img src="' + this.result + '" alt="" id="licenseImg"/><span class="delete">&times;</span></p></li>';

                    /* 最多上传一张 */

                    maxNum($("#licenseBtn"), $("#licenseShowBox"), 1);
                    $("#licenseShowBox").find('.init-img').hide();
                    $("#licenseShowBox").find("li").remove();
                    $("#licenseShowBox").append(temp);

                    //图片压缩方法
                    var i = document.getElementById("licenseImg");
                    i.src = event.target.result;
                    setTimeout(function () {
                        var quality = 50; //图像压缩比，越小压缩越多
                        licenseBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                    }, 10);
                    //licenseBtn = i.src;
                }
            }

        });

        /* 执照点击delete 删除图片 */
        $('#licenseShowBox').on('click', ".delete", function(e) {
            $(this).parent().parent('li').remove();
            $("#licenseShowBox").find('.init-img').show();
            $("#licenseBtn").val("");
            $('#licenseBtn').removeProp('disabled');
            console.log()

        });

        /*营业执照鼠标移入移出*/
        $('.yyzz').hover(function(e) {
            $(this).attr("src", "${bath}/images/businessLicense_mo.png")
        }, function() {
            $(this).attr("src", "${bath}/images/businessLicense.png")
        });
        //点击查看大图
        $('.imgs img').zoomify();

    });

    /* 上传的图片大小 返回值为 图片大小 */
    function fileSize(file) {
        var fileSize = 0;
        if(file.size > 1024 * 1024 * 5) {
            fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
            return false;
        } else {
            fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
            return fileSize;
        }
    }

    /* 最多上传数 */
    function maxNum(btn, showBox, num) {
        if(showBox.find('li').length >= (num - 1)) {
            btn.prop('disabled', 'disabled');
            showBox.find('.init-img').hide();
        } else {
            btn.removeProp('disabled');
            showBox.find('.init-img').show();
        }
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


</html>