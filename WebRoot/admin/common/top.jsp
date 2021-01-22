<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<c:set var="ctx"><%=request.getContextPath()%></c:set>
<style type="text/css">
	li.no_click {
		margin-top: 10px;
		height: 37px;
		width: 169px;
		list-style-type: none;
		text-indent: 38px;
		font-size: 14px;
		margin: 0;
		border-bottom: 1px solid #E3EAF0;
		line-height: 37px;
	}
	
	li.current {
		background: url("../images/spit_back.png") no-repeat scroll 0 0
			transparent;
		border-bottom: medium none;
		list-style-type: none;
		height: 37px;
		width: 169px;
		text-indent: 38px;
		font-size: 14px;
		margin: 0;
		border-bottom: 1px solid #E3EAF0;
		line-height: 37px;
		color: #white;
	}
	
	ul {
		margin: 0;
		padding: 0;
	}
	
	a:link {
		text-decoration: none;
	}
	
	a:visited {
		text-decoration: none;
	}
	
	a:hover {
		text-decoration: none;
	}
	
	a:active {
		text-decoration: none;
	}
}
</style>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="container">
	  <div class="navbar-header">
	   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	      <span class="sr-only">Toggle navigation</span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </button>
	    <a class="navbar-brand" href="#">后台管理</a>    
	  </div> 
	
	  <!-- Collect the nav links, forms, and other content for toggling --> 
	  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    <ul class="nav navbar-nav"> 
	      <li class="home menu" data-url="#chothesManager"><a href="${ctx }/admin/index.jsp#chothesManager" >衣服管理</a></li>
	      <li class="menu" data-url="#orderManager"><a href="${ctx }/admin/orderList.jsp#orderManager" >订单管理</a></li>
	       <li class="menu" data-url="#vipTypeManager"><a href="${ctx }/admin/vipTypeList.jsp#vipTypeManager" >vip管理</a></li>
	       <li class="menu" data-url="#customerManager"><a href="${ctx }/admin/customerList.jsp#customerManager" >会员管理</a></li>
	       
	    </ul>
	   
	    <ul class="nav navbar-nav navbar-right">
	      <li class="dropdown">
	        <a href="#" class="dropdown-toggle"  data-toggle="dropdown">系统管理<b class="caret"></b></a>
	        <ul class="dropdown-menu">
	        	<li><a href="${ctx }/" target="_blank" id="" >前台下单页</a></li>
	          <li><a href="#" id="a_logout" >退出登录</a></li>
	        </ul>
	      </li>
	    </ul>
	  </div><!-- /.navbar-collapse -->
  </div>
</nav>

<div style="margin-top:120px;">

</div>

<div id="back-to-top" style="position: fixed;bottom:40px;right:10px;display: none;z-index: 9999;">
	<a href="#" class="btn btn-primary"><span class="glyphicon glyphicon-arrow-up"></span></a>
</div>

	<script>
		$(function(){
			//切换菜单样式
			var isKuaijie = true;
			$(".menu").each(function(){
				$(this).removeClass("active");
				if($(this).data("url") == location.hash){
					$(this).addClass("active");
					isKuaijie = false;
				}
				if(!location.hash){
					$(".home").addClass("active");
					isKuaijie = false;
				}
			});
			
			if(isKuaijie){
				$(".kuaijie").addClass("active");
			}
			
			
			if("${user.status}" == 1){
				$(".nav-li").each(function(){
					$(this).show();
				});
				
			}
			$(".nav-li").each(function(){
				
				$(this).click(function(){
					$(".active").removeClass("active");
					$(this).addClass("active");
				});
			});
			//退出系统
			$('#a_logout').click(
				function(){
					if(!confirm("确定要退出系统!")){
						return;
					}
					jQuery.ajax({
						type : 'Get',
						contentType : 'application/json',
						url : '../admin/login/logout.do', 
						dataType : 'json',
						success : function(obj) {
							if (obj.result)
								location.href = "./login.html";
						},
						error : function(data) {
							
						}
					});
				}		
			);
		});
		
		$(document).ready(function(){
		    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
		    $(function () {
		    $(window).scroll(function(){
		    if ($(window).scrollTop()>100){
		    $("#back-to-top").fadeIn(500);
		    }
		    else
		    {
		    $("#back-to-top").fadeOut(500);
		    }
		    });
		    //当点击跳转链接后，回到页面顶部位置
		    $("#back-to-top").click(function(){
		    $('body,html').animate({scrollTop:0},100);
		    return false;
		    });
		    });
		    });
	</script>
	

</body>
</html>