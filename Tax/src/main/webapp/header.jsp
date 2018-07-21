<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
	    <meta name="viewport" content="width=device-width"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/header.css"/>	
	    <script type="text/javascript" src="http://localhost:8080/Tax/resources/zeroModal/zeroModal.min.js" charset="utf-8"></script>
	    <script type="text/javascript" src="http://localhost:8080/Tax/resources/js/jquery.form.js" charset="utf-8"></script>
	    <link rel="stylesheet" href="http://localhost:8080/Tax/resources/zeroModal/zeroModal.css"/>
	    <link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
    </head>
    <body>
    	<div class="header" style="display:flex;justify-content:space-around;">
    	<div class="logo"></div>
		<div class="nav">
			<ul id="tabs_nav" style="display:flex;justify-content:space-around;">
				<li id="oneplus"><a href="http://localhost:8080/Tax/index.jsp" id="one">首页</a><span class="underline"></span></li>
				<li id="twoplus"><a href="http://localhost:8080/Tax/questions.jsp" id="two">咨询</a></li>
				<li id="threeplus"><a href="http://localhost:8080/Tax/posts_type=0.jsp" id="three">经验分享</a></li>
				<li id="fourplus"><a href="http://localhost:8080/Tax/posts_type=1.jsp" id="four">专业解读</a></li>
				<li id="fiveplus"><a href="http://localhost:8080/Tax/usersZone.jsp" id="five">用户专区</a></li>
				<form action="http://localhost:8080/Tax/question/search">
					<li class="herader_search" style="visibility: hidden;">
						<div class="s_wrap">
						    <a href="http://localhost:8080/Tax/questions/search">
						   	 <img alt="" src="http://localhost:8080/Tax/resources/image/icon/fdj.png" class="magnifying">
						    </a>
							<input type="text" id="head_srarch" name="title" class="ssearch" value="搜索问题…"/>
						</div>
					</li>
				</form>

			</ul>
		</div>
		<!--   用户未登录     -->

		<div class="but">
			<!-- 若是登陆的话呀把这个消息提醒做出来 -->
			<div class="your_meaasge" id="messages" hidden='hidden'>
					<a id="news"  href="http://localhost:8080/Tax/notifies/notificationPopWin" class="newss" title="新消息未读数量"></a>
					  <a href="http://localhost:8080/Tax/notifies/notificationPopWin" >
						<img src="http://localhost:8080/Tax/resources/image/new-message.png" title="新消息提醒" class="message">
					</a> 
			</div>
			<div class="but_content">				
						<!--  未登录状态 -->
						<a id='' href="http://localhost:8080/Tax/login" style="padding: 0 50px;">
							<!-- 若js判断登陆 要修改为用户uid对应头像 -->
							<img id="avatarImgHeader" class="person">
							
						</a>
						<div style="position: absolute; left: 20px; line-height: 0px;">
							<!-- 若js判断登陆 这里a内容改为 用户名字 href改为userzone -->
							<div style="line-height: 13px;">
								<a id='login_area' href="http://localhost:8080/Tax/guest/login.jsp">登录</a>
								<a href="#" id="welcome_area"></a>
							</div>
							<div style="line-height: 13px;">&nbsp;/&nbsp;</div>
							<!-- 若js判断登陆 这里a内容改为 退出 href改为logut -->
							<div style="text-align: left; line-height: 13px;">
								<a id='register_area' href="http://localhost:8080/Tax/guest/register.jsp">注册</a>
								<a href="javascript:logout()" id="logout_area">退出</a>
							</div>
						</div>	
			</div>
		</div>
	</div>
		
		<!-- 用户登录  -->
		<script>
			//ready
			$(function() {
				loginCheck();
			});
			
			/**执行的向后问题*/
			function logout() {
				$.ajax({
					url:'http://localhost:8080/Tax/user/logout',
					type:'post'
				});
				alert("goodbye");
				window.location.href='http://localhost:8080/Tax';
			}
			
			/**在这里判断用户是否已经登陆了*/
			function loginCheck(){
				//alert("loginCheck()");
				//cookie _user->(uid;username;password)
				var cookie = document.cookie;
				var field = cookie.split(';');
				var hasLogin = false;
				for(var i in field){
					var info = field[i].split('=');
					if(info[0].trim() == '_user'){
						hasLogin = true;
						//alert("has login");
						$.ajax({
							url:'http://localhost:8080/Tax/guest/decode',
							type:'get',
							data:{
								str:info[1].trim()
							},
							success:function(data) {
								//alert(data['result']);
								//显示用户名
								$('#welcome_area').text(data['result'].split(';')[1]);
								/**登陆后就设置头像*/
								initAvatarHeader();	
							},
							error:function(data) {
								$('#welcome_area').text('欢迎您');
								alert('decode progress failed')
								console.log(data);
							}
						});
					}
				}
				if(hasLogin) {
					$('#login_area').hide();
					$('#register_area').hide();
					$('#welcome_area').show();
					$('#logout_area').show();
					//设置用户那个圆形头像的连接
					$('.but_content').children('a:eq(0)').attr('href','http://localhost:8080/Tax/user/personalCenter.jsp'); 
				}
				else {
					$('#login_area').show();
					$('#register_area').show();
					$('#welcome_area').hide();
					$('#logout_area').hide();
					//设置用户那个圆形头像的连接
					$('.but_content').children('a:eq(0)').attr('href','http://localhost:8080/Tax/guest/login.jsp'); 
					$('#avatarImgHeader').attr('src', 'http://localhost:8080/Tax/resources/image/header/u198.png');
				}
			}
			
			/**根据用户设置头像*/
			function initAvatarHeader(){
				$('#avatarImgHeader').attr('src', 'http://localhost:8080/Tax/user/generateUserAvatar');
			}
		</script>
		
		<script>
	        $(function(){
	           $(".user_text").hover(function(){
	               var width_a = $(this).width();
	               var width_b = $(this).find(".user_id").width();
	               var indent_px = width_a - width_b;
	               if( width_a <= width_b ){
	                   $(this).css("text-indent",indent_px);
	               }
	           },function(){
	               $(this).css("text-indent","0");
	           });
	        });
	    </script>
	      <!-- input点击清除value值 -->
	    <script type="text/javascript">
			wap_val = [];
			$(".ssearch").each(function(i) {
				wap_val[i] = $(this).val();
				$(this).focusin(function() {
					if ($(this).val() == wap_val[i]) {
						$(this).val("");
					}
				}).focusout(function() {
					if ($.trim($(this).val()) == "") {
						$(this).val(wap_val[i]);
					}
				});
			});
			//  用户名显示
			 $(".user_id").each(function(){
			  var maxwidth=4;
			  if($(this).text().length > maxwidth){
			    $(this).text($(this).text().substring(0,maxwidth));
			    $(this).html($(this).html()+'...');
			  }
			}); 
		</script>
		
		<!-- 在这里判断用户是否登陆？？？ -->
		<script>
			$(function() {
				$(".check_user_login").click(function(event) {
					event.preventDefault();
					zeroModal.alert('请登录用户!');
				});
			});
			
			
		</script>
		
		<script>
		// 窗体加载完成时轮询
		var t, notifyNum = 0;
		window.onload = function() {
			loadNotifies();
			t = setInterval(loadNotifies, 10000); //每10秒执行一次
		}
		// 窗体关闭之前清除此定时器
		window.onbeforeunload = function() {
			clearInterval(t);
		}
		
		//消息提示
		function loadNotifies() {
			var param = {
				pagingOrNot : "not",
				readOrUnread : "0"
			};
			// 获取所有的通知
			$.get('http://localhost:8080/Tax/notifies/count', param, function(data) {
				if(notifyNum == data) {
					return;
				}
				notifyNum = data;
				var numTxt = "";
				if(notifyNum >= 100) {
					numTxt = "99+";
				} else if(notifyNum == 0) {
					numTxt = "";
				}
				$("#news").text(numTxt);
			});
		}
		</script>
	</body>