<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>安徽省国家税务局税企互助交流平台</title>
		<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/sendFtby.css">
		<script type="text/javascript" src="http://localhost:8080/Tax/resources/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/config.js"></script>
		<script type="text/javascript">
			window.onload = function a() {
				console.log("1");
				console.log("user_1530497245745");
				console.log("u0001");
			}

			function send() {
				var text = $("#text").val();
				var content=editor.getData();
				if(text === "") {
					alert("请填写私信内容");
					return;
				}
				var form = document.getElementById("formid");
				var formData=new FormData(form);
				formData.set('content',content);
				$.ajax({
					url: 'http://localhost:8080/Tax/sendLetter',
					type: 'POST',
					processData: false,
					contentType: false,
					data: formData,
					success: function(data) {
						console.log(data);
						history.go(-1);
					}
				});

			}
		</script>
	</head>
	<body>
		<%@ include file="header.jsp" %>
		<div class="path_nav" style="margin-left:100px;margin-right:150px;">
		<span class="">当前位置：<a href="javascript:history.go(-1);" class="nav_style">用户专区</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
				<span class=""><a href="" class="nav_style">发私信</a></span>
		</div>
		<div class="content">
			
			<div class="content_main">
				<div class="content_top">
					<div class="personal_left">发私信</div>
				</div>
				<div class="gary">
					<div class="pink"></div>
				</div>
				<div class="content_middle">
					<form id="formid">
						<!--  action = 'sendLetter' method="post" -->
						<input type="hidden" name="fromId" id="fromId" value="user_1530497245745">
						<input type="hidden" name="toId" id="toId" value="u0001">
					<!-- ckedlor -->
					<textarea name="content" id="editor" cols="30" rows="10"></textarea>
						<!-- type="submit" -->
					</form>
					<button class="btn" onclick="send();">发送</button>
					<button class="btn" onclick="history.go(-1);">返回</button>
				</div>
			</div>
		</div>
	<!-- footer start -->	
	<%@ include file="footer.jsp" %>	
	<!-- footer end -->	
		 <script type="text/javascript">
	    	 var editor =CKEDITOR.replace('editor');
	  	</script>
	</body>
</html>