
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
var server_context=basePath;

var idfrontBtn = "";
var IDcardBtn = "";
var licenseBtn = "";

$(function() {

	//上传身份证正面图片
	/*var idfrontBtn = $('#idfrontBtn'),
		idfrontShowBox = $('#idfrontShowBox');*/

    $('#idfrontBtn').change(function() {
		var self = $(this),
			file = document.getElementById('idfrontBtn').files[0]; //获取到上传控件对象files
		if(file) {

			fileSize(file);
            if ( fileSize(file)==false){
                $("#idfrontBtn").val("");
                toastr.error('每张不得超过5M！');
                return false;
            }
			var reader = new FileReader(); //创建一个FileReader对象

			reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
			reader.onload = function(e) { //当文件成功读取后
				var temp = '<li> <p class="id_front_imgs"><img src="' + this.result + '" alt="" id="idFrontImg"/> <span class="delete">&times;</span></p> </li>';

				/* 最多上传一张 */

				maxNum($('#idfrontBtn'), $('#idfrontShowBox'), 1);
                $('#idfrontShowBox').find('.init-img').hide();
                $('#idfrontShowBox').append(temp);

                //图片压缩方法
                var i = document.getElementById("idFrontImg");
                i.src = event.target.result;
                setTimeout(function () {
                    var quality = 50; //图像压缩比，越小压缩越多
                    idfrontBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                }, 10);
                //idfrontBtn = i.src;

			}
		}

	});

	/* 身份证正面点击delete 删除图片 */
	$('#idfrontShowBox').on('click', ".delete", function(e) {
		$(this).parent().parent('li').remove();
        $('#idfrontShowBox').find('.init-img').show();
        $('#idfrontBtn').val("");
		$('#idfrontBtn').removeProp('disabled');

	});
	/*身份证正面鼠标移入移出*/
	$('.sfzzm').hover(function(e) {
		$(this).attr("src", server_context+"/images/IDcardfront_mo.png")
	}, function() {
		$(this).attr("src", server_context+"/images/IDcardfront.png")
	});
	
	/*身份证反面上传图片*/
	$("#IDcardBtn").change(function() {
		var self = $(this),
			file = document.getElementById('IDcardBtn').files[0]; //获取到上传控件对象files
		if(file) {

			fileSize(file);
            if ( fileSize(file)==false){
                $("#IDcardBtn").val("");
                toastr.error('每张不得超过5M！');
                return false;
            }
			var reader = new FileReader(); //创建一个FileReader对象

			reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
			reader.onload = function(e) { //当文件成功读取后
                var temp = '<li> <p class="id_tails_imgs"><img src="' + this.result + '" alt="" id="idTailsImg"/><span class="delete">&times;</span></p></li>';

				/* 最多上传一张 */

				maxNum($("#IDcardBtn"), $("#IDcardshowBox"), 1);
				$("#IDcardshowBox").find('.init-img').hide();
				$("#IDcardshowBox").append(temp);

                //图片压缩方法
                var i = document.getElementById("idTailsImg");
                i.src = event.target.result;
                setTimeout(function () {
                    var quality = 50; //图像压缩比，越小压缩越多
                    IDcardBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                }, 10);
                //IDcardBtn = i.src;
			}
		}

	});
	
	/* 身份证反面点击delete 删除图片 */
	$('#IDcardshowBox').on('click', ".delete", function(e) {
		$(this).parent().parent('li').remove();
		$("#IDcardshowBox").find('.init-img').show();
		$("#IDcardBtn").val("");
		$('#IDcardBtn').removeProp('disabled');

	});
	
	/*身份证反面鼠标移入移出*/
	$('.sfzfmId').hover(function(e) {
		$(this).attr("src", server_context+"/images/IDcardbase_mo.png")
	}, function() {
		$(this).attr("src", server_context+"/images/IDcardbase.png")
	});
	
	/*营业执照上传*/
	$("#licenseBtn").change(function() {
		var self = $(this),
			file = document.getElementById('licenseBtn').files[0]; //获取到上传控件对象files
		if(file) {

			fileSize(file);
            if ( fileSize(file)==false){
                $("#licenseBtn").val("");
                toastr.error('每张不得超过5M！');
                return false;
            }
			var reader = new FileReader(); //创建一个FileReader对象

			reader.readAsDataURL(file); //将文件以Data URL形式读入页面 ，并且将结果存在result属性中
			reader.onload = function(e) { //当文件成功读取后
                var temp = '<li> <p class="license_imgs"><img src="' + this.result + '" alt="" id="licenseImg"/><span class="delete">&times;</span></p></li>';

				/* 最多上传一张 */

				maxNum($("#licenseBtn"), $("#licenseShowBox"), 1);
				$("#licenseShowBox").find('.init-img').hide();
				$("#licenseShowBox").append(temp);

                //图片压缩方法
                var i = document.getElementById("licenseImg");
                i.src = event.target.result;
                setTimeout(function () {
                    var quality = 50; //图像压缩比，越小压缩越多
                    licenseBtn = i.src = jic.compress(i, quality).src; //压缩图像后重新设置内容
                }, 10);
                //licenseBtn = i.src;
			}
		}

	});
	
	/* 执照点击delete 删除图片 */
	$('#licenseShowBox').on('click', ".delete", function(e) {
		$(this).parent().parent('li').remove();
		$("#licenseShowBox").find('.init-img').show();
		$("#licenseBtn").val("");
		$('#licenseBtn').removeProp('disabled');

	});
	
	/*营业执照鼠标移入移出*/
	$('.yyzz').hover(function(e) {
		$(this).attr("src", server_context+"/images/businessLicense_mo.png")
	}, function() {
		$(this).attr("src", server_context+"/images/businessLicense.png")
	});
	
	/* 点击注册 */
	$('.nextbtn').on('click', function(e) {
        toastr.options = {
            "positionClass": "toast-nav-center-center", //弹出窗的位置
            "timeOut": "1000", //展现时间
        };
        if (! $('.moreBody').validate('submitValidate')){
            return false;
        }
        if (! $('.picturesee').validate('submitValidate')){
            return false;
        }

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var enterPrisename = $("#enterPrisename").val();
        var registerAdress = $("#registerAdress").val();
        var legalPersonname = $("#legalPersonname").val();
        var legalPersonphone = $("#legalPersonphone").val();
        var legalPersonID = $("#legalPersonID").val();
        var businessLicensenum = $("#businessLicensenum").val();
        var contactPersonname = $("#contactPersonname").val();
        var contactPersonphone = $("#contactPersonphone").val();
        var zipCode = $("#zipCode").val();
        var email = $("#email").val();


        $.ajax({
            type : "POST", //用POST方式传输
            url : server_context+'/company/addCompany', //目标地址
            data : {
                entCode:$("#userId").val(),
                name:enterPrisename,
                registAddress:registerAdress,
                legalPersonName:legalPersonname,
                legalPersonContact:legalPersonphone,
                legalPersonIdcard:legalPersonID,
                businessLicence : businessLicensenum,
                linkmanName : contactPersonname,
                linkmanMobile:contactPersonphone,
                zipCode:zipCode,
                email:email,
				model:$("#userId").val() + "Register",
                linkmanIdcardfrontPhoto:idfrontBtn,
                linkmanIdcardbasePhoto:IDcardBtn,
                businessLicensePhoto:licenseBtn
            },
            beforeSend: function(jqXHR) {
                if (undefined != header){
                    jqXHR.setRequestHeader(header, token);
                }
            },
            dataType : "json", //数据格式:JSON
            success : function(retInfo) {
                $(".black_overlay").css("display","block");
            	$(".trueinfoContent")[0].innerHTML=retInfo.data;
            }
        });

		//$(".black_overlay").css("display","block");
	});

	/*/!*点击蒙版隐藏*!/
	$('#fade').on('click', function(e) {
		$(".black_overlay").css("display","none");
	});
	
	/!*阻止蒙版点击事件*!/
	$('#success').on('click', function(event) {
		 var e=window.event||e;
    if(document.all){  //只有ie识别
        e.cancelBubble=true;
    }else{
        e.stopPropagation();
    }
	});*/
})
/* 上传的图片大小 返回值为 图片大小 */
function fileSize(file) {
	var fileSize = 0;
	if(file.size > 1024 * 1024 * 5) {
		fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
		return false;
	} else {
		fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
		return fileSize;
	}
}

/* 最多上传数 */
function maxNum(btn, showBox, num) {
	if(showBox.find('li').length >= (num - 1)) {
		btn.prop('disabled', 'disabled');
		showBox.find('.init-img').hide();
	} else {
		btn.removeProp('disabled');
		showBox.find('.init-img').show();
	}
}

function getObjectURL(file) {
    var url = null ;
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
}