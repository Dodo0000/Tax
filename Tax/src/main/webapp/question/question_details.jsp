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
	<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/zeroModal/zeroModal.min.js" charset="utf-8"></script>
	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/footer.css"/>
	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/questionDetails.css">
	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/zeroModal/zeroModal.css">
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/config.js"></script>
	<style>
		#two {
			border-bottom: 1px solid #fff;
		    padding-bottom: 10px;
		    color: #fff;
		    display: inline-block;
		    width: 90%;
		    height: 65%;
		}
		#twoplus{
			background:#1B55A9;
		}
	</style>
</head>
<body>
	<!-- header start -->
		<%@ include file="../header.jsp" %>
	<!-- header end -->
	<!-- 中间部分start -->
	<div class="liuan_content_wrapall">
		<!-- path -->
		<div class="path_nav">
			
			<span class="fl">当前位置：<a style="color:black;" href="http://localhost:8080/Tax/questions" class="nav_style">咨询</a></span>
			<span class="fl">&nbsp;&gt;&nbsp;</span>
			<span class="fl" style="width:300px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
			   <a href="http://localhost:8080/Tax/questions/ques_1513737987706/details" class="nav_style"> 想了解个人所得税流程 </a>
			</span>
		</div>
		<div class="liuan_content">
			<div class="notsolved">
				<!-- 头部 start -->
				<div class="mark">
					<img src="http://localhost:8080/Tax/resources/image/questionmark.png">
					<span>未解决</span>
				</div>
				<div class="mark_content">
					<ul>
						<li><p>问题：想了解个人所得税流程</p></li>
						<li><span>2017-12-20</span></li>
					</ul>
				</div>
				<!-- 头部 end -->
				<div class="user_messageone">
					<!-- 问题详情 start -->
					<div class="user_messageone_list_content">
						<span>内容：</span>
						<span id="hidden"><p>个人说的税是怎么计算的，流程是什么？</p></span>
					</div>
					<!-- 问题详情 end -->
				</div>
			</div>
		<!-- 我的答案 start -->
		<div class="liuan_content_three">
			<div class="liuan_content_three_nav">
				<ul>
					<li><span>浏览：</span><span>381</span></li>
					<li><span>回答：</span><span>11</span></li>
						
					
					<li data-target-id="ques_1513737987706" data-target="question" onclick="report();" style="cursor:pointer;float:right;cursor:pointer;" id="report">举报</li>
					<li class="check_not_login" data-target-id="ques_1513737987706" data-target="question" onclick="starQuestion();" style="cursor: pointer;float:right;">
						收藏
					</li>
				</ul>
			</div>
			<!-- 最佳回答 -->
			
			<!-- 我的答案 end -->
			<!--其他回答 start -->
			<h1>全部回答</h1>
			<div class="gary">
				<div class="pink"></div>
			</div>
			<div class="user_messageTwo">
				<div class="user_messageTwo_list" id="user_messageTwo_list">
					<div id="answerContent" class="user_messageTwo_list_content"></div>
					<div id=answersPaging class="box"></div>
				</div>
			</div>
		</div>
		<!--其他回答 end -->
		<div style=" margin-top: 51px;">
			<p class="liuan_content_three_p">我要回答</p>
			
				
					<form action="http://localhost:8080/Tax/questions/ques_1513737987706/answers" method="post"> 
						<div class="liuan_content_four">
							<div class="liuan_content_four_main">
								<div class="liuan_content_four_content">
									<textarea name="content" id="editorContent" placeholder="你的回复"></textarea>
								</div>
								<div class="liuan_content_four_button">
									<button type="submit">提交</button>
								</div>
							</div>
						</div>
					</form>
				
				
			
		</div>
	</div>
	</div>
	<!-- 弹出举报详细信息窗口 start -->
	<div class="ex_liuan_PopWinbg">
		<div class="ex_liuan_PopWinContent">
			<form method="GET" id="sunmitTable">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="6">举报详细信息</td>
						<td><input type="hidden" name="target" id="target" style="height:0;width:0;"></td>
						<td><input type="hidden" name="targetId" id="targetId" style="height:0;width:0;"></td>
					</tr>
					<tr><td colspan="6" style="height:5px;"></td></tr>
					<tr>
						<td colspan="6">
						<textarea name="description"></textarea> 
						
						</td>
					</tr>
					<tr><td colspan="6"><button type="submit">提交</button></td></tr>
				</table>
			</form>
			<div class="ex_liuan_Close_PopWin" onclick="closePopWin()"></div>
		</div>
	</div>
	<!-- 弹出举报详细信息窗口 end -->
	<!-- 弹出修改详细信息窗口 start -->
		<div class="ex_liuan_PopWinbgdel">
			<div class="ex_liuan_PopWinContentdel">
				<form method="POST" id="editQuestion">
					<input type="hidden" value="ques_1513737987706" name="id">
					<table cellspacing="0" cellpadding="0" style="height:330px;width:600px;">
						<tr>
							<td align="center" colspan="6">修改详细信息</td>
						</tr>
						<tr>
							<td style="width:50px;height:75px;">标题：</td>
							<td>
								<input type="text" value="想了解个人所得税流程" name="title" style="width:100%;height:45%;font-size:20px;">
							</td>
						</tr>
						<tr>
							<td style="width:50px;">内容：</td>
							<td>
								<textarea id="quescontent" name="content"><p>个人说的税是怎么计算的，流程是什么？</p>
</textarea> 
							</td>
						</tr>
					</table>
				</form>
				<div class="ex_liuan_buttondel">
					<input class="fl" type="button" onclick="subEdit()" value="提交">
					<input class="fr" type="button" value="返回" onclick="closePopWindel()">
				</div>
				<div class="ex_liuan_Close_PopWindel" onclick="closePopWindel()"></div>
			</div>
		</div>
		<!-- 弹出修改详细信息窗口 end -->
	<!--  尾部 start -->
	<%@ include file="../footer.jsp" %>
	<!--  尾部 end -->
	
	<script type="text/javascript">
	CKEDITOR.replace("quescontent");
	
	
		$('#sunmitTable').submit(function() {
	        $.ajax({
		        	url: "http://localhost:8080/Tax/report",
		        type: "post",
		        dataType: "json",
		        data: $('#sunmitTable').serialize(),
		        success: function (data) {
			        	if(data.result=='1'){
			        		zeroModal.success('操作成功!');
			        	} else {
			        		zeroModal.error('操作失败!');
			        	}
		        }
	      	})
		});
		//弹出框
		function closePopWin(){
			$('.ex_liuan_PopWinbg').hide();
		}
	</script>
	<!--  尾部 end -->
	
	
		
			<script type="text/javascript">
			 	var userId='user_1530497245745';
			 	var bestAnswerId = ''
			 	
			 	
				//点赞 answer
				function likeAnswer() {
					var $target;
					if(event.target.tagName === 'SPAN') {
						$target = $(event.target).parent('li');
					} else {
						$target = $(event.target);
					}
					
					var $likeCount = $target.children('.like-answer-num');
					var answerId = $target.data("answerId");
					
					$.post("http://localhost:8080/Tax/like", {
						questionId: questionId,
						answerId: answerId,
					}, function(data) {
						if(data.action == -1 && data.result > 0) { // 取消成功
							var count = parseInt($likeCount.text());
							$likeCount.text(count - 1);
							$target.children('span:first-child').html("点赞");
							return;
						}
						if (data.action == 1 && data.result > 0) { //点赞成功
							var count = parseInt($likeCount.text());
							$likeCount.text(count + 1);
							$target.children('span:first-child').html("已赞");
							return;
						}
		        		});
				}
				//采纳答案
				function acceptAnswer() {
					if(hasBestAnswer) {
				 		zeroModal.alert("你已经采纳了最佳回答!");
				 		return;
					}
					
					var $target = $(event.target);
				 	 
					var answerId = $target.data("answer-id");
					/* var questionId = $target.data("question-id"); */
					
				 	$.post("http://localhost:8080/Tax/updateAnswerId", {
						answerId: answerId,
						id: questionId
				    }, function(data) {
		   				if(data.mes=="更新成功") {
						 	location.reload();
		   				}
	        	 		});
			 	}
				
				// 举报问题
				function report() {
					var $target = $(event.target);
					var target = $target.data("target");
					var targetId = $target.data("target-id");
					$("#target").val(target);
					$("#targetId").val(targetId);
					
					$('.ex_liuan_PopWinbg').show();
				}
				
				// 检查登录用户是否点赞答案
				function checkLikeAnswers(answerIds) {
				   	$.get('http://localhost:8080/Tax/likes/check', {
						 questionId: 'ques_1513737987706',
						 a: answerIds
					 }, function(data) {
					 	var staredTargetIds = new Set(data);
						 var uls = $("#answerContent").children('ul');
						 if(staredTargetIds.has(bestAnswerId)) {
							 $('#quesBestAnswer').find('.like-answer span:first-child').html('已赞');
						 }
						
						for(var i = 0; i < uls.length; i++ ) {
							var ul = uls[i];
							var answerId = ul.dataset.answerId;
							if(staredTargetIds.has(answerId)) {
								staredTargetIds.delete(answerId);
								ul.querySelector('.like-answer span:first-child').innerHTML = '已赞';
							}
						}
					});
				}
				
				// 检查登录用户是否收藏答案
				function checkStarAnswers(answerIds) {
				   	$.get('http://localhost:8080/Tax/star/check', {
						 target: 'answer',
						 userId: userId,
						 t: answerIds
					 }, function(data) {
					 	var staredTargetIds = new Set(data);
						
						 var uls = $("#answerContent").children('ul');
						 
						 if(staredTargetIds.has(bestAnswerId)) {
							 $('#quesBestAnswer').find('.star-answer span:first-child').html('已收藏');
						 }
						
						for(var i = 0; i < uls.length; i++ ) {
							var ul = uls[i];
							var answerId = ul.dataset.answerId;
							if(staredTargetIds.has(answerId)) {
								staredTargetIds.delete(answerId);
								ul.querySelector('.star-answer span:first-child').innerHTML = '已收藏';
							}
						}
					});
				}
				
				//收藏答案
				function starAnswer() {
				
					var $target;
					if(event.target.tagName === 'SPAN') {
						$target = $(event.target).parent('li');
					} else {
						$target = $(event.target);
					}
					var $starCount = $target.children('.star-answer-num');
					var targetId = $target.data("target-id");
					$.post("http://localhost:8080/Tax/star", {
						target: "answer",
						targetId: targetId
					}, function(data) {
					 	if(data.action == -1 && data.result > 0) { //取消成功
							var count = parseInt($starCount.text());
							$starCount.text(count - 1);
							$target.children('span:first-child').html('收藏');
							
							if(targetId == bestAnswerId) {
								$('#quesBestAnswer').find('.star-answer span:first-child').html('收藏');
								$('#quesBestAnswer').find('.star-answer-num').html(count - 1);
							}
							return;
						}
						if (data.action == 1 && data.result > 0) { //收藏成功
							var count = parseInt($starCount.text());
							$starCount.text(count + 1);
							$target.children('span:first-child').html('已收藏');
							
							if(targetId == bestAnswerId) {
								$('#quesBestAnswer').find('.star-answer span:first-child').html('已收藏');
								$('#quesBestAnswer').find('.star-answer-num').html(count + 1);
							}
							return;
						}
			       	});
				}
					
				//收藏问题(详情页面)
				function starQuestion() {
					
					var $target = $(event.target);
					
					$.post("http://localhost:8080/Tax/star",{
						target: "question",
						targetId: "ques_1513737987706"
					},function(data) {
						console.log("data----"+JSON.stringify(data));
					 	if(data.action == -1 && data.result > 0) { //取消成功
							$target.html('收藏');
							return;
						}
						if (data.action == 1 && data.result > 0) { //收藏成功
							$target.html('已收藏'); 
							return;
						}
			       	});
				}
			</script>
		
		
	
	<script type="text/javascript">
		//分页
		/* 咨询详情 */
		var count =10;
		var page = Math.ceil(count/10);
		var questionId='ques_1513737987706';
		
		// 如果问题提问者已经采纳最佳答案
		var hasBestAnswer = false;// 已经存在最佳答案
		var canAcceptAnswer = false;// 已经存在最佳答案
		
		// 分页获取 该question的相关回答answers
	    $('#answersPaging').paging({
	        initPageNo: 1, 								//初始页码
	        totalPages: page, 							//总页数
	        totalCount: '合计10条数据', 				//条目总数
	        slideSpeed: 600, 							//缓动速度。单位毫秒
	        jump: true,									//是否支持跳转
	        callback: function(page) {					//回调函数
	        		$.get("http://localhost:8080/Tax/questions/ques_1513737987706/answers", {
		            	page: page,
		            	rows: 10,
	            }, function(data) {
	            		initAndCheckAnswers(data);
	            }); 
	        }
	    });
		var imgUrl = 'http://localhost:8080/Tax/file/showPicFile?fileId=';
		var defaultImgUrl = 'http://localhost:8080/Tax/resources/image/u2815.png';
		// 初始化答案 以及 check answers
		function initAndCheckAnswers(data) {
			var dataHTML = data.map(function(value, index, array) {
	           	var bestAnswer = canAcceptAnswer && !hasBestAnswer ? ('<li data-answer-id="'+value.id+'" data-question-id="'+questionId+'" onclick="acceptAnswer();" style="cursor:pointer;">采纳</li>') : '';
	           	var userAvatar = value.user && value.user.avatar ? (imgUrl + value.user.avatar) : defaultImgUrl;
            		return '<ul data-answer-id="' + value.id + '" style="border-bottom:1px dashed #ccc;height:136px;">'+
			        			'<li>' +
			        				'<a href="http://localhost:8080/Tax/users/' + value.user.userId + '/zone">' +
			        					'<img src="' + userAvatar + '" alt="Avatar">' +
			        				'</a>' +
			        			'</li>'+
			        			'<li><p class="over">'+value.content+'</p></li>'+
			        			'<li><span>'+value.createdTime+'</span></li>'+
			        			'<li class="star_answer_action star-answer" data-target-id="'+value.id+'" onclick="starAnswer();" style="cursor:pointer;">' +
			        				'<span>收藏：</span>' +
			        				'<span class="starCount star-answer-num">' + (value.starCount ? value.starCount : 0 ) + '</span>' +
			        			'</li>'+
			        			'<li class="like-answer" data-answer-id="'+value.id +'" onclick="likeAnswer();"  style="cursor:pointer;">' +
			        				'<span style="cursor:pointer;">点赞：</span>' +
			        				'<span class="likeCount like-answer-num">' + (value.likeCount ? value.likeCount : 0 ) + '</span>' +
		        				'</li>'+
			        			bestAnswer +
			        			'<li id="report_one">' +
			        				'<span data-target-id="'+value.id+'" data-target="answer" onclick="report();" style="text-decoration: none;color:black;cursor:pointer;">举报</span>' +
		        				'</li>' +
		        			'</ul>' ;
    			});
        		
        		$("#answerContent").html(dataHTML.join(""));
        		/* 判断登陆用户是否收藏答案 */
        		
        		var answerIds = data.map(function(obj) {
				return obj.id;
			});
			if(answerIds.length==0){
				return;
			}
        		checkLikeAnswers(answerIds);
        		checkStarAnswers(answerIds);
		}
		
		//点击回到顶部下500px 时间0
       jQuery(function() {
 		  	$('#nextPage').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		  	$('#prePage').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		 	$('#firstPage').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		 	$('#lastPage').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		 	$('.sel-page').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		 	$('.selpage').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		 	$('.jump-button').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		 	$('.turnPage').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		 	$('.last-page').click(function(){$('html,body').animate({scrollTop: '500px'}, 0);return false;});
 		});
		
      	//修改弹出框
 		function reportdel(){
 			$('.ex_liuan_PopWinbgdel').show();
 		}
 		function closePopWindel(){
			$('.ex_liuan_PopWinbgdel').hide();
		}
	 		
 		//删除
 		$(document).ready(function() {
 			CKEDITOR.replace('editorContent');
 		 	
		  	$("#del").click(function() {
				  zeroModal.confirm('是否删除？', function() {
					  $.ajax({
							 url: "http://localhost:8080/Tax/questions/ques_1513737987706/del",
							 type: 'POST',
							 processData: false,
							 contentType: false,
							 success: function(data) {
								 console.log(data);
								 if(data==1){
									 zeroModal.alert('删除成功');
								 }else{
									 zeroModal.alert('删除失败');
								 }
							 }
						 });
				  });
			  });
		});
	 		
 		function subEdit() {
 			$.ajax({
				 url: "http://localhost:8080/Tax/questions/update",
				 type: 'POST',
				 dataType: "json",
			     data: $('#editQuestion').serialize(),
				 success: function(data) {
					 console.log(data);
					 if(data==1){
						 zeroModal.alert('修改成功');
						 closePopWindel();
						 $(".zeromodal-btn").click(function(){
							 history.go(0) ;
						 })
					 }else{
						 zeroModal.alert('修改失败');
						 closePopWindel();
					 }
				 }
			 });
 		}
	</script>
</body>
</html>