<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./common/header.jsp" %>
<body>
<%@ include file="./common/top.jsp"%>
	<div class="container">  
		
		<form class="form-horizontal" role="form" id="clothes_form_id">
		  <input type="hidden" name="clothes.id" id="id_id">  
			 
		  <div class="form-group">
		    <label for="clothesName" class="col-sm-2 control-label">名称：</label>
		    <div class="col-xs-3">
		      <input type="text" name="clothes.name"  class="form-control required" id="clothesName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="clothesName" class="col-sm-2 control-label">价格：</label>
		    <div class="col-xs-3">
		      <input type="text" name="clothes.price"  class="form-control required" id="clothesPrice">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
	    	  <button type="button" id="add_clothes_btn_id" class="btn btn-primary">修改</button>
		      <a href="./index.jsp" class="btn btn-default">取消</a>
		    </div>
  		  </div>
  		</form>
  		
	</div>
	<script>
		
		
		$(function(){
			var valid = new jValidation.Validation('clothes_form_id',{immediate:true},{onSubmit:false});
			$('#add_clothes_btn_id').click(
				function(){
					var result = valid.validate();
					if(!result){
						return;
					}
					var formData = $('#clothes_form_id').serialize();
					jQuery.ajax( {
						type : 'POST',
						url : '../admin/clothes/edit.do',
						dataType : 'json',
						data : formData,
						success : function(obj) {
							if(obj.result){
								window.top.jWei.Tips.success("修改数据成功");
								location.href="./index.jsp";
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
				url : '../admin/clothes/get.do',
				dataType : 'json',
				contentType : 'application/json',
				data : {
					id: id
				},
				success : function(obj) {
					if(obj.result){
						$("#clothesName").val(obj.obj.name);
						$("#clothesPrice").val(obj.obj.price);
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