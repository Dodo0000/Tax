<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta name="viewport" content="width=device-width" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/expertReading.css">
	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
	<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript"
		charset="utf-8"></script>
	<style>
		#four {
			border-bottom: 1px solid #fff;
		    padding-bottom: 10px;
		    color: #fff;
		    display: inline-block;
		    width: 90%;
		    height: 65%;
		}
		#fourplus{
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
							
								
									<li><span>专业解读</span></li>
								
								
							
						</ul>
					</div>
					<div id="exSharingContainer">
						<div class="exSharingContent">
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1475754962616">焦点问题的意见</a></li>
											<li style="float: right;">2012-12-13</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 97</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">4</span>
											</li>
											<li data-target-id="post_1475754962616" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1475754962618">当事人关于争议焦点问题的意见</a></li>
											<li style="float: right;">2012-12-12 </li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 41</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">1</span>
											</li>
											<li data-target-id="post_1475754962618" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513307706343">所得的税的缴纳</a></li>
											<li style="float: right;">2017-12-15</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 30</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513307706343" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513390982768">专业解读所得税</a></li>
											<li style="float: right;">2017-12-16</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 16</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513390982768" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513477945710">专业解读个人所得税？</a></li>
											<li style="float: right;">2017-12-17</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 6</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">1</span>
											</li>
											<li data-target-id="post_1513477945710" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513478325043">专业解读车船税</a></li>
											<li style="float: right;">2017-12-17</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 3</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513478325043" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513478658168">专业解读1</a></li>
											<li style="float: right;">2017-12-17</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 7</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513478658168" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513560162834">专业解读4</a></li>
											<li style="float: right;">2017-12-18</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 5</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513560162834" data-target="post"
												onclick="starPost();"><span>收藏</span></li>
										</ul>
									</li>
								</ul>
							
								<ul class="ex_main_left_content_ul uls clearfix">
									<li class="center_top">
										<ul>
											<li style="padding-left: 20px"><a
												href="http://localhost:8080/Tax/posts/post_1513749519576">专业解读税收政策</a></li>
											<li style="float: right;">2017-12-20</li>
										</ul>
									</li>
									<li class="center_bottom">
										<ul style="background: none">
											<li><span>浏览：</span> <span> 2</span>
											</li>
											<li><span>收藏：</span> <span class="starCount">0</span>
											</li>
											<li data-target-id="post_1513749519576" data-target="post"
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
			value="1" name="type" type="hidden" />
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
		 // var exSharingCount = 9;
		 var totalPages = Math.ceil(0.9);
		 console.log('totalPages', totalPages);
		 $('#exSharingPage').paging({
	         initPageNo: 1, 							// 初始页码
	         totalPages: totalPages, 							// 总页数
	         totalCount: '合计 9条数据', 			// 条目总数
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