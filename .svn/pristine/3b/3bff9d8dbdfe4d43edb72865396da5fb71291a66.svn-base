<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<body>

	<tags:customerTop/>
	<div class="container" id="main_container">		
	
			<ol class="breadcrumb" style="margin-top:20px;">
			  <li><a href="${ctx }" style="color:#ffb238;">首页</a></li>
			  <li class="active">账号信息</li>
			  <li class="active">用户管理</li>
			</ol>
			
		
		<div class="row">
		    <div class="col-md-8">
		    	<form class="form-horizontal" id="register_form" role="form">
		    	  <input type="hidden" name="id" value="${customer.id}"/>
				  <div class="form-group">
				    <label for="email" class="col-sm-2 control-label"><span class="noempty">*</span>邮箱</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control required useTitle validate-email ajax" validate-email-title="请输入有效的邮箱" required-title="邮箱不能为空" name="email" value="${customer.email }" id="email"/>
				    </div>
				  </div> 
				  
				  <div class="form-group">
				    <label for="mobile" class="col-sm-2 control-label"><span class="noempty">*</span>手机号码</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control required useTitle validate-mobile-phone" validate-mobile-phone-title="请输入有效的手机号码" required-title="手机号码不能为空" value="${customer.mobile}"  name="mobile" id="mobile"/>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="mobile" class="col-sm-2 control-label">昵称</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control useTitle max-length-20" max-length-title="不能超过20个字符" name="nickname" id="nickname" value="${customer.nickname }"/>
				    </div>
				  </div>
				  
				
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-7">
				      <button type="button" id="register_btn" class="btn btn-buy">修改用户信息</button>
				    </div>
				  </div>
				 
			</form>	
		</div>
		
   </div>
 </div>			
	

<tags:bottom/>

<script>
	$(function(){
		
		var valid = new jValidation.Validation('register_form', {
			immediate : true,
			onElementValidateForAjax : function(elm) {
				if ($(elm).attr("id") == 'email') {
					var username = $(elm).val();
					return validateUsername(username);
				}
			}
		});
		
		function validateUsername(username) {
			var result = new jValidation.ajax.Result();
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : '${ctx}/customer/validateUsername.do',
				dataType : 'json',
				async : false,
				data : {
					username : username
				},
				success : function(data) {
					if (!data.result) {
						//如果用户名和目前一致验证通过
						if(username == "${customer.email}"){
							result.setResult(true);	
						}else{
							result.setResult(false);
							result.setErrorMsg(data.errorMsg);	
						}
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
		
		
		$("#register_btn").click(function(){
			if(!valid.validate()){
				return false;
			}
			var postData = $("#register_form").serialize();

			$.ajax({
				type : "POST",
				url : "${ctx}/customer/edit.do",
				data : postData,
				dataType : "json",
				success : function(data) {
					if (data.result) {
						alert("修改信息成功，请重新登录！")
						window.location.replace("${ctx}/login");
					} else {
						alert("系统繁忙，请您稍后再试！");
					}
				},
				error : function(data) {
					alert("系统繁忙，请您稍后再试！");
				}
			});
		});
		
		
	});
</script>
	
</body>