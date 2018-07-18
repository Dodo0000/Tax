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
		<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/receiveMessage.css">
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
			<span class=""><a href="" style="color:black"> 收到的私信</a></span>
		</div>
				<div class="tab_menu">
					<ul>
						<li class="selected">收到的私信</li>
					</ul>
				</div>
				<div class="tab_box">
					<!-------------------------------------------------------我收到的私信 statr-------------------------------------------------->
					<div class="center">
						<!-- 分页 start -->
						<div class="tab_a" id="tab_b" >
						  	<ul class="tabOne tabOneys" id="tabOne">
							    <li data-target="#allmyLetterPut" class="curr"><a class="active">全部</a></li>
							    <li data-target="#myLetterPutUser"><a>用户</a></li>
							    <li data-target="#myLetterPutSys"><a>系统</a></li>
						  	</ul>
					  		<div class="tab_con">
					  			<!-- 全部 start -->
					    		<div id="allmyLetterPut" style="display:block;">
					    			<div class="quesContent">
					    				
									</div>
						    		<div id="Fy_allmyLetterPut" class="box"></div>
					    		</div>
					    		<!-- 全部 end -->
					    		
					    		<!-- 用户 start -->
					    		<div id="myLetterPutUser" style="display:none;">
					    			<div class="quesContent">
					    				
									</div>
						    		<div id="Fy_myLetterPutUser" class="box"></div>
					    		</div>
					    		<!-- 用户 end -->
					    		
					    		<!-- 系统 start -->
					    		<div id="myLetterPutSys" style="display:none;">
					    			<div class="quesContent">
					    				
									</div>
						    		<div id="Fy_myLetterPutSys" class="box"></div>
					    		</div>
					    		<!-- 系统 end -->
					    	</div>
						</div>
						<!-- 分页 end -->
					</div>
					<!-------------------------------------------------------我收到的私信 end-------------------------------------------------->
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
				var $allmyLetterPut=$('#allmyLetterPut');
				var $myLetterPutUser=$('#myLetterPutUser');
				var $myLetterPutSys=$('#myLetterPutSys');
				$div_li.click(function() {
					$(this).addClass("selected") 				//当前<li>元素高亮
						.siblings().removeClass("selected"); 	//去掉其它同辈<li>元素的高亮
					var index = $div_li.index(this); 			//获取当前点击的<li>元素 在 全部li元素中的索引。
					$("div.tab_box > div") 						//选取子节点。不选取子节点的话，会引起错误。如果里面还有div 
						.eq(index).show() 						//显示 <li>元素对应的<div>元素
						.siblings().hide();						//隐藏其它几个同辈的<div>元素
					$myLetterPutUser.css('display','block');
					$myLetterPutSys.css('display','block');
				})
			});
			//我收到的私信小的切换
			$(function(){
				var $li = $('.tabOne li');
				var $li_one=$('.tabOne li:nth-child(1)');
				var $ul = $('.tab_con div:nth-child(1)');
				var $tab_on=$('.tab_con');
				var $allmyLetterPut=$('#allmyLetterPut');
				var $myLetterPutUser=$('#myLetterPutUser');
				var $myLetterPutSys=$('#myLetterPutSys');
				$li.click(function() {
					$allmyLetterPut.css('display','none');
					$myLetterPutUser.css('display','none');
					$myLetterPutSys.css('display','none');
					var target = $(this).data("target");
					$(target).css('display','block');
				});
				$li.click(function(){
					$(this).addClass("curr") 				//当前<li>元素高亮
					.siblings().removeClass("curr");
				})
			});
			
			//-------------------------------------------------------我收到的私信分页 statr--------------------------------------------------
			/* 全部  */
			var allmyLetterPutCount =0;
			$('#Fy_allmyLetterPut').paging({
	            initPageNo: 1, 									// 初始页码
	            totalPages: Math.ceil(allmyLetterPutCount/10),  // 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 								// 缓动速度。单位毫秒
	            jump: true,										// 是否支持跳转
	            callback: function(pageOne) { 					// 回调函数
	                $.get("http://localhost:8080/Tax/users/myReceiveMessages",{
	                	page: pageOne,
	                	rows: 10,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array) {
		                		var type = "";
		                		if(value.fromType=="0"){
		                			type="用户";
		                		} else {
		                			type="系统";
		                		}
		                		var userAvatar;
	            				if(value.fromUser && value.fromUser.avatar) {
	            					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.fromUser.avatar +'" alt="Avatar" style="width:55px;vertical-align:middle;height:55px;">';
	            				} else {
	            					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;height:55px;">';
	            				}
		                		return '<ul style="border-bottom:1px dashed #ccc;height: 130px;">' + 
	                						'<li><a href="http://localhost:8080/Tax/users/' + value.fromUser.userId + '/zone">' + userAvatar + '<span>&nbsp;' + value.fromUser.userName + '</span></a></li>' +
										'<li><span>' + type + '</span></li>' + 
										'<li><span>' + value.createdTime + '</span></li>' + 
										'<li><a href="http://localhost:8080/Tax/letter/' + value.id + '/details"><span>' + value.content + '</span></a></li>' + 
									'</ul>'
		            		});
		            		$("#allmyLetterPut>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			
			/* 用户  */
			var myLetterPutUserCount =0;
			$('#Fy_myLetterPutUser').paging({
	            initPageNo: 1, 									// 初始页码
	            totalPages: Math.ceil(myLetterPutUserCount/10), // 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 								// 缓动速度。单位毫秒
	            jump: true,										// 是否支持跳转
	            callback: function(pageTwo) { 					// 回调函数
	                $.get("http://localhost:8080/Tax/users/myReceiveMessages",{
		                	page: pageTwo,
		                	rows: 10,
		                	fromType: 0,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array) {
		                		var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				}
		                		return '<ul style="border-bottom:1px dashed #ccc;height: 130px;">' + 
	                						'<li><a href="http://localhost:8080/Tax/users/' + value.fromUser.userId + '/zone">' + userAvatar + '<span>&nbsp;' + value.fromUser.userName + '</span></a></li>' + 
										'<li><span>' + value.createdTime + '</span></li>' + 
										'<li><span>用户</span></li>' + 
										'<li><span>' + value.content + '</span></li>' + 
									'</ul>'
		            		});
		            		$("#myLetterPutUser>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			
			/* 系统  */
			var myLetterPutSysCount =0;
			$('#Fy_myLetterPutSys').paging({
	            initPageNo: 1, 									// 初始页码
	            totalPages: Math.ceil(myLetterPutSysCount/10),  // 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 								// 缓动速度。单位毫秒
	            jump: true,										// 是否支持跳转
	            callback: function(pageThree) { 				// 回调函数
	                $.get("http://localhost:8080/Tax/users/myReceiveMessages",{
		                	page: pageThree,
		                	rows: 10,
		                	fromType: 1,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array) {
		                		var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				}
		                		return '<ul style="border-bottom:1px dashed #ccc;height: 130px;">' + 
										'<li><a href="http://localhost:8080/Tax/users/' + value.fromUser.userId + '/zone">' + userAvatar + '<span>&nbsp;' + value.fromUser.userName + '</span></a></li>' +
										'<li><span>' + value.createdTime + '</span></li>' + 
										'<li><span>系统</span></li>' + 
										'<li><span>' + value.content + '</span></li>' + 
									'</ul>'
		            		});
		            		$("#myLetterPutSys>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			//-------------------------------------------------------我收到的私信分页 end--------------------------------------------------
			
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