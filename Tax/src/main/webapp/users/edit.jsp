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
  	<link rel="icon" href="/lagsms/resources/image/home/favicon.gif" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/myData.css">
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="/lagsms/resources/css/footer.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/lagsms/resources/css/cropper/cropper.css">
    <link rel="stylesheet" href="/lagsms/resources/css/cropper/main.css">
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
					<a href="/lagsms/users/updatePwd">修改密码</a>
					<img src="/lagsms/resources/image/home/blue_head.png">
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
						    
							    
							    
							        <img src="/lagsms/resources/image/u2815.png" id="avatarImg" alt="Avatar">
							    
							
					    </div>
					    <!-- Cropping modal -->
					    <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
					      <div class="modal-dialog modal-lg">
					        <div class="modal-content">
					          <form class="avatar-form" action="/lagsms/file/fileUpLoad" enctype="multipart/form-data" method="post">
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
					
					<form id="dataForm" action="/lagsms/updateMyData" method="POST">
						<input type="hidden" name="avatar" id="userAvatarId"/>
						<div class="all_message">
							<div class="uesrname">
								<span class="write_left">用户姓名：</span>
								<input type="text" name="userName" class="usermassage" value="Linbeii">
							</div>
							<div class="uesrname">
								<span class="write_left">用户类型：</span>
								<span class="type">
									
										
										
										普通用户
									
								</span>
							</div>
							<div class="uesrname">
								<span class="write_left">电话号码：</span>
								<input type="text" name="userTelephone" value="18451313151" class="usermassage" />
							</div>
							<div class="uesrname">
								<span class="write_left">单位名称：</span>
								<input type="text" readonly="readonly" name="" value="Linbeii" class="usermassage" />
							</div>
							<div class="uesrname">
								<span class="write_left">邮箱号码：</span>
								<input type="text" name="mail" value="944841236@qq.com" class="usermassage" />
							</div>
							<div class="uesrname clearfix" id="selectMajor">
								<span class="write_left">选择专业分类:</span>
								<span class="professional">
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040001">
											发票系统故障及操作指导
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040002">
											发票领购
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040003">
											发票代开
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040004">
											发票开具
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040005">
											红字增值税发票开具
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040006">
											申报有误能否作废
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040007">
											一般纳税人资格
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040008">
											辅导期一般纳税人
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040009">
											专用发票认证抵扣
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040010">
											小规模纳税人增值税起征点是否有调整
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040011">
											认定为一般纳税人之后是否可以转为小规模纳税人
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040012">
											小规模纳税人自行开具的增值税专用发票如何填写申报表
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040013">
											注销登记
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040014">
											发票检查
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040015">
											专用发票丢失
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040016">
											征收率
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040017">
											非国税业务
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040018">
											信用等级
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040019">
											营改增
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040020">
											金税管理
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040021">
											进出口税收
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040022">
											征收管理
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="major" value="040023">
											发票保管
										</label>
									 
								</span>
							</div>
							<div class="save">
								<button class="save_btn" type="submit">保存信息</button>
							</div>
							<input type="hidden" name="userOrg" value="user_1530497245745">
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
	<script src="/lagsms/resources/js/cropper/cropper.min.js"></script>
	<script src="/lagsms/resources/js/cropper/main.js"></script>
	<script type="text/javascript">
		function updateVerifyCode() {
			event.target.src = event.target.src + "?t=" + Date.now();
		}
		
		var boxObj = $('#selectMajor').find("input"); //获取所有的复选框值  
	    var userMajor = ''; 				//用el表达式获取在控制层存放的复选框的值为字符串类型  
	    var userMajorArr = userMajor.split(',');
	    $.each(userMajorArr, function(index, major) {
	       boxObj.each(function () {
	            if($(this).val() == major) {
	               $(this).attr("checked",true);
	            }
	        });
	    });
	</script>
</body>
</html>
