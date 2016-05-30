/**
 * 
 */
function newlogin(){
	var username = $('#username').val();
	var password = $('#password').val();
	
	//密码MD5加密
	var encode_password = $.md5(password);
	
	if($.strIsNull(username)) {
		 $('#login_msg').empty();
		 $('#login_msg').append("<font color='red'>请输入用户名！</font>");
		 $('#username').focus();
		 return false;
	}else if($.strIsNull(password)){
		 $('#login_msg').empty();
		 $('#login_msg').append("<font color='red'>请输入用户密码！</font>");
		 $('#password').focus();
		 return false;
	}

	$.ajax({
		type:"POST",
		url: rootPath + "/user/loginCheck",
		data:{"username":username,"password":encode_password},
		success: function(json){
			if(json == "1"){
				  window.location.href = rootPath+"/";
			}else{
				$('#login_msg').empty();
				$('#login_msg').append("<font color='red'>用户名或者密码错误</font>");
				return;
			}
		}
		
	});
}