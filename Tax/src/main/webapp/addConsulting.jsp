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
<link rel="shortcut icon" href="http://localhost:8080/Tax/resources/image/project.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/consultingShare.css">
<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/ckeditor/config.js"></script>
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
				<!-- 去掉 onsubmit="return save();"  action="http://localhost:8080/Tax/question/addConsulting"-->
				<form id="consultingShareForm" method="post" >
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
								<!-- 默认0积分 -->
								<option value="" disabled selected>自选金额</option>
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
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="1">发票系统故障及操作指导</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="2">发票领购</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="3">发票代开</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="4">发票开具</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="5">红字增值税发票开具</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="6">申报有误能否作废</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="7">一般纳税人资格</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="8">辅导期一般纳税人</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="9">专用发票认证抵扣</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="10">小规模纳税人增值税起征点是否有调整</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="11">认定为一般纳税人之后是否可以转为小规模纳税人</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="12">小规模纳税人自行开具的增值税专用发票如何填写申报表</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="13">注销登记</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="14">发票检查</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="15">专用发票丢失</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="16">征收率</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="17">非国税业务</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="18">信用等级</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="19">营改增</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="20">金税管理</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="21">进出口税收</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="22">征收管理</label>
								
									<label><input type="checkbox" class="major_item" onclick="selectedMajor();" name="majorCategory" value="23">发票保管</label>
								
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
									<!-- 这里动态拼接 相关用户的checkbox -->
									<!-- 这里要动态获取点击的相关用户 -->
									<div id="ordinary" class="ordinaryone fl">
										<label class="checkbox-template" hidden="hidden">
											<input type="checkbox" class="type_item"  name="invitedId" value="userId" >
											<span>username</span>
										</label>
									</div>
								</div>
							</div>	
							<div style="clear: both;"></div>
						</div>
						<!-- 标题 -->
						<div class="add_title clearfix">
							<div class="title_one fl" style="margin-top:20px;font-size:18px;">标&emsp;&emsp;题:</div>
							<input name="title" id="title" class="title_input fl"/>
						</div>
						
						<!-- ckeditor开始 -->
						<div class="add_content clearfix">
							<div class="text_area">
								<textarea name="content" id="content" class="fl" style="height:180px;"></textarea>
								<!-- <textarea name="content" id="editor" class="fl"  cols="30" rows="10"></textarea> -->
								<script>
									/**猜测这里加载ckeditor?*/
    								CKEDITOR.replace('editor');
								</script>
							</div>
						</div>
						<!-- ckeditor结束 -->
						
						<div class="sub">
							<input type="button" onclick="submitQuestion()" value="提交" class="button_submit pr">
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
		
		/**ready函数*/
		$(function(){
			selectedMajor();
		});
		
		/**提交问题*/
		function submitQuestion(){
			alert("submitQuestion");
			/**先获取提问信息*/
			var title = $('#title').val();
			console.log("标题："+title);
			var content = $('#content').val();
			console.log("内容："+content);
			var type = '';
			$("input[name='majorCategory']:checked").each(function(i){//把所有被选中的复选框的值存入数组
            	//alert.log(i+"th typeId :"+$(this).val());
            	type = type+$(this).val()+';';
        	});
        	alert("type: "+type);
			var prize = $('#rewardAmount').val();
			if(prize==undefined || prize<1)
				prize = 0;
			console.log("赏金： "+prize);
			var invitedIdArr = [];
			$("input[name='invitedId']:checked").each(function(i){//把所有被选中的复选框的值存入数组
            	invitedIdArr[i] =$(this).val();
            	console.log(i+"th invitedId :"+invitedIdArr[i]);
        	});
        	/**ajax提交到数据库*/
        	
        	$.ajax({
        		url:'http://localhost:8080/Tax/user/publishQuestion',
        		type:'post',
        		data:{
        			title:title,
        			content:content,
        			type:type,
        			prize:prize,
        			invitedUserIdArr:invitedIdArr,
        		},
        		success:function(data){
        			if(data['message']=='success'){
        				alert("咨询成功");
        				window.location.href='http://localhost:8080/Tax/questions.jsp';
        			}
        			else if(data['message']=='empty title'){
        				alert("标题不能为空");
        				window.location.reload();
        			}
        			else if(data['message']=='empty content'){
        				alert("内容不能为空");
        				window.location.reload();
        			}
        			else if(data['message']=='permission denied'){
        				alert("请先登陆");
        				window.location.href='http://localhost:8080/Tax/guest/login.jsp';
        			}
        			else{
        				alert("未处理状态");
        			}
        		},
        		error:function(data){
        			alert("服务器忙");
        			console.log(data);
        		}
        	});
        	
		}
		
		//如果是悬赏就不禁用 否则就禁用
		function selectCategory() {
			var target = event.target;
		 	if(target.value == '1') { //悬赏提问
		 		var rewardAmount = document.getElementById("rewardAmount");
			 	rewardAmount.value = "";
			 	rewardAmount.disabled = false;
		 	} else {
		 		var rewardAmount = document.getElementById("rewardAmount");
		 		//若不是悬赏把rewardAmount设置为0
		 		rewardAmount.value = "";
			 	rewardAmount.disabled = true;
		 	}
	 	}
	
		// 存放所有选中的mojor
		var selectedMajors = new Set();
		function selectedMajor() {
			//alert("selectMajor");
			// 为了兼容firefox
			var e =  window.event || arguments.callee.caller.arguments[0];
			if(e.target.checked) {
				selectedMajors.add(e.target.value);
			} else {
				selectedMajors.delete(e.target.value);
			}
			// ajax 请求
			var m = Array.from(selectedMajors).join(';');
			m = encodeURI(m);
			//alert(m);
			if(selectedMajors.size > 0 ) {
				$.ajax({
					url:'http://localhost:8080/Tax/user/getRelaventUsers',
					type:'post',
					data:{
						questionTypes:m,
					},
					success:function(data){
						if(data['message']=='success'){
							//先清空之前填写的candidate-template-clone
							$('label').remove('.candidate-template-clone');
							var candidateList = data['result'];
							var template_parent = $('#ordinary');
							for(i in candidateList){
								//alert(candidateList[i]['username']);
								//alert(candidateList[i]['id']);
								var template = template_parent.children('label:eq(0)').clone(true);
								template.addClass('candidate-template-clone');
								template.removeAttr('hidden');
								//设置用户名
								template.children('span:eq(0)').text(candidateList[i]['username']);
								template.children('input:eq(0)').val(candidateList[i]['id']);
								//添加模板
								template_parent.children('label').last().after(template);
							}
						}
						else if(data['message']=='permission denied'){
							alert("请先登陆");
							window.location.href='http://localhost:8080/Tax/guest/login.jsp';
						}
						else if(data['message']=='empty query result'){
							//先清空之前填写的candidate-template-clone
							//alert("empty query result");
							$('label').remove('.candidate-template-clone');
						}
						else{
							alert("未处理问题");
						}
					},
					error:function(data){
						alert("服务器忙");
						console.log(data);
					},
				});
			}
			else if(selectedMajors.size==0){
				//先清空之前填写的candidate-template-clone
				$('label').remove('.candidate-template-clone');
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
 
	</script>
</body>
</html>