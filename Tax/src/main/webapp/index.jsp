<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>安徽省国家税务局税企互助交流平台</title>
	<meta name="viewport" content="width=device-width"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/index.css"/>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/Tax/resources/css/header/banner.css"/>
	<script type="text/javascript" src="http://localhost:8080/Tax/resources/easyui/jquery.min.js"></script>

  	<style>
  		#one{
	  		border-bottom: 1px solid #fff;
		    padding-bottom: 10px;
		    color: #fff;
		    display: inline-block;
		    width: 85%;
		    height: 65%;
  		}
  		#oneplus{
  			background:#1B55A9;
  		}
  	</style>
</head>
<body>
	<%@ include file="header.jsp" %>
		
	<!-- 首页轮播图 这个banner css有问题-->
    <div class="banner">
	   <div class="indexSearch">
			<a href="http://localhost:8080/Tax/questions/search">
				<img alt="" src="http://localhost:8080/Tax/resources/image/icon/fdj.png" class="fangdajing">
			</a>
			<form action="http://localhost:8080/Tax/questions/search">
				<input type="text" id="head_srarch" name="title" class="sousuo" value="搜索问题…"/>
			</form>
		</div>
   		<ul class="img clearfix">	  
   		 		
	    	<li><a href="#" class="" id="content" style="background: url(http://localhost:8080/Tax/resources/image/home/homepic3.png);background-size: 100% 100%;"></a></li>
	    	<li><a href="#" class="" id="content" style="background: url(http://localhost:8080/Tax/resources/image/home/homepic4.png);background-size: 100% 100%;"></a></li>

	 	</ul>
	  <ul class="num absolute"></ul>
	  	<div class="left btn">
	  		<img alt="" src="http://localhost:8080/Tax/resources/image/icon/left.png" style="width:65px;">
	  	</div>
		<div class="right btn">
			<img alt="" src="http://localhost:8080/Tax/resources/image/icon/right.png" style="width:65px;">
		</div>
		<div class="customer_service">
			<a href="http://localhost:8080/Tax/user/customer"   target="_blank"   class="luan_kefu">
				<img alt="" src="http://localhost:8080/Tax/resources/image/customer.png" style="width:100%;cursor:pointer;" />
			</a>
		</div>
    </div>

<!--banner end-->


<!-- 轮播图 -->
<script>
	//首页轮播 (进入首页的ready函数)
	$(function() {
		var size = $(".img li").length;
		for(var i = 1; i <= size; i++) {
			var li = "<li>" + i + "</li>";
			$(".num").append(li);
		}
		$(".img li").first().show();
		$(".num li").eq(0).addClass("active");
		$(".num li").mouseover(function() {
			$(this).addClass("active").siblings().removeClass("active");
			var index = $(this).index();
			i = index;
			$(".img li").eq(index).stop().fadeIn(300).siblings().stop().fadeOut(300);
		});
		var i = 0;
		var t = setInterval(move, 3000);

		function moveL() {
			i--;
			if(i == -1) {
				i = size - 1;
			}
			$(".num li").eq(i).addClass("active").siblings().removeClass("active");
			$(".img li").eq(i).fadeIn(300).siblings().fadeOut(300);
		}

		function move() {
			i++;
			if(i == size) {
				i = 0;
			}
			$(".num li").eq(i).addClass("active").siblings().removeClass("active");
			$(".img li").eq(i).fadeIn(300).siblings().fadeOut(300);
		}
		$(".banner .left").click(function() {
			moveL();
		});
		$(".banner .right").click(function() {
			move()
		});
		$(".banner").hover(function() {
			clearInterval(t)
		}, function() {
			t = setInterval(move, 3000);
		});
	});

	//点击按钮出现,另一个隐藏
	$(function() {
		$(".ct").click(function() {
			$(this).hide();
			$('.fa').hide();
			$(".pubu").show();
			$(".ll").show();
		});
		$(".ll").click(function() {
			$(this).hide();
			$('.fa').show();
			$('.ct').show();
			$(".pubu").hide();
		});

	});
</script>
<!-- 清除value -->
<script type="text/javascript">
	wap_val = [];
	$(".sousuo").each(function(i) {
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
</script>
 <%@ include file="footer.jsp" %>
</html>

