<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta name="viewport" content="width=device-width" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css"
		href="http://localhost:8080/Tax/resources/css/expertReading.css">
	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/footer.css"/>
	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif"
		type="image/x-icon" />
	<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="http://localhost:8080/Tax/resources/zeroModal/zeroModal.min.js" charset="utf-8"></script>
	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/zeroModal/zeroModal.css" />
	<style type="text/css">
		#three {
			border-bottom: 1px solid #fff;
		    padding-bottom: 10px;
		    color: #fff;
		    display: inline-block;
		    width: 90%;
		    height: 65%;
		}
		#threeplus{
			background:#1B55A9;
		}
	</style>
	<style type="text/css">
	.liuan_main {
		flex: 1;
		background: #fff;
	}
	
	.liuan_footers {
		margin: 0;
		margin-top: 0 !important;
	}
	
	body {
		display: flex;
		flex-flow: column;
		min-height: 100vh;
	}
	body::-webkit-scrollbar {display:none}
			body::-o-scrollbar {display:none}
			body::-ms-scrollbar {display:none}
			body::-moz-scrollbar {display:none}
	</style>
		
</head>

<body>
	<!-- 头部标题start -->
	<%@ include file="header.jsp" %>
	<!-- 头部标题end -->

	<!-- 中间部分start -->
	<div class="content">
		<div class="content_main">
			 <div class="liuan_center_search">
				
			</div> 
			<div class="c_s_header">
				<div class="lists">
					<div class="ex_main_left_content_header">
							
						<ul style="background: none">
							
								
								
									<li><span>经验分享</span></li>
								
							
						</ul>
					</div>
					<div id="exSharingContainer">
						<div class="exSharingContent">
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513478006486">分享车船税</a></li>
											<li style="float: right;">2017-12-17</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 51</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">2</span>
											</li>
											<li data-target-id="post_1513478006486" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513478121849">纳税人缴纳个人税</a></li>
											<li style="float: right;">2017-12-17</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 21</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513478121849" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513478785301">经验分享1</a></li>
											<li style="float: right;">2017-12-17</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 9</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513478785301" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513479111976">经验分享2</a></li>
											<li style="float: right;">2017-12-17</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 6</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513479111976" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513479223282">税务问题</a></li>
											<li style="float: right;">2017-12-17</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 4</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513479223282" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513562598456">经验分享车船税</a></li>
											<li style="float: right;">2017-12-18</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 3</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513562598456" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1525945371366">经验分享测试</a></li>
											<li style="float: right;">2018-05-10</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 6</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1525945371366" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
						</div>
						<div id="exSharingPage" class="box"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form style="display: none" id="postsForm" method="GET"
		action="http://localhost:8080/Tax/posts">
		<input value="1" name="page" type="hidden"> <input
			value="10" name="size" type="hidden"> <input
			value="0" name="type" type="hidden" />
	</form>

	<!-- 底部内容start -->
	<%@ include file="footer.jsp" %>
	<!-- 底部内容end -->

	
		
		
			<script type="text/javascript">
				function starPost() {
					zeroModal.alert("请先登录用户");
				}
			</script>
		
	

	<script type="text/javascript">
		/* function createQuestionItem(post) {
			return '<ul class="ex_main_left_content_ul uls clearfix">' +
					'<li class="center_top">' +
						'<ul>' +
							'<li style="padding-left: 20px">' +
								'<a href="http://localhost:8080/Tax/posts/' + post.id + '">' + post.title + '</a>' +
							'</li>' +
							'<li style="float: right;">' + post.createdTime + '</li>' +
						'</ul>'+
					'</li>' +
					'<li class="center_bottom">' +
						'<ul style="background: none">' +
							'<li><span>浏览：</span><span>' + (post.browseCount == 0 ? '' : post.browseCount) + '</span></li>' +
							'<li><span>收藏：</span><span class="starCount">' + (post.starCount == 0 ? '' : post.starCount) + '</span></li>' +
							'<li data-target-id="' + post.id + '" data-target="post" onclick="starPost();">' +
								'<span>收藏</span>' +
							'</li>' +
						'</ul>'+
					'</li>' +
				'</ul>';
		} */
		
		/* function fetchPosts(page) {
			var questionIds = [];
	    	 	$.get("http://localhost:8080/Tax/posts/getPosts", {
	            	page: page,
	            	rows: 10,
	            	type: '1'
	        }, function(data) {
	        		var dataHTML = data.map(function(value, index, array) {
	        			questionIds.push(value.id);
	        			return createQuestionItem(value);
	        		});
	        		$("#exSharingContainer>.exSharingContent").html(dataHTML.join(""));
	        		checkPostStar(questionIds);
			});
		} */
		 //分页
		 // var exSharingCount = 7;
		 var totalPages = Math.ceil(0.7);
		 console.log('totalPages', totalPages);
		 $('#exSharingPage').paging({
	         initPageNo: 1, 							// 初始页码
	         totalPages: totalPages, 							// 总页数
	         totalCount: '合计 7条数据', 			// 条目总数
	         slideSpeed: 600, 							// 缓动速度。单位毫秒
	         jump: true, 								// 是否支持跳转
	         initLoad: false,
	         callback: function(page) { 				// 回调函数
	         	var postsForm = document.getElementById("postsForm");
	         	postsForm.page.value = page;
	         	postsForm.submit();
	         }
	     });
		 jQuery(function(){
		  	$('#nextPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		  	$('#prePage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('#firstPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('#lastPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.sel-page').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.selpage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.jump-button').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.turnPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.last-page').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 });
	</script>
</body>
</html>