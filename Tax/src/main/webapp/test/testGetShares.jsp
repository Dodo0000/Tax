<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'testGetShares.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<!-- 引入用jquery请求/提交数据所需要的包 -->
<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://localhost:8080/Tax/resources/js/paging.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="http://localhost:8080/Tax/resources/zeroModal/zeroModal.min.js"
	charset="utf-8"></script>
<!-- <script type="text/javascript"
	src="http://localhost:8080/Tax/jquery/jquery-2.0.3.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/Tax/jquery/jquery.form.js"></script> -->

</head>

<body>
	This is my JSP page.
	<br>

	<!-- 中间部分start -->
	<div class="content">
		<div class="content_main">
			<div class="liuan_center_search"></div>
			<div class="c_s_header">
				<div class="lists">
					<div class="ex_main_left_content_header">

						<ul style="background: none">



							<li><span>经验分享</span>
							</li>


						</ul>
					</div>

					<div id="exSharingContainer">
						<!-- 填充经验分享 开始 -->
						<div class="exSharingContent">
							<!-- 复制模板，然后填充后，append -->
							<ul class="ex_main_left_content_ul uls clearfix", , hidden="hidden">
								<li class="center_top">
									<ul>
										<li style="padding-left: 20px"><a
											href="http://localhost:8080/Tax/posts/post_1513478006486"></a>
										<!-- 填写title --></li>
										<li style="float: right;"></li>
										<!-- 填写日期 -->
									</ul>
								</li>
								<li class="center_bottom">
									<ul style="background: none">
										<li><span>浏览：</span> <span></span>
										</li>
										<!-- 填写click -->
										<li><span>收藏：</span> <span class="starCount"></span>
										</li>
										<!-- 填写favourite -->
										<li data-target-id="post_1513478006486" data-target="post"
											onclick="starPost();"><span>收藏</span>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<!-- 填充经验分享 结束-->
						<div id="exSharingPage" class="box"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 这个form暂时不知道是干什么的 -->
	<!-- <form style="display: none" id="postsForm" method="GET"
		action="http://localhost:8080/Tax/posts">
		<input value="1" name="page" type="hidden"> <input value="10"
			name="size" type="hidden"> <input value="0" name="type"
			type="hidden" />
	</form> -->
	<!-- 中间内容结束 -->

	<!-- 填充经验分享内容-->
<script>
		$(function() {
			initShares();
		});
		/**填充购物车*/
		function initShares() {
			$.ajax({
				url : 'api/v1/guest/share/1',
				success : function(data) {
					alert('ajax success');
					var jsonarray = eval(data);
					if (jsonarray["status"] == "200") {
						alert("data access successful");
						var shareList = data["result"]["list"];
						var template_parent=$('.exSharingContent:first');
						for ( var i in shareList) {
							//alert(shareList[i]["authorName"]);
							var template=template_parent.children('ul:eq(0)').clone(true);
							//设置为可见
							template.removeAttr('hidden');
							//获取并填写模板中第一个li中的title publishDateStr
							var title_li=template.children('li:eq(0)').children('ul:eq(0)').children('li:eq(0)');
							title_li.text(shareList[i]["title"]);
							var date_li=template.children('li:eq(0)').children('ul:eq(0)').children('li:eq(1)');
							date_li.text(shareList[i]["publishDateStr"]);
							//获取并填写模板中第二个li中的click favourite
							var click_li=template.children('li:eq(1)').children('ul:eq(0)').children('li:eq(0)').children('span:eq(1)');
							click_li.text(shareList[i]["click"]);
							var click_li=template.children('li:eq(1)').children('ul:eq(0)').children('li:eq(1)').children('span:eq(1)');
							click_li.text(shareList[i]["favourite"]);
							template_parent.children('ul').last().after(template);
						}
					}
				},
				error : function() {
					alert('服务器忙');
				}
			});
		};
	</script>

</body>
</html>
