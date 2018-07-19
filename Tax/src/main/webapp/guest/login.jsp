<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>安徽省国家税务局税企互助交流平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="Simple">
	<!--  360浏览器专用 -->
	<meta name="renderer" content="ie-stand" />
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/login.css">
    <script type="text/javascript" src="http://localhost:8080/Tax/resources/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="http://localhost:8080/Tax/resources/js/jquery.cookie.js"></script>
    <script type="text/javascript">
	  	//ajax不缓存
	    jQuery.ajaxSetup({cache:false});
		//支持Enter键登录
		document.onkeydown = function(e){
			if(!e) e = window.event;
			if((e.keyCode || e.which) == 13){
				var obtnLogin=document.getElementById("submit_btn");
				obtnLogin.focus();
			}
		};
		/*
		$(function(){
			$("#messages").remove();
			//提交表单
			$('#submit_btn').click(function(){
				if($('.username').val() == ''){
					//阻塞状态弹出
					$.messager.alert('提示',"请填写用户名！",'info');
					$('.username').focus();
				}else if($('.password').val() == ''){
					//阻塞状态弹出
					$.messager.alert('提示',"请填写登录密码！",'info');
					$('.password').focus();
				}else{
					$('#loginForm').submit();
				}
			});
		});
		*/
		$(document).ready(function(){
			$('.username').focus();
		});
		//返回首页
		function goBack(){
			window.location.href="http://localhost:8080/Tax/index.jsp";
		}
	</script>
	<style type="text/css">
	html{height:100%;}
	body{
		display: flex;
		flex-direction: column;
		-webkit-display: flex;
		height: 100%;
	}
	.header{flex: 0 0 auto;}
	.content{flex: 1 0 auto;}
	.liuan_footers{flex: 0 0 auto;}
	</style>
  </head>	

<body>
	<%@ include file="../header.jsp" %>
	<!--content start-->
	<div class="content">
		<div class="content_main">
			<!-- 原来有 onsubmit="return login();" action="http://localhost:8080/Tax/guest/login" -->
			<form class="content_login" id="loginForm" method="post" >
				<ul class="login_opacity">
					<li>
						<span style="font-size: 20px;">登录系统</span>
					</li>
					<li id="lines">
					</li>
					<li class="login_yanzheng">
						<div><input id="j_username" type="text" placeholder="用户名" name="username"></div>
						<span id="userName1"></span>
					</li>
					<li class="login_yanzheng">
						<div><input id="j_password" type="password" placeholder="密码" name="password"></div>
						<span id="password1"></span>
					</li>
					<li class="login_yanzheng">
						<div><input  data-ok="0" id="verifyCode" type="text"  style="width: 64%;"></div>
						<a>
							<img onclick="updateVerifyCode();" src="http://localhost:8080/Tax/guest/generateValidationCode" alt="">
						</a>
						<span id="code1" style="display:inline-block;"></span>
						
					</li>
					<!-- 获取记住密码 -->
					<li>
						<input type="checkbox" value="" id="j_rmbUser" style="vertical-align: middle;"><span style="color: #1B55A9;">记住密码</span><a href="#" onclick="report();"></a>
					</li>
					<li>
						<!-- 原本的onclick="save()"-->
						<button id="submit_btn" type="button" onclick="login()">登录</button>
						<div><a href="http://localhost:8080/Tax/register.jsp" style="color: #1B55A9;" id="register">立即注册<img src="http://localhost:8080/Tax/resources/image/login/z_c.png" alt=""></a></div>
					</li> 
				</ul>
			</form>
			<div style="clear: both;"></div>
		</div>
	</div>
	<!--content end-->
	
	<!-- footer start -->		
	<%@ include file="../footer.jsp" %>
	<!-- footer end -->		


	<script type="text/javascript">
	//短信验证
	var verification='';
	var tel;
	function showtime(t){ 
		  //ajax请求
	     tel=$("#userTel").val();
	   /*  returnValue{"code":22,"msg":"验证码类短信1小时内同一手机号发送次数不能超过3次","detail":"验证码类短信1小时内同一手机号发送次数不能超过3次"} */
	    $.ajax({
	    	   type: "GET",
	    	   url: "http://localhost:8080/Tax/getVerification",
	    	   data:"userTelephone="+tel,
	    	   async: false,
	    	   success: function(msg){
	    		   var returnValue= null;
	    		  		 if(msg.returnValue=="0"){
	  	    			   zeroModal.error('请输入已注册的手机号!');
	  	    		   }else {
	  	    			   var returnValue=JSON.parse(msg.returnValue);
	  	    			   if(returnValue.code==22){
	  	    				 zeroModal.alert(returnValue.msg);
	  	    			   }else if(returnValue.code==0){
	  	    				 verification=msg;   
	  	    			   }/* else if(returnValue.code==3){
	  	    				 zeroModal.alert("账户余额不足,请充值后重试!");
	  	    				 return;
	  	    			   } */else{
	  	    				 zeroModal.alert("获取验证码失败!");
	  	    				 return;
	  	    			   }
	  	    			   document.myform.phone.disabled=true; 
	  	    			    for(i=1;i<=t;i++) { 
	  	    			        window.setTimeout("update_p(" + i + ","+t+")", i * 1000); 
	  	    			    } 
	  	    		   }
	    	   }
	    	});
	} 
	function update_p(num,t) { 
	    if(num == t) { 
	        document.myform.phone.value =" 重新发送 "; 
	        document.myform.phone.disabled=false; 
	    } 
	    else { 
	        printnr = t-num; 
	        document.myform.phone.value = " (" + printnr +")秒后重新发送"; 
	    } 
	} 
	
	
		$('#j_username').bind('input propertychange', function() {  
			var userName = $("#j_username").val();
	
			 if (userName.length===0){
					$("#userName1").html('用户名不能为空!');
					return;
			  }else{
					$("#userName1").html('');
			  }
		}); 
		$('#j_password').bind('input propertychange', function() {  
			var pwd = $("#j_password").val();
	
			 if (pwd.length===0){
					$("#password1").html('密码不能为空!');
					return;
			  }else{
					$("#password1").html('');
			  }
		});  
		$('#verifyCode').bind('input propertychange', function() {  
			var verifyCode = $("#verifyCode").val();
	
			 if (verifyCode.length===0){
					$("#code1").html('验证码不能为空!');
					return;
			  }else{
					$("#code1").html('');
			  }
		}); 
		function updateVerifyCode() {
			event.target.src = "verifyCode?t=" + Date.now();
		}
/* 		var menu = document.getElementById("menu").getElementsByTagName("a");
		for(var i = 0; i < menu.length; i++) {
			//给每个a元素绑定一个点击事件
			menu[i].onclick = function(event) {
				//清空之前选中的样式
				for(var j = 0; j < menu.length; j++) {
					menu[j].parentElement.className = "";
				}
				//每次点击就添加一个class
				event.toElement.parentElement.className = "curr";
			}
		} */
		
		/**修改这里的login()方法即可*/
		function login(){
			alert("login()");
			var userName = $("#j_username").val();
			var pwd = $("#j_password").val();
			var verifyCode = $("#verifyCode").val();
			if(userName.length == 0){
				$("#userName1").html('用户名不能为空!');
				return false;
			}
			if(pwd.length == 0){
				$("#password1").html('密码不能为空!');
				return false;
			}
			if(verifyCode.length == 0){
				$("#code1").html('验证码不能为空!');
				return false;
			}
			if($("#verifyCode").data('ok') == '1') {
				return true;
			}
			alert("*");
			if(verifyCode != null) {
				 alert("**");
				 $.post('http://localhost:8080/Tax/guest/checkValidationCode', {
					inputValidationCode : $('#verifyCode').val()
				}, function(data) {
					console.log(data);
					dataJson = eval(data);
					console.log(dataJson);

					if(dataJson['message'] == 'success') {
						$("#verifyCode").data('ok', '1');
						//$('#loginForm').submit();
						/**注意要引入jquery-form插件*/
						$('#loginForm').ajaxSubmit({
							url:'http://localhost:8080/Tax/guest/login',
							type:'post',
							success:function(data){
								alert('ajax success');
								if(data['message']=='success'){
									alert("登陆成功");
									window.location.href='http://localhost:8080/Tax/index.jsp';
									return true;
								}
								else{
									alert("用户名或密码不正确");
									window.location.href='http://localhost:8080/Tax/login.jsp';
									return false;
								}
							},
							error:function(data){
								alert('服务器忙！');
	       						console.log(data);
	       						return false;
							}
						});
					}
					else if(dataJson['message'] == 'invalid validation code'){
						//alert(1);
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
			return false;
		}
		
	
		/* //初始化页面时验证是否记住了密码
		$(document).ready(function() {
		    if ($.cookie("rmbUser") == "true") {
		        $("#j_rmbUser").attr("checked", true);
		        $("#j_username").val($.cookie("userName"));
		        $("#j_password").val($.cookie("passWord"));
		    }
		});
		//保存用户信息
		function save() {
		    if ($("#j_rmbUser").attr("checked") == true) {
		        var userName = $("#j_username").val();
		        var passWord = $("#j_password").val();
		        $.cookie("rmbUser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie
		        $.cookie("userName", userName, { expires: 7 }); // 存储一个带7天期限的 cookie
		        $.cookie("passWord", passWord, { expires: 7 }); // 存储一个带7天期限的 cookie
		    }
		    else {
		        $.cookie("rmbUser", "false", { expires: -1 });
		        $.cookie("userName", '', { expires: -1 });
		        $.cookie("passWord", '', { expires: -1 });
		    }
		} */
		
		//忘记密码
		function report(){
			$('.ex_liuan_PopWinbg').show();
		}
		function closePopWin(){
			$('.ex_liuan_PopWinbg').hide();
		}
		//忘记密码
		function passSure(){
			var text=$("#text").val();
			var telephone=$("#userTel").val();
			if(telephone!=''&&telephone != undefined){
				if(text!=''){
					if(text==verification){
						$('.ex_liuan_PopWinbg1').show();
					}else{
						zeroModal.error('您输入的验证码不正确!');
						$('.ex_liuan_PopWinbg').show();
					}
				}else{
					zeroModal.alert('请输入您的验证码!');
					$('.ex_liuan_PopWinbg').show();
				}
			}else{
				zeroModal.alert('请输入您的手机号!');
				$('.ex_liuan_PopWinbg').show();
			}
		}
		function closeNewPass(){
			$('.ex_liuan_PopWinbg1').hide();
		}
		function updatePassword(){
			if($("userPassword").val()==$("userPasswordTwo").val()){
				  $.ajax({
			    	   type: "POST",
			    	   url: "http://localhost:8080/Tax/updatePassword",
			    	   data:"userTelephone="+tel,
			    	   async: false,
			    	   success: function(msg){
			    		   zeroModal.success(msg);
			    	   }
			    	});
			}else{
				 zeroModal.alert("两次密码输入不一致!");
				
			}
		}
	</script>
</body>
</html>