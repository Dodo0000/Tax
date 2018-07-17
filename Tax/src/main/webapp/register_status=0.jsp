<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>





<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安徽省国家税务局税企互助交流平台</title>
	<link rel="shortcut icon" href="http://localhost:8080/Tax/resources/image/project.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/registerExt.css">
	<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<script type="text/javascript">
	$(function(){
		$("#messages").remove();
	})
</script>
<body>
	<!-- header start -->
	<%@ include file="header.jsp" %>
	<!--header end-->
	<!--content start-->
	<div class="content">
		<div class="path_nav">
			<span class="touch">当前位置：<a href="javascript:history.go(-1);"
				class="nav_style">注册</a> </span> <span class="touch">&nbsp;&gt;&nbsp;</span>
			<span class="touch"><a href="" class="nav_style">个人注册</a> </span>
		</div>
		<div class="content_main">
			<div class="content_top">
				<div class="personal_left">个人资料</div>
			</div>
			<div class="content_middle">
				<div class="content_middle_m">
					<!-- form表单提交注册信息 form start -->
					<!-- 要把form表单中的字段的name修改成TaxUser对应的-->
					<!-- 尝试去掉 enctype="multipart/form-data" -->
					<!-- 密码字段还是需要传md5以后加一个md5插件 -->
					<!-- onsubmit去掉 onsubmit="return checkUser();"-->
					<form id="addUser"
						action="http://localhost:8080/Tax/guest/register"
						method="post">
						<input type="hidden" name="type" value="0">
						<table style="margin: 0 auto;">
							<tr>
								<td style="width:25%;">用户名</td>
								<td style="width:75%;"><input id="userName" type="text"
									name="username" placeholder="请输入用户名" value="" />
								</td>
								<td><span id="userName1" class="yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;">邮箱</td>
								<td style="width:75%;"><input id="mail" type="text"
									name="email" placeholder="请输入邮箱" value="">
								</td>
								<td><span id="mail1" class="yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;">电话</td>
								<td style="width:75%;"><input id="userTelephone"
									type="text" name="telephone" placeholder="请输入电话" value="">
								</td>
								<td><span id="userTelephone1" class="yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;">密码</td>
								<td style="width:75%;"><input id="pwd" type="password"
									name="password" placeholder="请输入密码" value="">
								</td>
								<td><span id="pwd1" class="yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;">确认密码</td>
								<td style="width:75%;"><input id="confirmPwd"
									type="password" name="pwd" placeholder="请确认密码" value="">
								</td>
								<td><span id="confirmPwd1" class="yanzheng"></span>
								</td>
							</tr>
							<!-- 验证码功能以后这里需要添加 -->
							<!-- 设置自己编写的产生验证码的方法 -->
							<tr>
								<td style="width:25%;">验证码</td>
								<td style="width:75%;"><input data-ok="0" id="verifyCode"
									type="text" style="width:235px" placeholder="验证码"> <a><img
										onclick="updateVerifyCode();" class="Img"
										src="http://localhost:8080/Tax/guest/generateValidationCode"
										alt=""> </a>
								</td>
								<td><span id="code1" class="yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="content_middle_btn">
										<!-- 为注册按钮添加id -->
										<button id="register-submit" class="save_btn" type="button"
											onclick="checkUser()">注册</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
					<!-- form表单提交注册信息 form end -->
				</div>
			</div>
		</div>
	</div>
	
<script>
	//失去焦点的时候ajax异步检验用户名是否存在
	$("#userName").blur(function() {
		var userName = $("#userName").val();
		if (userName.length != 0 && userName != "") {
			/**这里以后url需要修改*/
			$.post('http://localhost:8080/Tax/guest/register/checkUsername', {
				username : $("#userName").val()
			}, function(data) {
				console.log(data);
				if (data['message'] == 'duplicate username') {
					$("#userName1").html('用户名已存在!');
				}
			});
		}
	});
	/**这个先不做 设计数据库的时候只是默认用户名要唯一即可*/
	//失去焦点的时候ajax异步检验用户电话号码是否存在
	/*
	$("#userTelephone").blur(function() {
		var userTelephone = $("#userTelephone").val();
		if (userTelephone.length != 0 && userTelephone != "") {
			$.post('http://localhost:8080/Tax/register/volidationUser', {
				userTelephone : $("#userTelephone").val()
			}, function(data) {
				console.log(data);
				if (data.userTelephone == 300) {
				} else {
					$("#userTelephone1").html('手机号已存在!');
				}
			});
		}
	});
	*/

	$('#userName').bind('input propertychange', function() {
		var userName = $("#userName").val();
		console.log("document--", userName);
		if (userName.length === 0) {
			$("#userName1").html('用户名不能为空!');
			return;
		} else {
			$("#userName1").html('');
		}
	});
	
	$('#mail').bind('input propertychange', function() {
		var mail = $("#mail").val();
		console.log("document--", mail);
		if (mail.length === 0) {
			$("#mail1").html('邮箱不能为空!');
			return;
		} else {
			$("#mail1").html('');
		}
	});
	
	$('#userTelephone').bind('input propertychange', function() {
		var userTelephone = $("#userTelephone").val()
		console.log("document--", userTelephone);
		if (userTelephone.length === 0) {
			$("#userTelephone1").html('电话号不能为空!');
			return;
		} else {
			$("#userTelephone1").html('');
		}
	});
	
	$('#pwd').bind('input propertychange', function() {
		var pwd = $("#pwd").val();
		console.log("document--", pwd);
		if (pwd.length === 0) {
			$("#pwd1").html('密码不能为空!');
			return;
		} else {
			$("#pwd1").html('');
		}
	});
	$('#confirmPwd').bind('input propertychange', function() {
		var confirmPwd = $("#confirmPwd").val()
		console.log("document--", confirmPwd);
		if (confirmPwd.length === 0) {
			$("#confirmPwd1").html('密码不能为空!');
			return;
		} else {
			$("#confirmPwd1").html('');
		}
	});
	$('#verifyCode').bind('input propertychange', function() {
		var confirmPwd = $("#verifyCode").val();
		console.log("document--", confirmPwd);
		if (verifyCode.length === 0) {
			$("#code1").html('验证码不能为空!');
			return;
		} else {
			$("#code1").html('');
		}
	});
	//更新验证码
	function updateVerifyCode() {
		event.target.src = event.target.src + "?t=" + Date.now();
	}
	//检查用户要提交的表单各个字段若都通过直接提交
	function checkUser() {
		//alert("in checkUser");
		var userName = $("#userName").val();
		var mail = $("#mail").val();
		var userTelephone = $("#userTelephone").val();
		var pwd = $("#pwd").val();
		var confirmPwd = $("#confirmPwd").val();
		var verifyCode = $("#verifyCode").val();

		if (userName.length == 0) {
			$("#userName1").html('用户名不能为空!');
			return false;
		}

		if (mail.length == 0) {
			$("#mail1").html('邮箱不能为空!');
			return false;
		}
		var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		if (!re.test(mail)) {
			$("#mail1").html('邮箱格式错误!');
			return false;
		}
		if (userTelephone.length == 0) {
			$("#userTelephone1").html('电话号不能为空!');
			return false;
		}
		var req = /^(?:13\d|14\d|15\d|17\d|18\d)-?\d{5}(\d{3}|\*{3})$/;
		if (!req.test(userTelephone)) {
			$("#userTelephone1").html('您输入的电话号码格式错误!');
			return false;
		}
		if (pwd.length == 0) {
			$("#pwd1").html('密码不能为空!');
			return false;
		}
		if (pwd.length > 10 || pwd.length < 3) {
			$("#pwd1").html('请输入3-10位密码!');
			return false;
		}
		if (confirmPwd.length == 0) {
			$("#confirmPwd1").html('密码不能为空!');
			return false;
		}
		if (pwd != confirmPwd) {
			$("#confirmPwd1").html('两次密码输入不一致!');
			return false;
		}
		if (verifyCode.length == 0) {
			$("#code1").html('验证码不能为空!');
			return false;
		}
		if ($("#verifyCode").data('ok') == '1') {
			return true;
		}
		//alert("*");
		/**通过这里post请求验证验证码*/
		if (verifyCode != null) {
			//alert("**");
			$.post('http://localhost:8080/Tax/guest/checkValidationCode', {
				inputValidationCode : $('#verifyCode').val()
			}, function(data) {
				console.log(data);
				dataJson = eval(data);
				console.log(dataJson);
				//alert(data);
				/**其实这里返回success仅仅是表单数据是对的*/
				if (dataJson['message'] == 'success') {
					alert("表单校验正确");
					$("#verifyCode").data('ok', '1');
					//$('#addUser').submit();
					$('#addUser').ajaxSubmit({
						url:'http://localhost:8080/Tax/guest/register',
						type:'post',
						success:function(data){
							alert('ajax success');
							if(data['message']=='success'){
								alert("注册成功");
								window.location.href='http://localhost:8080/Tax/login.jsp';
								return true;
							}
							else{
								alert("注册失败，重新注册");
								window.location.reload();
								return false;
							}			
						},
						error:function(data) {
	       					alert('服务器忙！');
	       					console.log(data);
	       					return false;
	       				}
					});
				} 
				else if(dataJson['message'] == 'invalid validation code') {
					//alert('1');
					$("#code1").html('验证码错误!');
					return false;
				}
				else if(dataJson['message'] == 'validation_code_token_error'){
					alert("token error !!!");
					window.location.reload();
					return false;
				}
				else{
					alert("未处理错误信息");
					return false;
				}
			});
		}
	};
</script>

	
	
	<!-- footer start -->		
	<%@ include file="footer.jsp" %>
	<!-- footer end -->
	
</body>
</html>
					