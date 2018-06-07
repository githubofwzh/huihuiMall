<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>申请开店</title>


<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/common.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/frontpages/terminal/shopkeeperPagesCss/apply.css" rel="stylesheet" type="text/css"/>
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
<label style="display: none" class="type_LX">1</label>
<label style="display: none" class="openId">${openId!""}</label>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 text-center degree">

        </div>
        <#--<div class="col-lg-12 col-sm-12 col-xs-12 login_zhuce">
            <div class="login_div clearfix">
                <label class="col-lg-3 col-sm-3 col-xs-3 login_label">账号</label>
                <input maxlength="16" id="userName" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" />
            </div>
            <div class="login_div clearfix">
                <label class="col-lg-3 col-sm-3 col-xs-3 login_label">密码</label>
                <input id="passWord" class="login_input col-lg-8 col-sm-8 col-xs-8" type="password" />
            </div>
            <div class="login_div clearfix">
                <label class="col-lg-3 col-sm-3 col-xs-3 login_label">姓名</label>
                <input maxlength="16" id="peopleName" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" />
            </div>
            <div class="login_div clearfix">
                <label class="col-lg-3 col-sm-3 col-xs-3 login_label">手机号</label>
                <input id="phoneNumber" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" />
            </div>
        </div>-->
        <div class="col-lg-12 col-sm-12 col-xs-12 choice">
            <ul class="ul_main" role="tablist">
                <li>请选择商户类型：</li>
                <li class="enterprise active" href="#enterprise" aria-controls="enterprise" role="tab" data-toggle="tab">
                    <img src="${bath}/images/frontpages/common/yuan_active.png" />企业
                </li>
                <li class="personal" href="#personal" aria-controls="personal" role="tab" data-toggle="tab">
                    <img src="${bath}/images/frontpages/common/yuan_none.png" />个体户
                </li>
            </ul>
        </div>


        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="enterprise">
                <div class="col-lg-12 col-sm-12 col-xs-12 information">
                    填写企业信息：
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
                            企业实际
                            <br />经营地址
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
                        <label class="col-lg-3 col-sm-3 col-xs-3">门店名称</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 FullName" type="text" placeholder="请填写门店名称" />
                    </div>

                    <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                        <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">门店负责人</label>
                        <input maxlength="16" id="peopleName" placeholder="请填写门店负责人" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" />
                    </div>

                    <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                        <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">联系方式</label>
                        <input maxlength="11" id="phoneNumber" placeholder="请填写联系方式" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" />
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 face_position">
                        <label class="col-lg-3 col-sm-3 col-xs-3">
                            门店所在
                            <br />地商情
                        </label>
                        <input type="radio" name="dizhi" value="0" /><span class="right_124">商场超市</span>
                        <input type="radio" name="dizhi" value="1" /><span>住宅区</span>
                        <br />
                        <input type="radio" name="dizhi" value="2" /><span class="right_154">写字楼</span>
                        <input type="radio" name="dizhi" value="3" /><span>其他</span>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 information_year">
                        <label class="col-lg-3 col-sm-3 col-xs-3">
                            门店经营
                            <br />年限
                        </label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 store_year" type="text" placeholder="请填写" />
                        <span>年</span>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 information_money">
                        <label class="col-lg-3 col-sm-3 col-xs-3">
                            去年全年
                            <br />收入情况
                        </label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 storeYearMoney"  type="text" placeholder="请填写" />
                        <span>万元/年</span>
                    </div>
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 information">
                    主营商品信息：
                </div>


                <div class="col-lg-12 col-sm-12 col-xs-12 basicInfo">
                    <div class="col-lg-12 col-sm-12 col-xs-12 commodity_name">
                        <label class="col-lg-3 col-sm-3 col-xs-3">品名1</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 name_one" type="text" placeholder="请填写商品名称" />
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 commodity_money">
                        <label class="col-lg-3 col-sm-3 col-xs-3">价格</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 name_One_Money" type="text" placeholder="请填写" />
                        <span>元</span>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 commodity_name">
                        <label class="col-lg-3 col-sm-3 col-xs-3">品名2</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 name_two" type="text" placeholder="请填写商品名称" />
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 commodity_money">
                        <label class="col-lg-3 col-sm-3 col-xs-3">价格</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 name_Two_Money" type="text" placeholder="请填写" />
                        <span>元</span>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 person_time">
                        <label class="col-lg-3 col-sm-3 col-xs-3">
                            店铺日均
                            <br />人流量
                        </label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 howMan" type="text" placeholder="请填写" />
                        <span>人次</span>
                    </div>
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information">
                    所需资料详单：
                </div>
                <div class="col-lg-12 col-sm-12 col-xs-12 basicInfo">
                    <div class="col-lg-12 col-sm-12 col-xs-12 application">
                        <label class="col-lg-4 col-sm-4 col-xs-4">加盟申请书：</label>
                        <input id="Enterprise_Application" name="Application" class="col-lg-7 col-sm-7 col-xs-7" type="file" />
                        <p class="col-lg-7 col-sm-7 col-xs-7">
                            请选择要上传的文件
                            <button>选择文件</button>
                        </p>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            企业三证
                        </label>



                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传营业执照</span>
                                <input id="Enterprise_BusinessLicense" name="BusinessLicense" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>



                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传税务登记证</span>
                                <input id="Enterprise_TaxRegistrationCertificate" name="TaxRegistrationCertificate" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传组织机构代码证</span>
                                <input id="Enterprise_OrganizationCodeCertificate" name="OrganizationCodeCertificate" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>





                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            租房合同或房产证明
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传租房合同或房产证明</span>
                                <input id="Enterprise_RealEstateCertificate" name="RealEstateCertificate" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
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
                                <input id="Enterprise_FacadeOfIDCard" name="FacadeOfIDCard" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传身份证反面</span>
                                <input id="Enterprise_IdentityCard" name="IdentityCard" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            三个月水电费缴纳凭证
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传缴纳凭证</span>
                                <input id="Enterprise_UploadPaymentVoucher" name="UploadPaymentVoucher" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            设备摆放位置照片
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传摆放位置照片</span>
                                <input id="Enterprise_PutPhotoOfPosition" name="PutPhotoOfPosition" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            开户许可证
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传开户许可证</span>
                                <input id="Enterprise_AccountOpeningPermit" name="AccountOpeningPermit" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
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
                                <input id="Enterprise_PhotoOfThePlaceOfBusiness" name="PhotoOfThePlaceOfBusiness" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
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




            <div role="tabpanel" class="tab-pane" id="personal">
                <div class="col-lg-12 col-sm-12 col-xs-12 information">
                    填写个人信息：
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 peopleInfo">
                    <div class="col-lg-12 col-sm-12 col-xs-12 main_information">

                        <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">姓名</label>
                            <input maxlength="16" id="FullName" placeholder="请填写姓名" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" />
                        </div>

                        <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">手机号</label>
                            <input maxlength="11" id="CellphoneNumber" placeholder="请填写手机号" class="login_input col-lg-8 col-sm-8 col-xs-8" type="text" />
                        </div>

                        <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">出生日期</label>
                            <input id="SpecificDate" class="col-lg-8 col-sm-8 col-xs-8" type="text" placeholder="请填写出生日期" />
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 Essential_information">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">性别</label>
                            <select class="col-lg-8 col-sm-8 col-xs-8 Gender">
                                <option value='' disabled selected style='display:none;'>性别</option>
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 information_number">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">身份证号</label>
                            <input class="col-lg-8 col-sm-8 col-xs-8 ID_Number" type="text" placeholder="请填写身份证号" />
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 Essential_information">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">婚姻状况</label>
                            <select class="col-lg-8 col-sm-8 col-xs-8 MaritalStatus">
                                <option value='' disabled selected style='display:none;'>婚姻状况</option>
                                <option value="2">未婚</option>
                                <option value="1">已婚</option>
                            </select>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 Essential_information">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">学历</label>
                            <select class="col-lg-8 col-sm-8 col-xs-8 Education">
                                <option value='' disabled selected style='display:none;'>学历</option>
                                <option value="1">硕士及以上</option>
                                <option value="2">本科</option>
                                <option value="3">大专</option>
                                <option value="4">高中</option>
                                <option value="5">初中</option>
                                <option value="6">小学</option>
                            </select>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 Contact_address">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">
                                联系地址
                            </label>
                            <div class="col-lg-8 col-sm-8 col-xs-8 three_padding">
                                <select class="login_Sheng_People" onchange="peopleShengChange();">


                                </select>
                                <select class="login_Shi_People" onchange="peopleShiChange();">


                                </select>
                                <select class="login_Qu_People" onchange="peopleQuChange();">


                                </select>
                                <select class="login_Jd_People">

                                </select>
                                <input class="DoorNumber_people" type="text" placeholder="请输入门牌号！" />
                            </div>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 face_name">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">门店名称</label>
                            <input class="col-lg-8 col-sm-8 col-xs-8 StoreName" type="text" placeholder="请填写门店名称" />
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 face_position">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">
                                门店所在
                                <br />地商情
                            </label>
                            <input type="radio" name="dizhi_people" value="0" /><span class="right_124">商场超市</span>
                            <input type="radio" name="dizhi_people" value="1" /><span>住宅区</span>
                            <br />
                            <input type="radio" name="dizhi_people" value="2" /><span class="right_154">写字楼</span>
                            <input type="radio" name="dizhi_people" value="3" /><span>其他</span>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 information_year">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">
                                门店经营
                                <br />年限
                            </label>
                            <input class="col-lg-8 col-sm-8 col-xs-8 year_people" type="text" placeholder="请填写" />
                            <span>年</span>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 information_money">
                            <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">
                                去年全年
                                <br />收入情况
                            </label>
                            <input class="col-lg-8 col-sm-8 col-xs-8 annualIncome" type="text" placeholder="请填写" />
                            <span>万元/年</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 information">
                    主营商品信息：
                </div>

                <div class="col-lg-12 col-sm-12 col-xs-12 peopleInfo">
                    <div class="col-lg-12 col-sm-12 col-xs-12 commodity_name">
                        <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">品名1</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 commodity_one" type="text" placeholder="请填写商品名称" />
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 commodity_money">
                        <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">价格</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 commodity_one_money" type="text" placeholder="请填写" />
                        <span>元</span>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 commodity_name">
                        <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">品名2</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 commodity_two" type="text" placeholder="请填写商品名称" />
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 commodity_money">
                        <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">价格</label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 commodity_two_money" type="text" placeholder="请填写" />
                        <span>元</span>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 person_time">
                        <label class="col-lg-3 col-sm-3 col-xs-3 three_padding">
                            店铺日均
                            <br />人流量
                        </label>
                        <input class="col-lg-8 col-sm-8 col-xs-8 Passengers" type="text" placeholder="请填写" />
                        <span>人次</span>
                    </div>
                </div>



                <div class="col-lg-12 col-sm-12 col-xs-12 information">
                    所需资料详单：
                </div>


                <div class="col-lg-12 col-sm-12 col-xs-12 peopleInfo">
                    <div class="col-lg-12 col-sm-12 col-xs-12 application">
                        <label class="col-lg-4 col-sm-4 col-xs-4">加盟申请书：</label>
                        <input id="SinglePerson_Application" name="Application" class="col-lg-7 col-sm-7 col-xs-7" type="file" />
                        <p class="col-lg-7 col-sm-7 col-xs-7">
                            请选择要上传的文件
                            <button>选择文件</button>
                        </p>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            企业三证
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传营业执照</span>
                                <input id="SinglePerson_BusinessLicense" name="BusinessLicense" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传税务登记证</span>
                                <input id="SinglePerson_TaxRegistrationCertificate" name="TaxRegistrationCertificate" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传组织机构代码证</span>
                                <input id="SinglePerson_OrganizationCodeCertificate" name="OrganizationCodeCertificate" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            租房合同或房产证明
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传租房合同或房产证明</span>
                                <input id="SinglePerson_RealEstateCertificate" name="RealEstateCertificate" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
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
                                <input id="SinglePerson_FacadeOfIDCard" name="FacadeOfIDCard" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传身份证反面</span>
                                <input id="SinglePerson_IdentityCard" name="IdentityCard" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            三个月水电费缴纳凭证
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传缴纳凭证</span>
                                <input id="SinglePerson_UploadPaymentVoucher" name="UploadPaymentVoucher" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            设备摆放位置照片
                        </label>
                        <div class="col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传摆放位置照片</span>
                                <input id="SinglePerson_PutPhotoOfPosition" name="PutPhotoOfPosition" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            开户许可证
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传开户许可证</span>
                                <input id="SinglePerson_AccountOpeningPermit" name="AccountOpeningPermit" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                        <div class="col-lg-12 col-sm-12 col-xs-12 Bank_number">
                            <label class="license_title">银行卡号</label>
                            <br />
                            <input type="text" id="Bank_number" />
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 border_bt">
                        <label class="license_title">
                            营业场所照片
                        </label>
                        <div class="col-lg-12 col-sm-12 col-xs-12 license_Photo">
                            <a class="upload text-center">
                                <span>上传营业场所照片</span>
                                <input id="SinglePerson_PhotoOfThePlaceOfBusiness" name="PhotoOfThePlaceOfBusiness" type="file" accept="image/png, image/jpeg, image/gif, image/jpg" class="fileinput">
                            </a>
                            <div class="on"><img src="${bath}/images/common/loading.gif" /></div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12 col-xs-12 submit">
                        <button class="All_data center-block" id="All_data">
                            <span>提交</span>
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>


<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var array = [];
    var jsonarray = eval(array);
    var openIdParma = $(".openId").text();
    var storeId = "";
    var retAddressShiId = "";
    var retAddressQuId = "";
    var retAddressStreetId = "";
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

        $(".enterprise").click(function () {
            $(".type_LX").text("0");
            $(".enterprise img").attr("src","${bath}/images/frontpages/common/yuan_active.png");
            $(".personal img").attr("src","${bath}/images/frontpages/common/yuan_none.png");
            openPaySheng();
        });
        $(".personal").click(function () {
            $(".type_LX").text("1");
            $(".personal img").attr("src","${bath}/images/frontpages/common/yuan_active.png");
            $(".enterprise img").attr("src","${bath}/images/frontpages/common/yuan_none.png");
            peoplePaySheng();
        });
        getOpenId();
        openPaySheng();
        peoplePaySheng();
//        var dataApply = new Object();
        $("#Submit_enterprise").click(function () {
//            var checkText=$(".mendian").find("option:selected").text();
            var ShengText=$(".login_Sheng").find("option:selected").text();
            var ShiText=$(".login_Shi").find("option:selected").text();
            var QuText=$(".login_Qu").find("option:selected").text();
            var JiedaoText=$(".login_Jd").find("option:selected").text();
            var DoorNumber = $(".DoorNumber").val();
            var address = ShengText + ShiText + QuText + JiedaoText + DoorNumber;
//            console.log(addressStrint);
            if (ShengText == "" || ShiText == "" || QuText == "" || JiedaoText == ""){
                toastr.error("经营地址为必填项，请填写完整！");
                return false;
            }
            var peopleName = $("#peopleName").val();
            if(peopleName == ""){
                toastr.error("请填写门店负责人！");
                return false;
            }
            var phoneNumber = $("#phoneNumber").val();
            if(phoneNumber == ""){
                toastr.error("请填写门店负责人电话！");
                return false;
            }
            var type = $(".type_LX").text();
            var enterpriseName = $(".enterpriseName").val();
            if(enterpriseName == ""){
                toastr.error("请填写企业名称！");
                return false;
            }
            var enterprisePhone = $(".enterprisePhone").val();
            if(enterprisePhone == ""){
                toastr.error("请填写公司电话！");
                return false;
            }
            var login_Sheng = $(".login_Sheng").val();
            var login_Shi = $(".login_Shi").val();
            var login_Qu = $(".login_Qu").val();
            var login_Jd = $(".login_Jd").val();
            var login_radio = $("input[name='dizhi']:checked").val();
            if(login_radio == ""){
                toastr.error("请填写门店所在地！");
                return false;
            }
            var store_year = $(".store_year").val();
            if(store_year == ""){
                toastr.error("请填写门店年限！");
                return false;
            }
            var store_YearMoney = $(".storeYearMoney").val();
            if(store_year == ""){
                toastr.error("请填写去年年收入！");
                return false;
            }
            var name_one = $(".name_one").val();
            if(name_one == ""){
                toastr.error("请填写商品名称！");
                return false;
            }
            var nameOneMoney = $(".name_One_Money").val();
            if(nameOneMoney == ""){
                toastr.error("请填写商品价格！");
                return false;
            }
            var name_two = $(".name_two").val();
            var nameTwoMoney = $(".name_Two_Money").val();
            var howMan = $(".howMan").val();
            if(howMan == ""){
                toastr.error("请填写店铺人流量！");
                return false;
            }
            var FullName = $(".FullName").val();
            if(FullName == ""){
                toastr.error("请填写门店名称！");
                return false;
            }
            storeApply(type,enterpriseName,enterprisePhone,login_Sheng,login_Shi,login_Qu,login_Jd,login_radio,store_year,store_YearMoney,name_one,nameOneMoney,name_two,nameTwoMoney,howMan,FullName,address,peopleName,phoneNumber,DoorNumber);
        });

        $("#All_data").click(function () {
//            var checkText=$(".mendian").find("option:selected").text();
            var ShengText=$(".login_Sheng_People").find("option:selected").text();
            var ShiText=$(".login_Shi_People").find("option:selected").text();
            var QuText=$(".login_Qu_People").find("option:selected").text();
            var JiedaoText=$(".login_Jd_People").find("option:selected").text();
            var DoorNumber = $(".DoorNumber_people").val();
            var address = ShengText + ShiText + QuText + JiedaoText + DoorNumber;
            if (ShengText == "" || ShiText == "" || QuText == "" || JiedaoText == ""){
                toastr.error("经营地址为必填项，请填写完整！");
                return false;
            }
            console.log(address);

            var peopleName = $("#FullName").val();
            if(peopleName == ""){
                toastr.error("请填写姓名！");
                return false;
            }
            var phoneNumber = $("#CellphoneNumber").val();
            if(phoneNumber == ""){
                toastr.error("请填写手机号！");
                return false;
            }
            var type = $(".type_LX").text();
            var birthday = $("#birthday").val();
            if(birthday == ""){
                toastr.error("请填写出生年月日！");
                return false;
            }
            var gender = $(".Gender").val();
            if(gender == ""){
                toastr.error("请填写性别！")
            }
            var idcard = $(".ID_Number").val();
            if(idcard == ""){
                toastr.error("请填写身份证号！");
                return false;
            }
            var login_Sheng = $(".login_Sheng_People").val();
            var login_Shi = $(".login_Shi_People").val();
            var login_Qu = $(".login_Qu_People").val();
            var login_Jd = $(".login_Jd_People").val();
            var ismarrige = $(".MaritalStatus").val();
            if(ismarrige == ""){
                toastr.error("请填写婚姻状况！");
                return false;
            }
            var education = $(".Education").val();
            if(education == ""){
                toastr.error("请填写学历！");
                return false;
            }
            var StoreName = $(".StoreName").val();
            if(StoreName == ""){
                toastr.error("请填写门店名称！");
                return false;
            }
            var login_radio = $(".face_position input[name='dizhi_people']:checked").val();
            if(login_radio == ""){
                toastr.error("请填写门店所在地！");
                return false;
            }
            var year_people = $(".year_people").val();
            if(year_people == ""){
                toastr.error("请填写门店经营年限！");
                return false;
            }
            var annualIncome = $(".annualIncome").val();
            if(annualIncome == ""){
                toastr.error("请填写去年年收入！");
                return false;
            }
            var commodity_one = $(".commodity_one").val();
            if(commodity_one == ""){
                toastr.error("请填写商品名称！");
                return false;
            }
            var commodity_one_money = $(".commodity_one_money").val();
            if(commodity_one_money == ""){
                toastr.error("请填写商品价格！");
                return false;
            }
            var commodity_two = $(".commodity_two").val();
            var commodity_two_money = $(".commodity_two_money").val();
            var Passengers = $(".Passengers").val();
            if(Passengers == ""){
                toastr.error("请填写日均人流量！");
                return false;
            }
            var BankNumber = $("#Bank_number").val();
            if(BankNumber == ""){
                toastr.error("请填写银行账户！");
                return false;
            }
//            console.log(birthday);
//            console.log(login_radio);
//            console.log(userName,passWord,peopleName,phoneNumber,type,birthday,gender,idcard,login_Sheng,login_Shi,login_Qu,login_Jd,ismarrige,education,StoreName,login_radio,year_people,annualIncome,commodity_one,commodity_one_money,commodity_two,commodity_two_money,Passengers,address,DoorNumber);

            storePeople(peopleName,phoneNumber,type,birthday,gender,idcard,login_Sheng,login_Shi,login_Qu,login_Jd,ismarrige,education,StoreName,login_radio,year_people,annualIncome,commodity_one,commodity_one_money,commodity_two,commodity_two_money,Passengers,address,DoorNumber,BankNumber);
        });


        // 单张上传照片
        $(".fileinput").change(function () {
            var file = this.files[0];
            var thisId = $(this).attr("name");
            readFile(file,$(this).parent().siblings(".on"),thisId);
        });

        //企业上传加盟书
        $("#Enterprise_Application").change(function () {
            var file = this.files[0];
            var thisId = $(this).attr("name");
            SinglePerson(file,thisId);
        });

        //个体上传加盟书
        $("#SinglePerson_Application").change(function () {
            var file = this.files[0];
            var thisId = $(this).attr("name");
            SinglePerson(file,thisId);
        });

        //删除图片
        $(".on").click(function () {
            $(this).children("img").remove();
            $(this).css("display","none");
            $(this).siblings(".upload").css("display","block");
            var siblingsId = $(this).siblings(".upload").children("input").attr("name");
            console.log(siblingsId);
            for (var i = 0; i < jsonarray.length; i++){
                if (jsonarray[i].name == siblingsId){
                    jsonarray.splice(i,1);
                }
            }
            toastr.success('删除成功！');
            var img = document.createElement('img');
            img.src = "${bath}/images/common/loading.gif";
            $(this).empty();
            $(this).append(img);
            console.log(jsonarray);
        });

    })
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
    //企业 ajax
    function storeApply(type,enterpriseName,enterprisePhone,login_Sheng,login_Shi,login_Qu,login_Jd,login_radio,store_year,store_YearMoney,name_one,nameOneMoney,name_two,nameTwoMoney,howMan,FullName,address,peopleName,phoneNumber,DoorNumber) {
        $("#All_data").css("display","none");

            var dataStringNumber = JSON.stringify(array);
            $.ajax({
                type : "POST", //用POST方式请求
                url : '${bath}/frontstore/addStoreApply', //目标地址
                data : {
                    merchantType : type,
                    enterpriseName : enterpriseName,
                    companyTel : enterprisePhone,
                    addressShengshi : login_Sheng,
                    addressShi : login_Shi,
                    addressQu : login_Qu,
                    addressStreet : login_Jd,
                    addressDoor : DoorNumber,
                    storeArea : login_radio,
                    businessYear : store_year,
                    income : store_YearMoney,
                    product1 : name_one,
                    price1 : nameOneMoney,
                    product2 : name_two,
                    price2 : nameTwoMoney,
                    dailyFlow : howMan,
                    storeName : FullName,
                    shopKeeperName : peopleName,
                    shopKeeperPhone : phoneNumber,
                    storeAddress : address,
                    data : dataStringNumber,
                    openId : openIdParma,
                    id : storeId
                },
                beforeSend: function (jqXHR) {
                    if (undefined != header) {
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                    console.log(retInfo);
                    console.log(retInfo);
                    var retCode = retInfo.retCode;
                    if (retCode != 0){
                        toastr.error("注册失败，请重新提交！");
                        $("#Submit_enterprise").css("display","block");
                    }else {
                        toastr.success("注册成功");
                        setTimeout(function () {
                            var navTypeParam = 0;
                            var url = "${bath}/portalLink/linkToBusinessLogin?navType="+navTypeParam;
                            window.open(url,"_self");
                        },2000)
                    }
                },
                error:function(XMLHttpRequest, textStatus){
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $("#loading").css("display","none");
                    toastr.error('提交失败！');
                    $("#All_data").css("display","block");
                    return false;
                }
            });
    }
    //个体ajax
    function storePeople(peopleName,phoneNumber,type,birthday,gender,idcard,login_Sheng,login_Shi,login_Qu,login_Jd,ismarrige,education,StoreName,login_radio,year_people,annualIncome,commodity_one,commodity_one_money,commodity_two,commodity_two_money,Passengers,address,DoorNumber,BankNumber) {
        $("#All_data").css("display","none");
            var dataStringNumber = JSON.stringify(array);
            $.ajax({
                type : "POST", //用POST方式请求
                url : '${bath}/frontstore/addStoreApply', //目标地址
                data : {
                    merchantType : type,  //企业  个体
                    birthday : birthday,  //出生日期
                    gender : gender, //性别
                    idcard : idcard,  //身份证
                    addressShengshi : login_Sheng,
                    addressShi :login_Shi ,
                    addressQu : login_Qu,
                    addressStreet : login_Jd,
                    addressDoor : DoorNumber,
                    ismarrige : ismarrige,//婚姻状况
                    education : education, //学历
                    storeArea : login_radio, //地址
                    businessYear : year_people,  //年限
                    income : annualIncome,  //年收入
                    product1 : commodity_one,  //商品1
                    price1 : commodity_one_money,  //商品1价格
                    product2 : commodity_two,  //商品2
                    price2 : commodity_two_money,   //商品2价格
                    dailyFlow : Passengers,  // 人次
                    storeName : StoreName,  //商店名称
                    shopKeeperName : peopleName,   //店主名字
                    shopKeeperPhone : phoneNumber,  //店主手机
                    storeAddress : address,//门店地址
                    data : dataStringNumber,
                    bankNumber : BankNumber,
                    openId : openIdParma,
                    id : storeId
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
                    if (retCode != 0){
                        toastr.error("注册失败，请重新提交！");
                        $("#All_data").css("display","block");
                    }else {
                        toastr.success("注册成功");
                        setTimeout(function () {
                            var navTypeParam = 0;
                            var url = "${bath}/portalLink/linkToBusinessLogin?navType="+navTypeParam;
                            window.open(url,"_self");
                        },2000)
                    }
                },
                error:function(XMLHttpRequest, textStatus){
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    $("#loading").css("display","none");
                    toastr.error('提交失败！');
                    $("#All_data").css("display","block");
                    return false;
                }
            });
    }

    //openId调取数据
    function getOpenId(){
        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/Portalshopkeeper/feedBackStore', //目标地址
            data : {
                openId : openIdParma
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

                    if (retCode == 0){
                        var retStore = retInfo.data.store;
                        var retShopkeeper = retInfo.data.shopkeeper;
                        var retStoreId = retStore.id;
                        var retMerchantType = retStore.merchantType;
                        var retAuditStatus = retStore.auditStatus;
                        storeId = retStoreId;
                        if (retAuditStatus == 0){
                            $(".degree").html("<img src='${bath}/images/frontpages/common/adopt.png'/>审核中");
                        }else if (retAuditStatus == 1){
                            $(".degree").html("<img src='${bath}/images/frontpages/common/adopt.png'/>审核通过");
                        }else if (retAuditStatus == 2){
                            $(".degree").html("<img src='${bath}/images/frontpages/common/error.png'/>审核失败");
                        }
                        if (retMerchantType == 0){
                            $(".enterprise").addClass("active");
                            $(".personal").removeClass("active");
                            $("#enterprise").addClass("active");
                            $("#personal").removeClass("active");
                            $(".type_LX").text("0");
                            $(".enterprise img").attr("src","${bath}/images/frontpages/common/yuan_active.png");
                            $(".personal img").attr("src","${bath}/images/frontpages/common/yuan_none.png");
                            //企业
                            var retEnterpriseName = retStore.enterpriseName;//企业全称
                            var retCompanyTel = retStore.companyTel;//公司电话
                            var retAddressShengshi = retStore.addressShengshi;//省ID
                            var retAddressShi = retStore.addressShi;//市ID
                            var retAddressQu = retStore.addressQu;//区ID
                            var retAddressStreet = retStore.addressStreet;//街道ID
                            retAddressShiId = retAddressShi;
                            retAddressQuId = retAddressQu;
                            retAddressStreetId = retAddressStreet;
                            var retAddressDoor = retStore.addressDoor;//门牌号
                            var retStoreName = retStore.storeName;//门店名称
                            var retShopkeeperName = retShopkeeper.name;//负责人名字
                            var retShopkeeperphoneNumber = retShopkeeper.phoneNumber;//负责人电话
                            var retStoreArea = retStore.storeArea;//门店所在地
                            var retBusinessYear = retStore.businessYear;//经营年限
                            var retIncome = retStore.income;//去年年收入
                            var retProductOne = retStore.product1;//品名1
                            var retPriceOne = retStore.price1;//价格1
                            var retProductTwo = retStore.product2;//品名2
                            var retPriceTwo = retStore.price2;//价格2
                            var retDailyFlow = retStore.dailyFlow;//日均人流量
                            var retBusinessLicense = retStore.businessLicense;//营业执照图片
                            var retTaxRegistration = retStore.taxRegistration;//税务登记证图片
                            var retOrganization = retStore.organization;//组织机构代码证图片
                            var retHouseInformation = retStore.houseInformation;//房产证明图片
                            var retIdCard = retStore.idCard;//身份证正面图片
                            var retEnterpriseThree = retStore.enterpriseThree;//身份证反面图片
                            var retWaterFee = retStore.waterFee;//三个月缴费凭证图片
                            var retEquipmentPhoto = retStore.equipmentPhoto;//摆放位置
                            var retAccountPermit = retStore.accountPermit;//开户许可证图片
                            var retPlacePhoto = retStore.placePhoto;//营业场所图片
                            $(".enterpriseName").val(retEnterpriseName);
                            $(".enterprisePhone").val(retCompanyTel);
                            $(".login_Sheng option[value='"+retAddressShengshi+"']").attr("selected","selected");
                            if(retAddressShengshi != ""){
                                openPayShi(retAddressShengshi);
                                if (retAddressShengshi != "" && retAddressShi != ""){
                                    openPayQu(retAddressShi,retAddressShengshi);
                                    if(retAddressShengshi != "" && retAddressShi != "" && retAddressQu != ""){
                                        openPayJD(retAddressShi,retAddressShengshi,retAddressQu);
                                    }
                                }
                            }
                            $(".DoorNumber").val(retAddressDoor);
                            $(".FullName").val(retStoreName);
                            $("#peopleName").val(retShopkeeperName);
                            $("#phoneNumber").val(retShopkeeperphoneNumber);
                            if (retStoreArea == 0){
                                $("input[name='dizhi']").eq(0).attr("checked","checked");
                            }else if (retStoreArea == 1){
                                $("input[name='dizhi']").eq(1).attr("checked","checked");
                            }else if (retStoreArea == 2){
                                $("input[name='dizhi']").eq(2).attr("checked","checked");
                            }else if (retStoreArea == 2){
                                $("input[name='dizhi']").eq(2).attr("checked","checked");
                            }
                            $(".store_year").val(retBusinessYear);
                            $(".storeYearMoney").val(retIncome);
                            $(".name_one").val(retProductOne);
                            $(".name_One_Money").val(retPriceOne);
                            $(".name_two").val(retProductTwo);
                            $(".name_Two_Money").val(retPriceTwo);
                            $(".howMan").val(retDailyFlow);
                            $("#Enterprise_BusinessLicense").parent().css("display","none");
                            $("#Enterprise_TaxRegistrationCertificate").parent().css("display","none");
                            $("#Enterprise_OrganizationCodeCertificate").parent().css("display","none");
                            $("#Enterprise_RealEstateCertificate").parent().css("display","none");
                            $("#Enterprise_FacadeOfIDCard").parent().css("display","none");
                            $("#Enterprise_IdentityCard").parent().css("display","none");
                            $("#Enterprise_UploadPaymentVoucher").parent().css("display","none");
                            $("#Enterprise_PutPhotoOfPosition").parent().css("display","none");
                            $("#Enterprise_AccountOpeningPermit").parent().css("display","none");
                            $("#Enterprise_PhotoOfThePlaceOfBusiness").parent().css("display","none");
                            $(".on").css("display","block");
                            $("#Enterprise_BusinessLicense").parent().siblings(".on").children("img").attr("src","${bath}"+retBusinessLicense);
                            $("#Enterprise_TaxRegistrationCertificate").parent().siblings(".on").children("img").attr("src","${bath}"+retTaxRegistration);
                            $("#Enterprise_OrganizationCodeCertificate").parent().siblings(".on").children("img").attr("src","${bath}"+retOrganization);
                            $("#Enterprise_RealEstateCertificate").parent().siblings(".on").children("img").attr("src","${bath}"+retHouseInformation);
                            $("#Enterprise_FacadeOfIDCard").parent().siblings(".on").children("img").attr("src","${bath}"+retIdCard);
                            $("#Enterprise_IdentityCard").parent().siblings(".on").children("img").attr("src","${bath}"+retEnterpriseThree);
                            $("#Enterprise_UploadPaymentVoucher").parent().siblings(".on").children("img").attr("src","${bath}"+retWaterFee);
                            $("#Enterprise_PutPhotoOfPosition").parent().siblings(".on").children("img").attr("src","${bath}"+retEquipmentPhoto);
                            $("#Enterprise_AccountOpeningPermit").parent().siblings(".on").children("img").attr("src","${bath}"+retAccountPermit);
                            $("#Enterprise_PhotoOfThePlaceOfBusiness").parent().siblings(".on").children("img").attr("src","${bath}"+retPlacePhoto);
                        }else {
                            $(".personal").addClass("active");
                            $(".enterprise").removeClass("active");
                            $("#personal").addClass("active");
                            $("#enterprise").removeClass("active");
                            $(".type_LX").text("1");
                            $(".personal img").attr("src","${bath}/images/frontpages/common/yuan_active.png");
                            $(".enterprise img").attr("src","${bath}/images/frontpages/common/yuan_none.png");
                            //个体户
                            var retShopkeeperName = retShopkeeper.name;//名字
                            var retShopkeeperphoneNumber = retShopkeeper.phoneNumber;//手机号
                            var retShopkeeperBirthday = retShopkeeper.birthday;//出生日期
                            var retShopkeeperIdcard = retShopkeeper.idcard;//出生日期
                            var retBirthday = retShopkeeperBirthday.substring(0,10);
                            var retSex = retShopkeeper.gender;//性别
                            var retMariyStatus = retShopkeeper.ismarrige;//婚姻状况
                            var retEducation = retShopkeeper.education;//学历状况
                            var retAddressShengshi = retStore.addressShengshi;//省ID
                            var retAddressShi = retStore.addressShi;//市ID
                            var retAddressQu = retStore.addressQu;//区ID
                            var retAddressStreet = retStore.addressStreet;//街道ID
                            retAddressShiId = retAddressShi;
                            retAddressQuId = retAddressQu;
                            retAddressStreetId = retAddressStreet;
                            var retAddressDoor = retStore.addressDoor;//门牌号
                            var retStoreName = retStore.storeName;//门店名称
                            var retStoreArea = retStore.storeArea;//门店所在地
                            var retBusinessYear = retStore.businessYear;//经营年限
                            var retIncome = retStore.income;//去年年收入
                            var retProductOne = retStore.product1;//品名1
                            var retPriceOne = retStore.price1;//价格1
                            var retProductTwo = retStore.product2;//品名2
                            var retPriceTwo = retStore.price2;//价格2
                            var retDailyFlow = retStore.dailyFlow;//日均人流量
                            var retBusinessLicense = retStore.businessLicense;//营业执照图片
                            var retTaxRegistration = retStore.taxRegistration;//税务登记证图片
                            var retOrganization = retStore.organization;//组织机构代码证图片
                            var retHouseInformation = retStore.houseInformation;//房产证明图片
                            var retIdCard = retStore.idCard;//身份证正面图片
                            var retEnterpriseThree = retStore.enterpriseThree;//身份证反面图片
                            var retWaterFee = retStore.waterFee;//三个月缴费凭证图片
                            var retEquipmentPhoto = retStore.equipmentPhoto;//摆放位置
                            var retAccountPermit = retStore.accountPermit;//开户许可证图片
                            var retBankNumber = retStore.bankNumber;//银行卡号
                            var retPlacePhoto = retStore.placePhoto;//营业场所图片
                            $("#FullName").val(retShopkeeperName);
                            $("#CellphoneNumber").val(retShopkeeperphoneNumber);
                            $("#SpecificDate").val(retBirthday);
                            $(".Gender option[value='"+retSex+"']").attr("selected","selected");
                            $(".ID_Number").val(retShopkeeperIdcard);
                            $(".MaritalStatus option[value='"+retMariyStatus+"']").attr("selected","selected");
                            $(".Education option[value='"+retEducation+"']").attr("selected","selected");
                            $(".login_Sheng_People option[value='"+retAddressShengshi+"']").attr("selected","selected");
                            if(retAddressShengshi != ""){
                                peoplePayShi(retAddressShengshi);
                                if (retAddressShengshi != "" && retAddressShi != ""){
                                    peoplePayQu(retAddressShengshi,retAddressShi);
                                    if(retAddressShengshi != "" && retAddressShi != "" && retAddressQu != ""){
                                        peoplePayJD(retAddressShengshi,retAddressShi,retAddressQu);
                                    }
                                }
                            }

                            $(".DoorNumber_people").val(retAddressDoor);
                            $(".StoreName").val(retStoreName);
                            if (retStoreArea == 0){
                                $("input[name='dizhi_people']").eq(0).attr("checked","checked");
                            }else if (retStoreArea == 1){
                                $("input[name='dizhi_people']").eq(1).attr("checked","checked");
                            }else if (retStoreArea == 2){
                                $("input[name='dizhi_people']").eq(2).attr("checked","checked");
                            }else if (retStoreArea == 2){
                                $("input[name='dizhi_people']").eq(2).attr("checked","checked");
                            }
                            $(".year_people").val(retBusinessYear);
                            $(".annualIncome").val(retIncome);
                            $(".commodity_one").val(retProductOne);
                            $(".commodity_one_money").val(retPriceOne);
                            $(".commodity_two").val(retProductTwo);
                            $(".commodity_two_money").val(retPriceTwo);
                            $(".Passengers").val(retDailyFlow);
                            $("#SinglePerson_BusinessLicense").parent().css("display","none");
                            $("#SinglePerson_TaxRegistrationCertificate").parent().css("display","none");
                            $("#SinglePerson_OrganizationCodeCertificate").parent().css("display","none");
                            $("#SinglePerson_RealEstateCertificate").parent().css("display","none");
                            $("#SinglePerson_FacadeOfIDCard").parent().css("display","none");
                            $("#SinglePerson_IdentityCard").parent().css("display","none");
                            $("#SinglePerson_UploadPaymentVoucher").parent().css("display","none");
                            $("#SinglePerson_PutPhotoOfPosition").parent().css("display","none");
                            $("#SinglePerson_AccountOpeningPermit").parent().css("display","none");
                            $("#SinglePerson_PhotoOfThePlaceOfBusiness").parent().css("display","none");
                            $("#Bank_number").val(retBankNumber);
                            $(".on").css("display","block");
                            $("#SinglePerson_BusinessLicense").parent().siblings(".on").children("img").attr("src","${bath}"+retBusinessLicense);
                            $("#SinglePerson_TaxRegistrationCertificate").parent().siblings(".on").children("img").attr("src","${bath}"+retTaxRegistration);
                            $("#SinglePerson_OrganizationCodeCertificate").parent().siblings(".on").children("img").attr("src","${bath}"+retOrganization);
                            $("#SinglePerson_RealEstateCertificate").parent().siblings(".on").children("img").attr("src","${bath}"+retHouseInformation);
                            $("#SinglePerson_FacadeOfIDCard").parent().siblings(".on").children("img").attr("src","${bath}"+retIdCard);
                            $("#SinglePerson_IdentityCard").parent().siblings(".on").children("img").attr("src","${bath}"+retEnterpriseThree);
                            $("#SinglePerson_UploadPaymentVoucher").parent().siblings(".on").children("img").attr("src","${bath}"+retWaterFee);
                            $("#SinglePerson_PutPhotoOfPosition").parent().siblings(".on").children("img").attr("src","${bath}"+retEquipmentPhoto);
                            $("#SinglePerson_AccountOpeningPermit").parent().siblings(".on").children("img").attr("src","${bath}"+retAccountPermit);
                            $("#SinglePerson_PhotoOfThePlaceOfBusiness").parent().siblings(".on").children("img").attr("src","${bath}"+retPlacePhoto);


                        }
                    }else{
                        $(".degree").html("<img src='${bath}/images/frontpages/common/Noaudit.png'/>还未提交审核");
                    }
            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("授权失败！");
            }
        });
    }



    //加盟书
    function SinglePerson(file,thisId) {
        var PhotoId = thisId;
        if (file){
            //        新建阅读器
            var reader = new FileReader();
            //        根据文件类型选择阅读方式
            reader.readAsDataURL(file);
            //        当文件阅读结束后执行的方法
            reader.addEventListener("load",function () {
                var src = event.target.result;

                jQuery.ajax({
                    type : "POST", //用POST方式请求
                    url : '${bath}/fileUpload', //目标地址
                    data : {
                        data : src
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
                            toastr.success('文件上传成功！');
                            console.log(array);
                        }else {
                            toastr.error('文件过大，请上传小于1M的文件！');
                            return false;
                        }
                    },
                    error:function(XMLHttpRequest, textStatus){
                        console.log(XMLHttpRequest);
                        console.log(textStatus);
                        $("#loading").css("display","none");
                        toastr.error('文件过大，请上传小于1M的文件！');
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
                $(".login_Shi option[value='"+retAddressShiId+"']").attr("selected","selected");
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
                $(".login_Qu option[value='"+retAddressQuId+"']").attr("selected","selected");
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
                $(".login_Jd option[value='"+retAddressStreetId+"']").attr("selected","selected");
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


    //获取省列表方法
    function peoplePaySheng() {

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

                $(".login_Sheng_People").empty();
                $(".login_Shi_People").empty();
                $(".login_Qu_People").empty();
                $(".login_Jd_People").empty();

                var defaultShengSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Sheng_People").append(defaultShengSelectedHtml);

                var defaultShiSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Shi_People").append(defaultShiSelectedHtml);

                var defaultQuSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Qu_People").append(defaultQuSelectedHtml);

                var defaultJiedaoSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Jd_People").append(defaultJiedaoSelectedHtml);

                for (var i = 0; i < retDataLength; i++){

                    var retId = retData[i].id1;
                    var retName = retData[i].name;
                    var shengSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";

                    $(".login_Sheng_People").append(shengSelectedHtml);
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
    function peoplePayShi(shengId) {
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

                $(".login_Shi_People").empty();

                var defaultShiSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Shi_People").append(defaultShiSelectedHtml);

                var retBjId = retData[0].id2;
                if (retBjId == 110100){
                    var retId = retData[0].id2;
                    var retName = retData[0].name;
                    var shiSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".login_Shi_People").append(shiSelectedHtml);
                }else {
                    for (i = 0; i < retDataLength; i++){
                        var retId = retData[i].id2;
                        var retName = retData[i].name;
                        var shiSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                        $(".login_Shi_People").append(shiSelectedHtml);
                    }
                }

                $(".login_Shi_People option[value='"+retAddressShiId+"']").attr("selected","selected");
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
    //区列表
    function peoplePayQu(shengId,shiId) {
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


                $(".login_Qu_People").empty();

                var defaultQuSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Qu_People").append(defaultQuSelectedHtml)

                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id;
                    var retName = retData[i].name;
                    var quSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".login_Qu_People").append(quSelectedHtml);
                }
                $(".login_Qu_People option[value='"+retAddressQuId+"']").attr("selected","selected");
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
    function peoplePayJD(shengId,shiId,quId) {
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


                $(".login_Jd_People").empty();

                var defaultJiedaoSelectedHtml = "<option value=''>请选择</option>";
                $(".login_Jd_People").append(defaultJiedaoSelectedHtml);


                for (var i = 0; i < retDataLength; i++){
                    var retId = retData[i].id4;
                    var retName = retData[i].name;
                    var jiedaoSelectedHtml = "<option value='"+retId+"'>"+retName+"</option>";
                    $(".login_Jd_People").append(jiedaoSelectedHtml);
                }
                $(".login_Jd_People option[value='"+retAddressStreetId+"']").attr("selected","selected");
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

    //个体触发市级列表
    function peopleShengChange() {
        var shengId = $(".login_Sheng_People").val();
        peoplePayShi(shengId);
    }
    //个体触发区级列表
    function peopleShiChange() {
        var shengId = $(".login_Sheng_People").val();
        var shiId = $(".login_Shi_People").val();
        peoplePayQu(shengId,shiId);
    }
    //个体触发街道列表
    function peopleQuChange() {
        var shengId = $(".login_Sheng_People").val();
        var shiId = $(".login_Shi_People").val();
        var quId = $(".login_Qu_People").val();
        peoplePayJD(shengId,shiId,quId);
    }

</script>