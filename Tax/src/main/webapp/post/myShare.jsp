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
		<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/myShare.css">
		<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/header/header.css"/>	
	    <link rel="stylesheet" type="text/css" href="/lagsms/resources/css/footer.css"/>
		<script src="/lagsms/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	  	<script src="/lagsms/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	  	<link rel="stylesheet" href="/lagsms/resources/css/paging.css">
	  	<link rel="icon" href="/lagsms/resources/image/home/favicon.gif" type="image/x-icon" />
	</head>
	<body>
		<!-- 头部标题start -->
		<%@ include file="../header.jsp" %>
		<!-- 头部标题end -->
		
		<!-- 中间部分start -->
		<div class="tab" style="width:1200px;margin-top:10px;">
		<div style="margin:10px;margin-top:10px;color:black;">
		<span class="">当前位置：<a style="color:black" href="javascript:history.go(-1);" class="nav_style">个人中心</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
			<span class=""><a href="" style="color:black"> 解读和分享</a></span>
		</div>
			<div class="tab_menu" style="width:150px;">
				<ul>
					<li class="selected" style="width:150px;">我的解读和分享</li>
				</ul>
			</div>
			<div class="tab_box">
				<div>
				<!-------------------------------------------------------我的分享 start-------------------------------------------------->
					<div class="center">
						<!-- 分页 start -->
						<div class="tab_a" id="tab_b" style="height: 1100px;">
						  	<ul class="tabOne tabOneys" id="tabOne">
							    	<li data-target="#myAllShare" class="curr"><a>全部</a></li>
							    	<li data-target="#myShareExamineWait"><a>等待审核</a></li>
							    	<li data-target="#myShareExamineSuccess"><a>审核通过</a></li>
							    	<li data-target="#myShareExamineFail"><a>审核不通过</a></li>
						  	</ul>
						  	<!-- 我的分享 -->
					  		<div class="tab_con">
					  			<!-- 我的分享 全部帖子 开始  -->
						    		<div id="myAllShare" style="display:block;">
						    			<div class="quesContent">
							    			
									</div>
							    		<div id="Fy_myAllShare" class="box"></div>
						    		</div>
						    		<!-- 我的分享 全部帖子 结束 -->
						    		
						    		<!-- 我的分享_等待审核  开始 -->
						    		<div id="myShareExamineWait" style="display: none;">
						    			<div class="quesContent">
							    			
									</div>
							    		<div id="Fy_myShareExamineWait" class="box"></div>
						    		</div>
						    		<!-- 我的分享_等待审核  结束 -->
						    		
						    		<!-- 我的分享_审核通过 开始 -->
						    		<div id="myShareExamineSuccess" style="display: none;">
						    			<div class="quesContent">
											
									</div>
									<div id="Fy_myShareExamineSuccess" class="box"></div>
						    		</div>
						    		<!-- 我的分享_审核通过 结束 -->
						    		
						    		<!-- 我的分享_审核不通过 开始 -->
						    		<div id="myShareExamineFail" style="display: none;">
						    			<div class="quesContent">
											
									</div>
									<div id="Fy_myShareExamineFail" class="box"></div>
						    		</div>
						    		<!-- 我的分享_审核不通过 结束-->
					    		</div>
						</div>
						<!-- 分页 end -->
					</div>
				</div>
				<!-------------------------------------------------------我的分享 end-------------------------------------------------->
			</div>
		</div>
		<!-- 中间部分end -->
		<!-- 弹出修改详细信息窗口 start -->
		<!-- <div class="ex_liuan_PopWinbg">
			<div class="ex_liuan_PopWinContent">
				<form method="GET" id="sunmitTable">
					<table cellspacing="0" cellpadding="0" style="height:330px;width:600px;">
						<tr>
							<td align="center" colspan="6">修改详细信息</td>
						</tr>
						<tr>
							<td style="width:50px;height:75px;">标题：</td>
							<td>
								<input type="text" style="width:100%;height:45%;font-size:20px;">
							</td>
						</tr>
						<tr>
							<td style="width:50px;">内容：</td>
							<td>
								<textarea name="description"></textarea> 
							</td>
						</tr>
					</table>
				</form>
				<div class="ex_liuan_button">
					<input class="fl" type="button" value="提交">
					<input class="fr" type="button" value="返回" onclick="closePopWin()">
				</div>
				<div class="ex_liuan_Close_PopWin" onclick="closePopWin()"></div>
			</div>
		</div> -->
		<!-- 弹出修改详细信息窗口 end -->
		
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
		
		//我的分享小的切换
		$(function() {
			var $li = $('.tabOne li');
			var $li_one=$('.tabOne li:nth-child(1)');
			var $ul = $('.tab_con div:nth-child(1)');
			var $tab_on=$('.tab_con');
			var $myAllShare=$('#myAllShare');
			var $myShareExamineWait=$('#myShareExamineWait');
			var $myShareExamineSuccess=$('#myShareExamineSuccess');
			var $myShareExamineFail=$('#myShareExamineFail');
			$li.click(function() {
				$myAllShare.css('display','none');
			 	$myShareExamineWait.css('display','none');
			 	$myShareExamineSuccess.css('display','none');
			 	$myShareExamineFail.css('display','none');
				var target = $(this).data("target");
				console.log(target);
				$(target).css('display','block');
				$(this).addClass("curr").siblings().removeClass("curr");//当前li高亮
			});
		});
			
			/*********************************************************我的分享 start********************************************************/
			/* 全部 */
			var allmyShareCount =0;
			$('#Fy_myAllShare').paging({
	            initPageNo: 1, 								// 初始页码
	            totalPages: Math.ceil(allmyShareCount/10),  // 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 							// 缓动速度。单位毫秒
	            jump: true,									// 是否支持跳转
	            callback: function(pageOne) { 				// 回调函数
	                $.get("/lagsms/users/myShares", {
		                	page: pageOne,
		                	rows: 10,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array) {
		                		var status="";
			                	if(value.status==0){
			                		status="审核中";
			                	}else if(value.status==1){
			                		status="审核通过";
			                	}else{
			                		status="审核未通过";
			                	}
			                	var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="/lagsms/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:54px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="/lagsms/resources/image/headport.png" alt="Avatar" style="width:55px;height:54px;vertical-align:middle;">';
	            				}
		                		return '<ul style="border-bottom:1px dashed rgb(238,238,238);height: 130px;">' +
		                					'<li>' + userAvatar + '<span>&nbsp;标题：' + value.title + '</span></li>' +
											'<li><span>' + status + '</span></li>' +
											'<li>' +
												'<span>' + value.createdTime + '</span>' +
												/* '<span class="quesContent_spanTwo" id="del">删除</span>'+
												'<span class="quesContent_spanOne" onclick="report();" id="report">修改</span>'+ */
											'</li>' +
											'<li><span><a style="color:black;" href="/lagsms/posts/'+value.id+'">'+value.content+'</a></span></li>' +
											'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
											'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
										'</ul>'
		            		});
		            		$("#myAllShare>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			
			/* 等待审核 */
			var myShareExamineWaitCount =0;
			$('#Fy_myShareExamineWait').paging({
	            initPageNo: 1, 								// 初始页码
	            totalPages: Math.ceil(myShareExamineWaitCount/10),  // 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 							// 缓动速度。单位毫秒
	            jump: true,									// 是否支持跳转
	            callback: function(pageTwo) { 				// 回调函数
	                $.get("/lagsms/users/myShares",{
	                	page: pageTwo,
	                	rows: 10,
	                	status: 0,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array) {
		                		var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="/lagsms/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:54px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="/lagsms/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				}
		                		return '<ul style="border-bottom:1px dashed rgb(238,238,238);height: 130px;">' +
		                					'<li>' + userAvatar + '<span>&nbsp;标题：' + value.title + '</span></li>' +
											'<li><span>审核中</span></li>' +
											'<li>' +
												'<span>' + value.createdTime + '</span>' +
												/* '<span class="quesContent_spanTwo" id="del">删除</span>'+
												'<span class="quesContent_spanOne" onclick="report();" id="report">修改</span>'+ */
											'</li>' +
											'<li><span><a style="color:black;" href="/lagsms/posts/'+value.id+'">'+value.content+'</a></span></li>' +
											'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
											'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
										'</ul>'
		            		});
		            		$("#myShareExamineWait>.quesContent").html(dataHTML.join(""));
	                });
	            }
			}); 
			
			/* 审核通过 */
			var myShareExamineSuccessCount =0;
			$('#Fy_myShareExamineSuccess').paging({
	            initPageNo: 1, 											// 初始页码
	            totalPages: Math.ceil(myShareExamineSuccessCount/10),   // 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 										// 缓动速度。单位毫秒
	            jump: true,												// 是否支持跳转
	            callback: function(pageThree) { 							// 回调函数
	                $.get("/lagsms/users/myShares",{
		                	page: pageThree,
		                	rows: 10,
		                	status: 1,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array){
		                		var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="/lagsms/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:54px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="/lagsms/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				}
		                		return '<ul style="border-bottom:1px dashed rgb(238,238,238);height: 130px;">' +
		                					'<li>' + userAvatar + '<span>&nbsp;标题：' + value.title + '</span></li>' +
											'<li><span>审核通过</span></li>' +
											'<li>' +
												'<span>' + value.createdTime + '</span>' +
												/* '<span class="quesContent_spanTwo" id="del">删除</span>'+
												'<span class="quesContent_spanOne" onclick="report();" id="report">修改</span>'+ */
											'</li>' +
											'<li><span><a style="color:black;" href="/lagsms/posts/'+value.id+'">'+value.content+'</a></span></li>' +
											'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
											'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
										'</ul>'
		            		});
		            		$("#myShareExamineSuccess>.quesContent").html(dataHTML.join(""));
	                });
	            }
			}); 
			
			/* 审核不通过 */
			var myShareExamineFailCount =0;
			$('#Fy_myShareExamineFail').paging({
	            initPageNo: 1, 										// 初始页码
	            totalPages: Math.ceil(myShareExamineFailCount/10),  // 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 									// 缓动速度。单位毫秒
	            jump: true,											// 是否支持跳转
	            callback: function(pageFour) { 						// 回调函数
	                $.get("/lagsms/users/myShares",{
		                	page: pageFour,
		                	rows: 10,
		                	status: -1,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array){
		                		var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="/lagsms/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:54px;vertical-align:middle;">';
	            				} else {
	            					userAvatar = '<img src="/lagsms/resources/image/headport.png" alt="Avatar" style="width:55px;vertical-align:middle;">';
	            				}
		                		return '<ul style="border-bottom:1px dashed rgb(238,238,238);height: 130px;">' +
											'<li>' + userAvatar + '<span>&nbsp;标题：' + value.title + '</span></li>' +
											'<li><span>审核不通过</span></li>' +
											'<li>' +
												'<span>' + value.createdTime + '</span>' +
												/* '<span class="quesContent_spanTwo" id="del">删除</span>'+
												'<span class="quesContent_spanOne" onclick="report();" id="report">修改</span>'+ */
											'</li>' +
											'<li><span><a style="color:black;" href="/lagsms/posts/'+value.id+'">'+value.content+'</a></span></li>' +
											'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
											'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
										'</ul>'
		            		});
		            		$("#myShareExamineFail>.quesContent").html(dataHTML.join(""));
	                });
	            }
			}); 
			
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
	      	//修改弹出框
	 		/* function report(){
	 			$('.ex_liuan_PopWinbg').show();
	 		}
	 		function closePopWin(){
				$('.ex_liuan_PopWinbg').hide();
			}
	 		//删除
	 		$(document).ready(function(){
			  $("#del").click(function(){
				  zeroModal.alert('是否删除？');
			  });
			}); */
		</script>
	</body>
</html>