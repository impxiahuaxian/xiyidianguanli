<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./header.jsp" %>

<head>
	 
	
</head>

<body class="">
	
	<tags:top/>
	
	<div style="widht:100%;height:900px;background: url('${ctx}/images/wash-bg.jpg');position:relative;">   
		<a href="${ctx }/order" class="btn btn-default btn-lg btn-yellow" id="add_clothes_id" style="position: absolute;left:50%;top:20%;margin-left:-150px;width:300px;height:60px;font-size:26px;">我要洗衣</a>
	</div>
	
	
	 <!-- Modal -->
<div class="modal fade" id="login_modal_id" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="margin-top:100px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">您尚未登录
        </h4>
      </div>
      <div class="modal-body">
        <div class="bs-example bs-example-tabs">
				      <ul id="myTab" class="nav nav-tabs">
				        <li class="active"><a href="#profile" data-toggle="tab">登录</a></li>
				        <li class=""><a href="#dropdown1" data-toggle="tab">注册</a></li>
				      </ul>
				      <div id="myTabContent" class="tab-content">
				        <div class="tab-pane fade active in" id="profile">
				          	<form role="form" id="login_form" style="padding-top:20px;">
							  <div class="form-group">
							    <label for="exampleInputEmail1">邮箱地址：</label>
							    <input type="text" name="email" class="form-control required useTitle validate-email" required-title="请输入用户名" id="email_login" placeholder="请输入邮箱">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">密码：</label>
							    <input type="password" name="password" class="form-control required useTitle min-length-6 max-length-16 ajax" maxlength="16" required-title="密码不能为空" min-length-title="密码由6到16位的字符组成" max-length-title="密码由6到16位的字符组成" id="password"/>
							  </div>
							   
							  <button type="submit" id="login_btn" class="btn btn-buy  btn-block" style="height:38px;">登录</button>
							  
<!-- 							   <div style="margin-top:5px;font-size:12px;"> -->
<%-- 							   		我不想登录<a style="color:#2DB8AD;" href="${ctx}/settlement">直接购买</a> --%>
<!-- 							   </div> -->
							</form>
				        </div>
				        <div class="tab-pane fade" id="dropdown1">
				          <form role="form" id="register_form" style="padding-top:20px;">
							  <div class="form-group">
							    <label for="exampleInputEmail1">电子邮箱：</label> 
							    <input type="text" name="email" class="form-control required useTitle validate-email ajax" required-title="请输入有效的电子邮箱" id="email_reg" placeholder="请输入电子邮箱作为账户名">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">密码：</label>
							    <input type="password" name="password" class="form-control required useTitle min-length-6 max-length-16" maxlength="16" required-title="密码不能为空" min-length-title="密码由6到16位的字符组成" max-length-title="密码由6到16位的字符组成" id="reg_password"/>
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputPassword1">确认密码：</label>
							    <input type="password" name="confirmpassword" class="form-control required equals-reg_password useTitle min-length-6 max-length-16" maxlength="16" required-title="密码不能为空" min-length-title="密码由6到16位的字符组成" max-length-title="密码由6到16位的字符组成" id="confirmpassword"/>
							  </div>
							  
							   <div class="checkbox">
								    <label style="font-size:12px;">
								      <input type="checkbox" id="agree_ment_id"> 我已阅读并同意《<a style="color:#ffb238;" href="${ctx }/agreement" target="_blank">洁衣库用户注册协议</a>》
								    </label>
							   </div>
							  <button type="submit" id="register_btn" disabled="disabled" class="disabled btn btn-buy  btn-block" style="height:38px;">立即注册</button>
							  
<!-- 							   <div style="margin-top:5px;font-size:12px;"> -->
<%-- 							   		我不想注册<a style="color:#2DB8AD;" href="${ctx}/settlement">直接购买</a> --%>
<!-- 							   </div> -->
							</form>
				        </div>
				      </div>
			    </div>
 
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	<script>
	
	//立即登录click事件
	$("#add_clothes_id").click(function(){
		if("${customer}"){
			window.location.href = "${ctx}/order";
		}else{
			$('#login_modal_id').modal();
		}
		return false;
	});
	
	//同意协议复选框绑定事件
	$("#agree_ment_id").click(function(){
		
		if($(this).prop("checked")){
			$("#register_btn").removeClass("disabled").prop("disabled",false);
		}else{
			$("#register_btn").addClass("disabled").prop("disabled",true);
		}
	});
	

	var validLogin = new jValidation.Validation('login_form', {
		immediate : true,
		onElementValidateForAjax : function(elm) {
			if ($(elm).attr("id") == 'password') {
				var password = $("#password").val();
				var username = $("#email_login").val();
				return validateUser(username,password);
			}
		}
		
	});
	
	var validReg = new jValidation.Validation('register_form', {
		immediate : true,
		onElementValidateForAjax : function(elm) {
			if ($(elm).attr("id") == 'email_reg') {
				var username = $(elm).val();
				return validateUsername(username);
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
		if(!validLogin.validate()){
			return false;
		} 
		window.location.href = "${ctx}/order"; 
		return false; 
	});
	
	$("#register_btn").click(function(){
		if(!validReg.validate()){
			return false;
		}
		
		var postData = $("#register_form").serialize();

		$.ajax({
			type : "POST",
			url : "${ctx}/customer/add.do",
			data : postData,
			dataType : "json",
			success : function(data) {
				if (data.result) {
					window.location.href = "${ctx}/login";
				} else {
					alert("系统繁忙，请您稍后再试！");
					return false;
				}
			},
			error : function(data) {
				alert("系统繁忙，请您稍后再试！");
				return false;
			}
		});
		return false;
	});
	
	</script>
	
</body>