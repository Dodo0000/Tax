<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html> 
<head>
	<title>国税监管个人主页</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width" />
  	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/passwordService.css">
  	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/footer.css"/>
  	<script src="/lagsms/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
  	<style type="text/css">
	.content_middle_m table tr td:nth-child(1){text-align:left;}
	</style>
</head>
<body>
		<!-- 头部标题start -->
		<%@ include file="../header.jsp" %>
		<!-- 头部标题end -->

		<!-- 中间部分start -->
		<div class="content">
		<div style="margin-left:100px;margin-top:25px;color:black">
		<span class="">当前位置：<a style="color:black" href="javascript:history.go(-1);" class="nav_style">个人资料</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
			<span class=""><a href="" style="color:black"> 修改密码</a></span>
		</div>
		<div class="content_main">
			<div class="content_top">
				<div class="personal_left">密码修改</div>
			</div>
			<div class="gary">
				<div class="pink"></div>
			</div>
			<div class="content_middle">
				<div class="content_middle_m">
					<div id="error" style="color:red;">
						
					</div>
					<form id="updateForm" action="/lagsms/users/updatePwd" method="POST" onsubmit="return checkPwd();">
						<table style="margin: 0 auto;">
							<tr>
								<td style="width:25%;">原始密码</td>
								<td style="width:75%;">
									<input id="password" type="password" name="userPassword" placeholder="请输入原始密码" >
									<!-- <input id="password1"  type="hidden" > -->
								</td>
								<td>
									<span id="password1" class="update_yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;">新密码</td>
								<td style="width:75%;">
									<input id="newPassword" type="password" name="password" placeholder="请输入6-15位新密码">
									<!-- <input id="newPassWord1" type="hidden"> -->
								</td>
								<td>
									<span id="newPassword1" class="update_yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;">确认新密码</td>
								<td style="width:75%;">
									<input id="confirmPassword" type="password" name="confirmPassword" placeholder="请输入6-15位新密码">
									<!-- <input id="confrimPassword1" type="hidden"> -->
								</td>
								<td>
									<span id="confirmPassword1" class="update_yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;"></td>
								<td style="width:75%;">
									<button class="save_btn" type="submit">提交修改</button>
								</td>
							</tr>
						</table>
					</form>	
				</div>
<!-- 				<div class="content_middle_btn"> -->
<!-- 					<button class="save_btn">提交修改</button> -->
<!-- 				</div> -->
			</div>
			</div>
		</div>
		<!-- 中间部分start -->

		<!-- 底部内容start -->
	    <%@ include file="../footer.jsp" %>
		<!-- 底部内容end -->
		
		<script type="text/javascript">
			$('#password').bind('input propertychange',function(){
				var password = $("#password").val();
				if(password.length===0){
					$("#password1").html('密码不能为空!');
				}else{
					$("#password1").html('');
				}
			});
			$('#newPassword').bind('input propertychange',function(){
				var newPassword = $("#newPassword").val();
				if(newPassword.length===0){
					$("#newPassword1").html('密码不能为空！');					
				}else{
					$("#newPassword1").html('');
				}
				
			});		
			$('#confirmPassword').bind('input propertychange',function(){
				var confirmPassword = $("#confirmPassword").val();
				if(confirmPassword.length===0){
					$("#confirmPassword1").html('密码不能为空!');
				}else{
					$("#confirmPassword1").html('');
				}
			});
			function checkPwd() {
				var password = $("#password").val();
				if(password.length == 0){
					$("#password1").html('密码为必选项！');
					return false;
				}
				var newPassword = $("#newPassword").val();
				if(newPassword.length==0){
					$("#newPassword1").html('密码为必选项！');
					return false;
				}
				if(newPassword.length >15 || newPassword.length <6){
					$("#newPassword1").html('请输入6-15位密码！');
					return false;
				}
				var confirmPassword = $("#confirmPassword").val();
				if(confirmPassword.length==0){
					$("#confirmPassword1").html('密码为必选项！');
					return false;
				}
				if(newPassword != confirmPassword ){
					$("#confirmPassword1").html('两次密码不一致');
					return false;
				}
				return true;
				
				
				
				
			}
			
		</script>
</body>
</html>