<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./common/header.jsp" %>
<body>
<%@ include file="./common/top.jsp"%>
	<div class="container">
		
		<form class="form-horizontal" role="form" id="customer_form_id">
			<div class="form-group">
			  <label class="col-sm-2 control-label sr-only"></label>
			    <div class="col-sm-10">
			    	<img id="head_pic_id" class="form-control" src="../images/fmmb.png" style="width: 129px;height: 129px">
			    </div>
			</div>
			
			<div class="form-group">
			    <label class="col-sm-2 control-label sr-only"></label>
			    <div class="col-sm-10">
			    	<input type="file" name="uploadFile" id="uploadify" />
			        <input name="pic" type="hidden" id="customer_avatar_id"/>
			  </div>
			  
			  <div class="form-group">
		    <label for="customerName" class="col-sm-2 control-label">邮箱：</label>
		    <div class="col-xs-3">
		      <input type="text" name="email" class="form-control required" id="email_id">
		    </div>  
		  </div>
		  <div class="form-group">
		    <label for="customerName" class="col-sm-2 control-label">名称：</label>
		    <div class="col-xs-3">
		      <input type="text" name="nickname" class="form-control required" id="name_id">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="customerName" class="col-sm-2 control-label">手机：</label>
		    <div class="col-xs-3">
		      <input type="text" name="mobile" class="form-control required" id="mobile_id">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="customerName" class="col-sm-2 control-label">会员等级：</label>
		    <div class="col-xs-3">
		    	<select class="form-control required useTitle" required-title="请选择会员等级" name="level" id="level_id">
					<option value="">请选择</option>
			  </select>
		     
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="customerName" class="col-sm-2 control-label">密码：</label>
		    <div class="col-xs-3">
		      <input type="text" name="password" class="form-control required" id="pwd_id">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
	    	  <button type="button" id="add_customer_btn_id" class="btn btn-primary">保存</button>
		      <a href="./customerList.jsp" class="btn btn-default">取消</a>
		    </div>
  		  </div>
  		</form>
  		
	</div>
	<script>
		
		
		$(function(){
			
			//查询所有会员等级
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : '../admin/vipType/getAll.do',
				dataType : 'json',
				success : function(data) {
					if (data.result) {
						var vipTypeList = data.obj;
						if(vipTypeList){
							for(var i = 0 ;i<vipTypeList.length;i++){
								var vipType = vipTypeList[i];
								if(vipType) 
									$("#level_id").append("<option value="+vipType.id+">"+vipType.name+"</option>");
							}
						}
						
					} else {
						jWei.Tips.error("获取分类异常！");
					}
				},
				error : function(data) {
					
				}
			});	
			
			
			var valid = new jValidation.Validation('customer_form_id',{immediate:true},{onSubmit:false});
			$('#add_customer_btn_id').click(
				function(){
					var result = valid.validate();
					if(!result){
						return;
					}
					var formData = $('#customer_form_id').serialize();
					jQuery.ajax( {
						type : 'POST',
						url : '../customer/add.do', 
						dataType : 'json',
						data : formData,
						success : function(obj) {
							if(obj.result){
								window.top.jWei.Tips.success("保存数据成功");
								location.href="./customerList.jsp";
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
			 
			//上传图片
			$("#uploadify").uploadify({
				height        : 30,
				swf           : '../styles/uploadify.swf',
				uploader      : '../upload/add.do?jSessionid=9B16F7330BD01F6C96CB79971F36EA2B',
				buttonText    : '上传头像',  
				width         : 100,
				cancelImg     : '../images/uploadify-cancel.png',
				uploadLimit   : 6, 
				fileTypeExts   :'*.gif; *.jpg; *.png',
				onUploadSuccess:function(file, data, response){  
					var dataObj = eval("("+data+")");
	            	$('#head_pic_id').attr("src","../upload/download.do?fileName="+dataObj.obj.name);
	            	$('#customer_avatar_id').val(dataObj.obj.name);
	        	} 
			});
		});
		
		
	</script>
</body>
</html>