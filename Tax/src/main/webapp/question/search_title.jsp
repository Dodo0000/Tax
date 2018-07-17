<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!-- 登录用户信息 -->

<!DOCTYPE html>
<html>
<head>
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="/lagsms/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
  	<script src="/lagsms/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
  	<script type="text/javascript" src="/lagsms/resources/zeroModal/zeroModal.min.js" charset="utf-8"></script>
  	<link rel="icon" href="/lagsms/resources/image/home/favicon.gif" type="image/x-icon" />
  	<link rel="stylesheet" href="/lagsms/resources/css/paging.css">
  	<link rel="stylesheet" href="/lagsms/resources/css/questions.css">
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/footer.css"/>
  	<link rel="stylesheet" href="/lagsms/resources/css/query.css">
  	<link rel="stylesheet" href="/lagsms/resources/zeroModal/zeroModal.css">
</head>
<body>
	<!-- header start -->
	<%@ include file="../header.jsp" %>
	<!-- header end -->
	<!-- 中间部分start -->
	<div class="liuan_center_main" style="background-color: #eeeeee;">
		<div class="path_nav">
			
			<span class="fl">当前位置：<a href="javascript:history.go(-1);" class="nav_style">返回上一页</a></span>
			<span class="fl">&nbsp;&gt;&nbsp;</span>
			
			<span class="fl"><a href="" class="nav_style">搜索问题</a></span>
		</div>
		<div class="liuan_main_headerContent">
			<div class="liuan_main_search pr">
				<form action="/lagsms/questions/search" id="quesSearchForm">
					<input name="title" placeholder="请输入您所需要的内容"
						value="11" style="width: 912px;" /> <input
						name="majorCategory" type="hidden"
						value="" /> <input name="page" id="page"
						value="1" type="hidden" />
					<button type="submit" class="searchbtn"></button>
				</form>
				<button class="consultation pa" onclick="userNotnull();">我要咨询</button>
			</div>
			<div class="search_choose" style="height: 40px;">
				<ul>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040001">发票系统故障及操作指导</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040002">发票领购</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040003">发票代开</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040004">发票开具</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040005">红字增值税发票开具</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040006">申报有误能否作废</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040007">一般纳税人资格</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040008">辅导期一般纳税人</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040009">专用发票认证抵扣</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040010">小规模纳税人增值税起征点是否有调整</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040011">认定为一般纳税人之后是否可以转为小规模纳税人</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040012">小规模纳税人自行开具的增值税专用发票如何填写申报表</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040013">注销登记</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040014">发票检查</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040015">专用发票丢失</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040016">征收率</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040017">非国税业务</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040018">信用等级</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040019">营改增</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040020">金税管理</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040021">进出口税收</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040022">征收管理</label>
						</li>
					
						<li style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
							<label><input type="checkbox" class="major_item" onchange="selectQuesCategory();" value="040023">发票保管</label>
						</li>
					
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
						<div id="seachMajor" class="quesContent">
							
						</div>
						<div id="searchQuesPage" class="box"></div>
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
				$.post("/lagsms/star",{
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
			 $.get('/lagsms/star/check',{
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
				 window.location.href='/lagsms/question/addConsulting';
			}
	  }
	</script>
</body>
</html>