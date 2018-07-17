<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>安徽省国家税务局税企互助交流平台</title>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/inviteAnswer.css">
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/easyui/jquery.min.js"></script>
	<script type="text/javascript">
	/* 	window.onload=function(){
			console.log(user_1530497245745);
			console.log(u0001);
		} */
		function sendInvitation(){
			var text = $("#text").val();
			var title = $("#title").val();
			if(title===""){
				zeroModal.alert("请填写标题");
				return;
			}
			if(text===""){
				zeroModal.alert("请填写问题描述");
				return;
			}
			var form = document.getElementById("invitationForm");
			 console.log(JSON.stringify(new FormData(form)));
			 console.log($("invitationForm").serialize());
			 $.ajax({
				 url:'http://localhost:8080/Tax/invitationqQuestion',
				 type: 'POST',
				 processData: false,
				 contentType: false,
				 data: new FormData(form),
				 success: function(data) {
					 console.log(data);
					 alert(data.mes);
					 history.go(-1);
				 }
			 });
		}
	</script>
	<style type="text/css">
	.liuan_footers{
		position:relative;
		bottom:0;
	}
	</style>
	</head>
	<body>
	<%@ include file="header.jsp" %>	
	<div class="content">
			<div class="path_nav">
				<span class="">当前位置：<a href="javascript:history.go(-1);" class="nav_style">用户专区</a></span>
				<span class="">&nbsp;&gt;&nbsp;</span>
				<span class=""><a href="" class="nav_style">邀请回答</a></span>
			</div>
			<div class="content_main">
				<div class="content_top">
					<div class="personal_left">邀请回答</div>
				</div>
				<div class="gary">
					<div class="pink"></div>
				</div>
				<div class="content_middle">
					<form id="invitationForm">
						<div class="selects clearfix">
							<input type="hidden" name="userId" value="user_1530497245745">
							<input type="hidden" name="invitedId" value="u0001">
							<div class="quextion_classify">问题分类：</div>
							<select name="category" id="question" style="">
								<option value="0">普通提问</option>
								<option value="1">悬赏提问</option>
							</select>
							<div class="reward">悬赏：</div>
							<select name="rewardAmount" id="reward">
								<option value="0">0</option>
								<option value="20">20</option>
							</select>
						</div>
						<div class="invite_title clearfix">
							<div>标&emsp;&emsp;题：</div>
							<input id="title" name="title" type="text">
						</div>
						<div class="invite_describe clearfix">
							<div class="describe">问题描述：</div>
							<textarea name="content" id="text"></textarea>
						</div>
					</form>
					<div class="invite_button">
						<button class="btn" onclick="sendInvitation();">提交</button>
						<button class="btn" onclick="history.go(-1);">返回</button>
					</div>
				</div>
			</div>
		</div>
	<!-- content end -->
	<!-- footer start-->
	<%@ include file="footer.jsp" %>
	<!--footer end-->
</body>
<script type="text/javascript">
$(function(){
	$("#reward").attr("disabled","disabled").css("background-color","#EEEEEE;");
})
$("#question").click(function(){
	  var a = $("#question option:selected").val();
	  console.log(a);
	  if(a==0){
		  document.getElementById("reward").options[0].selected = true; 
		  $("#reward").attr("disabled","disabled").css("background-color","#EEEEEE;");
	  }else{
		  $("#reward").removeAttr("disabled");
	  }
});
</script>
</html>