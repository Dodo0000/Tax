<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!-- 登录用户信息 -->

<!DOCTYPE html>
<html>
<head>
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
  	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
  	<script type="text/javascript" src="http://localhost:8080/Tax/resources/zeroModal/zeroModal.min.js" charset="utf-8"></script>
  	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/questions.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/footer.css"/>
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/query.css">
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/zeroModal/zeroModal.css">
</head>
<body>
	<!-- header start -->
	<%@ include file="../header.jsp" %>
	<!-- header end -->
	<!-- 中间部分start -->
	<div class="liuan_center_main" style="background-color: #eeeeee;">
		<div class="path_nav">
			
			<span class="fl">当前位置：</span>
			<span class="fl">&nbsp;&gt;&nbsp;</span>
			<span class="fl"><a href="" class="nav_style">搜索问题</a></span>
		</div>
		<div class="liuan_main_headerContent">
			<div class="liuan_main_search pr">
				<form action="http://localhost:8080/Tax/questions/search" id="quesSearchForm">
					<!-- 搜索栏的那个input -->
					<input id="searchKeyword" name="title" placeholder="请输入您所需要的内容"
						style="width: 912px;" /> <input
						name="majorCategory" type="hidden"
						value="" /> <input name="page" id="page"
						value="1" type="hidden" />
					
					<!-- 搜索按钮 -->		
					<button type="button" onclick="clickSearchButton()" type="button" class="searchbtn"></button>
				
				</form>
				<!--再这个搜索详情页面不加我要咨询-->
				<!--  
				<button class="consultation pa" onclick="userNotnull();">我要咨询</button>
				-->
			</div>
			
			<!-- 搜索type的checkbox容器 -->
			<div class="search_choose" style="height: 40px;">
				<ul>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="1" name="majorCategory">发票系统故障及操作指导</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="2" name="majorCategory">发票领购</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="3" name="majorCategory">发票代开</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="4" name="majorCategory">发票开具</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="5" name="majorCategory">红字增值税发票开具</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="6" name="majorCategory">申报有误能否作废</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="7" name="majorCategory">一般纳税人资格</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="8" name="majorCategory">辅导期一般纳税人</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="9" name="majorCategory">专用发票认证抵扣</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="10" name="majorCategory">小规模纳税人增值税起征点是否有调整</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="11" name="majorCategory">认定为一般纳税人之后是否可以转为小规模纳税人</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="12" name="majorCategory">小规模纳税人自行开具的增值税专用发票如何填写申报表</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="13" name="majorCategory">注销登记</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="14" name="majorCategory">发票检查</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="15" name="majorCategory">专用发票丢失</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="16" name="majorCategory">征收率</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="17" name="majorCategory">非国税业务</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="18" name="majorCategory">信用等级</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="19" name="majorCategory">营改增</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="20" name="majorCategory">金税管理</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="21" name="majorCategory">进出口税收</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="22" name="majorCategory">征收管理</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="23" name="majorCategory">发票保管</label></li>

				</ul>
				<div class="searchchoose_up"></div>
				<div class="searchchoose_down"></div>
			</div>
			<!-- 选择类型 -->
		</div>
		
		<div class="liuan_center_tab">
			<!-- 分页 start -->
			<div class="tab_a" id="tab_b" style="height: 1100px; margin: 0 auto;">
				<div class="tab_con">
					<!-- latest start -->
					<div id="latestQuesContainer">
						<!-- <div><p style="width:100px;padding-bottom:5px;text-align:center;height:21px;border-bottom-width:100px;border-bottom:3px solid  #1B55A9;font-size:20px;">最新咨询</p></div> -->
						
						<!-- 搜索结果的容器-->
						<div id="searchContent" class="quesContent">
							<!-- 搜索结果为空的模板 -->
							<p id="empty_search_question_area" hidden="hidden"><b>没有相关回答</b></p>
							<!-- 填充问题项的模板 -->
							<ul style="border-bottom:1px dashed #ccc;height: 70px;"
								hidden="hidden">
								<!-- 填充title li_0-->
								<li><a
									href="http://localhost:8080/Tax/questions/ques_1513737987706/details">
								</a></li>
								<!-- 填充publishDateStr li_1-->
								<li><span></span></li>

								<!-- 填充悬赏积分  li_2-->
								<li hidden="hidden"><span>悬赏：</span> <span></span></li>

								<!-- 填充click li_3-->
								<li><span>浏览：</span> <span></span></li>
								<!-- 填充totalAnswerNum li_4-->
								<li><span>回答：</span> <span></span></li>
								<!-- 填充favourite li_5 -->
								<li style="width:110px;"><span>收藏：</span> <span
									class="starCount"></span></li>
								<!-- 填充type li_6 -->
								<li><span>分类：</span> <span></span></li>

								<!-- li_7 -->
								<li data-target-id="ques_1513737987706" data-target="question"
									onclick="starQuestion();"
									style="width:73px;float:right;cursor:pointer;"><span>收藏</span>
								</li>
							</ul>
							
						</div>
						
						<!-- 分页的容器 -->
						<div id="searchQuesPage" class="box"></div>
						<!-- 分页的容器 -->
						
						<script type="text/javascript">
							/**ready*/
							$(function(){
								//alert(decodeURI(window.location));
								var keyword=getUrlParam('keyword');
								//alert(keyword);
								//alert("keyword get from url:"+keyword);
								if(keyword==null)
									keyword='';
								var type=getUrlParam('type');
								if(type==null)
									type='';
								var page=getUrlParam('page');
								if(page==null)
									page=1;
								//alert("keyword:"+keyword);
								//alert("type:"+type);
								//alert("page:"+page);
								$.ajax({
									url:'http://localhost:8080/Tax/guest/search',
									data:{
										keyword:keyword,
										type:type,
										page:page,
									},
									success:function(data){
										if(data['message']=='success'){
											fillQuestionBriefList(data['result']['list']);
											/**分页操作*/
											$('#searchQuesPage').paging({
	        									initPageNo: parseInt(data['result']['currentPage']), 			//初始页码
	        									totalPages: parseInt(data['result']['totalPage']),							//总页数
	        									totalCount: '合计'+data['result']['totalCount']+'条数据', 			//条目总数
	        									slideSpeed: 600, 							//缓动速度。单位毫秒
	        									jump: true,									//是否支持跳转
	        									initLoad: false,								//初始化完成后是否跳转
	        									callback: function(callback_page) {//回调函数	
	        										//alert("callback_page:"+callback_page);			
	        										if(callback_page==null)
	        											callback_page=1;
	        											window.location.href='http://localhost:8080/Tax/search_title.jsp'
	        																+'?keyword='+keyword
	        																+'&type='+type
	        																+'&page='+callback_page;
	        										}
	    									});
										}
										else if(data['message']=='empty query result'){
											fillEmptySearchResult();
										}
										else{
											alert("未处理问题");
										}
									},
									error:function(data){
										alert("服务器忙");
										console(data);
									}
								});
							});
							
							/**点击收藏按钮*/
							function collectQuestion(questionId){
								alert("点击收藏 id为:"+questionId+"的问题");
								$.ajax({
									url:'http://localhost:8080/Tax/user/collectQuestion',
									type:'post',
									data:{
										questionId:questionId,
									},
									success:function(data){
										if(data['message']=='success'){
											window.location.reload();
										}
										else if(data['message']=='permission denied'){
											alert("请先登陆");
											window.location.href='http://localhost:8080/Tax/guest/login.jsp';
										}
										else if(data['message']=='duplicate collect'){
											alert("你已经收藏过了");
										}
										else{
											alert("未处理信息");
										}
									},
									error:function(data){
										alert("服务器忙");
										console.log(data);
									}
								});
							}
		

							/**点击搜索按钮*/
							function clickSearchButton(){
								//alert("clickSearchButton");
								var keyword = $('#searchKeyword').val();
								//alert("keyword: "+keyword);
								var type = '';
								$("input[name='majorCategory']:checked").each(function(i){//把所有被选中的复选框的值存入数组
            						//alert.log(i+"th typeId :"+$(this).val());
            						type = type+$(this).val()+';';
        						});
        						//alert("type: "+type);
        						window.location.href='http://localhost:8080/Tax/search_title.jsp'
        											+'?keyword='+keyword
        											+'&type='+type;
							}
							
							
							/**填充搜索后的问题列表  注意：！！！QuestionBriefList！！！*/
							function fillQuestionBriefList(questionList){
								/**拼答案模板*/
								var template_parent=$('#searchContent');
								/**把空的那个标签隐藏*/
								$('#empty_search_question_area').hide();
								/**先清空之前填写的search_question_template_clone*/
								$('ul').remove('.search_question_template_clone');
								for(var i in questionList){
									var template = template_parent.children('ul:eq(0)').clone(true);
									template.addClass('search_question_template_clone');
									template.removeAttr('hidden');
									/**设置title 并且设置title这个a标配的href*/
									var title = template.children('li:eq(0)').children('a:eq(0)');
									title.text(questionList[i]['title']);
									/**这里换了页面链接要修改一下*/
									title.attr('href', 'http://localhost:8080/Tax/question_details.jsp'+ '?questionId=' + questionList[i]['id']);
									/**设置publishDateStr*/
									var publishDateStr = template.children('li:eq(1)').children('span:eq(0)');
									publishDateStr.text(questionList[i]['publishDateStr']);
									/**设置悬赏*/
									if (questionList[i]['prize']!=undefined && questionList[i]['prize']>0) {
										//alert(typeVal);
										//设置悬赏
										var prize_parent = template.children('li:eq(2)');
										var prize = prize_parent.children('span:eq(1)');
										prize_parent.removeAttr('hidden');
										prize.text(questionList[i]['prize']);
										//alert('reward prize: '+questionList[i]['prize']);
									}
									/**设置click*/
									var click = template.children('li:eq(3)').children('span:eq(1)');
									click.text(questionList[i]['click']);
									/**设置totalAnswerNum*/
									var totalAnswerNum = template.children('li:eq(4)').children('span:eq(1)');
									totalAnswerNum.text(questionList[i]['totalAnswerNum']);
									/**设置favourite*/
									var favourite = template.children('li:eq(5)').children('span:eq(1)');
									favourite.text(questionList[i]['favourite']);
									/**设置type*/
									var type = template.children('li:eq(6)').children('span:eq(1)');
									type.text(questionList[i]['type']);
									/**设置点击收藏的方法*/
									template.children('li:eq(7)').attr('onclick', 'collectQuestion('+questionList[i]['id']+')');
									//添加模板
									template_parent.children('ul').last().after(template);
								}
							}
							
							/**填充无回答时候的那个div*/
							function fillEmptySearchResult(){
								var template_parent=$('#searchContent');
								//清空
								$('ul').remove('.search_question_template_clone');
								//把空集合显示
								$('#empty_search_question_area').show();
							}
							
							/**获取url中的参数*/
							function getUrlParam(name) {
								var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)'); //构造一个含有目标参数的正则表达式对象
								var r = window.location.search.substr(1).match(reg); //匹配目标参数
								if (r != null)
									return r[2];
								return null; //返回参数值
							}
						</script>
						
					</div>
					<!-- latest end -->
				</div>
			</div>
			<!-- 分页 end -->
		</div>
	</div>
	<!-- 中间部分start -->
		<!--  尾部 start -->
		<%@ include file="../footer.jsp" %>	
		<!--  尾部 end -->
	<!--  
	<script type="text/javascript">
	/*选择*/
	$('.searchchoose_up').click(function(){
		$('.search_choose').animate({height:"180px"});
		$('.searchchoose_down').css('display','block');
		$('.searchchoose_up').css('display','none');
	})
	$('.searchchoose_down').click(function(){
		$('.search_choose').animate({height:"40px"});
		$('.searchchoose_up').css('display','block');
		$('.searchchoose_down').css('display','none');
	})
		//收藏
		function starQuestion() {
			var userId='user_1530497245745';
			if(userId != 'null'){
				var $target;
				if(event.target.tagName === 'SPAN') {
					$target = $(event.target).parent('li');
				} else {
					$target = $(event.target);
				}
				var $starCount = $target.parent("ul").find('.starCount');
				var target = $target.data("target");
				var targetId = $target.data("target-id");
				$.post("http://localhost:8080/Tax/star",{
						target: target,
						targetId: targetId
					},function(data) {
		    				console.log(data);
						if(data.action == -1 && data.result > 0) { //取消成功
							var count = parseInt($starCount.text());
							$starCount.text(count - 1);
							$target.html('收藏')
							return;
						}
						if (data.action == 1 && data.result > 0) { //收藏成功
							var count = parseInt($starCount.text());
							$starCount.text(count + 1);
							$target.html('已收藏')
							return;
						}
		       	});
			} else {
				zeroModal.alert("请先登录用户");
		    }
		}
		$('#searchQuesPage').paging({
	        initPageNo: 1, 			//初始页码
	        totalPages: parseInt('0.0'),							//总页数
	        totalCount: '合计 0 条数据', 			//条目总数
	        slideSpeed: 600, 							//缓动速度。单位毫秒
	        jump: true,									//是否支持跳转
	        initLoad: false,								//初始化完成后是否跳转
	        callback: function(page) { 					//回调函数
	        		$("#quesSearchForm").children(":input[name='page']").val(page);
	        		$("#quesSearchForm").submit();
	        }
	    });
		var a = "";
		var b = new Array();
		b = a.split(",");
		console.log(b);
		$(function(){
			var list = document.getElementsByTagName("input");
			for(var j=0;j<b.length;j++){
				for(var i = 0; i < list.length; i++) {
					if(list[i].value==b[j]){
						list[i].checked = "checked";
						selectedQuesCategories.add(b[j]);
					}
				}
			}
			
			
			var userId='user_1530497245745';
			var questionIds = [];
			var target = 'question';
			 $.get('http://localhost:8080/Tax/star/check',{
				 target: target,
				 userId: userId,
				 t: questionIds
			 }, function(data) { // [targetId]
			 	console.log(data)
			 	var staredTargetIds = new Set(data);
				var lis = $("#seachMajor").find('ul li:last-child');
				
				for(var i = 0; i < lis.length; i++ ) {
					var li = lis[i];
					var targetId = li.dataset.targetId;
					
					if(staredTargetIds.has(targetId)) {
						staredTargetIds.delete(targetId);
						li.querySelector('span:last-child').innerHTML = '已收藏';
					} else {
						li.querySelector('span:last-child').innerHTML = '收藏';
					}
				}
			});
		});
		/* 选择筛选类别 */
		var selectedQuesCategories = new Set();
	    function selectQuesCategory(){
			var $target = event.target;
			if($target.checked) {
				selectedQuesCategories.add($target.value);
				console.log("????"+$target.value);
			} else {
				selectedQuesCategories.delete($target.value);
				console.log("????"+$target.value);
			}
			selectedQuesCategories.delete("");
			console.log(">>>>>>>>>"+Array.from(selectedQuesCategories).join(","));
			$("#quesSearchForm").children(":input[name='majorCategory']").val(Array.from(selectedQuesCategories).join(","));
			$("#quesSearchForm").submit();
		}
	       //点击回到顶部下100px
	       jQuery(function(){  
			  	$('#nextPage').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			  	$('#prePage').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			 	$('#firstPage').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			 	$('#lastPage').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			 	$('.sel-page').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			 	$('.selpage').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			 	$('.jump-button').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			 	$('.turnPage').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			 	$('.last-page').click(function(){$('html,body').animate({scrollTop: '220px'}, 0);return false;});
			 });
		function userNotnull(){
			var userId='user_1530497245745';
			console.log(userId);
			if(userId==='null'){
				zeroModal.alert('请登陆用户!');
			}else{
				 window.location.href='http://localhost:8080/Tax/question/addConsulting';
			}
	  }
	</script>
	-->
</body>
</html>