
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
		<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/myAnswer.css">
		<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	  	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
	  	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
	  	<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/config.js"></script>
	</head>
	<body>
	<div class="liuan_main">
		<!-- 头部标题start -->
		<%@ include file="../header.jsp" %>
		<!-- 头部标题end -->
		<!-- 中间部分start -->
		<div class="tab" style="width:1200px;margin-top:10px;min-height:600px">
		<div style="margin:10px;margin-top:10px;color:black;">
		<span class="">当前位置：<a style="color:black" href="javascript:history.go(-1);" class="nav_style">个人中心</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
			<span class=""><a href="" style="color:black"> 回答</a></span>
		</div>
				<div class="tab_menu">
					<ul>
						<li class="selected">我的回答</li>
					</ul>
				</div>
				<div class="tab_box">
					
					<!----------------------------------------------- 我的回答 start------------------------------------------------------->
					<div class="tab_box">
						<div class="center" >
							<!-- 分页 start -->
							<div class="tab_a" id="tab_b">
								<div class="center_listButton">
								  	<ul class="tabOne tabOneys myAnswerExamineFail_li" id="tabOne">
									    	<li data-target="#myAllAnswer" class="curr"><a>全部</a></li>
									    	<li data-target="#myAnswerExamineWait"><a>审核待处理</a></li>
									    	<li data-target="#myAnswerExamineSuccess"><a>审核通过</a></li>
									    	<li data-target="#myAnswerExamineFail"><a>审核未通过</a></li>
								  	</ul>
							  	</div>
						  		<div class="tab_con">
							  		<!-- 全部 start -->
							    		<div id="myAllAnswer" style="display:block;">
							    			<div class="quesContent">
							    				
											</div>
								    		<div id="Fy_myAllAnswer" class="box" style="height:120px;width:100%;overflow:hidden;background:#fff;margin:0;padding:50px;"></div>
							    		</div>
							    		<!-- 全部 end -->
							    		
							    		<!-- 等待处理 start -->
							    		<div id="myAnswerExamineWait" style="display: none;">
							    			<div class="quesContent">
							    				
											</div>
								    		<div id="Fy_myAnswerExamineWait" class="box" style="height:120px;width:100%;overflow:hidden;background:#fff;margin:0;padding:50px;"></div>
							    		</div>
							    		<!-- 等待处理 end -->
							    		
							    		<!-- 审核通过 start -->
							    		<div id="myAnswerExamineSuccess" style="display: none;">
							    			<div class="quesContent">
								    			
											</div>
										<div id="Fy_myAnswerExamineSuccess" class="box" style="height:120px;width:100%;overflow:hidden;background:#fff;margin:0;padding:50px;"></div>
							    		</div>
							    		<!-- 审核通过 end -->
							    		
							    		<!-- 审核未通过 start -->
							    		<div id="myAnswerExamineFail" style="display: none;">
							    			<div class="quesContent">
							    			
											</div>
										<div id="Fy_myAnswerExamineFail" class="box" style="height:120px;width:100%;overflow:hidden;background:#fff;margin:0;padding:50px;"></div>
							    		</div>
							    		<!-- 审核未通过 end -->
						    	</div>
							</div>
							<!-- 分页 end -->
						</div>
					</div>
					<!----------------------------------------------- 我的回答 end------------------------------------------------------->
				</div>
			</div>
		<!-- 中间部分end -->
		<!-- 弹出修改详细信息窗口 start -->
		<div class="ex_liuan_PopWinbg">
			<div class="ex_liuan_PopWinContent">
				<form method="POST" id="updateAnswerForm">
					<input type="hidden" name="id" id="Id">
					<table cellspacing="0" cellpadding="0" style="height:330px;width:600px;">
						<tr>
							<td align="center" colspan="3">修改详细信息</td>
						</tr>
						<tr>
							<td style="width:50px;height:1px;"></td>
						</tr>
						<tr>
							<td style="width:50px;height:75px;">内容：</td>
							<td>
								<textarea id="editor"  name="content" ></textarea> 
							</td>
						</tr>
					</table>
				</form>
				<div class="ex_liuan_button">
					<input class="fl" type="button" value="提交" onclick="updateAnswer()">
					<input class="fr" type="button" value="返回" onclick="closePopWin()">
				</div>
				<div class="ex_liuan_Close_PopWin" onclick="closePopWin()"></div>
			</div>
		</div>
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
			
			//我的回答小的切换
			$(function(){
				var $li = $('.center_listButton ul li');	
				var $li_one=$('.tabOne li:nth-child(1)');
				var $ul = $('.tab_con div:nth-child(1)');
				var $tab_on=$('.tab_con');
				var $myAllQuestion=$('#myAllAnswer');
				var $myQuestionExamineWait=$('#myAnswerExamineWait');
				var $myQuestionWaitAnswer=$('#myAnswerExamineSuccess');
				var $myQuestionOverAnswer=$('#myAnswerExamineFail');
				$li.click(function() {
					$(this).addClass("curr") 				//当前<li>元素高亮
					.siblings().removeClass("curr");
					$myAllQuestion.css('display','none');
				 	$myQuestionExamineWait.css('display','none');
				 	$myQuestionWaitAnswer.css('display','none');
				 	$myQuestionOverAnswer.css('display','none');
					var target = $(this).data("target");
					console.log(target);
					$(target).css('display','block');
				});
				$li.click(function(){
					$(this).addClass("curr") 				//当前<li>元素高亮
					.siblings().removeClass("curr");
				})
			});
			
			/********************************************************我的回答 start**********************************************************/
			
			function fetchMyAnswers(opts) {
				
			}
			
			/* 全部 */
			var allAnswerCount =0;
			$('#Fy_myAllAnswer').paging({
	            initPageNo: 1, 								// 初始页码
	            totalPages: Math.ceil(allAnswerCount/10), 	// 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 							// 缓动速度。单位毫秒
	            jump: true,									// 是否支持跳转
	            callback: function(answerPageOne) { 		// 回调函数
	                $.get("http://localhost:8080/Tax/users/answers",{
		                	page: answerPageOne,
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
		                		return '<ul style="height:auto;">' +
		                					'<li>'+
		                						'<div>' +
		                							'<a href="http://localhost:8080/Tax/questions/' + value.questionId + '/details" style="color:#000;">问题:<span>' + value.question.title + '</span></a>'+
		                							'<span>' + value.createdTime + '</span>' +
		                						'</div>' +
	                						'</li>' +
											
											'<li class="answer_content">答案：<div>' + value.content + '</div> </li>' +
											
											'<li>' +
												'<div>' +
													'<div><span>浏览：</span><span>' + value.browseCount + '</span></div>' +
													'<div><span>点赞：</span><span>' + value.likeCount + '</span></div>' +
													'<span>' + status + '</span>' +
													'<span data-answer-id="'+ value.id +'"  id="del" onclick="delAnswer();" style="cursor:pointer;">删除</span>'+
													'<span data-answer-id="'+ value.id +'"  onclick="editAnswer();" style="cursor:pointer;">修改</span>'+
												'</div>' +
											'</li>' +
											
									    '</ul>'
		            		});
	            			$("#myAllAnswer>.quesContent").html(dataHTML.join(""));
	                });
	            }
			});
			
			/* 等待处理 */
			var examiningAnswerCount =0;
			$('#Fy_myAnswerExamineWait').paging({
	            initPageNo: 1, 								// 初始页码
	            totalPages: Math.ceil(examiningAnswerCount/10), 					// 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 							// 缓动速度。单位毫秒
	            jump: true,									// 是否支持跳转
	            callback: function(answerPageTwo) { 		// 回调函数
	                $.get("http://localhost:8080/Tax/users/answers",{
		                	page: answerPageTwo,
		                	rows: 10,
		                	status: 0,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array) {
		        				return '<ul style="height:auto;">' +
					    					'<li>'+
					    						'<div>' +
					    							'<a href="http://localhost:8080/Tax/questions/' + value.questionId + '/details" style="color:#000;">问题:<span>' + value.question.title + '</span></a>'+
					    							'<span>' + value.createdTime + '</span>' +
					    						'</div>' +
											'</li>' +
											
											'<li class="answer_content">答案：<div>' + value.content + '</div> </li>' +
											
											'<li>' +
												'<div>' +
													'<div><span>浏览：</span><span>' + value.browseCount + '</span></div>' +
													'<div><span>点赞：</span><span>' + value.likeCount + '</span></div>' +
													'<span data-answer-id="'+ value.id +'"  id="del" onclick="delAnswer();" style="cursor:pointer;">删除</span>'+
													'<span data-answer-id="'+ value.id +'"  onclick="editAnswer();"  style="cursor:pointer;">修改</span>'+
												'</div>' +
											'</li>' +
											
									    '</ul>';
		            		});
	            			$("#myAnswerExamineWait>.quesContent").html(dataHTML.join(""));
	                });
            		}
			});
			
			/* 审核通过 */
			var examineSuccessAnswerCount =0;
			$('#Fy_myAnswerExamineSuccess').paging({
	            initPageNo: 1, 								// 初始页码
	            totalPages: Math.ceil(examineSuccessAnswerCount/10), 					// 总页数
	            totalCount: '合计 0 条数据', 	// 条目总数
	            slideSpeed: 600, 							// 缓动速度。单位毫秒
	            jump: true,									// 是否支持跳转
	            callback: function(answerPageThree) { 		// 回调函数
	                $.get("http://localhost:8080/Tax/users/answers",{
		                	page: answerPageThree,
		                	rows: 10,
		                	status: 1,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array){
		                		return '<ul style="height:auto;">' +
					    					'<li>'+
					    						'<div>' +
					    							'<a href="http://localhost:8080/Tax/questions/' + value.questionId + '/details" style="color:#000;">问题:<span>' + value.question.title + '</span></a>'+
					    							'<span>' + value.createdTime + '</span>' +
					    						'</div>' +
										'</li>' +
										'<li class="answer_content">答案：<div>' + value.content + '</div> </li>' +
										'<li>' +
											'<div>' +
												'<div><span>浏览：</span><span>' + value.browseCount + '</span></div>' +
												'<div><span>点赞：</span><span>' + value.likeCount + '</span></div>' +
												'<span data-answer-id="'+ value.id +'"  id="del" onclick="delAnswer();" style="cursor:pointer;">删除</span>'+
												'<span data-answer-id="'+ value.id +'"  onclick="editAnswer();"  style="cursor:pointer;">修改</span>'+
											'</div>' +
										'</li>' +
								    '</ul>';
		            		});
		            		$("#myAnswerExamineSuccess>.quesContent").html(dataHTML.join(""));
	                });
            		}
			});
			
			/* 审核未通过 */
			var examineFailAnswerCount =0;
			$('#Fy_myAnswerExamineFail').paging({
	            initPageNo: 1, 								// 初始页码
	            totalPages: Math.ceil(examineFailAnswerCount/10), 				// 总页数
	            totalCount: '合计 0 条数据', // 条目总数
	            slideSpeed: 600, 							// 缓动速度。单位毫秒
	            jump: true,									// 是否支持跳转
	            callback: function(answerPageFour) { 		// 回调函数
	                $.get("http://localhost:8080/Tax/users/answers",{
		                	page: answerPageFour,
		                	rows: 10,
		                	status: -1,
	                }, function(data) {
		                	var dataHTML = data.map(function(value, index, array) {
		                		return '<ul style="height:auto;">' +
					    					'<li>'+
					    						'<div>' +
					    							'<a href="http://localhost:8080/Tax/questions/' + value.questionId + '/details" style="color:#000;">问题:<span>' + value.question.title + '</span></a>'+
					    							'<span>' + value.createdTime + '</span>' +
					    						'</div>' +
											'</li>' +
											
											'<li class="answer_content">答案：<div>' + value.content + '</div> </li>' +
											
											'<li>' +
												'<div>' +
													'<div><span>浏览：</span><span>' + value.browseCount + '</span></div>' +
													'<div><span>点赞：</span><span>' + value.likeCount + '</span></div>' +
													'<span data-answer-id="'+ value.id +'"  id="del" onclick="delAnswer();" style="cursor:pointer;">删除</span>'+
													'<span data-answer-id="'+ value.id +'"  onclick="editAnswer();"  style="cursor:pointer;">修改</span>'+
												'</div>' +
											'</li>' +
									    '</ul>';
		            		});
		            		$("#myAnswerExamineFail>.quesContent").html(dataHTML.join(""));
	                });
            		}
			});
			/********************************************************我的回答 end**********************************************************/
			
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
			
			var updaingAnswerContent;
	    	// 修改弹出框
	 		function editAnswer(){
	 			var answerId = event.target.dataset.answerId;
	 			var $target = $(event.target); //answer_content
	 			updaingAnswerContent = $target.parent('div').parent('li').siblings('.answer_content').children('div');
	 			var content = updaingAnswerContent.html();
	 			console.log(content);
	 			
	 			document.getElementById('Id').value=answerId;
	 			editor.setData(content);
				$('.ex_liuan_PopWinbg').show();
	 		}
	    	
	 		// 保存修改
	    	function updateAnswer() {
	 			var updateAnswerForm = document.getElementById("updateAnswerForm");
	 			if(updateAnswerForm.content.value == null) {
	 				zeroModal.alert("内容不能为空！")
	 				return;
	 			}
	 			var formData = new FormData(updateAnswerForm);
	 			formData.set("content", editor.getData());
	 			
	    		$.ajax("http://localhost:8080/Tax/answer/update", {
	    			type: 'POST',
    			  	data: formData,  
    	            dataType: 'JSON',  
    	            cache: false,  
    	            processData: false,  
    	            contentType: false,
	    			success: function(data) {
	    				zeroModal.alert("更新内容成功！")
	    				$('.ex_liuan_PopWinbg').hide();
	    				
	    				updaingAnswerContent.html(editor.getData());
	    				updaingAnswerContent = null;
	    				editor.setData("")
	    				updateAnswerForm.reset();
	    			}
	    		});
	    	}
	    	
	 		// 删除
	 		function delAnswer(){
	 			var answerId = event.target.dataset.answerId;
	 			var $target = $(event.target);
	 			zeroModal.confirm("是否删除？", function() {
					$.post("http://localhost:8080/Tax/answer/" + answerId + "/del", function() {
						$target.parent('div').parent('li').parent('ul').remove();
					})
					zeroModal.alert("删除成功！")
	 			});
			}
	 		
	 		function closePopWin(){
				$('.ex_liuan_PopWinbg').hide();
			}
	 		var editor =  CKEDITOR.replace('editor');
		</script>
	</body>
</html>