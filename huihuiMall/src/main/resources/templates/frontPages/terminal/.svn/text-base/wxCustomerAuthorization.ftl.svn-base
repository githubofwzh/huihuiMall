<!DOCTYPE html>
<html lang="en">
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>微信授权-用户</title>

<#if _csrf??>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</#if>
    <link href="${bath}/js/tip/toastr.css" rel="stylesheet" type="text/css"/>

    <script src="${bath}/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${bath}/js/tip/toastr.min.js" type="text/javascript"></script>
</head>
<body>

</body>
</html>
<script>

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    toastr.options = {
        "positionClass": "toast-tip-center-center", //弹出窗的位置
        "timeOut": "1000" //展现时间
    };

    $(document).ready(function() {

        //获取url中的参数id
        function getQueryVariable(variable){
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] == variable){return pair[1];}
            }
            return(false);
        }

        var openIdParma = getQueryVariable("opendid");

        $.ajax({
            type : "POST", //用POST方式请求
            url : '${bath}/Portalcustomer/WeChatAuthLand', //目标地址
            data : {
                openid : openIdParma
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
                if(retCode == 1){
                    var navTypeParam = 1;
                    var retData = retInfo.data;
                    var id = retData.id;
                    var phoneParam = retData.phoneNumber;
                    var url ="${bath}/portalLink/linkToUserTerminalIndex?navType="+navTypeParam+"&uid="+id+"&phone="+phoneParam;
                    window.open(url,"_self");
                }else if(retCode == 2){
                    var url = "${bath}/portalLink/userTerminalLogin?openId="+openIdParma;
                    window.open(url,"_self");
                }else{
                    toastr.error("授权失败！");
                }
            },
            error:function(XMLHttpRequest, textStatus){
                //请求失败
                console.log(XMLHttpRequest);
                console.log(textStatus);
                toastr.error("授权失败！");
            }
        });
    });

</script>