<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta name="viewport" content="width=device-width" />
  	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/expertPrefecture.css">
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">	
  	<script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
  	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
	<style>
		.box{
			width:955px!important;
		}
		#five {
			border-bottom: 1px solid #fff;
		    padding-bottom: 10px;
		    color: #fff;
		    display: inline-block;
		    width: 90%;
		    height: 65%;
		}
		#fiveplus{
			background:#1B55A9;
		}
		body::-webkit-scrollbar {display:none}
		body::-o-scrollbar {display:none}
		body::-ms-scrollbar {display:none}
		body::-moz-scrollbar {display:none}
	</style>
</head>

<body style="min-height:1000px;">
	<%@ include file="header.jsp" %>
	
	<!-- content start -->
	<div class="liuan_content_main">
		<div class="liuan_content">
			<!-- 专家简介 -->
			<div class="tab_main intro">
				<div class="center_main">
					<div class="content_message">
						<div class="user_tou">
							<img src="http://localhost:8080/Tax/resources/image/expert.png">
						</div>
						<div class="all_people">
							<div class="all_people_num">
								<span>总人数：</span><span>7</span>
							</div>
							<div class="all_people_num">
								<span>总答题：</span><span>116</span>
							</div>
							<div class="all_people_num">
								<span>采纳数：</span><span>1</span>
							</div>
							<div class="renzheng">
								<a onclick="userNotNull();"><img src="http://localhost:8080/Tax/resources/image/attestation.png">专家认证</a>
							</div>
						</div>
					</div>
					<div class="expter_massage">
						<h3>专家简介</h3>
						<p>
							专家用户是指具有税务师、注册会计师资格或在税务机关、税务院校从事税收相关工作，
							拥有比较丰富的税收专业知识和办税经验，乐于分享，能够积极主动帮助问税用户答疑解惑的个人。
							专家用户须经本人申请，并经问税平台管理方审核认证。
						</p>
					</div>
				</div>
			</div>
			<!-- 机构简介 -->
			<div class="tab_main">
				<div class="center_main">
					<div class="content_message">
						<div class="user_tou">
							<img src="http://localhost:8080/Tax/resources/image/u3392.png" style="width:88%;">
						</div>
						<div class="all_people">
							<div class="all_people_num">
								<span>总人数：</span><span>11</span>
							</div>
							<div class="all_people_num">
								<span>总答题：</span><span>1</span>
							</div>
							<div class="all_people_num">
								<span>采纳数：</span><span>1</span>
							</div>
							<div class="renzheng">
								<a onclick="userNoLogin();"><img src="http://localhost:8080/Tax/resources/image/attestation.png">机构认证</a>
							</div>
						</div>
					</div>
					<div class="expter_massage">
						<h3>机构简介</h3>
						<p>机构是指由从事涉税领域相关工作的用户代表单位申请创建，
						经问税平台管理方审核通过，拥有一支涉税工作队伍，
						自愿与问税平台合作，调动单位所属问税用户积极主动
						帮助其他用户答疑解惑的单位。
						</p>
					</div>
				</div>
			</div>
			<!--机构与专家点击切换  -->	
			<div class="expert_org">
				<span class="tab_titles" id="organization">优秀机构</span>
				<span class="header_titles">|</span>
				<span class="tab_titles active" id="expert">优秀专家</span>
				<span class="expert_org_more mores"><a href="http://localhost:8080/Tax/orgOrUserRank?type=2">更多</a></span>
				<span class="expert_org_more"><a href="http://localhost:8080/Tax/orgOrUserRank?type=1">更多</a></span>
				<div class="gary">
					<div class="pink"></div>
				</div>
			</div>
			
		<!--优秀专家机构切换  two-->
		<div class="tab_accordance">
			<!--优秀机构  -->
			<div class="content_all">
				<div class="center_tabones">
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513161052281/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513161052281/zone">
										<p>税务人员</p>
									</a>
									<p>
										<span>邮箱：</span><span>admin@admin.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-05-11 10:36:29</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span>50</span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513161100659/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513161100659/zone">
										<p>admin2</p>
									</a>
									<p>
										<span>邮箱：</span><span>admin@admin.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-06-30 09:23:30</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span>40</span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513229800015/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513229800015/zone">
										<p>test2</p>
									</a>
									<p>
										<span>邮箱：</span><span>admin@admin.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 16:32:30</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513229839629/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513229839629/zone">
										<p>test3</p>
									</a>
									<p>
										<span>邮箱：</span><span>admin@admin.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 16:33:20</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513229858019/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513229858019/zone">
										<p>test4</p>
									</a>
									<p>
										<span>邮箱：</span><span>admin@admin.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 16:34:42</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513305598358/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513305598358/zone">
										<p>test8</p>
									</a>
									<p>
										<span>邮箱：</span><span>test8@163.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-04-21 11:39:05</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513589939694/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513589939694/zone">
										<p>guanli1</p>
									</a>
									<p>
										<span>邮箱：</span><span></span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 16:39:59</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513589960358/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513589960358/zone">
										<p>guanli2</p>
									</a>
									<p>
										<span>邮箱：</span><span></span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 16:40:23</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513590035842/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513590035842/zone">
										<p>guanli3</p>
									</a>
									<p>
										<span>邮箱：</span><span></span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 16:44:59</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1525851285503/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1525851285503/zone">
										<p>机构用户</p>
									</a>
									<p>
										<span>邮箱：</span><span></span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-05-11 10:34:24</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1525851340580/zone" style="color:#000;">
									
									     
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1525851340580/zone">
										<p>专家用户</p>
									</a>
									<p>
										<span>邮箱：</span><span></span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-05-11 10:32:39</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<!-- a -->
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
					<!--one end-->
				</div>
			</div>
				
			<!-- 机构vip -->
			<div class="content_vip">
				<span class="header_titles">实力排行榜</span>
				<div class="gary">
					<div class="pink"></div>
				</div>
				<div class="rankinglist">
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513161052281/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513161052281/zone" style="color:#000;">
									<span>用户名：税务人员</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名1</span>
								</div>
								<div>
									<span>总积分50</span>
								</div>
								<div>
									<span>回答数50</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513161100659/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513161100659/zone" style="color:#000;">
									<span>用户名：admin2</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名2</span>
								</div>
								<div>
									<span>总积分40</span>
								</div>
								<div>
									<span>回答数40</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1525851285503/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1525851285503/zone" style="color:#000;">
									<span>用户名：机构用户</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名3</span>
								</div>
								<div>
									<span>总积分0</span>
								</div>
								<div>
									<span>回答数0</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513590035842/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513590035842/zone" style="color:#000;">
									<span>用户名：guanli3</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名4</span>
								</div>
								<div>
									<span>总积分0</span>
								</div>
								<div>
									<span>回答数0</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513589960358/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513589960358/zone" style="color:#000;">
									<span>用户名：guanli2</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名5</span>
								</div>
								<div>
									<span>总积分0</span>
								</div>
								<div>
									<span>回答数0</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513589939694/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513589939694/zone" style="color:#000;">
									<span>用户名：guanli1</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名6</span>
								</div>
								<div>
									<span>总积分0</span>
								</div>
								<div>
									<span>回答数0</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513305598358/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513305598358/zone" style="color:#000;">
									<span>用户名：test8</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名7</span>
								</div>
								<div>
									<span>总积分0</span>
								</div>
								<div>
									<span>回答数0</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513229858019/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513229858019/zone" style="color:#000;">
									<span>用户名：test4</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名8</span>
								</div>
								<div>
									<span>总积分0</span>
								</div>
								<div>
									<span>回答数0</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513229839629/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513229839629/zone" style="color:#000;">
									<span>用户名：test3</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名9</span>
								</div>
								<div>
									<span>总积分0</span>
								</div>
								<div>
									<span>回答数0</span>
								</div>
							</div>
						</div>
					
						 
						<div class="paiming">
							<div class="touxiang">
								<a href="http://localhost:8080/Tax/users/user_1513229800015/zone">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
							</div>
							<div class="ecpert_center">
								<a href="http://localhost:8080/Tax/users/user_1513229800015/zone" style="color:#000;">
									<span>用户名：test2</span>
								</a>
							</div>
							<div class="zjf">
								<div>
									<span>排名10</span>
								</div>
								<div>
									<span>总积分0</span>
								</div>
								<div>
									<span>回答数0</span>
								</div>
							</div>
						</div>
					
				</div>
			</div>
			<!--机构答题-->
			<div class="center_last">
				<!-- 分页标题 start -->
				<div class="center_last_header">
					<span class="header_titles">答题动态</span>
				</div>
				<div id="exSharingContainer_org">
		    			<div class="exSharingContent answer">
		    				
		    			</div>
			    		<div id="exSharingPage_org" class="box"></div>
		    		</div>
			</div>
		</div>
			
		<!--优秀专家机构切换one  -->
		<div class="tab_accordance center">
			<!--优秀专家  -->
			<div class="content_all">
				<div class="center_tabones">
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/u0001/zone" style="color:#000;">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/u0001/zone">
										<p>管理员</p>
									</a>
									<p>
										<span>邮箱：</span><span>13366521793@qq.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-07-05 14:07:14</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span>89</span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>116</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513161147650/zone" style="color:#000;">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513161147650/zone">
										<p>admin3</p>
									</a>
									<p>
										<span>邮箱：</span><span>admin@admin.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-07-03 15:47:07</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span>4</span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513161184968/zone" style="color:#000;">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513161184968/zone">
										<p>admin4</p>
									</a>
									<p>
										<span>邮箱：</span><span>admin@admin.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-04-24 17:44:53</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span>3</span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513229299915/zone" style="color:#000;">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513229299915/zone">
										<p>admin9</p>
									</a>
									<p>
										<span>邮箱：</span><span>admin@admin.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-04-24 17:41:26</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513590215567/zone" style="color:#000;">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513590215567/zone">
										<p>李志</p>
									</a>
									<p>
										<span>邮箱：</span><span>16784987345@qq.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 17:25:55</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1513739346529/zone" style="color:#000;">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1513739346529/zone">
										<p>李志明</p>
									</a>
									<p>
										<span>邮箱：</span><span>1013829@qq.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 16:52:02</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
						<div class="center_first">
							<div class="first_header">
								<a href="http://localhost:8080/Tax/users/user_1515569063859/zone" style="color:#000;">
									
									    
									    
									        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
									    
									
								</a>
								<div class="first_content">
									<a href="http://localhost:8080/Tax/users/user_1515569063859/zone">
										<p>lee</p>
									</a>
									<p>
										<span>邮箱：</span><span>1138392902021@qq.com</span>
									</p>
									<p>
										<span>最近访问：</span><span>2018-03-26 17:01:07</span>
									</p>
								</div>
							</div>
							<div class="conter_center">
								<div class="zongjifen">
									<span>总积分：</span><span></span>
								</div>
								<div class="zongjifen">
									<span>回答数：</span><span>1</span>
								</div>
							</div>
							<div class="fasixin">
								<div class="letter">
									<a onclick="orginvite()" href=''>发私信</a>
								</div>
								<div class="invite">
									<a onclick="orginvite()" href=''>邀请回答</a>
								</div>
							</div>
						</div>
					
					<!--one end-->
				</div>
			</div>
				
				<!-- 专家 vip -->
				<div class="content_vip">
					<span class="header_titles">实力排行榜</span>
					<div class="gary">
						<div class="pink"></div>
					</div>
					<div class="rankinglist">
						
							
							<div class="paiming">
								<div class="touxiang">
									<a href="http://localhost:8080/Tax/users/u0001/zone">
										
										    
										    
										        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
										    
										
									</a>
								</div>
								<div class="paiming_first">
									<a href="http://localhost:8080/Tax/users/u0001/zone" style="color:#000!important;">
										用户名：管理员
									</a>
								</div>
								<div class="zjf">
									<div>
										<span>排名:1</span>
									</div>
									<div>
										<span>总积分:89</span>
									</div>
									<div>
										<span>回答数:89</span>
									</div>
								</div>
							</div>
						
							
							<div class="paiming">
								<div class="touxiang">
									<a href="http://localhost:8080/Tax/users/user_1513161147650/zone">
										
										    
										    
										        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
										    
										
									</a>
								</div>
								<div class="paiming_first">
									<a href="http://localhost:8080/Tax/users/user_1513161147650/zone" style="color:#000!important;">
										用户名：admin3
									</a>
								</div>
								<div class="zjf">
									<div>
										<span>排名:2</span>
									</div>
									<div>
										<span>总积分:4</span>
									</div>
									<div>
										<span>回答数:4</span>
									</div>
								</div>
							</div>
						
							
							<div class="paiming">
								<div class="touxiang">
									<a href="http://localhost:8080/Tax/users/user_1513161184968/zone">
										
										    
										    
										        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
										    
										
									</a>
								</div>
								<div class="paiming_first">
									<a href="http://localhost:8080/Tax/users/user_1513161184968/zone" style="color:#000!important;">
										用户名：admin4
									</a>
								</div>
								<div class="zjf">
									<div>
										<span>排名:3</span>
									</div>
									<div>
										<span>总积分:3</span>
									</div>
									<div>
										<span>回答数:3</span>
									</div>
								</div>
							</div>
						
							
							<div class="paiming">
								<div class="touxiang">
									<a href="http://localhost:8080/Tax/users/user_1513229299915/zone">
										
										    
										    
										        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
										    
										
									</a>
								</div>
								<div class="paiming_first">
									<a href="http://localhost:8080/Tax/users/user_1513229299915/zone" style="color:#000!important;">
										用户名：admin9
									</a>
								</div>
								<div class="zjf">
									<div>
										<span>排名:4</span>
									</div>
									<div>
										<span>总积分:0</span>
									</div>
									<div>
										<span>回答数:0</span>
									</div>
								</div>
							</div>
						
							
							<div class="paiming">
								<div class="touxiang">
									<a href="http://localhost:8080/Tax/users/user_1513590215567/zone">
										
										    
										    
										        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
										    
										
									</a>
								</div>
								<div class="paiming_first">
									<a href="http://localhost:8080/Tax/users/user_1513590215567/zone" style="color:#000!important;">
										用户名：李志
									</a>
								</div>
								<div class="zjf">
									<div>
										<span>排名:5</span>
									</div>
									<div>
										<span>总积分:0</span>
									</div>
									<div>
										<span>回答数:0</span>
									</div>
								</div>
							</div>
						
							
							<div class="paiming">
								<div class="touxiang">
									<a href="http://localhost:8080/Tax/users/user_1513739346529/zone">
										
										    
										    
										        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
										    
										
									</a>
								</div>
								<div class="paiming_first">
									<a href="http://localhost:8080/Tax/users/user_1513739346529/zone" style="color:#000!important;">
										用户名：李志明
									</a>
								</div>
								<div class="zjf">
									<div>
										<span>排名:6</span>
									</div>
									<div>
										<span>总积分:0</span>
									</div>
									<div>
										<span>回答数:0</span>
									</div>
								</div>
							</div>
						
							
							<div class="paiming">
								<div class="touxiang">
									<a href="http://localhost:8080/Tax/users/user_1515569063859/zone">
										
										    
										    
										        <img src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
										    
										
									</a>
								</div>
								<div class="paiming_first">
									<a href="http://localhost:8080/Tax/users/user_1515569063859/zone" style="color:#000!important;">
										用户名：lee
									</a>
								</div>
								<div class="zjf">
									<div>
										<span>排名:7</span>
									</div>
									<div>
										<span>总积分:0</span>
									</div>
									<div>
										<span>回答数:0</span>
									</div>
								</div>
							</div>
						
					</div>
				</div>
			
				<!--专家 答题-->
				<div class="center_last">
					<!-- 分页标题 start -->
					<div class="ex_main_left_content_header">
						<span class="header_titles">答题动态</span>
					</div>
						
					<div id="exSharingContainer">
		    			<div class="exSharingContent answer">
		    				
		    			</div>
			    		<div id="exSharingPage" class="box"></div>
			    	</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
	
	<script type="text/javascript">
		//点击专家认证按钮提示
		function userNotNull() {
			var userId='null';
			console.log(userId);
			if(userId=='null'){
				zeroModal.alert("请先登录用户");
				
			}else{
				window.location.href='http://localhost:8080/Tax/expertApply.jsp';
			}
		}
		
		//点击机构认证按钮提示
		function userNoLogin(){
			var userId='null';
			console.log(userId);
			if(userId=='null'){
				zeroModal.alert("请先登录用户");
			
			}else{
				window.location.href='http://localhost:8080/Tax/orgApply';
			}
		}

		//机构与专家tab切换
		var a= document.getElementsByClassName('tab_titles');
		var b= document.getElementsByClassName('tab_accordance');
		var c= document.getElementsByClassName('tab_main');
		var d= document.getElementsByClassName('expert_org_more');
		console.log(d);

		for(var i=0;i<a.length;i++) {
			a[i].index = i;
			a[i].onclick=function() {
				for (var j=0;j<a.length;j++) {
					a[j].className ="tab_titles";
					b[j].className ="tab_accordance";
					c[j].className ="tab_main intro";
					d[j].className ="mores expert_org_more"; 
				}
				a[this.index].className ="tab_titles active";
				b[this.index].className="tab_accordance center";
				c[this.index].className="tab_main";
				d[this.index].className="expert_org_more";
			}
		}
		
		//分页
		var expertCount =27;
		//专家分页
		var totalPages = Math.ceil(expertCount/10);
		$('#exSharingPage').paging({
	         initPageNo: 1, 							// 初始页码
	         totalPages: totalPages, 					// 总页数
	         totalCount: '合计 27条数据', 				// 条目总数
	         slideSpeed: 600, 							// 缓动速度。单位毫秒
	         jump: true, 								// 是否支持跳转
	         callback: function(page) { 				// 回调函数
        	 		$.get("http://localhost:8080/Tax/questions/latest", {
		            	page:page,
		            	rows:10,
		            	type: '1'
	            }, function(data) {
	            		var dataHTML = data.map(function(value, index, array) {
	            				var userAvatar;
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar">';
	            				} else {
	            					userAvatar = '<img  src="http://localhost:8080/Tax/resources/image/u2815.png"  alt="Avatar">';
	            				}
	            				var userHref='href="http://localhost:8080/Tax/users/'+value.userId+'/zone"';
			            		return	'<div class="uesr_message">' +
										'<div class="message_one">' +
											'<a href="http://localhost:8080/Tax/questions/'+value.id+'/details">' + value.content + '</a>' +
										'</div>' +
										'<div class="answer_message">' +
											'<a '+userHref+' style="color:#000;">'+userAvatar +'</a>'+
											'<a '+userHref+' style="color:#000;"><span>' + value.user.userName + '</span></a>' +	
											'<span>' + value.createdTime + '</span>' +
										'</div>' +	
									'</div>' ;
	            		});
	            		/* $("#latestQuesContainer>.quesContent").remove(); */
	            		$("#exSharingContainer>.exSharingContent").html(dataHTML.join(""));
     			});
         	}
     	});
	
		//机构分页
		var orgCount=27;
		var totalPages = Math.ceil(orgCount/10);
		$('#exSharingPage_org').paging({
	         initPageNo: 1, 							// 初始页码
	         totalPages: totalPages, 					//总页数
	         totalCount: '合计 27条数据', 				// 条目总数
	         slideSpeed: 600, 							// 缓动速度。单位毫秒
	         jump: true, 								//是否支持跳转
	         callback: function(page) { 				// 回调函数
        	 		$.get("http://localhost:8080/Tax/questions/latest", {
		            	page:page,
		            	rows:10,
		            	type: '2'
	            },function(data){
	            	console.log("数据格式-----",JSON.stringify(data));
	            		var dataHTML = data.map(function(value, index, array){
	            				console.log(value)
	            				var userAvatar;
	            				var id = value.id;
	            				var userHref=' href="http://localhost:8080/Tax/users/'+value.userId+'/zone"';
	            				console.log(userHref)
	            				if(value.user && value.user.avatar) {
	            					userAvatar = '<img src="file/showPicFile?fileId='+ value.user.avatar +'" alt="Avatar">';
	            				} else {
	            					userAvatar = '<img src="resources/image/u2815.png" alt="Avatar">';
	            				}
	            				
	            				var hrefs = 'href="http://localhost:8080/Tax/questions/'+id+'/details"';
	            				console.log(hrefs)
			            		return	'<div class="uesr_message">' +
										'<div class="message_one">' +
											'<a '+hrefs+'>' + value.content + '</a>' +
										'</div>' +
										'<div class="answer_message">' +
											'<a '+userHref+'  style="color:#000;width:40px;">'+userAvatar +'</a>'+
											'<a '+userHref+'  style="color:#000;"><span style="width:137px!important;display: inline-block!important;">' + value.user.userName + '</span></a>' +	
											'<span class="created_time">' + value.createdTime + '</span>' +
										'</div>' +	
									'</div>' ;
	            		});
	            		$("#exSharingContainer_org>.exSharingContent").html(dataHTML.join(""));
     			});
         	}
     	});
	</script>
	
	
		<script type="text/javascript">
			//点击邀请回答按钮提示
			function orginvite(){
				event.preventDefault();
				zeroModal.alert('请登陆用户!');
			}
		</script>
	
</body>
</html>