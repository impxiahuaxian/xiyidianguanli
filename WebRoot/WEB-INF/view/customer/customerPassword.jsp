<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<body>

	<tags:customerTop/>
	<div class="container" id="main_container">		
	
			<ol class="breadcrumb" style="margin-top:20px;">
			  <li><a href="${ctx }" style="color:#ffb238;">首页</a></li>
			  <li class="active">账号信息</li>
			  <li class="active">修改密码</li>
			</ol>
			
			<div class="row">
		    <div class="col-md-8">
		    	<form class="form-horizontal" id="register_form" role="form">
				  
			
				  <div class="form-group">
				    <label for="password" class="col-sm-2 control-label"><span class="noempty">*</span>原密码</label>
				    <div class="col-sm-7">
				      <input type="password" name="password" maxlength="16"  class="form-control required useTitle min-length-6 max-length-16 ajax" required-title="密码不能为空" min-length-title="密码由6到16位的字符组成" max-length-title="密码由6到16位的字符组成" id="password"/>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="password" class="col-sm-2 control-label"><span class="noempty">*</span>新密码</label>
				    <div class="col-sm-7">
				      <input type="password" name="password" maxlength="16"  class="form-control required useTitle min-length-6 max-length-16" required-title="密码不能为空" min-length-title="密码由6到16位的字符组成" max-length-title="密码由6到16位的字符组成" id="newpassword"/>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="password" class="col-sm-2 control-label"><span class="noempty">*</span>确认新密码</label>
				    <div class="col-sm-7">
				      <input type="password" name="password" maxlength="16"  class="form-control required useTitle min-length-6 max-length-16 equals-newpassword" required-title="密码不能为空" min-length-title="密码由6到16位的字符组成" max-length-title="密码由6到16位的字符组成" id="confirmpassword"/>
				    </div>
				  </div>
				    
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-7">
				      <button type="button" id="login_btn" class="btn btn-buy">修改密码</button>
				    </div>
				  </div>
				
			</form>		
		</div>
	</div>
			
	</div>
	
	<script>
		$(function(){
			
			var valid = new jValidation.Validation('register_form', {
				immediate : true,
				onElementValidateForAjax : function(elm) {
					if ($(elm).attr("id") == 'password') {
						var password = $("#password").val();
						return validatePassword(password);
					}
				}
				
			});
			
			function validatePassword(password) {
				var result = new jValidation.ajax.Result();
				jQuery.ajax({
					type : 'Get',
					contentType : 'application/json',
					url : '${ctx}/customer/validatePassword.do',
					dataType : 'json',
					async : false,
					data : {
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
			
			$("#login_btn").click(function(){
				if(!valid.validate()){
					return false;
				}
				
				jQuery.ajax({
					type : 'Get',
					contentType : 'application/json',
					url : '${ctx}/customer/editPassword.do',
					dataType : 'json',
					async : false,
					data : {
						newPassword:$("#newpassword").val()
					},
					success : function(data) {
						if (data.result) {
							alert("修改密码成功！");
						}
					}
				});
				
				return false;
			});
			
			
		});
	</script>
	
</body>