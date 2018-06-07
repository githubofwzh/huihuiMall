<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>资质审核</title><#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/form/form.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/table/table.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/checkbox_radio_select.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pagination.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/button.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/qualificationAudit.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/common.js" type="text/javascript" type="text/javascript"></script>
    <script src="${bath}/js/loading/spin.min.js" type="text/javascript"></script>
    <script src="${bath}/js/loading/loading.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 text-center title_header" style="background-color: #FFFFFF;">
            <h4>商家入驻申请表</h4>
        </div>




        <div class="col-lg-12 col-sm-12 col-xs-12 basicInfo firm">
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
                <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                    <label class="col-lg-3 col-sm-3 col-xs-3">公司注册地址</label>
                    <input class="col-lg-8 col-sm-8 col-xs-8 DoorNumber" style="width:1101px" type="text" placeholder="请输入公司注册地址" />
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
                    <input id="DotNumber" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写网点数" />
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
                    <input class="col-lg-8 col-sm-8 col-xs-8 name_one" type="text" placeholder="请填写商品名称" />
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
                    <div class="on">
                        <img id="BusinessLicense" src="" />
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    法人身份证
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <div class="on">
                        <img id="PositiveId" src="" />
                    </div>
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <div class="on">
                        <img id="PositiveTheOtherSide" src="" />
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    公司或者商铺门脸照片
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <div class="on">
                        <img id="CompanyPhoto" src="" />
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    卫生许可证（食品类）
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <div class="on">
                        <img id="HygieneLicense" src="" />
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    营业场所照片
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <div class="on">
                        <img id="UploadAPhotoOfABusinessPlace" src="" />
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                <label class="license_title">
                    营业场所证明
                </label>
                <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                    <div class="on">
                        <img id="CertificateOfBusinessPlace" src="" />
                    </div>
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
    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };
    var storeId = "";
    var storeType = "";
    var array = [];
    $(document).ready(function() {
        getUserInfos();
        openPaySheng();
        $("#Submit_enterprise").click(function () {
            $("#Submit_enterprise").css("display","none");
            /*var ShengText = $(".login_Sheng").find("option:selected").text();
            var ShiText = $(".login_Shi").find("option:selected").text();
            var QuText = $(".login_Qu").find("option:selected").text();
            var JiedaoText = $(".login_Jd").find("option:selected").text();*/
            var DoorNumber = $(".DoorNumber").val();
            var address = DoorNumber;
            var name = $(".enterpriseName").val();//企业名称
            var phone = $(".enterprisePhone").val();//企业电话
            var businessLicenseNumber = $(".FullName").val();//执照注册号
            var institutionCodeNumber = $("#OrganizationCode").val();//组织机构代码号
            var accountOpeningLicense = $("#OpeningCode").val();//开户许可证号
            var taxRegistryNumber = $("#TaxRegistration").val();//税务登记证号
            var legalPersonName = $("#LegalRepresentative").val();//法定代表人
            var legalPersonContact = $("#ContactNumber").val();//法定代表人电话
            var coverageArea = $("#OverlayArea").val();//覆盖区域
            var numberOfBranches = $("#DotNumber").val();//网点数
            var annualSales = $("#AnnualSales").val();//年销售额
            var profit = $("#profit").val();//利润
            var logisticsType = $("input[name='type']:checked").val();
            var linkmanName = $("#ContactName").val();//联系人姓名
            var linkmanMobile = $("#ContactPhone").val();//联系人电话
            var mainProduct = $(".name_one").val();//主营商品
            var bankName = $("#openingBank").val();//银行名称
            var bankNumber = $("#BankAccount").val();//银行账号
            SubmissionInformation(storeId,name,phone,DoorNumber,businessLicenseNumber,institutionCodeNumber,accountOpeningLicense,taxRegistryNumber,legalPersonName,legalPersonContact,coverageArea,numberOfBranches,annualSales,profit,logisticsType,linkmanName,linkmanMobile,mainProduct,bankName,bankNumber,address);
            //console.log(name,phone,DoorNumber,businessLicenseNumber,institutionCodeNumber,accountOpeningLicense,taxRegistryNumber,legalPersonName,legalPersonContact,coverageArea,numberOfBranches,annualSales,profit,logisticsType,linkmanName,linkmanMobile,mainProduct,bankName,bankNumber,address);
        });
    });

    //获取信息方法
    function getUserInfos(){
        var coder = sessionStorage.getItem("userId");
        $.ajax({
            type : "POST", //用POST方式传输
            url : '${bath}/merchantController/MerchantAudit', //目标地址
            data : {
                id : coder
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                console.log(retInfo);
                var retData = retInfo.data;
                var name = retData.name;//企业名称
                var id = retData.id;//企业名称
                var phone = retData.phone;//企业电话
                var registAddress = retData.registAddress;//地址
                var businessLicenseNumber = retData.businessLicenseNumber;//营业执照注册号
                var institutionCodeNumber = retData.institutionCodeNumber;//组织机构代码证号
                var accountOpeningLicense = retData.accountOpeningLicense;//开户许可证号
                var taxRegistryNumber = retData.taxRegistryNumber;//税务登记证号
                var legalPersonName = retData.legalPersonName;//法定代表人
                var legalPersonContact = retData.legalPersonContact;//法定代表人电话
                var coverageArea = retData.coverageArea;//覆盖区域
                var numberOfBranches = retData.numberOfBranches;//网点数
                var annualSales = retData.annualSales;//年销售额（万元）
                var profit = retData.profit;//利润（万元）
                var logisticsType = retData.logisticsType;//物流类型
                var linkmanName = retData.linkmanName;//联系人姓名
                var linkmanMobile = retData.linkmanMobile;//联系电话
                var mainProduct = retData.mainProduct;//主营产品
                var bankName = retData.bankName;//开户银行名称
                var bankNumber = retData.bankNumber;//银行账号
                var auditStatus = retData.auditStatus;//银行账号
                var businessLicence = retData.businessLicence;//营业执照照片
                var linkmanIdcardbasePhoto = retData.linkmanIdcardbasePhoto;//身份证正面
                var legalPersonIdcard = retData.legalPersonIdcard;//身份证反面
                var managementPlacePhotos = retData.managementPlacePhotos;//营业场所照片
                var managementPlaceThat = retData.managementPlaceThat;//营业场所证明
                var companyDoorFacePhotos = retData.companyDoorFacePhotos;//公司或者商铺门脸照片
                var hygienicLicense = retData.hygienicLicense;//食品许可证
                $("#BusinessLicense").attr("src","${bath}"+businessLicence);
                $("#PositiveId").attr("src","${bath}"+linkmanIdcardbasePhoto);
                $("#PositiveTheOtherSide").attr("src","${bath}"+legalPersonIdcard);
                $("#CompanyPhoto").attr("src","${bath}"+companyDoorFacePhotos);
                $("#UploadAPhotoOfABusinessPlace").attr("src","${bath}"+managementPlacePhotos);
                $("#CertificateOfBusinessPlace").attr("src","${bath}"+managementPlaceThat);
                $("#HygieneLicense").attr("src","${bath}"+hygienicLicense);
                $(".enterpriseName").val(name);
                $(".enterprisePhone").val(phone);
                $(".DoorNumber").val(registAddress);
                $(".FullName").val(businessLicenseNumber);
                $("#OrganizationCode").val(institutionCodeNumber);
                $("#OpeningCode").val(accountOpeningLicense);
                $("#TaxRegistration").val(taxRegistryNumber);
                $("#LegalRepresentative").val(legalPersonName);
                $("#ContactNumber").val(legalPersonContact);
                $("#OverlayArea").val(coverageArea);
                $("#DotNumber").val(numberOfBranches);
                $("#AnnualSales").val(annualSales);
                $("#profit").val(profit);
                if (logisticsType == 0){
                    $("input[name='type']").eq(0).attr("checked","checked");
                }else if (logisticsType == 1){
                    $("input[name='type']").eq(1).attr("checked","checked");
                }else if (logisticsType == 2){
                    $("input[name='type']").eq(2).attr("checked","checked");
                }
                $("#ContactName").val(linkmanName);
                $("#ContactPhone").val(linkmanMobile);
                $(".name_one").val(mainProduct);
                $("#openingBank").val(bankName);
                $("#BankAccount").val(bankNumber);

                if (auditStatus == 0){
                    $(".title_header h4").text("审核中");
                    $(".submit").css("display","none");
                }else if (auditStatus == 1){
                    $(".title_header h4").text("审核通过");
                    $(".submit").css("display","none");
                }else if (auditStatus == 2){
                    $(".title_header h4").text("审核失败");
                    $(".submit").css("display","block");
                };
                storeId = id;
                return storeId;
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
    //提交信息
    function SubmissionInformation(storeId,name,phone,DoorNumber,businessLicenseNumber,institutionCodeNumber,accountOpeningLicense,taxRegistryNumber,legalPersonName,legalPersonContact,coverageArea,numberOfBranches,annualSales,profit,logisticsType,linkmanName,linkmanMobile,mainProduct,bankName,bankNumber,address) {
        //if (array.length >= 8){
            var dataString = array.join();
            $.ajax({
                type : "POST",
                url : "${bath}/merchantController/updateMerchant",
                data : {
                    id : storeId,
                    auditStatus : 0,
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
                        $(".submit").css("display","block")
                        toastr.error("提交失败！");
                        return false;
                    }
                    else{
                        toastr.success("提交成功，请等待审核！");
                        location.reload();
                    }
                },
                error : function (XMLHttpRequest, textStatus) {
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $("#loading").css("display","none");
                    toastr.error('查询失败！');
                    return false;
                }
            })
       /* }else {
            toastr.error('请把信息填写完整！');
        }*/
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
