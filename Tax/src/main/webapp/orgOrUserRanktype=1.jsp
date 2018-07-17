<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta name="viewport" content="width=device-width"/>
  	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/query.css">
  	<link rel="stylesheet" href="http://localhost:8080/Tax/resources/css/paging.css">
  	<script type="text/javascript" src="http://localhost:8080/Tax/resources/easyui/jquery.min.js"></script>
  	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script> 	
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
	<!-- 头部标题start -->
	<%@ include file="header.jsp" %>
	<!-- 头部标题end -->
	<!-- 中间部分start -->
	<div class="content">
	<!-- path -->
		<div class="path_nav">
			<span class="fl">当前位置：<a href="http://localhost:8080/Tax/usersZone" class="nav_style">用户专区</a></span>
			<span class="fl">&gt;</span>
			<span class="fl"><a href="http://localhost:8080/Tax/orgOrUserRank?type" class="nav_style">更多</a></span>
		</div>
		<div class="content_main" style="min-height:900px;">
			<div class="liuan_center_search">			
				<form action="http://localhost:8080/Tax/orgOrUserRankQuery" >
					<div class="search">
						<div class="liuan_main_search">
							<input  placeholder="请输入您所需要的内容" name="userName"/>
							<input name="type" value="1" type="hidden"/>
							<button class="searchbtn"></button>
						</div>
					</div>
				</form>	
			</div>
			<div class="c_s_header">
				<div class="lists">
					<div id="exSharingContainer">
		    			<div class="exSharingContent">
		    				
						</div>
			    		<div id="exSharingPage" class="box"></div>
		    		</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部内容start -->
	<%@ include file="footer.jsp" %>
	<!-- 底部内容end -->
	<script type="text/javascript">
	var page = Math.ceil(7/10);
	var type = '1';
	var userName = '';
	console.log(userName);
	console.log("type="+type);
	 $('#exSharingPage').paging({
         initPageNo: 1, 							// 初始页码
         totalPages: page, 							// 总页数
         totalCount: '合计 7条数据', 			// 条目总数
         slideSpeed: 600, 							// 缓动速度。单位毫秒
         jump: true, 								// 是否支持跳转
         callback: function(page) { 				// 回调函数
        	 $.get("http://localhost:8080/Tax/usersRank", {
	            	page:page,
	            	rows:10,
	            	type:type,
	            	userName:userName
	            },function(data){
	            		console.log(data);
	            		var index=1;
	            		var dataHTML = data.map(function(value, index, array){  
	            			index++;
	            			var name = type==1?"专家名:":"机构名:";
	            			return '<ul class="clearfix expert_ul">' +
										'<li class="fl uesr_paihang">NO.'+index+'</li>' +
										'<li class="org_name fl"=""><a href="http://localhost:8080/Tax/users/'+value.userId+'/zone">'+name+''+value.userName+'</a></li>' +
										'<li class="jifen fl">积分:'+value.score+'</li>' +
									'</ul>';
	            		});
	            		console.log(dataHTML);
	            		/* $("#latestQuesContainer>.quesContent").remove(); */
	            		$("#exSharingContainer>.exSharingContent").html(dataHTML.join(""));
     			});
         }
     });
	 jQuery(function(){  
		  	$('#nextPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		  	$('#prePage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('#firstPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('#lastPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.sel-page').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.selpage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.jump-button').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.turnPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.last-page').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 });
	</script>
</body>
</html>