<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./common/header.jsp" %>
<body>
<%@ include file="./common/top.jsp"%>
	<div class="container">  
		
		<form class="form-horizontal" role="form" id="vipType_form_id">
		  <input type="hidden" name="id" id="id_id">  
			 
		  <div class="form-group">
		    <label for="vipTypeName" class="col-sm-2 control-label">等级：</label>
		    <div class="col-xs-3">
		      <input type="text" name="level"  class="form-control required" id="level_id">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="vipTypeName" class="col-sm-2 control-label">名称：</label>
		    <div class="col-xs-3">
		      <input type="text" name="name"  class="form-control required" id="name_id">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="vipTypeName" class="col-sm-2 control-label">折扣：</label>
		    <div class="col-xs-3">
		      <input type="text" name="discount"  class="form-control required" id="discount_id">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
	    	  <button type="button" id="add_vipType_btn_id" class="btn btn-primary">修改</button>
		      <a href="./index.jsp" class="btn btn-default">取消</a>
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
						url : '../admin/vipType/edit.do',
						dataType : 'json',
						data : formData,
						success : function(obj) {
							if(obj.result){
								window.top.jWei.Tips.success("修改数据成功");
								location.href="./vipTypeList.jsp";
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
			
			var id = $.request.queryString["id"];
			jQuery.ajax( { 
				type : 'Get',
				url : '../admin/vipType/get.do',
				dataType : 'json',
				contentType : 'application/json',
				data : {
					id: id
				},
				success : function(obj) {
					if(obj.result){
						$("#discount_id").val(obj.obj.discount);
						$("#level_id").val(obj.obj.level);
						$("#name_id").val(obj.obj.name);
						$("#id_id").val(obj.obj.id); 
					}else{
						alert(obj.errorMsg);
					}
				},
				error : function() {
					alert('error');
				}
			});
			
			
		});
		
		
	</script>
</body>
</html>