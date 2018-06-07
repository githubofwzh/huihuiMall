<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
</head>
<body>

<form action="login" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <p>公司代码: <input type="text" name="entCode" value="00000001"/></p>
    <p>用户名: <input type="text" name="username" value="test1"/></p>
    <p>密码: <input type="password" name="password" value="123456"/></p>
    <input type="submit" value="Submit" />
</form>

</body>
</html>