<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>




<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安徽省国家税务局税企互助交流平台</title>
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/easyui/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/register.css">
	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
	<script type="text/javascript">
	$(function(){
		$("#messages").remove();
	})
	</script>
	<style type="text/css">
	.liuan_footers{
			bottom:0;
			position:relative;
		}
		body{
			display:flex;
			flex-flow:column;
		}
		.content{
			/* min-height:110vh; */
			flex:1;
		}
	</style>
</head>

<body style="display: flex;flex-flow: column;min-height: 100vh;">
	<!--header start-->
		<%@ include file="../header.jsp" %>
	<!--header end-->
	<!--content start-->
	<div class="content">
		<div class="content_main">
			<div class="content_middle">
				<div class="content_middle_btn">
					<!-- 修改个人注册的链接 -->
					<a href="http://localhost:8080/Tax/guest/register_status=0.jsp" class="save_btn">个人注册</a>
					<a href="http://localhost:8080/Tax/register?status=1" class="save_btn">专家注册</a>
					<a href="http://localhost:8080/Tax/register?status=2" class="save_btn">机构注册</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer start -->		
	<%@ include file="../footer.jsp" %>
	<!-- footer end -->		
</body>
</html>