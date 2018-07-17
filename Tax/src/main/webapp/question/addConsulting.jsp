<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>安徽省国家税务局税企互助交流平台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="Simple">
<!--  360浏览器专用 -->
<meta name="renderer" content="ie-stand" />
<link rel="shortcut icon" href="/lagsms/resources/image/project.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/consultingShare.css">
<script src="/lagsms/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="/lagsms/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="/lagsms/resources/ckeditor/config.js"></script>
</head>
<body>
	<!-- 头部标题start -->
	<%@ include file="../header.jsp" %>
	<!-- 头部标题end -->
	<div class="content">
		<div class="content_main">
			<div class="content_top">我要咨询</div>
			<div class="gary">
				<div class="pink"></div>
			</div>
			<div class="content_middle">
				<form id="consultingShareForm" method="post" onsubmit="return save();" action="/lagsms/question/addConsulting">
					<div>
						<div>
							<input type="text" name="userId" id="userId" hidden="true">
						</div>
						<div>
							<input type="text" name="status" id="status" hidden="true">
						</div>
						<div>
							<input type="text" name="browseCount" id="browseCount" hidden="true">
						</div>
						
						<div class="content_middle_one">
							<span>选择类型:</span>
							<select id="category" name="category" onchange="selectCategory();">
		   						 <option value="0">普通提问</option>
		   						 <option value="1">悬赏提问</option>
							</select> 
							<span style="margin-left: 33px;">悬赏金额:</span>
							<select name="rewardAmount" id="rewardAmount">
								<option value="" disabled selected>自选积分金额</option>
								 <option value="1">1</option>
		   						 <option value="3">3</option>
		   						 <option value="5">5</option>
							</select>
						</div>
						
						<div class="content_middle_two">
							<div class="select_f">
								<span>选择专业分类:</span>
							</div>
							<div class="select_btn">
							<ul>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040001">发票系统故障及操作指导</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040002">发票领购</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040003">发票代开</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040004">发票开具</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040005">红字增值税发票开具</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040006">申报有误能否作废</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040007">一般纳税人资格</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040008">辅导期一般纳税人</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040009">专用发票认证抵扣</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040010">小规模纳税人增值税起征点是否有调整</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040011">认定为一般纳税人之后是否可以转为小规模纳税人</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040012">小规模纳税人自行开具的增值税专用发票如何填写申报表</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040013">注销登记</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040014">发票检查</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040015">专用发票丢失</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040016">征收率</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040017">非国税业务</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040018">信用等级</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040019">营改增</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040020">金税管理</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040021">进出口税收</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040022">征收管理</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="040023">发票保管</label>
								
							</ul>
							</div>
						</div>
						<div style="clear: both;"></div>
						<div style="clear: both;"></div> 
						<div class="content_middle_three">
							<span>邀请回答:</span>
							<div class="Org fr" style="margin-top: -18px;" id="org">
								<div class="clearfix">
									<div class="ordinary fl">普通用户:</div>
									<div id="ordinary" class="ordinaryone fl"></div>
								</div>
								<div class="clearfix">
									<div class="expert fl">专家用户:</div>
									<div id="expert" class="expertone fl"></div>
								</div>
								<div class="clearfix">
									<div class="institution fl">机构用户:</div>
									<div id="institution" class="institutionone fl"></div>
								</div>
							</div>	
							<div style="clear: both;"></div>
						</div>
						<!-- 标题 -->
						<div class="add_title clearfix">
							<div class="title_one fl" style="margin-top:20px;font-size:18px;">标&emsp;&emsp;题:</div>
							<input name="title" id="title" class="title_input fl"/>
						</div>
						<div class="add_content clearfix">
							<div class="text_area">
								<!-- <textarea name="content" id="content" class="fl" style="height:180px;"></textarea> -->
								<textarea name="content" id="editor" class="fl"  cols="30" rows="10"></textarea>
							</div>
						</div>
						<div class="sub">
							<input type="submit" value="提交" class="button_submit pr">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 底部内容start -->
	<%@ include file="../footer.jsp" %>
	<!-- 底部内容end -->
	<script type="text/javascript">
		
		//如果是悬赏就不禁用 否则就禁用
		function selectCategory() {
			var target = event.target;
		 	if(target.value == '1') { //悬赏提问
		 		var rewardAmount = document.getElementById("rewardAmount");
			 	rewardAmount.value = "";
			 	rewardAmount.disabled = false;
		 	} else {
		 		var rewardAmount = document.getElementById("rewardAmount");
			 	rewardAmount.disabled = true;
		 	}
	 	}
	
		// 存放所有选中的mojor
		var selectedMajors = new Set();
		function selectedMajor() {
			// 为了兼容firefox
			var e =  window.event || arguments.callee.caller.arguments[0];
			if(e.target.checked) {
				selectedMajors.add(e.target.value);
			} else {
				selectedMajors.delete(e.target.value);
			}
			// ajax 请求
			var m = Array.from(selectedMajors).join(',');
			m = encodeURI(m);
			m = encodeURI(m);
			if(selectedMajors.size > 0 ) {
				$.get("/lagsms/users/search", { major: m }, function(data) {
					console.log(data);
					var ordinaryHtml = "";
	              	var expertHtml = "";
	              	var institutionHtml = "";
	              	for(var i = 0;i<data.length;i++){
	                 	console.log(data[i]);
	                 	if(data[i].userId == 'user_1530497245745') {
	                 		continue;
	                 	}
	                		if(data[i].type == 0){
		                 	var a = '<label><input type="checkbox" class="type_item"  name="invitedId" value="'+data[i].userId+'" >'+data[i].userName+'</label>';
		                 	console.log(data[i].userId);
		                 	ordinaryHtml += a;
	                 	}else if(data[i].type == 1){
	                	 		var a = '<label><input type="checkbox" class="type_item"  name="invitedId" value="'+data[i].userId+'" >'+data[i].userName+'</label>';
		                 	console.log(data[i].userId);
		                 	expertHtml += a;
	                 	}else{
	                	 		var a = '<label><input type="checkbox" class="type_item"  name="invitedId" value="'+data[i].userId+'" >'+data[i].userName+'</label>';
		                 	console.log(data[i].userId);
		                 	institutionHtml += a;
	                 	}
	              	}
	              $("#ordinary").html(ordinaryHtml);
	              $("#expert").html(expertHtml);
	              $("#institution").html(institutionHtml);
				}, "json");
			} else {
				 $("#ordinary").html("");
				 $("#expert").html("");
				 $("#institution").html("");
			}
		}
	
		 function save() {
			//下拉框校验
			/* var myselect=document.getElementById("category");
			if(null==myselect.selectedIndex||myselect.selectedIndex==""){
				zeroModal.alert("请选择类型");
				return false;
			} */
			
			var rewardAmount = document.getElementById("rewardAmount");
			if(parseInt(rewardAmount.value) > parseInt('100')) {
				zeroModal.alert("您的积分不足");
				return false;
			}
			
			//复选框校验
			var str=document.getElementsByName("majorCategory");
			var objarray=str.length;
			var chestr="";
			for (i=0;i<objarray;i++) {
			  	if(str[i].checked == true) {
			   		chestr+=str[i].value+",";
			  	}
			}
			if(chestr == "") {
				zeroModal.alert("请先选择一个专业");
			  	return false;
			}
			
			var strone=document.getElementsByName("invitedId");
			var objarrayone=strone.length;
			var chestrone="";
			for (i=0;i<objarrayone;i++) {
			  if(strone[i].checked == true) {
				  chestrone+=strone[i].value+",";
			  }
			}
			if(chestrone == "") {
				zeroModal.alert("请先选择一个用户");
			  return false;
			}

			//输入框校验
			var text = document.getElementById('title').value
			console.log(text.trim());
			/* text.replace(/\ +/g, ""); //去掉空格
	        text.replace(/[ ]/g, "");    //去掉空格
	        text.replace(/[\r\n]/g, ""); //去掉回车换行  */
			if (null == text || text == "") {
				zeroModal.alert("请填写标题");
				return false;
			}
			//文本域校验
			var text = document.getElementById('content').value
			console.log(text.trim());
			/* text.replace(/\ +/g, ""); //去掉空格
	        text.replace(/[ ]/g, "");    //去掉空格
	        text.replace(/[\r\n]/g, ""); //去掉回车换行  */
			if (null == text || text == "") {
				zeroModal.alert("请填写正文");
				return false;
			
			}
	        //是否登录用户校验
			var userId='user_1530497245745';
			console.log(userId);
			if(userId=='null'){
				zeroModal.alert("请先登录用户");
				return false;
			}
			return true;
       }
 

    	 CKEDITOR.replace('editor');
	</script>
</body>
</html>