<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx"><%=request.getContextPath()%></c:set>
<head>
	<script src="${ctx}/js/validation/validation.js"></script>
</head>
<style>
	.navbar {
        background: #ffb238;
        margin-bottom:0px;
	}
	
	.dropdown-menu li a{
		font-size:13px !important;
	}
	.menu a{
		color:#FFF;
		font-size:16px;
		font-family: 微软雅黑, 'Microsoft Yahei', 'Hiragino Sans GB', tahoma, arial, 宋体;
	}
	.menu a:hover,.menu a:focus{
		background-color:#FFF !important;
		color:#ffb238 !important;
		border-radius:3px;
	}
	
	.navbar .current>a{
		background-color:#FFF;
		color:#ffb238;
		font-weight: bold;
		border-radius:3px;
	}
	#logo a:hover{
		background: #FE7402;
	}
	
	fieldset{
		border:none;
	}
	
	fieldset:hover
	{
		border:none;
	}
	
	.del{
		color:#ffb238; 
	}
	
/* 	.navbar .nav > li .dropdown-menu { */
/* 	margin: 0; */
/* } */
/* .navbar .nav > li:hover .dropdown-menu { */
/* 	display: block; */
/* } */
	
</style>

<header class="navbar" style="border-radius:0px;" role="banner">
	  <div class="container">
	    <div class="navbar-header">
	      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
	        <span class="sr-only"></span>
	        <span class="icon-bar" style="background-color: #fff;"></span>
	        <span class="icon-bar" style="background-color: #fff;"></span>
	        <span class="icon-bar" style="background-color: #fff;"></span>
	      </button>
	      <a href="${ctx}/" class="navbar-brand"><span style="color:#fff;font-weight: bold;">洁衣库</span><span style="color:#fff;font-size:13px;"></span></a>
	    </div>
	    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
	      <ul class="nav navbar-nav">
	        	<li class="home menu"><a href="${ctx}/customer/customerManager">我的订单</a></li>
	 			<li class="dropdown menu">
			      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
					        账号信息<span class="caret"></span>
			      </a>
			      <ul class="dropdown-menu" role="menu">
			        <li><a href="${ctx}/customer/customerAccount">用户管理</a></li>
			        <li><a href="${ctx}/customer/customerAddr">地址管理</a></li>
			        <li><a href="${ctx}/customer/customerPassword">修改密码</a></li>
			        <li class="divider"></li>
			        <li><a href="#" id="logout_a">退出登录</a></li>
			      </ul>
			    </li>
	      </ul>
	    </nav>
	  </div>
	</header>
	
	<script>
		$(function(){
			
			$("#logout_a").click(function(){
				$.get("${ctx}/customer/logout.do",function(data){
					window.location.href = "${ctx}/";
				});
			});
			
			//突出当前菜单			
			if(window.location.href.indexOf("customerManager") != -1){
				$(".home").addClass("current");
			}else{
				$(".dropdown").addClass("current");
			}
		});
	</script>
