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
	
	
	
	
	
</style>
</head>

<body>
	<header class="navbar" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only"></span>
         <span class="icon-bar" style="background-color: #000;"></span>
        <span class="icon-bar" style="background-color: #000;"></span>
        <span class="icon-bar" style="background-color: #000;"></span>
      </button>
      <a href="${ctx }/" class="navbar-brand"><span style="color:#ffb238;font-weight: bold;">洁衣库</span><span style="color:#ffb238;font-size:13px;"></span></a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
    
      <ul class="nav navbar-nav navbar-right">
      	<li class="menu">
          <a href="${ctx }/register">注册</a>
        </li>
        
        <li class="menu">
          <a href="${ctx}/">洁衣库首页</a>
        </li>
        
     
      </ul>
    </nav>
  </div>
</header>
	
    <div class="container" style="margin-top:20px;">
		
		<div class="row">
		    <div class="col-md-6">
		    	<form class="form-horizontal" id="register_form" role="form">
				  <div class="form-group">
				    <label for="email" class="col-sm-2 control-label"><span class="noempty">*</span>邮箱</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control required useTitle validate-email" validate-email-title="请输入有效的邮箱" required-title="邮箱不能为空" name="email" id="email"/>
				    </div>
				  </div> 
			
				  <div class="form-group">
				    <label for="password" class="col-sm-2 control-label"><span class="noempty">*</span>密码</label>
				    <div class="col-sm-7">
				      <input type="password" name="password" maxlength="16"  class="form-control required useTitle min-length-6 max-length-16 ajax" required-title="密码不能为空" min-length-title="密码由6到16位的字符组成" max-length-title="密码由6到16位的字符组成" id="password"/>
				    </div>
				  </div>
				    
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-7">
				      <button type="button" id="login_btn" class="btn btn-lg btn-buy btn-block">登录</button>
				    </div>
				  </div>
				  
				  	<div class="form-group">
					    <label class="col-sm-2 control-label"></label>
					    <div class="col-sm-10">
					      <p class="form-control-static" style="font-size:12px;">还没有账号，<a style="color:#ffb238;" href="${ctx }/register">10秒立即注册</a></p>
					    </div>
				</div>
				
			</form>	
		</div>
		
	    <div class="col-md-6">
			洁衣库
			金牌服务，让您省心更安心！
			
			</br>
			</br>
			注册成功：
			</br>
			1、可查看订单状态
			</br>
			2、可实时关注最新促销活动
		</div>
	</div>
		
		
   </div>
	<tags:bottom/>
	<script>
		$(function(){
			
			var valid = new jValidation.Validation('register_form', {
				immediate : true,
				onElementValidateForAjax : function(elm) {
					if ($(elm).attr("id") == 'password') {
						var password = $("#password").val();
						var username = $("#email").val();
						return validateUser(username,password);
					}
				}
				
			});
			
			function validateUser(username,password) {
				var result = new jValidation.ajax.Result();
				jQuery.ajax({
					type : 'Get',
					contentType : 'application/json',
					url : '${ctx}/customer/validate.do',
					dataType : 'json',
					async : false,
					data : {
						username : username,
						password:password
					},
					success : function(data) {
						if (!data.result) {
							result.setResult(false);
							result.setErrorMsg(data.errorMsg);
						} else {
							result.setResult(true);
						}
					},
					error : function(data) {
						result.setResult(false);
						result.setErrorMsg("服务器繁忙，请您稍后再试！");
					}
				});
				return result;

			}
			
			$('#email,#password').bind('keypress',function(event){
	            if(event.keyCode == "13")    
	            {
	            	$("#login_btn").trigger("click");
	            	return false;
	            }
	        });
			
			$("#login_btn").click(function(){
				if(!valid.validate()){
					return false;
				}
				window.location.href = "${ctx}/";
			});
		});
	</script>
	
</body>