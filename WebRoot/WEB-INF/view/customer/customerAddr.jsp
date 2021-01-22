<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<body>

	<tags:customerTop/>
	<div class="container" id="main_container">		
	
			<ol class="breadcrumb" style="margin-top:20px;">
			  <li><a href="${ctx }" style="color:#ffb238;">首页</a></li>
			  <li class="active">账号信息</li>
			  <li class="active">地址管理</li>
			</ol>
			
			<div class="row outstanding" id="addr_div_id" data-save="false">
	    		<div class="col-md-12">
	    			<strong style="font-size:16px;">收货地址管理</strong>
	    		</div>
	    		
	    		<div class="col-md-12" style="padding-left:30px;margin-top:20px;">
	    		
	    		<div id="has_addr_div_id">
	    			<div class="radio" id="address_addr_id" style="display: none;">
					  	<label>
						    <input type="radio" name="customerAddress" value="">
						    <span class="name-id" style="margin-right:5px;"></span>
						    <span class="addr-id" style="margin-right:5px;"></span>
						    <span class="mobile-id" style="margin-right:5px;"></span>
						    
						    <span><a href="#" id="edit_addr_a" class="edit-btn" style="display: none;font-size:12px;">修改</a></span>
						    <span><a href="#" id="del_addr_a" class="del-btn" style="display: none;font-size:12px;">删除</a></span>
						    <span id="set_default_addr_id" class="default-btn" style="display: none;font-size:12px;"><a href="#">设为默认地址</a></span>
					  	</label>
				   </div>
	    		</div>
	    		
	    		<div class="radio" id="useNewAddr" style="display: none;">
					  	<label>
						    <input type="radio" name="customerAddress" value="">
						    <span class="name-id" style="margin-right:5px;">新增地址</span>
					  	</label>
				   </div>
			      	
					<form class="form-horizontal" role="form" id="addr_form" style="display: none;">
						<input type="hidden" name="customerId" value="${customer.id }"/>
						<input type="hidden" name="id" id="id_id" value=""/>
	  					 <div id="add_div">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">收货人：</label>
						    <div class="col-sm-10 col-md-2">
						      <input type="text" id="name_id" name="name" class="form-control useTitle required validate-chinese min-length-2 max-length-8" required-title="请输入收件人"  validate-chinese-title="请输入您真实的姓名"  min-length-title="请输入您真实的姓名" max-length-title="请输入您真实的姓名"/>
						    </div>
						  </div>
						    <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 col-md-2 control-label">所在地区：</label>
							   
							    <div class="col-sm-8 col-md-6">
								  <div class="col-xs-4 col-sm-4" style="padding-left:0px;">
								  	<select class="form-control required" name="province" id="province_sel">
								  		<option value="">请选择</option>
								  	</select>
								  	
								  </div>
								  <div class="col-xs-4 col-sm-4"  style="padding-left:0px;">
								    <select class="form-control required"  name="city" id="city_sel">
								  		<option value="">请选择</option>
								  	</select>
								  </div>
								  <div class="col-xs-4 col-sm-4" style="padding-left:0px;">
								    <select class="form-control required" name="area" id="area_sel">
								  		<option value="">请选择</option>
								  	</select>
								  </div>
								</div>
							  </div>
						  
						  <div class="form-group">
						    <label for="" class="col-sm-2 control-label">详细地址：</label>
						    <div class="col-sm-10 col-md-5">
						      <input type="text" name="address" id="address_id" class="form-control required  min-length-6 max-length-120 useTitle" required-title="请填写详细地址" min-length-title="请填写详细地址" max-length="不能超过120个字符">
						    </div>
						  </div>
						  
					     <div class="form-group">
						    <label for="" class="col-sm-2 col-md-2 control-label">手机号码：</label>
						    <div class="col-sm-9 col-md-6">
						     <div class="col-sm-7" style="padding-left:0px;">
							  	<input type="text" name="mobile" id="mobile_id" required-title="请输入手机号码" validate-mobile-phone-title="手机号码不正确"  class="form-control useTitle required validate-mobile-phone">
							  </div>
							  
	<!-- 						 <div class="col-sm-5" style="padding-left:0px;"> -->
	<!-- 						 	<button type="submit" class="btn btn-def">获取验证码</button> -->
	<!-- 						 </div> -->
						     
						    </div>
						     
						  </div>
						  
	<!-- 					  <div class="form-group"> -->
	<!-- 					    <label for="inputPassword3" class="col-sm-2 control-label">短信验证码：</label> -->
	<!-- 					    <div class="col-md-2"> -->
	<!-- 					      <input type="password" class="form-control" id="inputPassword3" > -->
	<!-- 					    </div> -->
	<!-- 					  </div> -->
	
						
						  
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-md-5">
						      <button type="button" id="save_addr_btn" class="btn btn-buy">保存收货人信息</button>
						    </div>
						  </div>
						 </div>
					</form>
				</div>
				
    	</div>
	</div>
<tags:bottom/>

<script>
	$(function(){
		
		var valid = new jValidation.Validation('addr_form', {
			immediate : true
		});
		
		jQuery.ajax({
			type : 'Get',
			contentType : 'application/json',
			url : '${ctx}/address/getAll.do',
			dataType : 'json',
			async:false,
			success : function(data) {
				if (data.result) {
					var provinceList = data.obj;
					var proHtml = '<option value="">请选择</option>';
					for(var i = 0;i<provinceList.length;i++){
						var item = provinceList[i];
						proHtml = proHtml +'<option value="'+item.code+"|"+item.name+'">'+item.name+'</option>';
					}
					$("#province_sel").html(proHtml);
				} else {
					
				}
			},
			error : function(data) {
				 
			}
		});
		
		$("#province_sel").change(function(){
			var provincecode = $(this).val().split("|")[0];
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : '${ctx}/address/getByProvincecode.do',
				dataType : 'json',
				async:false,
				data:{
					provincecode:provincecode
				},
				success : function(data) {
					if (data.result) {
						var cityList = data.obj;
						var proHtml = '<option value="">请选择</option>';
						for(var i = 0;i<cityList.length;i++){
							var item = cityList[i];
							proHtml = proHtml +'<option value="'+item.code+"|"+item.name+'">'+item.name+'</option>';
						}
						$("#city_sel").html(proHtml);
					} else {
						
					}
				},
				error : function(data) {
					 
				}
			});
		});
		
		$("#city_sel").change(function(){
			var citycode = $(this).val().split("|")[0];
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : '${ctx}/address/getByCitycode.do',
				dataType : 'json',
				data:{
					citycode:citycode
				},
				async:false,
				success : function(data) {
					if (data.result) {
						var cityList = data.obj;
						var proHtml = '<option value="">请选择</option>';
						for(var i = 0;i<cityList.length;i++){
							var item = cityList[i];
							proHtml = proHtml +'<option value="'+item.code+"|"+item.name+'">'+item.name+'</option>';
						}
						$("#area_sel").html(proHtml);
					} else {
						
					}
				},
				error : function(data) {
					 
				}
			});
			
		});
		
		//保存地址
		$("#save_addr_btn").click(function(){
			
			if(!valid.validate()){
				return false;
			}
			//是否存在id，用于判断是新增还是修改
			var id = $("#id_id").val();
			var postData = $("#addr_form").serialize();
			jQuery.ajax({
				type : 'POST',
				url : '${ctx}/customer/addAddr.do',
				dataType : 'json',
				data:postData,
				async:false,
				success : function(data) {
					if(data.result){
						var addr = data.obj;
						if(!id){
							var model = $("#address_addr_id").clone();
							$("#has_addr_div_id").append(model);
							model.find(".name-id").html(addr.name);
							model.find(".addr-id").html(addr.province+addr.city+addr.area+addr.address);
							model.find(".mobile-id").html(addr.mobile);
							model.find(":radio").prop("checked",true).data("addr",addr);
							model.find(".edit-btn").show().data("id",addr.id);
							model.find(".del-btn").show().data("id",addr.id);
							model.find(".default-btn").show().data("id",addr.id);
							model.show();	
						
						//修改操作
						}else{
							var jLable = $("#has_addr_div_id").find(":radio:checked").parent();								
							jLable.find(".name-id").html(addr.name);
							jLable.find(":radio").data("addr",addr);
							jLable.find(".mobile-id").html(addr.mobile);
							jLable.find(".addr-id").html(addr.province+addr.city+addr.area+addr.address);
						}
						
						//设置popup地址信息
						$("#myModal .addr-id").html(addr.province+addr.city+addr.area+addr.address);
						$("#myModal .name-id").html(addr.name);
						$("#myModal .mobile-id").html(addr.mobile);
						$("#addr_form").hide();
						$("#addr_div_id").removeClass("outstanding").addClass("didiao");
						//状态设置为已经保存地址，用于提交订单验证
						$("#addr_div_id").data("save",true);
						$("#submit_tips").hide();
						$("#submit_btn").prop("disabled",false).removeClass("disabled");	
						
					}
				}
			});
			
			
		});
		
		//获取地址数据
		jQuery.ajax({
			type : 'Get',
			contentType : 'application/json',
			url : '${ctx}/customer/getCustomerAddrs.do?customerId=${customer.id}',
			async:false,
			dataType : 'json',
			success : function(data) {
				if(data.result){
					var addrs = data.obj;
					if(addrs){
						$("#useNewAddr").show();
						for(var i = 0 ;i<addrs.length;i++){
							var addr = addrs[i];
							var model = $("#address_addr_id").clone();
							$("#has_addr_div_id").append(model);
							model.find(".name-id").html(addr.name);
							model.find(".addr-id").html(addr.province+addr.city+addr.area+addr.address);
							model.find(".mobile-id").html(addr.mobile);
							model.find(".del-btn").data("id",addr.id);
							model.find(".edit-btn").data("id",addr.id);
							model.find(".default-btn").data("id",addr.id);
							model.find(":radio").data("addr",addr);
							if(addr.defaultAddr == 0){
								//显示删除、修改按钮
								model.find(".edit-btn").show();
								model.find(".del-btn").show();
								model.find(".default-btn").html("默认地址").show();
								
								model.find(":radio").prop("checked",true);
								//设置popup地址信息
								$("#myModal .addr-id").html(addr.province+addr.city+addr.area+addr.address);
								$("#myModal .name-id").html(addr.name);
								$("#myModal .mobile-id").html(addr.mobile);
								//状态设置为已经保存地址，用于提交订单验证
								$("#addr_div_id").removeClass("outstanding").addClass("didiao");
								$("#addr_div_id").data("save",true);
								$("#submit_tips").hide();
								$("#submit_btn").prop("disabled",false).removeClass("disabled");
							}
							model.show();
						}
					}else{
						$("#addr_form").show();
					}
				}
			}
		});
		
		//绑定删除地址按钮事件
		$("#has_addr_div_id").on("click",".del-btn",function(){
			var that = $(this);
			var id = $(this).data("id");
			if(confirm("确定要删除该地址！")){
				$("#addr_form").hide();
				$("#addr_form").find(":text,:password,:radio,:checkbox,select,textarea").each(function(){
					$(this).val("");
				});
				jQuery.ajax({
					type : 'Get',
					contentType : 'application/json',
					url : '${ctx}/customer/delAddr.do?id='+id,
					async:false,
					dataType : 'json',
					success : function(data) {
						that.closest(".radio").remove();
						//状态设置为未保存地址，禁止提交订单
						$("#addr_div_id").addClass("outstanding").removeClass("didiao");
						$("#addr_div_id").data("save",false);
						$("#submit_tips").show();
						$("#submit_btn").prop("disabled",true).addClass("disabled");
					}
				});	
			}
			return false;
		});
		
		//绑定修改地址按钮事件
		$("#has_addr_div_id").on("click",".edit-btn",function(){
			var addr = $(this).closest(".radio").find(":radio").data("addr");
			$("#id_id").val(addr.id);
			$("#name_id").val(addr.name);
			$("#province_sel").val(addr.provinceCode+"|"+addr.province);
			$("#province_sel").change();
			$("#city_sel").val(addr.cityCode+"|"+addr.city);
			$("#city_sel").change();
			$("#area_sel").val(addr.areaCode+"|"+addr.area);
			$("#address_id").val(addr.address);
			$("#mobile_id").val(addr.mobile);	
			$("#addr_form").show();
			//状态设置为未保存地址，禁止提交订单
			$("#addr_div_id").addClass("outstanding").removeClass("didiao");
			$("#addr_div_id").data("save",false);
			$("#submit_tips").show();
			$("#submit_btn").prop("disabled",true).addClass("disabled");
			
			return false;
		});
		
		//绑定设为默认地址按钮事件
		$("#has_addr_div_id").on("click",".default-btn a",function(){
			var id = $(this).closest(".default-btn").data("id");
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : '${ctx}/customer/setDefaultAddr.do?id='+id,
				async:false,
				dataType : 'json',
				success : function(data) {
					if(data.result){
						alert("设置默认地址成功！");
						window.location.reload();
					}
				}
			});	
			
			return false;
		});
		
		//使用新地址
		$("#useNewAddr :radio").click(function(){
			//先清空修改留下的id
			$("#id_id").val("");
			$("#addr_form").find(":text,:password,:radio,:checkbox,select,textarea").each(function(){
				$(this).val("");
			});
			$("#addr_form").show();
			
			//隐藏地址删除、修改按钮
			$("#has_addr_div_id").find(".edit-btn,.del-btn").each(function(){
				$(this).hide();
			});
			//状态设置为未保存地址，禁止提交订单
			$("#addr_div_id").addClass("outstanding").removeClass("didiao");
			$("#addr_div_id").data("save",false);
			$("#submit_tips").show();
			$("#submit_btn").prop("disabled",true).addClass("disabled");
		});
		
		//绑定地址单选按钮事件
		$("#has_addr_div_id").on("click",":radio",function(){
			$("#addr_form").hide();	
			//隐藏地址删除、修改按钮
			$("#has_addr_div_id").find(".edit-btn,.del-btn,.default-btn").each(function(){
				$(this).hide();
			});
			//显示当前选中地址删除、修改按钮
			$(this).parent().find(".edit-btn,.del-btn,.default-btn").each(function(){
				$(this).show();
			});
			
			//状态设置为已经保存地址，用于提交订单验证
			$("#addr_div_id").removeClass("outstanding").addClass("didiao");
			$("#addr_div_id").data("save",true);
			$("#submit_tips").hide();
			$("#submit_btn").prop("disabled",false).removeClass("disabled");
			
			//设置popup地址信息
			var addr = $(this).data("addr");
			$("#myModal .addr-id").html(addr.province+addr.city+addr.area+addr.address);
			$("#myModal .name-id").html(addr.name);
			$("#myModal .mobile-id").html(addr.mobile);
			
		});
	});
</script>
	
</body>