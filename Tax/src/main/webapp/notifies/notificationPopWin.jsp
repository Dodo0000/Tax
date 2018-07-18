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
  	<link rel="icon" href="http://localhost:8080/Tax/resources/image/home/favicon.gif" type="image/x-icon" />
  	<script type="text/javascript" src="http://localhost:8080/Tax/resources/easyui/jquery.min.js"></script>
  	<script src="http://localhost:8080/Tax/resources/js/paging.js" type="text/javascript" charset="utf-8"></script>
</head>
<style type="text/css">
	.liuan_main {
		flex: 1;
		background:#fff;
	}
	
	.liuan_footers {
		margin: 0;
		margin-top:0!important;
	}
	body{
		display: flex;
		flex-flow: column;
		min-height: 100vh;
	}
	.state{
	    width: 70px;
	    float: left;
	    margin-left: 30px;
	}
	.question_title{
	    width: 270px;
	    float: left;
	}
	.question_content{
	    float: left;
	    width: 340px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	   	white-space: nowrap;
	   	text-align:left;
	   	margin-left: 75px;
	}
	.uesr_paihang{
	    width: 140px;
	    text-align: left;
	    margin-left: 101px;
	}
	.expert_ul{
		 float:none!important;
	}
	.box_send_message{
		margin:20px 140px!important;
		padding-bottom:40px!important;
		width:950px;
	}
</style>
<body>
	<!-- 头部标题start -->
	<%@ include file="../header.jsp" %>
	<!-- 头部标题end -->
	<!-- 中间部分start -->
	<div class="content" style="min-height:900px;">
		<div class="content_main">
			<div class="all_message clearfix">
				<span class="fl">所有通知</span>
				<button id="emptyId" class="fr" onclick="empty()">清空</button>
			</div>
			<div class="c_s_header">
				<div class="lists">
					<div id="exSharingContainer">
		    			<div class="exSharingContent clearfix">
		    				
						</div>
			    		<div id="directPage" class="box box_send_message"></div>
		    		</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部内容start -->
	<%@ include file="../footer.jsp" %>
	<!-- 底部内容end -->
	<script type="text/javascript">
	var page = Math.ceil(0/10);
	console.log(page)
	 $('#directPage').paging({
         initPageNo: 1, 							// 初始页码
         totalPages: page, 							// 总页数
         totalCount: '合计 0条数据', 			// 条目总数
         slideSpeed: 600, 							// 缓动速度。单位毫秒
         jump: true, 								// 是否支持跳转
         callback: function(page) { 				// 回调函数
        	 $.get("http://localhost:8080/Tax/notifies/all", {
	            	page:page,
	            	rows:10,
	            	pagingOrNot:'paging'
	            },function(data){
	            		console.log(data);
	            		var dataHTML = data.map(function(value, index, array){
	            			var type = value.type;
	            			var contents;
	            			var hrefs;
	            			var readOrUnread = value.readOrUnread;
	            			var state = readOrUnread == 0 ?"未读":"已读";
	            			if(type=='answer'){
	            				contents = value.titleAndId.title;
	            				hrefs = "href='http://localhost:8080/Tax/questions/"+value.titleAndId.id+"/details'";
	            			}
	            			if(type=='invitationAnswer'){
	            				contents = value.titleAndId.title;
	            				hrefs = "href='http://localhost:8080/Tax/questions/"+value.titleAndId.id+"/details'";
	            			}
	            			if(type=='letter'){
	            				contents = value.titleAndId.content;
	            				hrefs = "href='http://localhost:8080/Tax/letter/"+value.titleAndId.id+"/details'";
	            			}
	            			var id = value.id;
	            			return '<ul class="clearfix expert_ul">' +
	            						'<li class="state">'+state+'</li>'+
										'<li class="fl uesr_paihang">'+value.trigger.userName+'</li>' +
										'<li class="question_title">'+value.action+'</li>'+
										'<li class="question_content"><a '+hrefs+' userId='+id+' onclick="changeState(this)" >'+contents+'</a></li>'+
									'</ul>';
	            		});
	            		//console.log(dataHTML);
	            		/* $("#latestQuesContainer>.quesContent").remove(); */
	            		$("#exSharingContainer>.exSharingContent").html(dataHTML.join(""));
     			});
         }
     });
	//改变状态
	function changeState(id){
		var url = "http://localhost:8080/Tax/notifies/updateState";
		var notificationId = id.getAttribute("userId");
		var param = {
			id : notificationId
		};
		$.get(url,param,function(result){
			console.log(result);
		})
	}
	//清空
	function empty(){
		var url = "http://localhost:8080/Tax/notifies/clear";
		$.post(url,function(result){
			console.log(result);
			history.go(0);
		})
	};
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