<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./header.jsp" %>
<c:set var="ctx"><%=request.getContextPath()%></c:set>
<head>
	<script src="${ctx}/js/validation/validation.js"></script>
	<style>
	.control-label{
		font-weight: normal;
	}
		
		
	.navbar {
        background: #FFF;
        border-radius:3px;
        padding-top:11px;
        padding-bottom:11px;
        margin-bottom:0px;
        border-bottom:1px solid #ccc;
	}
	.menu a{
		color:#666;
		font-size:12px;
	}
	.menu a:hover{
		text-decoration: underline !important;
	}
	
	#regist-process{
		position: relative;
	}
	#regist-process-bar{
		background: url("./images/regist-process.png") 0 -35px no-repeat;
		width:780px;
		height:36px;
		margin-bottom:90px;
	}
	
	#regist-process-step1 {
		position: absolute;
		top: 46px;
		left: 107px;
		color:#626262;
	}
	
	#regist-process-step2 {
		position: absolute;
		top: 46px;
		left: 352px;
		color:#999;
	}
	
	#regist-process-step3 {
		position: absolute;
		top: 46px;
		left: 611px;
		color:#999;
	}
	
</style>
</head>

<body>
	<header class="navbar" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="${ctx }/" class="navbar-brand"><a href="./" class="navbar-brand"><span style="color:#ffb238;font-weight: bold;">洁衣库</span><span style="color:#ffb238;font-size:13px;"></span></a></a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
    
      <ul class="nav navbar-nav navbar-right">
      	<li class="menu">
          <a href="${ctx }/login">登录</a>
        </li>
        
        <li class="menu">
          <a href="${ctx }/">洁衣库首页</a>
        </li>
        
      </ul>    
    </nav>
  </div>
</header>
	
    <div class="container" style="margin-top:20px;">
    
		<div class="row">
					<div class="col-sm-6 col-md-6">
						<span class="glyphicon glyphicon-ok" style="color:#7ABD54;font-size:36px"></span>
						<span style="color:#7ABD54;font-size:24px;margin-left:15px;">恭喜您注册成功！</span>
					</div>
					
					<div class="col-sm-7 col-md-5">
						<a type="button" id="register_btn" class="btn btn-lg btn-buy" href="${ctx }/login" style="font-weight:bold;">马上登录</a>
					</div>
					
		</div>	
			
	</div>
		
		
   </div>
	<tags:bottom/>
	
</body>