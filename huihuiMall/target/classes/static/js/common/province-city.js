//获取省市信息
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
var server_context=basePath;
console.log(server_context);

function  getProvinceCityInfo() {
    $.ajax({
        type : "POST", //用POST方式传输
        url : server_context+'/address/queryProvince', //目标地址
        data : {},
        beforeSend: function(jqXHR) {
            if (undefined != header){
                jqXHR.setRequestHeader(header, token);
            }
        },
        dataType : "json", //数据格式:JSON
        success : function(retInfo) {
            var retData = retInfo.data;
            var retDataLength = retData.length;

            for(var p = 0; p < retDataLength; p++){
                var id = retData[p].id;
                var provinceName = retData[p].province_name;

                var provinceHtml = "<option value="+id+">"+provinceName+"</option>";

                $("#province").append(provinceHtml);
            }
        }
    });
};

//获取地市级信息
$("#province").change(function(){
    var provinceID = $("#province").find("option:selected").val();
    $("#city").empty();
    $("#city").html("<option value='0'>地级市</option>");
    $.ajax({
        type : "POST", //用POST方式传输
        url : server_context+'/address/queryAddress', //目标地址
        data : {
            provinceId : provinceID
        },
        beforeSend: function(jqXHR) {
            if (undefined != header){
                jqXHR.setRequestHeader(header, token);
            }
        },
        dataType : "json", //数据格式:JSON
        success : function(retInfo) {
            var retData = retInfo.data;
            var retDataLength = retData.length;

            for(var c = 0; c < retDataLength; c++){
                var cityID = retData[c].cityId;
                var cityName = retData[c].cityName;

                var cityHtml = "<option value="+cityID+">"+cityName+"</option>";

                $("#city").append(cityHtml);
            }
        }
    });
});

//获取选中的省、地级市信息
function getSelectedProvinceCityInfo(provinceID,cityID){
    var pID = provinceID;
    var cID = cityID;

    $("#modifyProvince").empty();
    $("#modifyProvince").html("<option value='0'>省份</option>");

    $("#modifyCity").empty();
    $("#modifyCity").html("<option value='0'>地级市</option>");

    $.ajax({
        type : "POST", //用POST方式传输
        url : server_context+'/address/queryProvince', //目标地址
        data : {},
        beforeSend: function(jqXHR) {
            if (undefined != header){
                jqXHR.setRequestHeader(header, token);
            }
        },
        dataType : "json", //数据格式:JSON
        success : function(retInfo) {
            var retData = retInfo.data;
            var retDataLength = retData.length;

            for(var p = 0; p < retDataLength; p++){
                var id = retData[p].id;
                var provinceName = retData[p].province_name;
                if(id == pID){
                    var provinceHtml = "<option value="+id+" selected='selected'>"+provinceName+"</option>";
                }else{
                    var provinceHtml = "<option value="+id+">"+provinceName+"</option>";
                }

                $("#modifyProvince").append(provinceHtml);
            }

            $.ajax({
                type : "POST", //用POST方式传输
                url : server_context+'/address/queryAddress', //目标地址
                data : {
                    provinceId : pID
                },
                beforeSend: function(jqXHR) {
                    if (undefined != header){
                        jqXHR.setRequestHeader(header, token);
                    }
                },
                dataType : "json", //数据格式:JSON
                success : function(retInfo) {
                    var retData = retInfo.data;
                    var retDataLength = retData.length;

                    for(var s = 0; s < retDataLength; s++){
                        var cityID = retData[s].cityId;
                        var cityName = retData[s].cityName;

                        if(cityID == cID){
                            var cityHtml = "<option value="+cityID+" selected='selected'>"+cityName+"</option>";
                        }else{
                            var cityHtml = "<option value="+cityID+">"+cityName+"</option>";
                        }
                        $("#modifyCity").append(cityHtml);
                    }
                }
            });
        }
    });
};

$("#modifyProvince").change(function(){

    var provinceID = $("#modifyProvince").find("option:selected").val();
    $("#modifyCity").empty();
    $("#modifyCity").html("<option value='0'>地级市</option>");

    $.ajax({
        type : "POST", //用POST方式传输
        url : server_context+'/address/queryAddress', //目标地址
        data : {
            provinceId : provinceID
        },
        beforeSend: function(jqXHR) {
            if (undefined != header){
                jqXHR.setRequestHeader(header, token);
            }
        },
        dataType : "json", //数据格式:JSON
        success : function(retInfo) {
            var retData = retInfo.data;
            var retDataLength = retData.length;

            for(var c = 0; c < retDataLength; c++){
                var cityID = retData[c].cityId;
                var cityName = retData[c].cityName;

                var cityHtml = "<option value="+cityID+">"+cityName+"</option>";

                $("#modifyCity").append(cityHtml);
            }
        }
    });
});