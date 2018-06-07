//后台侧边导航js
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
var server_context=basePath;
console.log(server_context);

$(function() {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $.ajax({
        type : "POST", //用POST方式传输
        url : server_context+'/menuToResource', //目标地址
        data : {},
        beforeSend: function(jqXHR) {
            if (undefined != header){
                jqXHR.setRequestHeader(header, token);
            }
        },
        dataType : "json", //数据格式:JSON
        success : function(retInfo) {
            var retData=retInfo.data;
            console.log(retData);
            /*生成左侧导航栏菜单*/
            if (retData.children !=null){
                var $bodyul=$("<ul class='nav' id='side-menu'></ul>")
                var parentList=retData.children;
                for(var i =0;i<parentList.length;i++){
                    var $li=$("<li class=''></li>");
                    switch (parentList[i].name){
                        case "企业管理" :
                            var $a=$("<a href='#'><i class='fa fa-home fa-fw'></i>&nbsp;"+parentList[i].name+"<span class='fa arrow'></span></a>");
                            break;
                        case "企业信息" :
                            var $a=$("<a href='#'><i class='fa fa-laptop fa-fw'></i>&nbsp;"+parentList[i].name+"<span class='fa arrow'></span></a>");
                            break;
                        case "监管码管理" :
                            var $a=$("<a href='#'><i class='fa fa-barcode fa-fw'></i>&nbsp;"+parentList[i].name+"<span class='fa arrow'></span></a>");
                            break;
                        case "扶贫基地管理" :
                            var $a=$("<a href='#'><i class='fa fa-handshake-o fa-fw'></i>&nbsp;"+parentList[i].name+"<span class='fa arrow'></span></a>");
                            break;
                        case "中医院管理" :
                            var $a=$("<a href='#'><i class='fa fa-hospital-o fa-fw'></i>&nbsp;"+parentList[i].name+"<span class='fa arrow'></span></a>");
                            break;
                    }
                    /*var $a=$("<a href='#'><i class='fa fa-home fa-fw'></i>&nbsp;"+parentList[i].name+"<span class='fa arrow'></span></a>");*/
                    $($li).append($a);
                    if (parentList[i].children !=null){
                        var childrenList=parentList[i].children;
                        var $ul=$("<ul class='nav nav-second-level'></ul>");
                        for(var k =0;k<childrenList.length;k++){
                            /*活动模板管理无内容，暂时隐调*/
                                var str=JSON.stringify(childrenList[k].resourceUrl);
                                var newstr=str.substring(1,str.length-4);

                                var index = newstr.lastIndexOf("\/");
                                var strUrl  = newstr .substring(index + 1, newstr .length);

                                var $childrenli =$("<li> <a link='"+server_context+""+newstr+"' id='"+strUrl+"'>"+childrenList[k].name+"</a></li>");
                            $($ul).append($childrenli);
                        }
                        $($li).append($ul);
                    }
                    $($bodyul).append($li);
                }
                $(".sidebar-nav").append($bodyul);
            }
            /*生成结束*/

            /*渲染菜单*/
            $('#side-menu').metisMenu();
            /*添加二级菜单的点击事件*/
            $(".collapse").on("click","li a", function() {
                var linkUrl = $(this).attr("link");
                goNewPage(linkUrl);
            });
        }
    });
});

function goNewPage(url) {
    var srcUrl = url;
    $("#iframe-main").attr("src", srcUrl);

    var index = srcUrl .lastIndexOf("\/");
    var strUrl  = srcUrl .substring(index + 1, srcUrl .length);

    /*这么写好傻*/
    if(strUrl != "company"){
        $("#company").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#company").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "AuditMgmt"){
        $("#AuditMgmt").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#AuditMgmt").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "applyMgmt"){
        $("#applyMgmt").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#applyMgmt").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "downloadCode"){
        $("#downloadCode").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#downloadCode").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "applyRecords"){
        $("#applyRecords").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#applyRecords").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });

    }

    if(strUrl != "queryCompanyDetails"){
        $("#queryCompanyDetails").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#queryCompanyDetails").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "applyCode"){
        $("#applyCode").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#applyCode").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "aidBase"){
        $("#aidBase").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#aidBase").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "medicinalMaterials"){
        $("#medicinalMaterials").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#medicinalMaterials").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "entOrders"){
        $("#entOrders").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#entOrders").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "purchaseRecords"){
        $("#purchaseRecords").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#purchaseRecords").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "hospitalInfo"){
        $("#hospitalInfo").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#hospitalInfo").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }

    if(strUrl != "hospitalOrders"){
        $("#hospitalOrders").css({
            "color":"#bfbfbf",
            "background-color":"#313541"
        });
    }else{
        $("#hospitalOrders").css({
            "color":"#FFFFFF",
            "background-color":"#3c67c0"
        });
    }
}