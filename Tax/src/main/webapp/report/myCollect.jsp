
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>安徽省国家税务局税企互助交流平台</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/myCollect.css">
		<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	  	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
	  	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
	</head>
	<body>
	<div class="liuan_main">
		<!-- 头部标题start -->
		<%@ include file="../header.jsp" %>
		<!-- 头部标题end -->
		<!-- 中间部分start -->
		<div class="tab" style="width:1200px;margin-top:10px;">
		<div style="margin:10px;margin-top:10px;color:black;">
		<span class="">当前位置：<a style="color:black" href="javascript:history.go(-1);" class="nav_style">个人中心</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
			<span class=""><a href="" style="color:black"> 收藏</a></span>
		</div>
				<div class="tab_menu">
					<ul>
						<li class="selected">我的收藏</li>
					</ul>
				</div>
				<div style="height:30px;"></div>
				<div class="tab_box">
					<div>
					<!-------------------------------------------------------我的收藏 start-------------------------------------------------->
						<div class="center">
							<!-- 分页 start -->
							<div class="tab_a" id="tab_b" style="height: 1100px;">
							  	<!-- 我的收藏 -->
						  		<div class="tab_con">
						  			<!-- 我的收藏 全部帖子 开始  -->
							    		<div id="myAllCollect" style="display:block;">
							    			<div class="quesContent">
								    			
											</div>
								    		<div id="Fy_myAllCollect" class="box"></div>
							    		</div>
							    		<!-- 我的收藏 全部帖子 结束 -->
						    	</div>
							</div>
							<!-- 分页 end -->
						</div>
					</div>
					<!-------------------------------------------------------我的收藏 end-------------------------------------------------->
				</div>
			</div>
		<!-- 中间部分end -->
		<!-- 底部内容start -->
		<%@ include file="../footer.jsp" %>
		<!-- 底部内容end -->
	</div>
		<script type="text/javascript">
			//大的tab切换
	        $(function() {
				var $div_li = $("div.tab_menu ul li");
				var $myAllShare=$('#myAllShareOne');
				var $myAllShareOne=$('#myAllShare');
				$div_li.click(function() {
					$(this).addClass("selected") 				//当前<li>元素高亮
						.siblings().removeClass("selected"); 	//去掉其它同辈<li>元素的高亮
					var index = $div_li.index(this); 			//获取当前点击的<li>元素 在 全部li元素中的索引。
					$("div.tab_box > div") 						//选取子节点。不选取子节点的话，会引起错误。如果里面还有div 
						.eq(index).show() 						//显示 <li>元素对应的<div>元素
						.siblings().hide();						//隐藏其它几个同辈的<div>元素
					$myAllShare.css('display','block');
					$myAllShareOne.css('display','block');
				})
			});
			
			
			/*********************************************************我的收藏 start********************************************************/
			/* 全部 */
			var allmyCollectCount =0;
			$('#Fy_myAllCollect').paging({
	            initPageNo: 1, 									// 初始页码
	            totalPages: Math.ceil(allmyCollectCount/10), 	// 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 								// 缓动速度。单位毫秒
	            jump: true,										// 是否支持跳转
	            callback: function(pageOne) { 					// 回调函数
	                $.get("http://localhost:8080/Tax/users/myCollects",{
	                	page: pageOne,
	                	rows: 10,
	                }, function(data) {
	                	var dataHTML = data.map(function(value, index, array){
	                		var targetTitle="";
	                		var targetId="";
	                		var targetcontent="";
		                	if(value.target=="answer"){
		                		targetTitle=value.targetPo.title;
		                		targetId=value.targetPo.id;
		                		targetcontent=value.targetPo.content;
		                	}else if(value.target=="question"){
		                		targetTitle=value.targetPo.title;
		                		targetId=value.targetPo.id;
		                		targetcontent=value.targetPo.content;
		                	}else{
		                		targetTitle=value.targetPo.title;
		                		targetId=value.targetPo.id;
		                		targetcontent=value.targetPo.content;
		                	}
		                	var userAvatar;
            				if(value.user && value.user.avatar) {
            					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:100%;height:100%;vertical-align:middle;">';
            				} else {
            					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:100%;height:100%;vertical-align:middle;">';
            				}
	                		return '<ul style="height: 170px;overflow：hidden;">' +
	                					 /* '<span>&nbsp;' + value.user.userName + '</span> */
	                					'<li style="width:66px;height:62px;margin-top:5px;">' + userAvatar +'</li>' + 
										'<li id="latestQuesContainerOne_one"><span>' + value.createdTime + '</span></li>' + 
										'<li id="latestQuesContainerOne_two">标题：<a style="color:black;" href="http://localhost:8080/Tax/posts/'+targetId+'">' + targetTitle + '</a></li>' +
										'<li id="">内容：<a style="color:black;" href="http://localhost:8080/Tax/posts/'+targetId+'">' + targetcontent + '</a></li>' +
									'</ul>'
	            		});
	            		$("#myAllCollect>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			/*********************************************************我的收藏 end********************************************************/
			
			
	        //点击分页跳到页面顶部下100px 时间0
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















