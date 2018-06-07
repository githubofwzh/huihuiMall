<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>第三方申请</title>


<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/ThirdParty.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/laydate/theme/default/laydate.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/laydate/laydate.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/imgJS/swipebox/jquery.swipebox.min.js" type="text/javascript"></script>
    <script src="${bath}/js/imgJS/JIC.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 text-center" style="background-color: #FFFFFF;">
            <h4>第三方注册</h4>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 basicInfo register">
            <div class="col-lg-12 col-sm-12 col-xs-12 login_zhuce">
                <div class="login_div clearfix">
                    <label class="col-lg-3 col-sm-3 col-xs-3 login_label">用户名</label>
                    <input maxlength="16" id="userName" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" onkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                </div>
                <div class="login_div clearfix">
                    <label class="col-lg-3 col-sm-3 col-xs-3 login_label">密码</label>
                    <input maxlength="16" id="passWord" class="login_input col-lg-8 col-sm-8 col-xs-8" type="password" />
                </div>
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 submit">
                <button class="All_data center-block" id="NextStep">下一步</button>
            </div>
        </div>




        <div class="col-lg-12 col-sm-12 col-xs-12 basicInfo firm" style="display: none;">
            <div class="col-lg-12 col-sm-12 col-xs-12 information">
                公司基本信息：
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 basicInfo">
                <div class="col-lg-12 col-sm-12 col-xs-12 information_name">
                    <label class="col-lg-3 col-sm-3 col-xs-3">企业全称</label>
                    <input class="col-lg-8 col-sm-8 col-xs-8 enterpriseName" type="text" placeholder="请填写企业全称" />
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3">公司电话</label>
                    <input class="col-lg-8 col-sm-8 col-xs-8 enterprisePhone" type="text" placeholder="请填写公司电话" />
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 information_type">
                    <label class="col-lg-3 col-sm-3 col-xs-3">
                        公司注册地址
                    </label>
                    <div class="col-lg-8 col-sm-8 col-xs-8 three_padding">
                        <select class="login_Sheng" onchange="shengChange();">

                        </select>
                        <select class="login_Shi" onchange="shiChange();">

                        </select>
                        <select class="login_Qu" onchange="quChange();">

                        </select>
                        <select class="login_Jd">

                        </select>
                        <input class="DoorNumber" type="text" placeholder="请输入门牌号" />
                    </div>
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 face_name">
                    <label class="col-lg-3 col-sm-3 col-xs-3">营业执照注册号</label>
                    <input class="col-lg-8 col-sm-8 col-xs-8 FullName" type="text" placeholder="请填写营业执照注册号" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">组织机构代码证号</label>
                    <input id="OrganizationCode" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写组织机构代码证号" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">开户许可证号</label>
                    <input id="OpeningCode" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写开户许可证号" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">税务登记证号</label>
                    <input id="TaxRegistration" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写税务登记证号" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">法定代表人</label>
                    <input id="LegalRepresentative" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写法定代表人" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">联系电话</label>
                    <input id="ContactNumber" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写代表人联系电话" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">覆盖区域</label>
                    <input id="OverlayArea" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写覆盖区域" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">网点数</label>
                    <input id="DotNumber" maxlength="11" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写网点数" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">年销售额（万元）</label>
                    <input id="AnnualSales" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写年销售额" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">利润（万元）</label>
                    <input id="profit" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写利润" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 face_position">
                    <label class="col-lg-3 col-sm-3 col-xs-3">
                        物流类型
                    </label>
                    <input type="radio" name="type" value="0" /><span>不提供</span>
                    <input type="radio" name="type" value="1" /><span>选择平台物流</span>
                    <input type="radio" name="type" value="2" /><span>自营</span>
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">联系人姓名</label>
                    <input id="ContactName" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写联系人姓名" />
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">联系电话</label>
                    <input id="ContactPhone" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写联系人电话" />
                </div>


            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 information">
                主营商品信息：
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 basicInfo">
                <div class="col-lg-12 col-sm-12 col-xs-12 commodity_name">
                    <label class="col-lg-3 col-sm-3 col-xs-3">商品名</label>
                    <input class="col-lg-8 col-sm-8 col-xs-8 name_one" type="text" placeholder="请填写商品名1、商品名2、商品名3....." />
                </div>
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 information">
                商家结算信息
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 information_name">
                <label class="col-lg-3 col-sm-3 col-xs-3">开户银行名称</label>
                <input class="col-lg-8 col-sm-8 col-xs-8 enterpriseName" id="openingBank" type="text" placeholder="请填写开户银行名称" />
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 information_name">
                <label class="col-lg-3 col-sm-3 col-xs-3">银行账号</label>
                <input class="col-lg-8 col-sm-8 col-xs-8 enterpriseName" id="BankAccount" type="text" placeholder="请填写银行账号" />
            </div>
            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    上传营业执照
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <a class="upload text-center">
                        <span>上传营业执照</span>
                        <input type="file" id="BusinessLicense" class="fileinput">
                    </a>
                    <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    法人身份证
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <a class="upload text-center">
                        <span>上传身份证正面</span>
                        <input type="file" id="PositiveId" class="fileinput">
                    </a>
                    <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <a class="upload text-center">
                        <span>上传身份证反面</span>
                        <input type="file" id="PositiveTheOtherSide" class="fileinput">
                    </a>
                    <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    公司或者商铺门脸照片
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <a class="upload text-center">
                        <span>公司或者商铺门脸照片</span>
                        <input type="file" id="CompanyPhoto" class="fileinput">
                    </a>
                    <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    卫生许可证（食品类）
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <a class="upload text-center">
                        <span>卫生许可证（食品类）</span>
                        <input type="file" id="HygieneLicense" class="fileinput">
                    </a>
                    <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    营业场所照片
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <a class="upload text-center">
                        <span>上传营业场所照片</span>
                        <input type="file" id="UploadAPhotoOfABusinessPlace" class="fileinput">
                    </a>
                    <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    营业场所证明
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <a class="upload text-center">
                        <span>营业场所证明</span>
                        <input type="file" id="CertificateOfBusinessPlace" class="fileinput">
                    </a>
                    <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 submit">
                <button class="All_data center-block" id="Submit_enterprise">
                    <span>提交</span>
                </button>
            </div>
        </div>




    </div>
</div>
</body>
</html>


<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var ID = "";
    var merchantCode = "";
    var array = [];
    var jsonarray = eval(array);
    $(document).ready(function () {

        toastr.options = {
            "positionClass": "toast-tip-center-center", //弹出窗的位置
            "timeOut": "1000" //展现时间
        };

        //执行一个laydate实例
        laydate.render({
            elem: "#SpecificDate",//指定元素
            theme: '#3c8dbc'
        });

        openPaySheng();
        $("#Submit_enterprise").click(function () {
            var ShengText = $(".login_Sheng").find("option:selected").text();
            var ShiText = $(".login_Shi").find("option:selected").text();
            var QuText = $(".login_Qu").find("option:selected").text();
            var JiedaoText = $(".login_Jd").find("option:selected").text();
            var DoorNumber = $(".DoorNumber").val();
            var address = ShengText + ShiText + QuText + JiedaoText + DoorNumber;
            if (ShengText == "" || ShiText == "" || QuText == "" || JiedaoText == "" || DoorNumber == ""){
                toastr.error("经营地址为必填项，请填写完整！");
                return false;
            }
            var name = $(".enterpriseName").val();//企业名称
            if (name == ""){
                toastr.error("请填写企业名称！");
                return false;
            }
            var phone = $(".enterprisePhone").val();//企业电话
            if (phone == ""){
                toastr.error("请填写企业电话！");
                return false;
            }
            var businessLicenseNumber = $(".FullName").val();//执照注册号
            if (businessLicenseNumber == ""){
                toastr.error("请填写执照注册号！");
                return false;
            }
            var institutionCodeNumber = $("#OrganizationCode").val();//组织机构代码号
            if (institutionCodeNumber == ""){
                toastr.error("请填写组织机构代码号！");
                return false;
            }
            var accountOpeningLicense = $("#OpeningCode").val();//开户许可证号
            if (accountOpeningLicense == ""){
                toastr.error("请填写开户许可证号！");
                return false;
            }
            var taxRegistryNumber = $("#TaxRegistration").val();//税务登记证号
            if (taxRegistryNumber == ""){
                toastr.error("请填写税务登记证号！");
                return false;
            }
            var legalPersonName = $("#LegalRepresentative").val();//法定代表人
            if (legalPersonName == ""){
                toastr.error("请填写法定代表人！");
                return false;
            }
            var legalPersonContact = $("#ContactNumber").val();//法定代表人电话
            if (legalPersonContact == ""){
                toastr.error("请填写法定代表人电话！");
                return false;
            }
            var coverageArea = $("#OverlayArea").val();//覆盖区域
            if (coverageArea == ""){
                toastr.error("请填写覆盖区域！");
                return false;
            }
            var numberOfBranches = $("#DotNumber").val();//网点数
            if (numberOfBranches == ""){
                toastr.error("请填写网点数！");
                return false;
            }
            var annualSales = $("#AnnualSales").val();//年销售额
            if (annualSales == ""){
                toastr.error("请填写年销售额！");
                return false;
            }
            var profit = $("#profit").val();//利润
            if (profit == ""){
                toastr.error("请填写年利润！");
                return false;
            }
            var logisticsType = $("input[name='type']:checked").val();
            if (logisticsType == ""){
                toastr.error("请填写运货方式！");
                return false;
            }
            var linkmanName = $("#ContactName").val();//联系人姓名
            if (linkmanName == ""){
                toastr.error("请填写联系人姓名！");
                return false;
            }
            var linkmanMobile = $("#ContactPhone").val();//联系人电话
            if (linkmanMobile == ""){
                toastr.error("请填写联系人电话！");
                return false;
            }
            var mainProduct = $(".name_one").val();//主营商品
            if (mainProduct == ""){
                toastr.error("请填写主营商品！");
                return false;
            }
            var bankName = $("#openingBank").val();//银行名称
            if (bankName == ""){
                toastr.error("请填写银行名称！");
                return false;
            }
            var bankNumber = $("#BankAccount").val();//银行账号
            if (bankNumber == ""){
                toastr.error("请填写银行账号！");
                return false;
            }
            SubmissionInformation(name,phone,DoorNumber,businessLicenseNumber,institutionCodeNumber,accountOpeningLicense,taxRegistryNumber,legalPersonName,legalPersonContact,coverageArea,numberOfBranches,annualSales,profit,logisticsType,linkmanName,linkmanMobile,mainProduct,bankName,bankNumber,address);
        });



        // 单张上传照片
        $(".fileinput").change(function () {
            var file = this.files[0];
            var thisId = $(this).attr("id");
            readFile(file,$(this).parent().siblings(".on"),thisId);
        });

        $("#NextStep").click(function () {
            $("#NextStep").css("display","none");
            var userName = $("#userName").val();
            var passWord = $("#passWord").val();
            if (userName != "" && passWord != ""){
                register(userName,passWord);
            }else {
                toastr.error("请把信息填写完整！")
            }
        });

        $(".on").click(function () {
            $(this).children("img").remove();
            $(this).css("display","none");
            $(this).siblings(".upload").css("display","block");
            var siblingsId = $(this).siblings(".upload").children("input").attr("id");
            console.log(siblingsId);
            for (var i = 0; i < jsonarray.length; i++){
                if (jsonarray[i].name == siblingsId){
                    jsonarray.splice(i,1);
                }
            };
            toastr.success('删除成功！');
            var img = document.createElement('img');
            img.src = "${bath}/images/common/loading.gif";
            $(this).empty();
            $(this).append(img);
            console.log(jsonarray);
        })
    });



    //提交信息
    function SubmissionInformation(name,phone,DoorNumber,businessLicenseNumber,institutionCodeNumber,accountOpeningLicense,taxRegistryNumber,legalPersonName,legalPersonContact,coverageArea,numberOfBranches,annualSales,profit,logisticsType,linkmanName,linkmanMobile,mainProduct,bankName,bankNumber,address) {
        $("#Submit_enterprise").css("display","none");
          var dataString = JSON.stringify(array);
            $.ajax({
                type : "POST",
                url : "${bath}/merchantController/addMerchant",
                data : {
                    id : ID,
                    merchantCode : merchantCode,
                    name : name,
                    phone : phone,
                    DoorNumber : DoorNumber,
                    businessLicenseNumber : businessLicenseNumber,
                    institutionCodeNumber : institutionCodeNumber,
                    accountOpeningLicense : accountOpeningLicense,
                    taxRegistryNumber : taxRegistryNumber,
                    legalPersonName : legalPersonName,
                    numberOfBranches : numberOfBranches,
                    annualSales : annualSales,
                    profit : profit,
                    logisticsType : logisticsType,
                    legalPersonContact : legalPersonContact,
                    coverageArea : coverageArea,
                    linkmanName : linkmanName,
                    linkmanMobile : linkmanMobile,
                    mainProduct : mainProduct,
                    bankName : bankName,
                    bankNumber : bankNumber,
                    data : dataString,
                    registAddress : address
                },
                beforeSend: function (jqXHR) {
                    if (undefined != header) {
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json",
                success : function (retInfo) {
                    console.log(retInfo);
                    var retCode = retInfo.retCode;
                    if(retCode != 0){
                        $("#Submit_enterprise").css("display","block");
                        toastr.error("提交失败！");
                        return false;
                    }
                    else{
                        toastr.success("提交成功！");
                        setTimeout(function () {
                            var url = "${bath}/account/login";
                            window.open(url,"_self");
                        },2000)
                    }
                },
                error : function (XMLHttpRequest, textStatus) {
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $("#loading").css("display","none");
                    $("#Submit_enterprise").css("display","block");
                    toastr.error('查询失败！');
                    return false;
                }
            })
    }

    //注册
    function register(userName,passWord) {
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/merchantController/MerchantAccount', //目标地址
            data : {
                loginAccount : userName,
                loginPassword : passWord
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
                if (retCode != 0){
                    toastr.error("用户名已存在,请重新输入账号！");
                    $("#NextStep").css("display","block");
                }else if (retCode == 0){
                    $(".register").css("display","none");
                    $(".firm").css("display","block");
                    var code = retData.merchantCode;
                    var id = retData.id;
                    merchantCode = code;
                    ID = id;
                    return merchantCode;
                    return ID;
                }
            },
            error:function(XMLHttpRequest, textStatus){
                console.log(XMLHttpRequest);
                console.log(textStatus);
                $("#loading").css("display","none");
                toastr.error('查询失败！');
                $("#NextStep").css("display","block");
                return false;
            }
        });
    }
    //需要把阅读的文件传进来file element是把读取到的内容放入的容器
    function readFile(file,element,thisId) {
        var PhotoId = thisId;
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
                element.empty();
                element.append(img);
                element.siblings(".upload").hide();
                element.show();
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
                        var retCode = retInfo.retCode;
                        if (retCode == 0){
                            console.log(PhotoId);
                            var retData = retInfo.data;
                            var arr  ={"name" : PhotoId,"value" : retData};
                            jsonarray.push(arr);
                            toastr.success('图片上传成功！');
                            element.siblings(".upload").children("input").val("");
                            console.log(array);
                        }else {
                            toastr.error('图片过大，请上传小于1M的图片！');
                            return false;
                        }
                    },
                    error:function(XMLHttpRequest, textStatus){
                        console.log(XMLHttpRequest);
                        console.log(textStatus);
                        $("#loading").css("display","none");
                        toastr.error('图片过大，请上传小于1M的图片！');
                        return false;
                    }
                });
            });
        }
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

                $(".login_Sheng").empty();
                $(".login_Shi").empty();
                $(".login_Qu").empty();
                $(".login_Jd").empty();

                var defaultShengSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Sheng").append(defaultShengSelectedHtml);

                var defaultShiSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Shi").append(defaultShiSelectedHtml);

                var defaultQuSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Qu").append(defaultQuSelectedHtml);

                var defaultJiedaoSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Jd").append(defaultJiedaoSelectedHtml);

                for (var i = 0; i < retDataLength; i++){

                    var retId = retData[i].id1;
                    var retName = retData[i].name;
                    var shengSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";

                    $(".login_Sheng").append(shengSelectedHtml);
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

                $(".login_Shi").empty();

                var defaultShiSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Shi").append(defaultShiSelectedHtml);

                var retBjId = retData[0].id2;
                if (retBjId == 110100){
                    var retId = retData[0].id2;
                    var retName = retData[0].name;
                    var shiSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".login_Shi").append(shiSelectedHtml);
                }else {
                    for (i = 0; i < retDataLength; i++){
                        var retId = retData[i].id2;
                        var retName = retData[i].name;
                        var shiSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                        $(".login_Shi").append(shiSelectedHtml);
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


                $(".login_Qu").empty();

                var defaultQuSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Qu").append(defaultQuSelectedHtml)

                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id;
                    var retName = retData[i].name;
                    var quSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".login_Qu").append(quSelectedHtml);
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


                $(".login_Jd").empty();

                var defaultJiedaoSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Jd").append(defaultJiedaoSelectedHtml);


                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id4;
                    var retName = retData[i].name;
                    var jiedaoSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".login_Jd").append(jiedaoSelectedHtml);
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
    //省发生change
    function shengChange() {
        var shengId = $(".login_Sheng").val();
        openPayShi(shengId);
    }
    //市发生change
    function shiChange() {
        var shengId = $(".login_Sheng").val();
        var shiId = $(".login_Shi").val();
        openPayQu(shiId,shengId);
    }
    //区发生change
    function quChange() {
        var shengId = $(".login_Sheng").val();
        var shiId = $(".login_Shi").val();
        var quId = $(".login_Qu").val();
        openPayJD(shiId,shengId,quId);
    }

</script>