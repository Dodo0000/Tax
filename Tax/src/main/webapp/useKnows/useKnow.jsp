<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta name="viewport" content="width=device-width"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/easyui/jquery.min.js"></script>
	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/fotter/useKnow.css"/>
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/zeroModal/zeroModal.min.js" charset="utf-8"></script>
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/zeroModal/zeroModal.css"/>
</head>
<body>
<!-- header start -->





<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width" name="viewport">
<script type="text/javascript"
	src="http://localhost:8080/Tax/resources/zeroModal/zeroModal.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://localhost:8080/Tax/resources/zeroModal/zeroModal.css">
<title>Insert title here</title>
<style type="text/css">

body {
	min-height: 900px;
	background:#eee;
}
.header {
	width: 100%;
	height: 100px;
	display: -webkit-box;
	position: relative;
	min-width: 1200px;
	background:rgba(255,255,255,255);
}

.header .logo {
	width: 614px;
	height: 42px;
	background: url(http://localhost:8080/Tax/resources/image/home/logo.png) no-repeat;
	position: relative;
	background-size: 100% 100%;
	margin: 30px 30px;
}

.header .nav {
	-webkit-box-flex: 1;
	width: 750px;
	margin-right:70px;
}

.header .nav ul {
	display: -webkit-box;
	list-style: none;
}

.header .nav ul li {
	-webkit-box-flex: 1;
	line-height: 100px;
	font-size: 16px;
	text-align: center;
	height: 85px;
	width:85px;
}

.header .nav ul li a {
	text-decoration: none;
	font-size: 19px;
	 color:#2057a6;
}

.header .but {
	width: 185px;
	height: 100px;
	position: relative;
	overflow: hidden;
	box-sizing: content-box;
}

.but_content {
    width:150px;
	height: 100px;
	position: absolute;
	bottom: 0;
}

.but_content div {
	float: left;
	height: 20px;
	line-height: 83px;
	color: #1B55A9;
	cursor: pointer;
	font-size: 15px;
	text-align: right;
}

.but_content div a {
	color: #1B55A9;
	font-size: 15px;
	text-decoration: none;
}

.message {
	width: 14px;
	cursor: pointer;
}

.your_meaasge span {
	color: #1B55A9;
}

.your_meaasge {
    height: 23px;
    position: absolute;
    margin-top: 55px;
    z-index:999;
    margin-left:15px;
    
}
.newss {
	color: #1B55A9;
	text-decoration: none;
	cursor: pointer;
}


/*	导航栏搜索	*/
/*new*/
.s_wrap{
    width: 145px; 
	height:30px;
	border:1px solid #1B55A9;
	line-height:100px;
	margin-top: 33px;
	border-radius:7px;
    margin-left: 10px;
}
.magnifying{
	width: 18px;
    height: 18px;
    float: left;
    margin: 6px 10px;
    cursor: pointer;
}
.ssearch{
	float: right;
    width: 76px;
    height: 30px;
    border: none;
    border-left:1px solid #1B55A9;
    box-sizing: border-box;
    margin:0px 28px 0 0;
    padding-left: 8px;
    color:#1B55A9;
    resize:none;
    outline:none;
    background:none;
}
.person{
	width:35px;
	height:35px;
	margin-top: 22px;
}
@media screen and (max-width: 1440px) {
	.header .logo {
		width: 720px;
		height: 34px;
		background: url(http://localhost:8080/Tax/resources/image/header/520.png) no-repeat;
		position: relative;
		background-size: 100% 100%;
		margin: 35px 30px;
	}
	.header .nav ul li a {
		text-decoration: none;
		color: #1B55A9;
		font-size: 19px;
	}
}

@media screen and (max-width: 1366px) {
	.header .logo {
	   width: 720px;
		height: 34px;
		background: url(http://localhost:8080/Tax/resources/image/header/520.png) no-repeat;
		position: relative;
		background-size: 100% 100%;
		margin: 35px 30px;
	}
	.header .nav ul li a {
		text-decoration: none;
		color: #1B55A9;
		font-size: 18px;
	}
}

@media screen and (max-width: 1280px) {
	.header .logo {
		width: 640px;
		height: 32px;
		background: url(http://localhost:8080/Tax/resources/image/header/490.png) no-repeat;
		position: relative;
		background-size: 100% 100%;
		margin: 35px 30px;
	}
	.header .nav ul li a {
		text-decoration: none;
		color: #1B55A9;
		font-size: 17px;
	}
}

@media screen and (max-width: 1024px) {
	.header .logo {
		width: 480px;
		height: 24px;
		background: url(http://localhost:8080/Tax/resources/image/header/380.png) no-repeat;
		position: relative;
		background-size: 100% 100%;
		margin: 40px 35px;
	}
	.header .nav ul li a {
		text-decoration: none;
		color: #1B55A9;
		font-size: 15px;
	}
}
 /* .logo,.nav,.but{
	border:1px solid;
}  */
</style>
</head>
<body>
	<div class="header" style="display:flex;justify-content:space-around;">
		<div class="logo"></div>
		<div class="nav">
			<ul id="tabs_nav" style="display:flex;justify-content:space-around;">
				<li id="oneplus"><a href="http://localhost:8080/Tax/index" id="one">首页</a><span class="underline"></span></li>
				<li id="twoplus"><a href="http://localhost:8080/Tax/questions" id="two">咨询</a></li>
				<li id="threeplus"><a href="http://localhost:8080/Tax/posts?type=0" id="three">经验分享</a></li>
				<li id="fourplus"><a href="http://localhost:8080/Tax/posts?type=1" id="four">专业解读</a></li>
				<li id="fiveplus"><a href="http://localhost:8080/Tax/usersZone" id="five">用户专区</a></li>
				<form action="http://localhost:8080/Tax/question/search">
					<li class="herader_search">
						<div class="s_wrap">
						    <a href="http://localhost:8080/Tax/questions/search">
						   	 <img alt="" src="http://localhost:8080/Tax/resources/image/icon/fdj.png" class="magnifying">
						    </a>
							<input type="text" id="head_srarch" name="title" class="ssearch" value="搜索问题…"/>
						</div>
					</li>
				</form>

			</ul>
		</div>
		<!--   用户登录     -->
		<div class="but">
			  
			<div class="but_content">
				
					
						<!--  未登录状态 -->
						<a href="http://localhost:8080/Tax/login" style="padding: 0 50px;">
							<img src="http://localhost:8080/Tax/resources/image/header/u198.png" class="person">
						</a>
						<div style="position: absolute; left: 20px; line-height: 0px;">
							<div style="line-height: 13px;">
								<a href="http://localhost:8080/Tax/login">登录</a>
							</div>
							<div style="line-height: 13px;">&nbsp;/&nbsp;</div>
							<div style="text-align: left; line-height: 13px;">
								<a href="http://localhost:8080/Tax/register">注册</a>
							</div>
						</div>
					
					
				
			</div>
		</div>
	</div>
	
	
	<script>
        $(function(){
           $(".user_text").hover(function(){
               var width_a = $(this).width();
               var width_b = $(this).find(".user_id").width();
               var indent_px = width_a - width_b;
               if( width_a <= width_b ){
                   $(this).css("text-indent",indent_px);
               }
           },function(){
               $(this).css("text-indent","0");
           });
        });
    </script>
      <!-- input点击清除value值 -->
    <script type="text/javascript">
		wap_val = [];
		$(".ssearch").each(function(i) {
			wap_val[i] = $(this).val();
			$(this).focusin(function() {
				if ($(this).val() == wap_val[i]) {
					$(this).val("");
				}
			}).focusout(function() {
				if ($.trim($(this).val()) == "") {
					$(this).val(wap_val[i]);
				}
			});
		});
		//  用户名显示
		 $(".user_id").each(function(){
		  var maxwidth=4;
		  if($(this).text().length > maxwidth){
		    $(this).text($(this).text().substring(0,maxwidth));
		    $(this).html($(this).html()+'...');
		  }
		}); 
	</script>
</body>
</html>
<!-- header end -->

<!-- content start -->
<div class="content">
	<div class="content_main">
	<div class="path_nav">
			<span style="float: left;">当前位置：
				<a href="javascript:history.go(-1);" class="nav_style">使用须知</a>
			</span>
		</div>
		<div class="content_main_list">
			<p><b style="font-size:20px;">使用须知</b></p>
		</div>
		<div class="content_main_list">
			<p><b>一：如何访问安徽省国家税务局税企互助交流平台？</b></p>
			<p>答：“安徽省国家税务局税企互助交流平台”网站是安徽省税务局唯一指定网站，网站域名为：<a href="http://www.baidu.com">http://www.baidu.com</a>。为方便您使用，建议将本站设为首页或加入收藏。</p>
		</div>
		<div class="content_main_list">
			<p><b>二：安徽省国家税务局税企互助交流平台都有哪些栏目？</b></p>
			<p>答：“安徽省国家税务局税企互助交流平台”分为首页、咨询、经验分享、专业解读、用户专区六个大的栏目，相对还有一些内容。</p>
		</div>
		<div class="content_main_list">
			<p><b>三：“安徽省国家税务局税企互助交流平台”网站有哪些应用服务？</b></p>
			<p>答：目前本网站的服务项目还不是很多，但大致可分为：
			<p>1．咨询类。</p>
			<p>2．回答类。</p>
			<p>3．查看类。</p>
		</div>
		<div class=content_main_list>
			<p><b>四：如何查询本网站的信息？</b></p>
			<p>答：网站用户主要分为普通用户和注册用户，其中：</p>
			<p>1．普通用户无需进行注册，便可直接浏览网站，并使用除办事类及部分互动类应用之外的网站功能。</p>
			<p>2．注册用户分为网站注册用户和纳税人用户，其中网站注册用户在本网站进行注册，可使用网站相关应用。纳税人用户应至主管税务机关办理网上用户的登记注册。</p>
		</div>
		<div class=content_main_list>
			<p><b>五：如何查询本网站的信息？</b></p>
			<p>答：您可以通过以下方式查找网站信息：</p>
			<p>1．根据所需查询的信息类别、税种或其他特征通过浏览网站相关栏目进行查阅。</p>
			<p>2．通过网站的搜索功能，输入“关键字”内容查找。对于特征明确的待查信息也可通过网站高级检索功能进行组合查询。</p>
		</div>
		<div class=content_main_list>
			<p><b>六：如何与本站取得联系？</b></p>
			<p
			>想了解更多有关网站方面的信息或是想对网站建设提出意见建议，可与本站联系，网站邮箱：xxx@xxx.com</p>
		</div>
	</div>
	<!-- <div class="content_share">
		<span>分享到：</span>
		<a href="">QQ</a>
		<a href="">VX</a>
		<a href="">WB</a>
	</div> -->
</div>
<!-- content end -->

<!-- fotter start -->




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	 /* 底部 */
	.liuan_footers{
		width:100%;
		height:110px;
		background:#1B55A9;
		overflow:hidden;
		min-width:1200px;
	}
	.liuan_footers_content{
		width:1200px;
		height:150px;
		text-align:center;			
		margin:-2px auto;
	}
	.liuan_footers_content ul{
		margin:25px 0;
		color:#fff;
		font-size:14px;
	}
	.liuan_footers_content ul li{
		height:20px;
		line-height:20px;
	}
	.liuan_footers_content ul li a{
		color:#fff;
		text-decoration: none;
	}
	.liuan_footers_content ul:nth-child(1){
		height:50px;
		width:450px;
		margin:0 auto;
		text-align:center;
	}
	.liuan_footers_content ul:nth-child(2){
		width:505px;
		margin:0 auto;
		text-align:center;
	}
	.liuan_footers_content ul:nth-child(1) li{
		width:130px;
		height:50px;
		text-align:right;
		margin:0 10px;
		line-height:50px;
	}
	.liuan_footers_content ul:nth-child(1) li:nth-child(1){
		float:left;
		background:url(http://localhost:8080/Tax/resources/image/home/footer_notice.png) left 30px center  no-repeat;
		background-size: 25% 61%;
	}
	.liuan_footers_content ul:nth-child(1) li:nth-child(2){
		float:left;
		background:url(http://localhost:8080/Tax/resources/image/home/footer_proposal.png) left 28px center no-repeat;
		background-size: 25% 61%;
	}
	.liuan_footers_content ul:nth-child(1) li:nth-child(3){
		float:left;
		background:url(http://localhost:8080/Tax/resources/image/home/footer_contact.png) left 28px center  no-repeat;
		background-size: 25% 61%;
	}
	.luan_use{
		display:flex;
	}
</style>
<body>
	<div class="liuan_footers" id="footer">
		<div class="liuan_footers_content">
			<ul class="luan_use">
				
				<li><a href="http://localhost:8080/Tax/useKnows/useKnow"  target="_blank">使用须知</a></li>
				<li><a href="http://localhost:8080/Tax/useKnows/useHelp" target="_blank">网站帮助</a></li>
				<li><a href="http://localhost:8080/Tax/login/contactUs" target="_blank">联系我们</a></li>
			</ul>
			<ul>
				
				<!-- <li>技术服务由科大讯飞股份有限公司提供</li>
				<li>地址：合肥市xx区xx路xxxx号 邮编：xxxxxx</li>
				<li>传真：xxxxx 电子邮件：xxxxx</li> -->
				<li>安徽省国家税务局主办 ICP备案号********
				
				</li>
				 <li>技术服务由科大讯飞股份有限公司提供</li> 
				<li>通讯地址：合肥市包河区中山路3398号 联系电话：0551-12366</li>
				<!-- <li>建议使用IE9以上浏览器，分辨率大于1024*768</li> -->
			</ul>
		</div>
	</div>
</body>
</html> 
<!-- fotter end -->
</body>
</html>
