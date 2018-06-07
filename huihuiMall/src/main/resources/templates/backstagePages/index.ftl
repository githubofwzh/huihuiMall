<!DOCTYPE html>
<html>
<head>
    <#assign bath=request.getContextPath()>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <#if _csrf??>
        <meta name="_csrf" content="${_csrf.token}"/>
        <!-- default header name is X-CSRF-TOKEN -->
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
    </#if>

    <title>HD驾驶室装焊信息化系统</title>
    <link href="${bath}/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="${bath}/css/skins/_all-skins.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/common.js" type="text/javascript"></script>

    <style>
        .navbar-title-menu{
            float:left;
        }
        .navbar-title-menu span{
            color:#FFFFFF;
            display: block;
            font-weight: bold;
            font-size: 25px;
            text-shadow: 3px 3px 7px #000;
            padding: 8px 0px 8px 20px;
        }
    </style>

</head>
<body class="hold-transition skin-blue sidebar-mini" style="overflow:hidden;">
<div id="ajax-loader" style="cursor: progress; position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background-color: #ecf0f5; z-index: 10000; overflow: hidden;">
    <img src="${bath}/images/common/ajax-loader.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
</div>
<div class="wrapper">
    <!--头部信息-->
    <header class="main-header">
        <a href="javascript:void(0);" target="_blank" class="logo">
            <!--<span class="logo-mini">LR</span>
            <span class="logo-lg">learun<strong>敏捷框架</strong></span>-->
            <img src="${bath}/images/common/logo.png" style="width:100%; height: 40px; float:left; margin: 5px 0px;">
        </a>

        <nav class="navbar navbar-static-top">
            <div class="navbar-title-menu" >
                <span><strong>HD驾驶室装焊信息化系统</strong></span>
            </div>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${bath}/images/common/default-user.png" class="user-image" alt="User Image">
                            <span class="hidden-xs">企业管理员：${username}</span>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="${bath}/account/login"><i class="ace-icon fa fa-power-off"></i>安全退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!--左边导航-->
    <div class="main-sidebar">
        <div class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${bath}/images/common/default-user.png" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${username}</p>
                    <a><i class="fa fa-circle text-success"></i>在线</a>
                </div>
            </div>
            <div style="overflow-y: scroll;position: absolute;width: 107.5%;top: 125px;bottom: 0;">
                <ul class="sidebar-menu" id="sidebar-menu">
                    <!--<li class="header">导航菜单</li>-->
                </ul>
            </div>
        </div>
    </div>
    <!--中间内容-->
    <div id="content-wrapper" class="content-wrapper">
        <div class="content-tabs">
            <button class="roll-nav roll-left tabLeft">
                <i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs menuTabs">
                <div class="page-tabs-content" style="margin-left: 0px;">
                    <a href="javascript:void(0);" class="menuTab active" data-id="/Home/Default">欢迎首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right tabRight">
                <i class="fa fa-forward" style="margin-left: 3px;"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown tabClose" data-toggle="dropdown">
                    页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
                </button>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a class="tabReload" href="javascript:void(0);">刷新当前</a></li>
                    <li><a class="tabCloseCurrent" href="javascript:void(0);">关闭当前</a></li>
                    <li><a class="tabCloseAll" href="javascript:void(0);">全部关闭</a></li>
                    <li><a class="tabCloseOther" href="javascript:void(0);">除此之外全部关闭</a></li>
                </ul>
            </div>
            <!-- <button class="roll-nav roll-right fullscreen"><i class="fa fa-arrows-alt"></i></button>-->
        </div>
        <div class="content-iframe" style="overflow: hidden;">
            <div class="mainContent" id="content-main" style="margin-bottom: 10px; padding: 0">
                <iframe class="LRADMS_iframe" width="100%" height="100%" src="${bath}/welcome" frameborder="0" data-id="/Home/Default"></iframe>
            </div>
        </div>
    </div>
</div>

<script src="${bath}/js/respond.min.js" type="text/javascript"></script>
<script src="${bath}/js/jquery/jquery-1.11.3.js" type="text/javascript"></script>
<script src="${bath}/js/bootstrap/js/bootstrap.min.js"></script>
<script src="${bath}/js/index.js"></script>
</body>
</html>
