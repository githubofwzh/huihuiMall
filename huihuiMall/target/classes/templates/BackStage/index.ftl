<!DOCTYPE html>
<html lang="en">
<head>
    <#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <#if _csrf??>
        <meta name="_csrf" content="${_csrf.token}"/>
        <!-- default header name is X-CSRF-TOKEN -->
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
    </#if>

    <title>中药材产业扶贫信息系统</title>
    <!-- Bootstrap Core CSS -->
    <link href="${bath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- MetisMenu CSS -->
    <link href="${bath}/css/templateCSS/metisMenu.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="${bath}/css/templateCSS/sb-admin-2.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="${bath}/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <!-- index CSS -->
    <link href="${bath}/css/common/index.css" rel="stylesheet" type="text/css" />
    <style>
        .page-header
        {
            margin-bottom: 0px;
            padding-bottom: 0px;
            border-bottom: none;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <!-- 顶部及导航组开始 -->
    <!-- 顶部开始 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; height:62px">
        <div class="navbar-header" style="background-color:#3c67c0">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><img src="${bath}/images/common/logo.png" style="margin-top: -12px; margin-left: 45px"/></a>
        </div>

        <ul class="nav navbar-top-links navbar-left">
            <div class="col-lg-12">
                <h3 class="page-header" style="color:#FFF">
                    欢迎登录中药材产业扶贫信息系统
                </h3>
            </div>
        </ul>

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <label><i class="fa fa-user fa-2x"></i></label>
                    <label id="mainUser">当前用户：${username}</label>
                    <label><i class="fa fa-caret-down"></i></label>
                </a>
                <ul class="dropdown-menu dropdown-user" id="personalCenter">
                    <#--<li><a id="personalCenter"><i class="fa fa-user fa-fw"></i>个人中心</a></li>
                    <li class="divider"></li>-->
                    <li><a href="${bath}/account/login"><i class="fa fa-sign-out fa-fw"></i>退出系统</a></li>
                </ul>
            </li>
        </ul>
        <!-- 顶部结束 -->

        <!--导航组开始-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
            </div>
        </div>
        <!-- 导航结束 -->
    </nav>
    <!-- 顶部及导航组结束 -->

    <!--iframe嵌套内容开始-->
    <div id="page-wrapper">
        <!--数据加载loading开始-->
        <div id="indexLoading" class="loading">数据加载中...</div>
        <!--数据加载loading结束-->

        <iframe src="${bath}/welcome" id="iframe-main" frameborder='0' style="width: 100%;background-color:#f0f0f0" scrolling="no" onload="this.height=880"></iframe>

    </div>
    <!--iframe嵌套内容开始-->

    <!--页脚开始-->
    <div id="footer" class="container" style="margin-top:20px;">
        <nav class="navbar navbar-default navbar-fixed-bottom" style="min-height:30px; background-color:#3c67c0; color:#FFF; border:none">
            <div class="navbar-inner navbar-content-center">
                <ul class="nav navbar-top-links navbar-right">
                    <div class="col-lg-12">
                        <h5 class="page-header" style="margin-bottom: 0px;padding-bottom: 0px;border-bottom: none; margin-top: 10px; margin-right: 40px">
                            Copyright&nbsp;©&nbsp;&nbsp;2017&nbsp;国家中医药管理局.保留所有权
                        </h5>
                    </div>
                </ul>
                <#--<ul class="nav navbar-top-links navbar-right">
                    <div class="col-lg-12">
                        <h5 class="page-header">
                            版本号：2.3.0-SNAPSHOT-5561
                        </h5>
                    </div>
                </ul>-->
            </div>
        </nav>
    </div>
    <!--页脚结束-->
</div>
</body>
</html>
<!-- jQuery -->

<script src="${bath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>

<!-- Bootstrap Core JavaScript -->

<script src="${bath}/js/bootstrap.min.js" type="text/javascript"></script>

<!-- Metis Menu Plugin JavaScript -->

<script src="${bath}/js/templateJS/metisMenu.js" type="text/javascript"></script>

<!-- Custom Theme JavaScript -->

<script src="${bath}/js/templateJS/sb-admin-2.js" type="text/javascript"></script>

<!--Nav JavaScript-->

<script src="${bath}/js/common/nav.js" type="text/javascript"></script>

<script>
    $(function () {
        var href= location.href;
        $(".navbar-brand").attr("href",href);

        var personalHref = '${bath}/account/linkPersonalCenter';
        $("#personalCenter").on("click",function () {
            goNewPage(personalHref);
        });

    })

    function reinitIframe() {
        var iframe = document.getElementById("iframe-main");

        $("#indexLoading").css("display","block");

        try {
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            iframe.height = height;
            $("#indexLoading").css("display","none");
        } catch (ex) {

        }
    }
    window.setInterval("reinitIframe()", 200);

</script>
