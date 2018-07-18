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
		<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/myQuestion.css">
		<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	  	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
	  	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/header.css"/>	
	    <link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/footer.css"/>
	  	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
	  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/zeroModal/zeroModal.css">
	  	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	</head>
	
	<body>
	    <!-- 头部标题start -->
	    <%@ include file="../header.jsp" %>
		<!-- 头部标题end -->
		<!-- 中间部分start -->
		<div class="tab" style="width:1200px;margin-top:10px; ">
		<div style="margin:10px;margin-top:10px;color:black;">
		<span class="">当前位置：<a style="color:black" href="javascript:history.go(-1);" class="nav_style">个人中心</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
			<span class=""><a href="" style="color:black"> 提问</a></span>
		</div>
				<div class="tab_menu">
					<ul>
						<li class="selected">我的提问</li>
					</ul>
				</div>
				<div class="tab_box">
					<div>
					<!-------------------------------------------------------我的提问 start-------------------------------------------------->
						<div class="center">
							<!-- 分页 start -->
							<div class="tab_a" id="tab_b" style="height: 1100px;">
								<div class="center_listButton">
								  	<ul class="tabOne tabOneys" id="tabOne">
									    	<li data-target="#myAllQuestion" class="curr"><a>全部</a></li>
									    	<li data-target="#myQuestionExamineWait"><a>审核待处理</a></li>
									    	<li data-target="#myQuestionWaitAnswer"><a>待解答</a></li>
									    	<li data-target="#myQuestionOverAnswer"><a>已解答</a></li>
									    	<li data-target="#myQuestionExamineFail"><a>审核未通过</a></li>
								  	</ul>
							  	</div>
						  		<div class="tab_con">
							  		<!-- 全部 start -->
							    		<div id="myAllQuestion" style="display:block;">
							    			<div class="quesContent">
							    				
											</div>
								    		<div id="Fy_myAllQuestion" class="box"></div>
							    		</div>
							    		<!-- 全部 end -->
							    		
							    		<!-- 等待处理 start -->
							    		<div id="myQuestionExamineWait" style="display: none;">
							    			<div class="quesContent">
								    			
											</div>
								    		<div id="Fy_myQuestionExamineWait" class="box"></div>
							    		</div>
							    		<!-- 等待处理 end -->
							    		
							    		<!-- 等待解答 start -->
							    		<div id="myQuestionWaitAnswer" style="display: none;">
							    			<div class="quesContent">
							    				
											</div>
										<div id="Fy_myQuestionWaitAnswer" class="box"></div>
							    		</div>
							    		<!-- 等待解答 end -->
							    		
							    		<!-- 已解答 start -->
							    		<div id="myQuestionOverAnswer" style="display: none;">
							    			<div class="quesContent">
							    			
											</div>
										<div id="Fy_myQuestionOverAnswer" class="box"></div>
							    		</div>
							    		<!-- 已解答 end -->
							    		
							    		<!-- 审核未通过 start -->
							    		<div id="myQuestionExamineFail" style="display: none;">
							    			<div class="quesContent">
								    			
											</div>
										<div id="Fy_myQuestionExamineFail" class="box"></div>
							    		</div>
							    		<!-- 审核未通过 end -->
						    	</div>
							</div>
							<!-- 分页 end -->
						</div>
					</div>
					<!-------------------------------------------------------我的提问 end-------------------------------------------------->
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
			var $myAllQuestion=$('#myAllAnswer');
			var $myAllAnswer=$('#myAllQuestion');
			$div_li.click(function() {
				$(this).addClass("selected") 				//当前<li>元素高亮
					.siblings().removeClass("selected"); 	//去掉其它同辈<li>元素的高亮
				var index = $div_li.index(this); 			//获取当前点击的<li>元素 在 全部li元素中的索引。
				$("div.tab_box > div") 						//选取子节点。不选取子节点的话，会引起错误。如果里面还有div 
					.eq(index).show() 						//显示 <li>元素对应的<div>元素
					.siblings().hide();						//隐藏其它几个同辈的<div>元素
				$myAllQuestion.css('display','block');
				$myAllAnswer.css('display','block');
			})
		});
		//我的提问小的切换
		$(function(){
			var $li = $('.center_listButton ul li');	
			var $li_one=$('.tabOne li:nth-child(1)');
			var $ul = $('.tab_con div:nth-child(1)');
			var $tab_on=$('.tab_con');
			var $myAllQuestion=$('#myAllQuestion');
			var $myQuestionExamineWait=$('#myQuestionExamineWait');
			var $myQuestionWaitAnswer=$('#myQuestionWaitAnswer');
			var $myQuestionOverAnswer=$('#myQuestionOverAnswer');
			var $myQuestionExamineFail=$('#myQuestionExamineFail');
			$li.click(function() {
				$myAllQuestion.css('display','none');
			 	$myQuestionExamineWait.css('display','none');
			 	$myQuestionWaitAnswer.css('display','none');
			 	$myQuestionOverAnswer.css('display','none');
			 	$myQuestionExamineFail.css('display','none');
				var target = $(this).data("target");
				console.log(target);
				$(target).css('display','block');
			});
			$li.click(function(){
				$(this).addClass("curr") 				//当前<li>元素高亮
				.siblings().removeClass("curr");
			})
		});
		
		/*********************************************************我的提问 start********************************************************/
		/* 全部 */
		var allQuestionCount =0;
		$('#Fy_myAllQuestion').paging({
            initPageNo: 1, 								// 初始页码
            totalPages: Math.ceil(allQuestionCount/10), // 总页数
            totalCount: '合计 0 条数据', 	// 条目总数
            slideSpeed: 600, 							// 缓动速度。单位毫秒
            jump: true,									// 是否支持跳转
            callback: function(pageOne) { 				// 回调函数
                $.get("http://localhost:8080/Tax/users/questions",{
                	page: pageOne,
                	rows: 10,
                }, function(data) {
                	var dataHTML = data.map(function(value, index, array){
                		var status="";
	                	if(value.status==0){
	                		status="审核中";
	                	}else if(value.status==1){
	                		status="待解答";
	                	}else if(value.status==2){
	                		status="已解答";
	                	}else{
	                		status="未通过";
	                	}
	                	var userAvatar;
           				if(value.user && value.user.avatar) {
           					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				} else {
           					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				}
                		return '<ul style="border-bottom:1px dotted #ccc;height: 130px;">' +
									'<li>' + userAvatar + '<span>&nbsp;标题：' + value.title + '</span></li>' + 
									'<li>'+
										'<span>' + status + '</span>' +
									'</li>' +
									'<li>'+
										'<span>' + value.createdTime + '</span>'+
									'</li>'+
									'<li><a href="http://localhost:8080/Tax/questions/' + value.id + '/details"><span>内容：</span><span>' + value.content + '</span></a></li>' + 
									'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
									'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
									'<li><span>回答：</span><span>' + value.answerCount + '</span></li>' +
									'<li><span>分类：</span><span>' + value.category + '</span></li>' +
								'</ul>';
            		});
            		$("#myAllQuestion>.quesContent").html(dataHTML.join(""));
                });
            }
		}); 
		
		
		/* 等待处理 */
		var examiningQuestionCount =0;
		$('#Fy_myQuestionExamineWait').paging({
            initPageNo: 1, 										// 初始页码
            totalPages: Math.ceil(examiningQuestionCount/10), 	// 总页数
            totalCount: '合计 0 条数据', 	// 条目总数
            slideSpeed: 600, 									// 缓动速度。单位毫秒
            jump: true,											// 是否支持跳转
            callback: function(pageTwo) { 						// 回调函数
                $.get("http://localhost:8080/Tax/users/questions",{
	                	page: pageTwo,
	                	rows: 10,
	                	status: 0,
                }, function(data) {
                	var dataHTML = data.map(function(value, index, array){
                		var userAvatar;
           				if(value.user && value.user.avatar) {
           					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				} else {
           					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				}
                		return '<ul style="border-bottom:1px dotted #ccc;height: 130px;">' +
                					'<li>' + userAvatar + '<span>&nbsp;标题：' + value.title + '</span></li>' + 
									'<li>'+
										'<span>审核中</span>'+
									'</li>' + 
									'<li>' + 
										'<span>' + value.createdTime + '</span>'+
										/* '<span class="quesContent_spanTwo" id="del">删除</span>'+
										'<span class="quesContent_spanOne" onclick="report();" id="report">修改</span>'+ */
									'</li>' +
									'<li><a href="http://localhost:8080/Tax/questions/' + value.id + '/details"><span>内容：</span><span>' + value.content + '</span></a></li>' +
									'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
									'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
									'<li><span>回答：</span><span>' + value.answerCount + '</span></li>' +
									'<li><span>分类：</span><span>' + value.category + '</span></li>' +
								'</ul>';
            		});
            		$("#myQuestionExamineWait>.quesContent").html(dataHTML.join(""));
                });
            }
		});
		
		/* 等待解答 */
		var answeringQuestionCount =0;
		$('#Fy_myQuestionWaitAnswer').paging({
            initPageNo: 1, 										// 初始页码
            totalPages: Math.ceil(answeringQuestionCount/10), 	// 总页数
            totalCount: '合计 0 条数据',	// 条目总数
            slideSpeed: 600, 									// 缓动速度。单位毫秒
            jump: true,											// 是否支持跳转
            callback: function(pageThree) { 					// 回调函数
                $.get("http://localhost:8080/Tax/users/questions",{
	                	page: pageThree,
	                	rows: 10,
	                	status: 1,
                }, function(data) {
                	var dataHTML = data.map(function(value, index, array){
                		var userAvatar;
           				if(value.user && value.user.avatar) {
           					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				} else {
           					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				}
                		return '<ul style="border-bottom:1px dotted #ccc;height: 130px;">' +
                		'<li>' + userAvatar + '<span>&nbsp;标题' + value.title + '</span></li>' +  
									'<li>'+
                						'<span>等待解答</span>'+
                					'</li>' + 
									'<li>' + 
										'<span>' + value.createdTime + '</span>'+
										/* '<span class="quesContent_spanTwo" id="del">删除</span>'+
										'<span class="quesContent_spanOne" onclick="report();" id="report">修改</span>'+ */
									'</li>' +
									'<li><a href="http://localhost:8080/Tax/questions/' + value.id + '/details"><span>内容：</span><span>' + value.content + '</span></a></li>' +
									'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
									'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
									'<li><span>回答：</span><span>' + value.answerCount + '</span></li>' +
									'<li><span>分类：</span><span>' + value.category + '</span></li>' +
								'</ul>';
            		});
            		$("#myQuestionWaitAnswer>.quesContent").html(dataHTML.join(""));
                });
            }
		});
		
		/* 已解答 */
		var answeredQuestionCount =0;
		$('#Fy_myQuestionOverAnswer').paging({
            initPageNo: 1, 										// 初始页码
            totalPages: Math.ceil(answeredQuestionCount/10), 	// 总页数
            totalCount: '合计 0 条数据', 	// 条目总数
            slideSpeed: 600, 									// 缓动速度。单位毫秒
            jump: true,											// 是否支持跳转
            callback: function(pageFour) { 						// 回调函数
                $.get("http://localhost:8080/Tax/users/questions",{
	                	page: pageFour,
	                	rows: 10,
	                	status: 2,
                }, function(data) {
                	var dataHTML = data.map(function(value, index, array){
                		var userAvatar;
           				if(value.user && value.user.avatar) {
           					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				} else {
           					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				}
                		return '<ul style="border-bottom:1px dotted #ccc;height: 130px;">' +
                					'<li>' + userAvatar + '<span>&nbsp;标题：' + value.title + '</span></li>' +  
									'<li>'+
										'<span>已解答</span>'+
                					'</li>' + 
									'<li>' + 
										'<span>' + value.createdTime + '</span>'+
										/* '<span class="quesContent_spanTwo" id="del">删除</span>'+
										'<span class="quesContent_spanOne" onclick="report();" id="report">修改</span>'+ */
									'</li>' +
									'<li><a href="http://localhost:8080/Tax/questions/' + value.id + '/details"><span>内容：</span><span>' + value.content + '</span></a></li>' +
									'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
									'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
									'<li><span>回答：</span><span>' + value.answerCount + '</span></li>' +
									'<li><span>分类：</span><span>' + value.category + '</span></li>' +
								'</ul>';
            		});
            		$("#myQuestionOverAnswer>.quesContent").html(dataHTML.join(""));
                });
            }
		});
		
		/* 审核未通过 */
		var examineFailQuestionCount =0;
		$('#Fy_myQuestionExamineFail').paging({
            initPageNo: 1, 										// 初始页码
            totalPages: Math.ceil(examineFailQuestionCount/10), // 总页数
            totalCount: '合计 0 条数据', 	// 条目总数
            slideSpeed: 600, 									// 缓动速度。单位毫秒
            jump: true,											// 是否支持跳转
            callback: function(pageFive) { 						// 回调函数
                $.get("http://localhost:8080/Tax/users/questions",{
	                	page: pageFive,
	                	rows: 10,
	                	status: -1,
                }, function(data) {
                	var dataHTML = data.map(function(value, index, array){
                		var userAvatar;
           				if(value.user && value.user.avatar) {
           					userAvatar = '<img src="http://localhost:8080/Tax/file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				} else {
           					userAvatar = '<img src="http://localhost:8080/Tax/resources/image/headport.png" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">';
           				}
                		return '<ul style="border-bottom:1px dotted #ccc;height: 130px;">' +
                					'<li>' + userAvatar + '<span>&nbsp;标题：' + value.title + '</span></li>' +  
									'<li>'+
										'<span>审核未通过</span>'+
                					'</li>' + 
									'<li>' + 
										'<span>' + value.createdTime + '</span>'+
										/* '<span class="quesContent_spanTwo" id="del">删除</span>'+
										'<span class="quesContent_spanOne" onclick="report();" id="report">修改</span>'+ */
									'</li>' +
									'<li><a href="http://localhost:8080/Tax/questions/' + value.id + '/details"><span>内容：</span><span>' + value.content + '</span></a></li>' +
									'<li><span>浏览：</span><span>' + value.browseCount + '</span></li>' +
									'<li><span>收藏：</span><span>' + value.starCount + '</span></li>' +
									'<li><span>回答：</span><span>' + value.answerCount + '</span></li>' +
									'<li><span>分类：</span><span>' + value.category + '</span></li>' +
								'</ul>';
            		});
            		$("#myQuestionExamineFail>.quesContent").html(dataHTML.join(""));
                });
            }
		});
		/*********************************************************我的提问 end********************************************************/
		
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
 			console.log("111111");
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