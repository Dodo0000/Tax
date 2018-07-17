
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!-- 登录用户信息 -->

<!DOCTYPE html>
<html>
	<head>
		<title>安徽省国家税务局税企互助交流平台</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/receiveInvite.css">
		<script src="/lagsms/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	  	<script src="/lagsms/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	  	<link rel="stylesheet" href="/lagsms/resources/css/paging.css">
	  	<link rel="icon" href="/lagsms/resources/image/home/favicon.gif" type="image/x-icon" />
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
			<span class=""><a href="" style="color:black"> 收到的邀请</a></span>
		</div>
				<div class="tab_menu">
					<ul>
						<li class="selected">我收到的邀请</li>
					</ul>
				</div>
				<div class="tab_box">
					<div>
					<!-------------------------------------------------------我收到的邀请 start-------------------------------------------------->
						<div class="center">
							<!-- 分页 start -->
							<div class="tab_a" id="tab_b">
								<div class="center_listButton">
								  	<ul class="tabOne tabOneys" id="tabOne">
								    	<li data-target="#myAllInvitePut" class="curr"><a>全部</a></li>
								    	<li data-target="#myInvitePutNotReply"><a>未回复</a></li>
								    	<li data-target="#myInvitePutReply"><a>已回复</a></li>
								  	</ul>
							  	</div>
						  		<div class="tab_con">
							  		<!-- 全部 start -->
							    		<div id="myAllInvitePut" style="display:block;">
							    			<div class="quesContent">
							    				
											</div>
								    		<div id="Fy_myAllInvitePut" class="box"></div>
							    		</div>
							    		<!-- 全部 end -->
							    		
							    		<!-- 未回复 start -->
							    		<div id="myInvitePutNotReply" style="display: none;">
							    			<div class="quesContent">
								    			
											</div>
								    		<div id="Fy_myInvitePutNotReply" class="box"></div>
							    		</div>
							    		<!-- 未回复 end -->
							    		
							    		<!-- 已回复 start -->
							    		<div id="myInvitePutReply" style="display: none;">
							    			<div class="quesContent">
							    				
											</div>
										<div id="Fy_myInvitePutReply" class="box"></div>
							    		</div>
							    		<!-- 已回复 end -->
						    		</div>
							</div>
							<!-- 分页 end -->
						</div>
					</div>
					<!-------------------------------------------------------我收到的邀请 end-------------------------------------------------->
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
				var $myAllInvitePut=$('#myAllAnswer');
				var $myAllAnswer=$('#myAllInvitePut');
				$div_li.click(function() {
					$(this).addClass("selected") 				//当前<li>元素高亮
						.siblings().removeClass("selected"); 	//去掉其它同辈<li>元素的高亮
					var index = $div_li.index(this); 			//获取当前点击的<li>元素 在 全部li元素中的索引。
					$("div.tab_box > div") 						//选取子节点。不选取子节点的话，会引起错误。如果里面还有div 
						.eq(index).show() 						//显示 <li>元素对应的<div>元素
						.siblings().hide();						//隐藏其它几个同辈的<div>元素
					$myAllInvitePut.css('display','block');
					$myAllAnswer.css('display','block');
				})
			});
			//我收到的邀请小的切换
			$(function(){
				var $li = $('.center_listButton ul li');	
				var $li_one=$('.tabOne li:nth-child(1)');
				var $ul = $('.tab_con div:nth-child(1)');
				var $tab_on=$('.tab_con');
				var $myAllInvitePut=$('#myAllInvitePut');
				var $myInvitePutNotReply=$('#myInvitePutNotReply');
				var $myInvitePutReply=$('#myInvitePutReply');
				$li.click(function() {
					$myAllInvitePut.css('display','none');
				 	$myInvitePutNotReply.css('display','none');
				 	$myInvitePutReply.css('display','none');
					var target = $(this).data("target");
					$(target).css('display','block');
				});
				$li.click(function(){
					$(this).addClass("curr") 				//当前<li>元素高亮
					.siblings().removeClass("curr");
				})
			});
			
			/*********************************************************我收到的邀请 start********************************************************/
			/* 全部 */
			var allPutInviteCount =0;
			$('#Fy_myAllInvitePut').paging({
	            initPageNo: 1, 								// 初始页码
	            totalPages: Math.ceil(allPutInviteCount/10),// 总页数
	            totalCount: '合计 0 条数据', // 条目总数
	            slideSpeed: 600, 							// 缓动速度。单位毫秒
	            jump: true,									// 是否支持跳转
	            callback: function(pageOne) { 				// 回调函数
	                $.get("/lagsms/invitations", {
		                	page: pageOne,
		                	rows: 10,
		                	type: 'in'
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array) {
		                		var status="";
			                	if(value.status==0) {
			                		status="未回复";
			                	} else {
			                		status="已回复";
			                	}
			                	var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="/lagsms/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="/lagsms/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				}
			                	return '<ul>' +
			                				'<li>' + userAvatar + '<span>&nbsp;邀请人：' + value.user.userName + '</span></li>' +
			                				'<li>' +
												'<span>' + value.questionPo.createdTime + '</span>'+
											'</li>' +
											'<li style="width:82%"><a href="/lagsms/questions/' + value.questionId + '/details"><span>简介：</span><span>' + value.questionPo.title + '</span></a></li>' +
											'<li style="float:left;width:55px;padding-left:0">'+
			                					'<span>' + status + '</span>' + 
			                				'</li>' +
										'<li style="float:left;"><a style="color:black;" href="/lagsms/invitations/' + value.id + '/details">我要回答</a></li>' +
									'</ul>'
		            		});
		            		$("#myAllInvitePut>.quesContent").html(dataHTML.join(""));
	                });
	            }
			}); 
			
			
			//未回复 
			var PutInviteNotReplyCount =0;
			$('#Fy_myInvitePutNotReply').paging({
	            initPageNo: 1, 										// 初始页码
	            totalPages: Math.ceil(PutInviteNotReplyCount/10), 	// 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 									// 缓动速度。单位毫秒
	            jump: true,											// 是否支持跳转
	            callback: function(pageTwo) { 						// 回调函数
	                $.get("/lagsms/invitations", {
		                	page: pageTwo,
		                	rows: 10,
		                	status: 0,
		                	type: 'in'
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array){
		                		var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="/lagsms/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="/lagsms/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				}
		                		return '<ul>' +
	                						'<li>' + userAvatar + '<span>&nbsp;邀请人：' + value.user.userName + '</span></li>' +
										'<li><span>' + value.questionPo.createdTime + '</span></li>' +
										'<li><a href="/lagsms/questions/' + value.questionId + '/details"><span>简介：</span><span>' + value.questionPo.title + '</span></a></li>' +
										'<li><a style="color:black;" href="/lagsms/invitations/' + value.id + '/details">我要回答</a></li>' +
									'</ul>'
		            		});
		            		$("#myInvitePutNotReply>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			
			//已回复
			var PutInviteReplyCount =0;
			$('#Fy_myInvitePutReply').paging({
	            initPageNo: 1, 									// 初始页码
	            totalPages: Math.ceil(PutInviteReplyCount/10), 	// 总页数
	            totalCount: '合计 0 条数据',	// 条目总数
	            slideSpeed: 600, 								// 缓动速度。单位毫秒
	            jump: true,										// 是否支持跳转
	            callback: function(pageThree) { 				// 回调函数
	                $.get("/lagsms/invitations",{
		                	page: pageThree,
		                	rows: 10,
		                	status: 1,
		                	type: 'in' // 接收到的邀请
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array){
		                		var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="/lagsms/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="/lagsms/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				}
		                		return '<ul>' +
	                						'<li>' + userAvatar + '<span>&nbsp;邀请人：' + value.user.userName + '</span></li>' +
										'<li><span>' + value.questionPo.createdTime + '</span></li>' +
										'<li><a href="/lagsms/invitation/' + value.questionId + '/details"><span>简介：</span><span>' + value.questionPo.title + '</span></a></li>' +
									'</ul>'
		            		});
		            		$("#myInvitePutReply>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			
			
			/*********************************************************我收到的邀请 end********************************************************/
			
			
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