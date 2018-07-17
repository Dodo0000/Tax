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
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/questions.css">
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
		body::-webkit-scrollbar {display:none}
		body::-o-scrollbar {display:none}
		body::-ms-scrollbar {display:none}
		body::-moz-scrollbar {display:none}
  	</style>
</head>

<body>
		<!-- header start -->
		<%@ include file="header.jsp" %>
		<!-- header end -->
		<!-- 中间部分start -->
		<div class="liuan_center_main">
			<div class="liuan_main_headerContent" >
				<!-- 搜索 -->
				<div class="liuan_main_search">
					<form action="http://localhost:8080/Tax/questions/search">
						<input name="title" placeholder="请输入您所需要的内容"  
						onfocus="if(this.value == this.defaultValue) this.value = ''" 
						onblur="if(this.value == '') this.value = this.defaultValue" />
						<button type="submit" class="searchbtn"></button>
					</form>
					<button onclick="userNotnull();" class="consultation">我要咨询</button>
				</div>
				<!-- 选择类型 -->
				<div class="search_choose" style="height: 40px;">
					<ul>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040001">发票系统故障及操作指导</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040002">发票领购</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040003">发票代开</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040004">发票开具</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040005">红字增值税发票开具</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040006">申报有误能否作废</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040007">一般纳税人资格</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040008">辅导期一般纳税人</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040009">专用发票认证抵扣</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040010">小规模纳税人增值税起征点是否有调整</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040011">认定为一般纳税人之后是否可以转为小规模纳税人</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040012">小规模纳税人自行开具的增值税专用发票如何填写申报表</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040013">注销登记</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040014">发票检查</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040015">专用发票丢失</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040016">征收率</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040017">非国税业务</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040018">信用等级</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040019">营改增</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040020">金税管理</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040021">进出口税收</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040022">征收管理</a>
							</li>
						
							<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<a href="http://localhost:8080/Tax/questions/search?majorCategory=040023">发票保管</a>
							</li>
						
					</ul>
					<div class="searchchoose_up"></div>
					<div class="searchchoose_down"></div>
				</div>
			</div>
			<div class="liuan_center_tab">
				<!-- 分页 start -->
				<div class="tab_a" id="tab_b" style="height: 1100px;">
				  	<ul class="tabOne tabOneys" id="tabOne">
				  	
				  		
				    			
				    			
				    			
				    				<li><a class="active" style="font-size:20px;">最新咨询</a></li>
				    				<li><a style="font-size:16px;" href="http://localhost:8080/Tax/questions?type=hot">热门咨询</a></li>
				    				<li><a style="font-size:16px;" href="http://localhost:8080/Tax/questions?type=reward">悬赏咨询</a></li>
				    			
				    		
				  	</ul>
				  	
				  	<form id="quesForm" action="http://localhost:8080/Tax/questions" style="display:none">
				  		<input name="type" type="hidden" value="latest"/>
						<input name="page" value="1" type="hidden"/>
				  	</form>
				  	
			  		<div class="tab_con">
				  		<!-- latest start -->
				    		<div id="latestQuesContainer">
					    		<div>
					    			
						    			
						    				<p class="question_title"><b>最新咨询</b></p>
						    			
						    			
						    			
						    		
					    		</div>
				    			<div id="quesContent" class="quesContent">
					    			<div class="gary">
									<div class="pink"></div>
								</div>
				    				
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513737987706/details"> 想了解个人所得税流程</a>
										</li>
										<li>
											<span>2017-12-20</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>333</span>
										</li>
										<li>
											<span>回答：</span>
											<span>9</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">6</span>
										</li>
										<li>
											<span>分类：</span>
											<span>发票系统故障及操作指导,发票领购</span>
										</li>
										<li data-target-id="ques_1513737987706" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513740963289/details"> 电子税务的一些知识</a>
										</li>
										<li>
											<span>2017-12-20</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>41</span>
										</li>
										<li>
											<span>回答：</span>
											<span>1</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">1</span>
										</li>
										<li>
											<span>分类：</span>
											<span>发票系统故障及操作指导,发票领购</span>
										</li>
										<li data-target-id="ques_1513740963289" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513754664159/details"> 咨询税收</a>
										</li>
										<li>
											<span>2017-12-20</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>28</span>
										</li>
										<li>
											<span>回答：</span>
											<span>3</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">1</span>
										</li>
										<li>
											<span>分类：</span>
											<span>发票系统故障及操作指导</span>
										</li>
										<li data-target-id="ques_1513754664159" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513613216919/details"> 电子税务的定义</a>
										</li>
										<li>
											<span>2017-12-19</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>57</span>
										</li>
										<li>
											<span>回答：</span>
											<span>3</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">2</span>
										</li>
										<li>
											<span>分类：</span>
											<span>发票系统故障及操作指导,发票领购,发票开具,红字增值税发票开具</span>
										</li>
										<li data-target-id="ques_1513613216919" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513392823785/details"> 电子税务局</a>
										</li>
										<li>
											<span>2017-12-16</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>258</span>
										</li>
										<li>
											<span>回答：</span>
											<span>2</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">1</span>
										</li>
										<li>
											<span>分类：</span>
											<span>发票系统故障及操作指导,红字增值税发票开具</span>
										</li>
										<li data-target-id="ques_1513392823785" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513393101988/details"> 我要分享</a>
										</li>
										<li>
											<span>2017-12-16</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>33</span>
										</li>
										<li>
											<span>回答：</span>
											<span>1</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">0</span>
										</li>
										<li>
											<span>分类：</span>
											<span>发票系统故障及操作指导,红字增值税发票开具</span>
										</li>
										<li data-target-id="ques_1513393101988" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513330800076/details"> 这是一个简单的测试提问？</a>
										</li>
										<li>
											<span>2017-12-15</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>22</span>
										</li>
										<li>
											<span>回答：</span>
											<span>0</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">1</span>
										</li>
										<li>
											<span>分类：</span>
											<span>发票系统故障及操作指导,小规模纳税人增值税起征点是否有调整</span>
										</li>
										<li data-target-id="ques_1513330800076" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513225973125/details"> 车船税的征收？</a>
										</li>
										<li>
											<span>2017-12-14</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>29</span>
										</li>
										<li>
											<span>回答：</span>
											<span>1</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">2</span>
										</li>
										<li>
											<span>分类：</span>
											<span></span>
										</li>
										<li data-target-id="ques_1513225973125" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513229403369/details"> 作为承租方租用房屋需要缴纳哪些税？</a>
										</li>
										<li>
											<span>2017-12-14</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>36</span>
										</li>
										<li>
											<span>回答：</span>
											<span>1</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">2</span>
										</li>
										<li>
											<span>分类：</span>
											<span>发票系统故障及操作指导,发票领购</span>
										</li>
										<li data-target-id="ques_1513229403369" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
									<ul style="border-bottom:1px dashed #ccc;height: 70px;">
										<li>
											<a href="http://localhost:8080/Tax/questions/ques_1513229523566/details"> 印花税</a>
										</li>
										<li>
											<span>2017-12-14</span>
										</li>
										
										<li>
											<span>浏览：</span>
											<span>5</span>
										</li>
										<li>
											<span>回答：</span>
											<span>1</span>
										</li>
										<li style="width:110px;">
											<span>收藏：</span>
											<span class="starCount">1</span>
										</li>
										<li>
											<span>分类：</span>
											<span></span>
										</li>
										<li data-target-id="ques_1513229523566" data-target="question" onclick="starQuestion();" style="width:73px;float:right;cursor:pointer;">
											<span>收藏</span>
										</li>
									</ul>
								
							</div>
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
	<%@ include file="footer.jsp" %>
	<!--  尾部 end -->
	
	
		
		
			<script type="text/javascript">
				function starQuestion() {
					zeroModal.alert("请先登录用户");
				}
				
				function userNotnull() {
					zeroModal.alert("请先登录用户");
				}
			</script>
		
	

	<script type="text/javascript">
	//分页
    /* 最新咨询 */
    var totalCount = 12;
    console.log('totalCount = ' + totalCount);
    var rows = 10;
    console.log('rows = ' + rows);
    $('#quesPaging').paging({
    		initPageNo: 1, 			// 初始页码
        totalPages: Math.ceil(totalCount/rows), 	// 总页数
        totalCount: '合计 12条数据', 			// 条目总数
        slideSpeed: 600, 							// 缓动速度。单位毫秒
        jump: true, 								// 是否支持跳转
        initLoad: false,
        callback: function(page) { 					// 回调函数
     	   	$("#quesForm").children(":input[name='page']").val(page);
    			$("#quesForm").submit();
        }
    });
    
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
	 //FF下用JS实现自定义滚动条
	$(function(){
    $("body").niceScroll({cursorborder:"",cursorcolor:"rgba(0,0,0,0)",boxzoom:true});
	})
</script>
</body>
</html>