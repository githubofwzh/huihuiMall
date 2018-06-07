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

    <title>个人中心</title>
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="${bath}/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<#--common CSS-->
    <link href="${bath}/css/common/checkBox_radio.css" rel="stylesheet" type="text/css" />
    <link href="${bath}/css/common/pageCommon.css" rel="stylesheet" type="text/css" />
<#--tip CSS-->
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css" />

    <!-- jQuery -->
    <script src="${bath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
    <script src="${bath}/js/jquery-validate.js" type="text/javascript"></script>
    <script src="${bath}/js/JIC.min.js" type="text/javascript"></script>
    <style>
        .valid_message{
            white-space: nowrap;
        }
    </style>
</head>
<body>

<!--顶部title与面包屑开始-->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-9 col-md-9" style="padding-left: 0px">
                <h3 class="page-header">
                    个人中心
                </h3>
            </div>
            <div class="col-lg-3  col-md-3">
                <h4 class="breadcrumb pull-right">
                    <li><a href="${bath}/welcome">首页</a></li>
                    <li style="color: #777">&nbsp;个人中心</li>
                </h4>
            </div>
        </div>
    </div>
</div>
<!--顶部title与面包屑结束-->

<!--操作面板与搜索面板结束-->

<!--table展示与分页开始-->
<div class="container-fluid" id="table-panel">
    <div class="row">
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-12" style="padding: 0">
                    <ul id="mainContent" style="margin-top: 20px">
                        <li>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-6 col-md-6 _padding">
                                    <div class="col-lg-2 col-md-2 title">
                                        <label class="control-label">
                                            用户名：</label>
                                    </div>
                                    <div class="col-lg-5 col-md-5 input-box">
                                        <input type="text" class="form-control"  id="userName" disabled>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-6 col-md-6 _padding">
                                    <div class="col-lg-2 col-md-2 title">
                                        <label class="control-label">
                                            原始密码：</label>
                                    </div>
                                    <div class="col-lg-5 col-md-5 input-box">
                                        <input type="password" class="form-control required"  id="oldPassWord" data-tip="请输入原始密码" data-valid="isNonEmpty" data-error="原始密码不能为空">
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-6 col-md-6 _padding">
                                    <div class="col-lg-2 col-md-2 title">
                                        <label class="control-label">
                                            新密码：</label>
                                    </div>
                                    <div class="col-lg-5 col-md-5 input-box">
                                        <input type="password" class="form-control required"  id="passWord" data-tip="请输入您的新密码(6-12位字母或数字)" data-valid="isNonEmpty||between:6-16" data-error="密码不能为空||密码长度6-16位" >
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="col-lg-12 col-md-12 input-form">
                                <div class="col-lg-6 col-md-6 _padding">
                                    <div class="col-lg-2 col-md-2 title">
                                        <label class="control-label">
                                            确认新密码：</label>
                                    </div>
                                    <div class="col-lg-5 col-md-5 input-box">
                                        <input type="password" class="form-control required"  id="nextpassWord"  data-tip="请再次输入您的新密码" data-valid="isNonEmpty||isRegisterSame" data-error="密码不能为空||两次密码输入不一致">
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="col-lg-6 col-md-6" style="margin-top: 20px">
                        <div class="col-lg-8 col-md-8 col-md-offset-1">
                            <button type="button" class="btn btn-default" style="width: 200px;margin-left: 70px;" >确认修改</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--table展示与分页结束-->


</body>
</html>

<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ready(function() {

        //获取用户名
        var User =$('#mainUser', parent.document)[0].innerHTML;
        var mainUser=User.substring(5);
        $("#userName").val(mainUser);

        $(".btn-default").click(function () {
            toastr.options = {
                "positionClass": "toast-nav-center-center", //弹出窗的位置
                "timeOut": "1000", //展现时间
            };
            if (! $('#mainContent').validate('submitValidate')){
                return false;
            }
            $.ajax({
                type : "POST", //用POST方式传输
                url : '${bath}/account/updateAccount', //目标地址
                data : {
                    loginAccount:$("#userName").val(),
                    oldPassword:$("#oldPassWord").val(),
                    newPassword :$("#passWord").val(),
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
                    if(retCode==10006){
                        toastr.error("原始密码错误，请重新输入");
                        return false;
                    }else{
                        toastr.success("密码修改成功");
                        $("#oldPassWord").val("");
                        $("#passWord").val("");
                        $("#nextpassWord").val("");
                    }
                }
            });
        })

        /*验证信息*/
        $('#mainContent').validate({
            onFocus: function() {
                this.parent().addClass('active');
                $(this).next('span[class=valid_message]').css("display","none");
                /*$(this).next('span[class=input-group-addon]').css("display","block");*/
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

    });

</script>
