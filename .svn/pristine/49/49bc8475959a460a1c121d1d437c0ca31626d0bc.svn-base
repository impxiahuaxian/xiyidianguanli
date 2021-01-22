<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./common/header.jsp" %>
<body>
<%@ include file="./common/top.jsp"%>
	<div class="container">
		
		<form class="form-horizontal" role="form" id="vipType_form_id">
			 
		  <div class="form-group">
		    <label for="vipTypeName" class="col-sm-2 control-label">等级：</label>
		    <div class="col-xs-3">
		      <input type="text" name="level" class="form-control required" id="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="vipTypeName" class="col-sm-2 control-label">名称：</label>
		    <div class="col-xs-3">
		      <input type="text" name="name" class="form-control required" id="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="vipTypeName" class="col-sm-2 control-label">折扣：</label>
		    <div class="col-xs-3">
		      <input type="text" name="discount" class="form-control required" id="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
	    	  <button type="button" id="add_vipType_btn_id" class="btn btn-primary">保存</button>
		      <a href="./vipTypeList.jsp#vipTypeManager" class="btn btn-default">取消</a>
		    </div>
  		  </div>
  		</form>
  		
	</div>
	<script>
		
		
		$(function(){
			var valid = new jValidation.Validation('vipType_form_id',{immediate:true},{onSubmit:false});
			$('#add_vipType_btn_id').click(
				function(){
					var result = valid.validate();
					if(!result){
						return;
					}
					var formData = $('#vipType_form_id').serialize();
					jQuery.ajax( {
						type : 'POST',
						url : '../admin/vipType/add.do',
						dataType : 'json',
						data : formData,
						success : function(obj) {
							if(obj.result){
								window.top.jWei.Tips.success("保存数据成功");
								location.href="./vipTypeList.jsp#vipTypeManager";  
							}else{
								window.top.jWei.Tips.success(obj.errorMsg);
							}
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