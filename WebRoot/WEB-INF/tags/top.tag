<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx"><%=request.getContextPath()%></c:set>
<style>
	ul{
		padding:0px;
		margin:0px;
	}

    .container{
    	width:1000px;
    	padding:0px;
    }

    #logo{
    	float: left;
    }
		
	.top-nav{
		height: 60px;
		line-height: 60px;
		background: #ffb238;
		color:#fff;
	}
		
	.top-nav ul{
		list-style: none;
		float: right;
		padding:0px;
	}
		
	.top-nav ul li{
		float: left;
	}
	
	.top-nav ul li a{ 
		color:#777;
		text-decoration: none;
		font-size:12px;
		padding:0px 6px;
		border-right:1px solid #fff;
	}
		
		.main-nav{
			height: 49px;
			line-height: 49px;
			background: #efefef;   
		}
		
		.main-nav ul{
			list-style: none;
			padding:0px;
		}
		
		.main-nav ul li{
			float: left;
			padding:0px 20px;
			text-align: center;
		}
		
		.main-nav ul li.active{
			background: #2f9623;
		}
		
		.main-nav ul li.category ,.main-nav ul li.category:hover{
			color:#fff;
			font-family: 'Microsoft Yahei';
			background: #2f9623;
			cursor: pointer;
		}
		
		.main-nav ul li:hover{
			background: #e5e6e6;
			
		}
		
		.main-nav ul li:hover a{
			color: #ffb238;
		}
		.main-nav ul li a{
			display: block;
			color:#727171;
			text-decoration: none;
		}
		
.wwwcategoryList {
		width: 260px;
		overflow: hidden;
		position: absolute;
		left:0px;
		z-index: 999;
		background: #fff;
		display: none;
		border:2px solid #ffb238;
}

.wwwcategoryList dl {
line-height: 16px;
padding-top: 10px;
border-top: 1px solid #c8c8c9;
border-bottom: none;
margin-top: 15px;
position: relative;
background: #fff;
}

.wwwcategoryList h3 {
padding: 0px 3px;
line-height: 20px;
font-size: 14px;
color: #ffb238;
background: #ffffff;
position: absolute;
left: 35px;
top: -10px;
}

.wwwcategoryList dl dt {
padding: 10px 0px 0px 37px;
font-size: 14px;
font-family: "Microsoft Yahei";
color: #A3A2A2;
}

.wwwcategoryList dl dd {
padding: 5px 0px 10px 30px;
border-bottom: 1px solid #c8c8c9;
}

.wwwcategoryList dl dd a.selectedtips:link, .wwwcategoryList dl dd a.selectedtips:visited, .categoryList dl dd a.selectedtips:hover, .categoryList dl dd a.selectedtips:active {
background: #e5e6e6;
color: #ffb238;
}

.wwwcategoryList dl dd a.selectedtips:link, .wwwcategoryList dl dd a.selectedtips:visited, .categoryList dl dd a.selectedtips:hover, .categoryList dl dd a.selectedtips:active {
background: #e5e6e6;
color: #ffb238;
}

.wwwcategoryList dl dd a:link, .wwwcategoryList dl dd a:visited {
color: #727171;
}

.wwwcategoryList dl dd a:link, .wwwcategoryList dl dd a:visited {
color: #727171;
}

.wwwcategoryList dl dd a {
display: inline-block;
padding: 0px 5px;
line-height: 20px;
font-size:12px;
}

dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, form, fieldset, legend, input, textarea, p, th, td {
margin: 0;
padding: 0;
}

.btn-yellow{
	background: #ffb238;
	color:#fff;
	border-color:#ffb238;
}
</style>

	<!-- begin顶部菜单 -->
	
	<nav class="top-nav">
         <div class="container">
         	<div style="float:left;width:200px;">
         		<a href="${ctx }/" style="color:#fff;text-decoration: none;font-size:28px;font-weight: bold;">洁衣库</a>
         	</div>
         	<ul class="clearfix;">
         		<c:choose>
      	<c:when test="${not empty customer}">
	 		<li class="dropdown menu">
			    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
			      ${customer.email } <span class="caret"></span>
			    </a>
			    <ul class="dropdown-menu">
			      <li style="float: none;"><a style="border-right:0px;height:30px;line-height: 30px;display: block;color:#000;" href="${ctx}/customer/customerManager">我的订单</a></li>
			      <li style="float: none;"><a style="border-right:0px;height:30px;line-height: 30px;display: block;color:#000;" href="#" id="logout_a">退出</a></li>
			    </ul>
			</li>	  
      	</c:when>
      	
      	<c:otherwise>
     		<li><a href="${ctx }/login" style="color:#fff;">登录</a></li>
         	<li><a href="${ctx }/register.html#注册" style="color:#fff;">注册</a></li>
	       <li><a href="${ctx }/admin/login.html" style="color:#fff;">管理</a></li>
      	</c:otherwise>
      	
      </c:choose>
         	</ul>
         </div>  
    </nav>
    <!-- end顶部菜单 -->
	
	
	
	
	<!-- end主导航 -->
	  
	
  
   
  
<script>
	
	//切换菜单样式
	$(".menu").each(function(){
		if($(this).data("url") == location.hash){
			$(this).addClass("current");
		}else{
			$(this).removeClass("current");
		}
		if(!location.hash){
			$(".home").addClass("current");
		}
	});
	
	 
	
	$("#logout_a").click(function(){
		$.get("${ctx}/customer/logout.do",function(data){
			window.location.href="${ctx}/";
		});
	});
	
 
</script>

<!-- <div style="margin-top:92px;"></div> -->
