<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./header.jsp" %>
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
      <a href="${ctx}" class="navbar-brand"><img src="${ctx}/images/logo-inver.png" style="width:150px;height:20px;"/></a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
    
      <ul class="nav navbar-nav navbar-right">
      	<li class="menu">
          <a href="${ctx}/login">登录</a>
        </li>
        
        <li class="menu">
          <a href="${ctx}">洁衣库首页</a>
        </li>
        
        <li class="menu">
          <a href="${ctx}/about">关于我们</a>
        </li>
     
      </ul>
    </nav>
  </div>
</header>
	
    <div class="container" style="margin-top:20px;">
    
    <c:if test="${result }">
    	
    </c:if>
    
    <c:choose>
    	<c:when test="${result }">
    		您的账户已经激活成功！
    	</c:when>
    	<c:otherwise>
    		激活失败！
    	</c:otherwise>
    </c:choose>
    	
	</div>
		
		
   </div>
	<tags:bottom/>
	
	
</body>