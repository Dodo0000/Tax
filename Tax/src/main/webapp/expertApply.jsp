<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>安徽省国家税务局税企互助交流平台</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width" />
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/expertApply.css">
		<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/config.js"></script>
		<style>
			html {
				height: 100%;
				overflow-y: auto !important;
			}
			
			body {
				display: flex;
				flex-direction: column;
				-webkit-display: flex;
				height: 100%;
			}
			
			.header {
				flex: 0 0 auto;
			}
			
			.liuan_main {
				flex: 1 0 auto;
			}
			
			.liuan_footers {
				flex: 0 0 auto;
			}
			
			#five {
				border-bottom: 1px solid #fff;
				padding-bottom: 10px;
				color: #fff;
				display: inline-block;
				width: 90%;
				height: 65%;
			}
			
			#fiveplus {
				background: #1B55A9;
			}
		</style>
	</head>
	<body>
	<!-- 头部标题start -->
	<%@ include file="header.jsp" %>
	<!-- 头部标题end -->
	<div class="liuan_main">
		<div class="path_nav">
			<span class="fl">当前位置：<a href="javascript:history.go(-1);"
				class="nav_style">用户专区</a></span> <span class="fl">&nbsp;&gt;&nbsp;</span>
			<span class="fl"><a href="" class="nav_style">专家认证</a></span>
		</div>
		<!-- 中间部分start -->
		<div class="org_apply">
			<p class="experts">专家认证</p>
			<div class="gary">
				<div class="blue"></div>
			</div>
			<form id="uploadForm" enctype="multipart/form-data">
				<div class="center">
					<div class="picture_input clearfix">
						<div class="picture fl">图片认证:</div>
						<input id="file" type="file" name="uploadFile" class="fl" />
					</div>
					<div class="text_area clearfix">
						<div class="remark fl">备&emsp;&emsp;注:</div>
						<textarea id="remark" rows="10" cols="40" class="fl"></textarea>
						<br>
					</div>
					<div class="submit">
						<input value="提交" type="button" onclick="sendApply();"
							class="apply_submit" />
					</div>
				</div>
			</form>
		</div>
		<!-- 中间部分start -->
	</div>
	<!-- 底部内容start -->
	<%@ include file="footer.jsp" %>	
	<!-- 底部内容end -->
	<script type="text/javascript">
		CKEDITOR.replace('editor');
	</script>
</body>
<script type="text/javascript">
		function sendApply() {
			var a = document.getElementById("file").value;
			if(a == "") {
				alert("请选择图片");
				return;
			}
			var formData = new FormData($("#uploadForm")[0]);
			console.log(formData);
			$.ajax({
				url: 'http://localhost:8080/Tax/file/fileUpLoad',
				type: 'POST',
				data: formData,
				async: false,
				cache: false,
				contentType: false,
				processData: false,
				success: function(result) {
					console.log(result);
					if(result != -1) {
						url = "http://localhost:8080/Tax/submitExpert"
						var remark = $("#remark").val();
						console.log(remark);
						params = {
							"certificationImg": result,
							"remark": remark
						};
						$.post(url, params, function(result2) {
							alert(result2.mes);
							history.go(-1);
						});
					} else {
						alert("上传图片失败!");
					}
				}
			});
		}
	</script>

</html>