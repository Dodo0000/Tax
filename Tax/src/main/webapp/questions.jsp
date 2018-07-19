<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!-- 登录用户信息 -->

<!DOCTYPE html>
<html>
<head>
<title>安徽省国家税务局税企互助交流平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://localhost:8080/Tax/resources/js/paging.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet"
	href="http://localhost:8080/Tax/resources/css/paging.css">
<link rel="stylesheet"
	href="http://localhost:8080/Tax/resources/css/questions.css">
<style>
#two {
	border-bottom: 1px solid #fff;
	padding-bottom: 10px;
	color: #fff;
	display: inline-block;
	width: 90%;
	height: 65%;
}

#twoplus {
	background: #1B55A9;
}

body::-webkit-scrollbar {
	display: none
}

body::-o-scrollbar {
	display: none
}

body::-ms-scrollbar {
	display: none
}

body::-moz-scrollbar {
	display: none
}
</style>
</head>

<body>
	<!-- header start -->
	<%@ include file="header.jsp"%>
	<!-- header end -->
	<!-- 中间部分start -->
	<div class="liuan_center_main">
		<div class="liuan_main_headerContent">
			<!-- 搜索 -->
			<div class="liuan_main_search">
				<form action="http://localhost:8080/Tax/questions/search">
					<input name="title" placeholder="请输入您所需要的内容"
						onfocus="if(this.value == this.defaultValue) this.value = ''"
						onblur="if(this.value == '') this.value = this.defaultValue" />
					<button type="submit" class="searchbtn"></button>
				</form>
				<!-- 点击我要咨询 -->
				<button onclick="consult();" class="consultation">我要咨询</button>
			</div>
			<!-- 选择类型 -->
			<div class="search_choose" style="height: 40px;">
				<ul>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040001">发票系统故障及操作指导</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040002">发票领购</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040003">发票代开</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040004">发票开具</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040005">红字增值税发票开具</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040006">申报有误能否作废</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040007">一般纳税人资格</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040008">辅导期一般纳税人</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040009">专用发票认证抵扣</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040010">小规模纳税人增值税起征点是否有调整</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040011">认定为一般纳税人之后是否可以转为小规模纳税人</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040012">小规模纳税人自行开具的增值税专用发票如何填写申报表</label>
					</li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040013">注销登记</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040014">发票检查</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040015">专用发票丢失</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040016">征收率</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040017">非国税业务</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040018">信用等级</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040019">营改增</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040020">金税管理</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040021">进出口税收</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040022">征收管理</label></li>

					<li
						style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
						<label><input type="checkbox" class="major_item"
							onchange="selectQuesCategory();" value="040023">发票保管</label></li>

				</ul>
				<div class="searchchoose_up"></div>
				<div class="searchchoose_down"></div>
			</div>
		</div>
		<div class="liuan_center_tab">
			<!-- 分页 start -->
			<div class="tab_a" id="tab_b" style="height: 1100px;">
				<ul class="tabOne tabOneys" id="tabOne">

					<!-- 通过写js控制下面 在点击这些超链接的时候添加上 type的参数在url上-->
					<li><a class="active" style="font-size:16px;"
						href="javascript:showLatestQuestions()">最新咨询</a>
					</li>
					<li><a style="font-size:16px;"
						href="javascript:showHotQuestions()">热门咨询</a>
					</li>
					<li><a style="font-size:16px;"
						href="javascript:showRewardQuestions()">悬赏咨询</a>
					</li>

				</ul>
				<!-- 分页用户获取数据 -->
				<form id="quesForm" action="http://localhost:8080/Tax/questions"
					style="display:none">
					<input name="type" value="latest" type="hidden" /> <input
						name="page" value="1" type="hidden" />
				</form>

				<!-- latest hot reward填充的模板 -->
				<div class="tab_con">
					<!-- 如果搜索结果为空打印这个  针对emptyQueryResult情况-->
					<p class="emptyQueryResult" hidden="hidden">
						<b></b>
					</p>
					<!-- latest start -->
					<div id="latestQuesContainer" hidden="hidden">
						<div>
							<p class="question_title">
								<!-- 填充查询的type latest hot reward， 默认填写latest 其余情况根据url中的type参数获取 -->
								<!-- <b>最新咨询</b> -->
								<b></b>
							</p>
						</div>
						<div id="quesContent" class="quesContent">
							<div class="gary">
								<div class="pink"></div>
							</div>
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
						<!-- 分页要操作前面的div -->
						<div id="quesPaging" class="box"></div>
					</div>
					<!-- latest end -->
				</div>
			</div>
			<!-- 分页 end -->
		</div>
	</div>
	<!-- 中间部分start -->

	<!--  尾部 start -->
	<%@ include file="footer.jsp"%>
	<!--  尾部 end -->

	<!-- 按latest hot reward查询问题  然后加入paging-->
	<script type="text/javascript">
		//初始的时候

		$(document).ready(function() {
			//alert('ready');
			initQuestions();
		});
		
		/**根据cookie看用户是否登陆*/
		function checkLogin(){
			var cookie = document.cookie;
			var field = cookie.split(';');
			var hasLogin = false;
			for(var i in field){
				var info = field[i].split('=');
				if(info[0].trim() == '_user'){
					hasLogin = true;
				}
			}
			return hasLogin; 
		}
		
		/**点击我要咨询时候的反应*/
		function consult(){
			var hasLogin = checkLogin();
			if(!hasLogin){
				alert("咨询前请登陆");
				window.location.href='http://localhost:8080/Tax/guest/login.jsp';
			}
			else{
				window.location.href='http://localhost:8080/Tax/addConsulting.jsp';
			}
		}
		
		//默认以latest为优先 加载当中的第一页
		function initQuestions() {
			//根据location设置种子
			//alert('initQuestions');
			//alert(location);
			/**在不同页面要修改*/
			var ajaxUrl = 'http://localhost:8080/Tax/guest/question';
			var typeVal = getUrlParam('type');
			if (typeVal == null)
				typeVal = 'latest';
			ajaxUrl = ajaxUrl + '/' + typeVal;
			var pageVal = getUrlParam('page');
			if (pageVal == null)
				pageVal = '1';
			ajaxUrl = ajaxUrl + '/' + pageVal;
			//alert('initQuestions ajaxUrl: '+ajaxUrl);
			/**填充购物车*/
			$
					.ajax({
						//这里是测试的html要回到父目录
						url : ajaxUrl,
						success : function(data) {
							//alert('ajax success');
							console.log(data);
							var jsonarray = eval(data);
							if (jsonarray['message'] == 'success') {
								//alert('data access successful');
								//先把原来问题那个模板清空然后再从list中添加
								fillQuestionBriefList(jsonarray, typeVal);
								//设置paging
								//分页
								/* 最新咨询 */
								var currentCount = parseInt(jsonarray['result']['currentCount']);
								//console.log('currentCount = ' + currentCount);
								var rows = parseInt(jsonarray['result']['currentCount']);
								//console.log('rows = ' + rows);
								$('#quesPaging')
										.paging(
												{
													initPageNo : parseInt(jsonarray['result']['currentPage']), // 初始页码
													totalPages : parseInt(jsonarray['result']['totalPage']), // 总页数
													totalCount : '合计 '
															+ jsonarray['result']['totalCount']
															+ '条数据', // 条目总数
													slideSpeed : 600, // 缓动速度。单位毫秒
													jump : true, // 是否支持跳转
													initLoad : false,
													/**可以通过更改这个回调函数来获取分页信息*/
													callback : function(page) { // 回调函数
														//alert("callback: "+page);
														//alert('paging callback');
														//alert('current location: '+location);
														//alert('current location.href: '+location.href);//http://localhost:8080/Tax/questions.jsp
														var callbackTypeVal = getUrlParam('type');//默认查询种类type
														var callbackDefaultTypeVal = 'latest';
														var callbackAjaxUrl = 'guest/question';
														if (callbackTypeVal == null)
															callbackTypeVal = callbackDefaultTypeVal;
														if (page == null)
															page = 1;
														/**在不同页面要修改*/
														window.location.href = 'http://localhost:8080/Tax/questions.jsp'
																+ '?type='
																+ callbackTypeVal
																+ '&page='
																+ page;
														/*
														$("#quesForm").children(":input[name='page']").val(page);
														$("#quesForm").submit();
														 */
													}
												});

								/*选择*/
								$('.searchchoose_up').click(
										function() {
											$('.search_choose').animate({
												height : '180px'
											});
											$('.searchchoose_down').css(
													'display', 'block');
											$('.searchchoose_up').css(
													'display', 'none');
										});
								$('.searchchoose_down').click(
										function() {
											$('.search_choose').animate({
												height : '40px'
											});
											$('.searchchoose_up').css(
													'display', 'block');
											$('.searchchoose_down').css(
													'display', 'none');
										});
							} else if (jsonarray['message'] == 'empty query result') {
								//alert('没有相应数据');
								//清空非hidden的div,然后把p标签填充上 不存在数据条
								var emptyQuestionContainer = $('.tab_con:first')
										.children('p:eq(0)');
								//alert(emptyQuestionContainer);
								emptyQuestionContainer.children('b:eq(0)')
										.text('-----没有相应数据-----');
								emptyQuestionContainer.removeAttr('hidden');
							} else if (jsonarray['message'] == 'invalid params') {
								alert('脏数据');
							} else {
								alert('未处理的返回信息');
							}
						},
						error : function() {
							alert('服务器忙');
						}
					});
		};

		//根据返回的jsonarray填充questionBriefList
		function fillQuestionBriefList(data, typeVal) {
			//alert('fillQuestionBriefList');
			var jsonarray = eval(data);//这里要多eval一次
			var questionContainer = $('.tab_con:first').children('div:eq(0)');
			questionContainer.removeAttr('hidden');
			var questionTitle = questionContainer.children('div:eq(0)')
					.children('p:eq(0)').children('b:eq(0)');
			if (typeVal == 'latest')
				questionTitle.text('最新咨询');
			else if (typeVal == 'hot')
				questionTitle.text('热门咨询');
			else if (typeVal == 'reward')
				questionTitle.text('悬赏咨询');
			var questionList = jsonarray['result']['list'];
			//alert(questionList);
			//先清空之前填写的question_template_clone
			$('ul').remove('.question_template_clone');
			var template_parent = questionContainer.children('div:eq(1)');
			for ( var i in questionList) {
				//alert(questionList[i]["title"]);
				var template = template_parent.children('ul:eq(0)').clone(true);
				template.addClass('question_template_clone');
				template.removeAttr('hidden');
				//设置title 并且设置title这个a标配的href
				var title = template.children('li:eq(0)').children('a:eq(0)');
				title.text(questionList[i]['title']);
				/**这里换了页面链接要修改一下*/
				title.attr('href', 'http://localhost:8080/Tax/question_details.jsp'
						+ '?questionId=' + questionList[i]['id']);
				//设置publishDateStr
				var publishDateStr = template.children('li:eq(1)').children(
						'span:eq(0)');
				publishDateStr.text(questionList[i]['publishDateStr']);
				//若是悬赏查询那么要显示悬赏
				if (typeVal == 'reward') {
					//alert(typeVal);
					//设置悬赏
					var prize_parent = template.children('li:eq(2)');
					var prize = prize_parent.children('span:eq(1)');
					prize_parent.removeAttr('hidden');
					prize.text(questionList[i]['prize']);
					//alert('reward prize: '+questionList[i]['prize']);
				}
				//设置click
				var click = template.children('li:eq(3)')
						.children('span:eq(1)');
				click.text(questionList[i]['click']);
				//设置totalAnswerNum
				var totalAnswerNum = template.children('li:eq(4)').children(
						'span:eq(1)');
				totalAnswerNum.text(questionList[i]['totalAnswerNum']);
				//设置favourite
				var favourite = template.children('li:eq(5)').children(
						'span:eq(1)');
				favourite.text(questionList[i]['favourite']);
				//设置type
				var type = template.children('li:eq(6)').children('span:eq(1)');
				type.text(questionList[i]['type']);
				//添加模板
				template_parent.children('ul').last().after(template);
			}
		};

		//获取url中的参数
		function getUrlParam(name) {
			var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)'); //构造一个含有目标参数的正则表达式对象
			var r = window.location.search.substr(1).match(reg); //匹配目标参数
			if (r != null)
				return unescape(r[2]);
			return null; //返回参数值
		}

		//点击最新咨询
		function showLatestQuestions() {
			/**在不同页面要修改*/
			window.location.href = 'http://localhost:8080/Tax/questions.jsp'
					+ '?type=' + 'latest' + '&page=' + '1';
		}
		//点击热门咨询
		function showHotQuestions() {
			/**在不同页面要修改*/
			window.location.href = 'http://localhost:8080/Tax/questions.jsp'
					+ '?type=' + 'hot' + '&page=' + '1';
		}
		//点击悬赏咨询
		function showRewardQuestions() {
			/**在不同页面要修改*/
			window.location.href = 'http://localhost:8080/Tax/questions.jsp'
					+ '?type=' + 'reward' + '&page=' + '1';
		}
	</script>


	<script type="text/javascript">
		function starQuestion() {
			zeroModal.alert("请先登录用户");
		}

		function userNotnull() {
			zeroModal.alert("请先登录用户");
		}
	</script>

</body>
</html>