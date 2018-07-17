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
	<script src="/lagsms/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="/lagsms/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/sendMessage.css">
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/footer.css"/>
	<link rel="stylesheet" href="/lagsms/resources/css/paging.css">
	<link rel="icon" href="/lagsms/resources/image/home/favicon.gif" type="image/x-icon" />
</head>

<body>
		<!-- 头部标题start -->
		<%@ include file="../header.jsp" %>
		<!-- 头部标题end -->
		<!-- 中间部分start -->
		<div class="tab" style="margin-top:10px;">
		<div style="margin:10px;margin-top:10px;color:black;">
		<span class="">当前位置：<a style="color:black" href="javascript:history.go(-1);" class="nav_style">个人中心</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
			<span class=""><a href="" style="color:black"> 发出的私信</a></span>
		</div>
			<div class="tab_menu">
				<ul>
					<li class="selected">发出的私信</li>
				</ul>
			</div>
			
			<div class="gary">
				<div class="pink"></div>
			</div>
			
			<div class="tab_box">
				<!-------------------------------------------------------我发出的私信 statr-------------------------------------------------->
				<div class="center">
					<!-- 分页 start -->
					<div class="tab_a" id="tab_b">
						<div class="tab_con">
							<!-- 全部 start -->
							<div id="allmyLetterOut" style="display: block;">
								<div class="quesContent"></div>
								<div id="Fy_allmyLetterOut" class="box"></div>
							</div>
							<!-- 全部 end -->
						</div>
					</div>
					<!-- 分页 end -->
				</div>
				<!-------------------------------------------------------我发出的私信 end-------------------------------------------------->
			</div>
		</div>
		<!-- 中间部分end -->
		
		<!-- 底部内容start -->
		<%@ include file="../footer.jsp" %>
		<!-- 底部内容end -->
		
	<script type="text/javascript">
			
			//-------------------------------------------------------我发出的私信分页 statr--------------------------------------------------
			/* 全部 */
			var allmyLetterOutCount =0;
			$('#Fy_allmyLetterOut').paging({
	            initPageNo: 1, 									// 初始页码
	            totalPages: Math.ceil(allmyLetterOutCount/10),  // 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 								// 缓动速度。单位毫秒
	            jump: true,										// 是否支持跳转
	            callback: function(pageOne) { 					// 回调函数
	                $.get("/lagsms/users/mySendMessages",{
		                	page: pageOne,
		                	rows: 10,
	                }, function(data) {
	                		console.log(data);
		                	var dataHTML = data.map(function(value, index, array){
		                		var userAvatar;
	            				if(value.toUser && value.toUser.avatar) {
	            					userAvatar = '<img src="/lagsms/file/showPicFile?fileId='+ value.toUser.avatar +'" alt="Avatar" >';
	            				} else {
	            					userAvatar = '<img src="/lagsms/resources/image/headport.png" alt="Avatar">';
	            				}
		                		return '<ul style="border-bottom:1px dashed #ccc;" class="clearfix">' + 
										'<li>' +
											'<div style="width:100px;float:left">'+ userAvatar +'</div>' +
											'<a href="/lagsms/users/' + value.toUser.userId + '/zone">' + '<span>接收人:</span> '+value.toUser.userName + '</a>' +
										'</li>' +
										'<li><span class="fl">' + value.createdTime + '</span></li>' +
										'<li><a href="/lagsms/letter/' + value.id + '/details"><span>' + value.content + '</span></a></li>' + 
										
									'</ul>'
		            		});
		            		$("#allmyLetterOut>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			//-------------------------------------------------------我发出的私信分页 end--------------------------------------------------
			
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