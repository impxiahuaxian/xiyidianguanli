<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./common/header.jsp" %>
<body>
<%@ include file="./common/top.jsp"%>
	<div class="container">
		
		<form class="form-horizontal" role="form" id="clothes_form_id">
			 
		  <div class="form-group">
		    <label for="clothesName" class="col-sm-2 control-label">衣服名称：</label>
		    <div class="col-xs-3">
		      <input type="text" name="clothes.name" class="form-control required" id="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="clothesName" class="col-sm-2 control-label">价格：</label>
		    <div class="col-xs-3">
		      <input type="text" name="clothes.price" class="form-control required" id="">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
	    	  <button type="button" id="add_clothes_btn_id" class="btn btn-primary">保存</button>
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
						url : '../admin/clothes/add.do',
						dataType : 'json',
						data : formData,
						success : function(obj) {
							if(obj.result){
								window.top.jWei.Tips.success("保存数据成功");
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
			
			
		});
		
		
	</script>
</body>
</html>