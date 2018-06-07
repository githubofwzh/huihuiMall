<!DOCTYPE html>
<html lang="en">
<head>
    <#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <style>
       body{
            width:100%;
            background-image: url("${bath}/images/common/welcome.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        /*.welcome{
            width:100%;
            height:100%;
            margin: 0 auto;
            text-align: center;
        }*/
    </style>
</head>
<body>
    <#--<div class="welcome">
        <img src="${bath}/images/common/welcome.jpg">
    </div>-->
</body>
</html>