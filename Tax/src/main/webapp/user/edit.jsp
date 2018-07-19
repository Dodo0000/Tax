<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html> 
<head>
	<!-- lb -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<script type="text/javascript"
		src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js ">
	</script>
	<!-- lb -->
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width" />
  	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/myData.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/footer.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/cropper/cropper.css">
    <link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/cropper/main.css">
    <style type="text/css">
    		.avatar-view img{margin:0;}
	    	.user_text{margin-top:7px;}
	    	.user_text_one{margin-top:7px;}
	    	.user_text_two{margin-top:7px;}
			::-ms-clear, ::-ms-reveal{display: none;}
    </style>
</head>
<body>
	<!-- 头部标题start -->
	<%@ include file="../header.jsp" %>
	<!-- 头部标题end -->
		
	<!-- 中间部分start -->
	
	<div class="content" style="height:680px;min-height:680px; ">
	   <div style="margin-left:50px;margin-top:25px;color:black">
		<span class="">当前位置：<a style="color:black" href="javascript:history.go(-1);" class="nav_style">个人中心</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
			<span class=""><a href="" style="color:black"> 个人资料编辑</a></span>
		</div>
		<div class="content_main">
			<div class="content_top">
				<div class="personal_left">个人资料</div>
				<div class="personal_right">
					<a href="http://localhost:8080/Tax/users/updatePwd">修改密码</a>
					<img src="http://localhost:8080/Tax/resources/image/home/blue_head.png">
				</div>
			</div>
			<div class="gary">
				<div class="pink"></div>
			</div>
			<div class="content_middle clearfix">
				<div class="lefts">
					<!-- cropper  -->
					<div class="container" id="crop-avatar">
					    <!-- Current avatar -->
					    <div class="avatar-view" title="Change the avatar">
						    
							    
							    
							        <img src="http://localhost:8080/Tax/resources/image/u2815.png" id="avatarImg" alt="Avatar">
							    
							
					    </div>
					    <!-- Cropping modal -->
					    <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
					      <div class="modal-dialog modal-lg">
					        <div class="modal-content">
					          <form class="avatar-form" action="http://localhost:8080/Tax/file/fileUpLoad" enctype="multipart/form-data" method="post">
					            <div class="modal-header">
					              <button type="button" class="close" data-dismiss="modal">&times;</button>
					              <h4 class="modal-title" id="avatar-modal-label">Change Avatar</h4>
					            </div>
					            <div class="modal-body">
					              <div class="avatar-body">
					                <!-- Upload image and data -->
					                <div class="avatar-upload">
					                 <!--  <input type="hidden" class="avatar-src" name="uploadFile">
					                  <input type="hidden" class="avatar-data" name="uploadFile"> -->
					                  <label for="avatarInput">图片上传</label>
					                  <input type="file" class="avatar-input" id="avatarInput" name="uploadFile">
					                </div>
					                <!-- Crop and preview -->
					                <div class="row">
					                  <div class="col-md-9">
					                    <div class="avatar-wrapper"></div>
					                  </div>
					                  <div class="col-md-3">
					                    <div id="avatarPreview" class="avatar-preview preview-lg"></div>
					                  </div>
					                </div>
					                <div class="row avatar-btns">
					                  <div class="col-md-9">
					                    <div class="btn-group">
					                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="-90" title="Rotate -90 degrees">Rotate Left</button>
					                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="-15">-15deg</button>
					                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="-30">-30deg</button>
					                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45">-45deg</button>
					                    </div>
					                    <div class="btn-group">
					                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="90" title="Rotate 90 degrees">Rotate Right</button>
					                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="15">15deg</button>
					                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="30">30deg</button>
					                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="45">45deg</button>
					                    </div>
					                  </div>
					                  <div class="col-md-3">
					                    <button type="submit" class="btn btn-primary btn-block avatar-save">开始上传</button>
					                  </div>
					                </div>
					              </div>
					            </div>
					            <div class="modal-footer">
					              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					            </div>
					          </form>
					        </div>
					      </div>
					    </div><!-- /.modal -->
					    <!-- Loading state -->
					    <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
					</div>
					<!-- cropper end -->
					<!-- lb -->
				</div>
				<!-- left end -->
				 <div class="rights">
					
					<!-- 这个表单一进来的时候首先要ajax查好当前登陆用户的信息然后填充好这个页面 -->
					<!-- 下面form中关于要查询获得的用户信息添加id -->
					<!-- action="http://localhost:8080/Tax/updateMyData" -->
					<form id="dataForm"  method="POST">
						<input type="hidden" name="avatar" id="userAvatarId"/>
						<div class="all_message">
							<div class="uesrname">
								<span class="write_left">用户姓名：</span>
								
								<input id="editFormUsername" type="text" name="username" class="usermassage" value="Linbeii">
							</div>
							<div class="uesrname">
								<span class="write_left">用户类型：</span>
								<span class="type">
									
										普通用户
										
								</span>
							</div>
							<div class="uesrname">
								<span class="write_left">电话号码：</span>
								<input id="editFormTelephone" type="text" name="telephone" value="18451313151" class="usermassage" />
							</div>
							<div class="uesrname">
								<span class="write_left">单位名称：</span>
								<input type="text" readonly="readonly" name="" value="Linbeii" class="usermassage" />
							</div>
							<div class="uesrname">
								<span class="write_left">邮箱号码：</span>
								<input id="editFormEmail" type="text" name="email" value="944841236@qq.com" class="usermassage" />
							</div>
							<div class="uesrname clearfix" id="selectMajor">
								<span class="write_left">选择专业分类:</span>
								<span class="professional">
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="1">
											发票系统故障及操作指导
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="2">
											发票领购
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="3">
											发票代开
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="4">
											发票开具
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="5">
											红字增值税发票开具
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="6">
											申报有误能否作废
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="7">
											一般纳税人资格
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="8">
											辅导期一般纳税人
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="9">
											专用发票认证抵扣
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="10">
											小规模纳税人增值税起征点是否有调整
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="11">
											认定为一般纳税人之后是否可以转为小规模纳税人
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="12">
											小规模纳税人自行开具的增值税专用发票如何填写申报表
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="13">
											注销登记
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="14">
											发票检查
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="15">
											专用发票丢失
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="16">
											征收率
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="17">
											非国税业务
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="18">
											信用等级
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="19">
											营改增
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="20">
											金税管理
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="21">
											进出口税收
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="22">
											征收管理
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="23">
											发票保管
										</label>
									 
								</span>
							</div>
							<div class="save">
								<!-- 按保存按钮提交修改 -->
								<button id="save-edit-form" class="save_btn" type="button" onclick="saveEditForm()">保存信息</button>
							</div>
							<!-- 设置隐藏域的uid并且提交 -->
							<input id="editFormUid" type="hidden" name="id" value="user_1530497245745">
						</div>
					</form>
				</div> 
			</div>
		</div>
	</div>
	<!-- 中间部分start -->
	<!-- 底部内容start -->
	<%@ include file="../footer.jsp" %>
	<!-- 底部内容end -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://localhost:8080/Tax/resources/js/cropper/cropper.min.js"></script>
	<script src="http://localhost:8080/Tax/resources/js/cropper/main.js"></script>
	<script type="text/javascript">
		//ready
		$(function() {
			checkLoginAndInitEditForm();
		});
		
		/*
		var boxObj = $('#selectMajor').find("input"); 
		//获取所有的复选框值 
	    var userMajor = ''; 				//用el表达式获取在控制层存放的复选框的值为字符串类型  
	    var userMajorArr = userMajor.split(',');
	    $.each(userMajorArr, function(index, major) {
	       	boxObj.each(function () {
	        	if($(this).val() == major) {
	               	$(this).attr("checked",true);
	            }
	        });
	    });
	    */
		function saveEditForm(){
			alert("saveEditForm");
			//从隐藏域中获取uid
			var uid = $('#editFormUid').val();alert("uid in hidden input: "+uid);
			var editedUsername = $('#editFormUsername').val();
			var editedTelephone = $('#editFormTelephone').val();
			var editedEmail = $('#editFormEmail').val();
			var proListStr=getTypeStrFromCheckBox();
			if(proListStr=='')
				alert("empty prolist");
			$.ajax({
				url:'http://localhost:8080/Tax/user/updateUserInfo',
				type:'post',
				data:{
					id:uid,
					username:editedUsername,
					telephone:editedTelephone,
					email:editedEmail,
					proList:proListStr,
				},
				success:function(data){
					if(data['message']=='success'){
						alert("修改成功");
						window.location.href='http://localhost:8080/Tax/user/personalCenter.jsp';
					}
					else{
						alert("用户名重复或email或电话合法");
						window.location.reload();
					}
				},
				error:function(data){
					alert("服务器忙");
					console.log(data);
				}
			});
		};
		
		function getTypeStrFromCheckBox(){
			var majorStr = '';
			$.each($('input:checkbox'),function(){
                if(this.checked){
                   majorStr= majorStr+$(this).val()+';';
                }
            });
            return majorStr;
            //alert("majorStr: "+majorStr);
		}
		
		/**
			查看是否登陆并填写用户那个基本表
			等上传图片做了还需要修改头像
		*/
		function checkLoginAndInitEditForm (){
			var cookie = document.cookie;
			var field = cookie.split(';');
			var hasLogin = false;
			for(var i in field){
				var info = field[i].split('=');
				if(info[0].trim() == '_user'){
					hasLogin=true;
					$.ajax({
						url:'http://localhost:8080/Tax/guest/decode',
						type:'get',
						data:{
							str:info[1].trim()
						},
						success:function(data) {
							//alert(data['result']);
							var uid=data['result'].split(';')[0];
							var username=data['result'].split(';')[1];
							var password=data['result'].split(';')[2];
							$.ajax({
								url:'http://localhost:8080/Tax/user/getUser',
								type:'post',
								success:function(data){
									if(data['message']=='success'){
										var userJson=data['result'];
										//根据这userJson填充表格
										$('#editFormUsername').attr('value', userJson['username']);
										$('#editFormTelephone').attr('value', userJson['telephone']);
										$('#editFormEmail').attr('value', userJson['email']);
										/**设置隐藏域uid*/
										$('#editFormUid').attr('value', userJson['id']);
									}
									else{
										alert('用户登陆cookie信息有问题！');
									}
								},
								error:function(data){
									alert('服务器忙');
									console.log(data);
								}
							});
						},
						error:function(data) {
							alert('decode progress failed')
							console.log(data);
						}
					});
				}
			}
			//若没有登陆跳转到登陆页面
			if(!hasLogin)
				window.locaion.href='http://localhost:8080/Tax/guest/login.jsp';
		}
	</script>
</body>
</html>
