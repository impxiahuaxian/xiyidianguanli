<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./common/header.jsp" %>
<body>
<%@ include file="./common/top.jsp"%>
<div class="container"  id="mainContainer">
	<form class="form-horizontal" role="form" id="obj_form_id" name="obj_form" style="margin-top:20px;">
		  <input type="hidden" id="id_id" name="id"/>
		  
		    <div class="form-group">
		    <label for="" class="col-sm-2 control-label">订单号</label>
		    <div class="col-xs-3">
		      <input name="outerid" type="text" id="outerid_id" class="form-control disabled" readonly="readonly">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">订单总价格</label>
		    <div class="col-xs-3">
  				<input name="totalPrice" id="totalPrice_id" type="text" validate-number-title="请输入数字" required-title="请输入价格" maxlength="4" class="form-control required useTitle validate-number"/>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="" class="col-sm-2 control-label">收货人</label>
		    <div class="col-xs-3">
			  <input name="name" id="name_id" type="text" required-title="请输入收货人"  class="form-control required useTitle" />
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="" class="col-sm-2 control-label">手机</label>
		    <div class="col-xs-3">
			  <input type="text" name="mobile" id="mobile_id" required-title="请输入手机号码" validate-mobile-phone-title="手机号码不正确"  class="form-control useTitle required validate-mobile-phone">
		    </div>
		  </div>
		  
		  
					  
		  <div class="form-group">
		    <label for="" class="col-sm-2 col-md-2 control-label">地址</label>
		    <div class="col-sm-10 col-md-5">
		      <input type="text" name="addr" id="addr_id" class="form-control required  min-length-6 max-length-120 useTitle" required-title="请填写详细地址" min-length-title="请填写详细地址" max-length="不能超过120个字符">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="" class="col-sm-2 col-md-2 control-label">附言</label>
		    <div class="col-sm-10 col-md-5">
		      <input type="text" name="remark" id="remark_id" class="form-control">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="" class="col-sm-2 col-md-2 control-label">备忘</label>
		    <div class="col-sm-10 col-md-5">
		      <input type="text" name="memo" id="memo_id" class="form-control"> 
		    </div>
		  </div>
 
		   
		   <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
	          <button id="add_obj_btn_id" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-folder-close"></i>保存</button>
		      <a href="./orderList.jsp" class="btn btn-default">取消</a>
		    </div>
  		  </div>
  		  
  		</form>
  		
  	</div>
	<script>
		$(function(){
			var id = $.request.queryString["id"];
			$("#mainContainer").showLoading();
			
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : '../order/get.do',
				data : {
					id:id
				},
				dataType : 'json',
				success : function(data) {
					if (data.result) {
						
						$.each(data.obj,function(key,val){
							$("#"+key+"_id").val(val);
						});

					} else {
						alert('数据库异常,查询数据失败');
					}
					$("#mainContainer").hideLoading();
				},
				error : function(data) {
					
				}
			});	
			
			
			
		 
			var valid = new jValidation.Validation('obj_form_id',{immediate:true},{onSubmit:false});
			$('#add_obj_btn_id').click(
				function(){
					var result = valid.validate();
					if(!result){
						return;
					}
					$("#mainContainer").showLoading();
					var formData = $('#obj_form_id').serialize();
					jQuery.ajax( {
						type : 'POST',
						url : '../order/editForBack.do',
						dataType : 'json',
						data : formData,
						success : function(obj) {
							if(obj.result){
								alert("保存数据成功");
								location.href="./orderList.jsp";
							}else{
								alert(obj.errorMsg);
							}
							$("#mainContainer").hideLoading();
						},
						error : function() {
							alert('error');
						}
					});
				}		
			);
		});
		
		
	</script>
</body>
</html>
