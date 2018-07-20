<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>安徽省国家税务局税企互助交流平台</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/personCenter.css">
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/header.css"/>	
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/footer.css"/>
    <script src="http://localhost:8080/Tax/resources/js/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
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
    </style>
</head>

<body>
	<!-- header start -->
	<%@ include file="../header.jsp" %>
    <!-- header end -->

    <!-- content start -->
    <div class="liuan_content_main">
        <div class="liuan_content">
         <!-- 个人 start -->
        <div class="center_main">
        <!-- 个人 left -->
            <div class="center_left">
                <div class="center_left_header">
                    <div class="center_left_header_left">
                        <p>个人资料</p>
                        		<!-- 这里修改为user/edit.jsp -->
                        		<a href="http://localhost:8080/Tax/user/edit.jsp">编辑<img src="http://localhost:8080/Tax/resources/image/personmore.png"></a>
                        
                    </div>
                </div>
                <div class="center_left_content">
                    <div class="center_left_content_left">
                        
						    
						    
						    <a href="http://localhost:8080/Tax/users/edit">
						        <img id="avatarImgPersonalCenter" src="http://localhost:8080/Tax/resources/image/u2815.png" alt="Avatar">
						    	<script type="text/javascript">
						   			$(function(){
						   				initAvatarPersonnalCenter();
						   			})
						   			/**根据用户设置头像*/
									function initAvatarPersonnalCenter(){
										$('#avatarImgPersonalCenter').attr('src', 'http://localhost:8080/Tax/user/generateUserAvatar');
									}
						   		</script>
						    </a>
						    
						
                        <span></span>
                    </div>
                    <div class="center_left_content_right">
                        <ul>
                            <li><span>邮箱：</span><span>944841236@qq.com </span></li>
							<li><span>最近访问：</span><span>2018-07-16 09:05:07</span></li>
							
							<li style="height:100px;overflow: auto;text-overflow:ellipsis;">
								<span>专业：</span>														
							</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 个人 right -->
            <div class="center_left">
                <div class="center_left_header">
                    <div class="center_left_header_left">
                        <p>个人数据</p>
                    </div>
                </div>
                <div class="center_left_contentone">
                    <div class="center_left_content_right">
                        <div>
                            <span>总积分:</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100</span>
                        </div>
                        <div>
                            <span>提问数量:</span><span style="padding-right:30px">&nbsp;&nbsp;0</span>
						
                        </div>  
                        <div>
                            <span>回答数量:</span><span style="padding-right:30px">&nbsp;&nbsp;0</span>
						
                        </div>  
                    </div>
                </div>
            </div>
        </div>
        <!-- 个人 end -->
        
        <!-- tab切换list start -->
        <div class="content_wrap">
        <!-- 第一个表 start -->
					<div class="tab_a">
						<ul class="tabOneys" id="tabOne">
							<li class="active" style="width:23%;">
								<a>
									我的提问
								</a>
							</li>
							<!-- <span class="tab_a_span"></span> -->
							<li style="width:23%;">
								<a>
									我的回答
								</a>
							</li>
						</ul>
						<div class="more myQuesAndAnswer">
							<span class=""><a href="http://localhost:8080/Tax/question/myQuestions.jsp">更多</a></span>
							<span class="mores"><a href="http://localhost:8080/Tax/answer/myAnswers.jsp">更多</a></span>
						</div>
						<div class="gary">
							<div class="blue"></div>
						</div>
						<div class="tab_conOne">
							<div style="display: block;height:auto;overflow:hidden;" >
								
							</div>
							<div>
								
							</div>
						</div>
					</div>
					<!-- 第一个表 end -->

					<!-- 第二个表 start -->
					<div class="tab_a">
						<ul class="tabOneys" id="tabTwo">
							<li class="active" style="width:31%;">
								<a>
									我发出的邀请
								</a>
							</li>
							<!-- <span class="tab_a_span"></span> -->
							<li style="width:31%;">
								<a>								  
									我收到的邀请
								</a>
							</li>
						</ul>
						<div class="more myInviOutAndPut">
							<span class="">
								<a href="http://localhost:8080/Tax/invitation/myInvitationOut.jsp">更多</a>
							</span>
							<span class="mores">
								<a href="http://localhost:8080/Tax/invitation/myInvitationIn.jsp">更多</a>
							</span>
						</div>
						<div class="gary">
							<div class="blue"></div>
						</div>
						<div class="tab_conTwo">
							<!-- 我发出的邀请 -->
							<div style="display: block">
								
							</div>
							<!-- 我收到的邀请 -->
							<div>
								
							</div>
						</div>
					</div>
					<!-- 第二个表 end -->
				</div>
					<div class="wrap_three">
					<!-- 第三个表 start -->
					<div class="tab_a">
						<ul class="tabOneys" id="tabThree">
							<li class="active" >
								<a>
									我的解读和分享
								</a>
							</li>
							<!-- <span class="tab_a_span"></span> -->
							<li style="width:23%;">
								<a>
									我的收藏
								</a>
							</li>
						</ul>
						<div class="more myShareAndColl">
							<span class="">
								<a href="http://localhost:8080/Tax/post/myShare.jsp">更多</a>
							</span>
							<span class="mores">
								<a href="http://localhost:8080/Tax/report/myCollect.jsp">更多</a>
							</span>
						</div>
						<div class="gary">
							<div class="blue"></div>
						</div>
						<div class="tab_conThree  tab_confour">
								<div style="display: block">
									
								</div>
							<div>
								
							</div>
						</div>
					</div>
					<!-- 第三个表 end -->
																						
					<!-- 第四个表 start -->
				    <!-- 私信 -->
				    <!-- 只有当前用户登录才可看到自己的私信 -->
				 	
						<div class="tab_a">
							<ul class="tabOneys" id="tabFour">
								<li class="active" style="width:31%;">
									<a>
										我发出的私信				
									</a>
								</li>
								<li style="width:31%;">
									<a>
										我接收的私信
									</a>
								</li>
							</ul>
								
							<div class="more myLettOutAndPut">
								<span class=""><a href="http://localhost:8080/Tax/letter/myLetterOut.jsp">更多</a></span>
								<span class="mores"><a href="http://localhost:8080/Tax/letter/myLetterIn.jsp">更多</a></span>
							</div>
							<div class="gary">
								<div class="blue"></div>
							</div>
							<div class="tab_conFour tabconfour">
								<div style="display: block; height: 480px; overflow: hidden;">
									
								</div>
								<div style="display: none;">
									
								</div>
							</div>
						</div>
					
					
					<!-- 第四个表 end -->
        </div>
        <!-- tab切换list end -->
        </div>
    <!-- content end -->
    <!-- footer start -->
	<%@ include file="../footer.jsp" %>
    <!-- footer start -->
</div>
</div>
<script type="text/javascript"> 
				function current(){ 
				var d=new Date(),str=''; 
				str +=d.getFullYear()+'/'; //获取当前年份 
				str +=d.getMonth()+1+'/'; //获取当前月份（0——11） 
				str +=d.getDate()+' '; 
				str +=d.getHours()+':'; 
				str +=d.getMinutes()+':'; 
				str +=d.getSeconds()+''; 
				return str; } 
				setInterval(function(){$("#nowTime").html(current)},1000);
				
				$(function() {
					var $li = $('#tabOne li');
					var $ul = $('.tab_conOne div');
					var $span = $('.myQuesAndAnswer span');
					$li.click(function() {
						var $this = $(this);
						var $t = $this.index();
						$li.removeClass();
						$this.addClass('active')
						 .siblings().removeClass("active");
						$ul.css('display','none')
						$ul.eq($t).css('display', 'block');
						$span.css('display','none');
						$span.eq($t).css('display', 'block');
					});
				});
				$(function() {
					var $li = $('#tabTwo li');
					var $ul = $('.tab_conTwo div');
					var $span = $('.myInviOutAndPut span');
					$li.click(function() {
						var $this = $(this);
						var $t = $this.index();
						$li.removeClass();
						$this.addClass('active')
						 .siblings().removeClass("active");
						$ul.css('display','none')
						$ul.eq($t).css('display', 'block');
						$span.css('display','none');
						$span.eq($t).css('display', 'block');
					});
				});
				$(function() {
					var $li = $('#tabThree li');
					var $ul = $('.tab_conThree div');
					var $span = $('.myShareAndColl span');
					$li.click(function() {
						var $this = $(this);
						var $t = $this.index();
						$li.removeClass();
						$this.addClass('active')
						 .siblings().removeClass("active");
						$ul.css('display','none')
						$ul.eq($t).css('display', 'block');
						$span.css('display','none');
						$span.eq($t).css('display', 'block');
					});
				});
				$(function() {
					var $li = $('#tabFour li');
					var $ul = $('.tabconfour div');
					var $span = $('.myLettOutAndPut span');
					$li.click(function() {
						var $this = $(this);
						var $t = $this.index();
						$li.removeClass();
						$this.addClass('active')
						 .siblings().removeClass("active");
						$ul.css('display','none')
						$ul.eq($t).css('display', 'block');
						$span.css('display','none');
						$span.eq($t).css('display', 'block');
					});
				});
		</script>
</body>
</html>