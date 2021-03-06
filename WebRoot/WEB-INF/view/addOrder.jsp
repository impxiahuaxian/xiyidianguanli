<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./header.jsp" %>

<head>
	<style>
		.control-label{
			font-weight: normal;
		}
		
		.didiao{
			border:1px solid #ccc;
		}
		.outstanding{
			border:3px solid #ffb238;
		}
		
		.btn-add{
			border:1px dashed #ffb238;background: #fff;color:#ffb238;border-radius:0;
		}
		
		.btn-add:hover{
			background: #ffb238;
			color:#fff;
		}
	</style>
</head>

<body>
	<tags:top/>
    <div class="container" style="margin-top:40px;">
		<a name="consigneeFocus"></a>    	
    	<div class="row outstanding" id="addr_div_id" data-save="false">
    		<div class="col-md-12" style="padding:10px;">
    			<strong style="font-size:16px;">客户配送信息</strong>  
    		</div>
    		
    		<div class="col-md-12" style="padding-left:30px;">
    		
    		<div id="has_addr_div_id">
    			<div class="radio" id="address_addr_id" style="display: none;">
				  	<label>
					    <input type="radio" name="customerAddress" value="">
					    <span class="name-id" style="margin-right:5px;"></span>
					    <span class="addr-id" style="margin-right:5px;"></span>
					    <span class="mobile-id" style="margin-right:5px;"></span>
					    
					    <span><a href="#" id="edit_addr_a" class="edit-btn" style="display: none;font-size:12px;">修改</a></span>
					    <span><a href="#" id="del_addr_a" class="del-btn" style="display: none;font-size:12px;">删除</a></span>
				  	</label>
			   </div>
    		</div>
    		
    		<div class="radio" id="useNewAddr" style="display: none;">
				  	<label>
					    <input type="radio" name="customerAddress" value="">
					    <span class="name-id" style="margin-right:5px;">使用新地址</span>
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
					      <input type="text" name="address" placeholder="详细地址无需在填写省、市、区"  id="address_id" class="form-control required  min-length-6 max-length-120 useTitle" required-title="请填写详细地址" min-length-title="请填写详细地址" max-length="不能超过120个字符">
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
					      <button type="button" id="save_addr_btn" class="btn btn-buy">保存客户信息</button>
					    </div>
					  </div>
					 </div>
				</form>
			</div>
				
    	</div>
    	
   		<div id="pay_div_id" style="margin-top:40px;" class="row didiao" data-save="false">
    		<div class="col-md-12" style="padding:10px;">
    			<strong style="font-size:16px;">支付及配送方式</strong>
    			<span style="font-size:13px;color:#666;"><a href="#orderremarka" class="orderremark-css" style="color:#ffb238;">（如有特殊要求请订单附言）</a></span>
    			<div style="padding-left:20px;margin-top:20px;" id="pay_type_id">
    			
	    			<div class="radio">
					  	<label>
						    <input type="radio" name="payType" id="" value="0"   checked="checked">
						           <span style="font-weight: bold;">货到付款：</span>满意后在付款，安全又放心！
					  	</label>
					</div>
					
					 
					
					
    			</div>
    			
    			 
    		</div>
    		
   		</div>
    	
    	<div class="row" style="border:1px solid #ccc;margin-top:40px;">
    		
	    		<ul class="list-group" style="border:none;margin-bottom:0px;padding-bottom:0px;">
	    			<li class="list-group-item">
	    				<strong style="font-size:16px;">衣物清单</strong>
	    				<a class="btn btn-buy btn-add" id="add_clothes_id"><span class="glyphicon glyphicon-plus"></span>添加送洗衣服</a>
	    			</li>
					  <li class="list-group-item" style="background: #F7F7F7;">
					  	<div class="row">
					  		<div class="col-xs-3 col-md-3" align="center">衣物名称</div>
					  		<div class="col-xs-3 col-md-3" align="center">价格</div>
					  		<div class="col-xs-3 col-md-3" align="center">数量</div>
					  		<div class="col-xs-3 col-md-3" align="center">操作</div>
					  	</div>
					  
					  </li>
					  <div class="shopboxs">
						  <li class="list-group-item" id="cart_model_div" style="display: none;margin-top:1px;">
						  	<h5><a href="#" style="font-size:12px; " class="title"></a></h5>
						  	<h5 style="font-size:12px;color:#666;" id="color_size_id"></h5>
						  	<div class="row">
						  		<div class="col-xs-3 col-md-3" align="center">
				  					 <span class="name">22</span>
						  		</div>
						  		<div class="col-xs-3 col-md-3" align="center">
						  			<span class="price" style="color:#333;">22</span>
						  		</div>  
						  		
						  		<div class="col-xs-3 col-md-3" align="center">
						  			<span class="num" style="color:#333;"></span>
						  		</div>
						  		
						  		<div class="col-xs-3 col-md-3" align="center">
						  			<a href="#" class="del">删除</a>
						  		</div>
						  	</div>
						  </li>
					  </div>
					  
				   <li class="list-group-item" style="background: #F7F7F7;border-bottom:none;">
				   	  <div class="total fr" align="right">商品总计：<span class="totalPrice" style="color: #666;font-size: 14px;font-weight: 400;" data-bind="0.00">¥0.00</span></div>
   	    			  <div class="total fr" align="right">配送费：<span class="express" style="color: #666;font-size: 14px;font-weight: 400;" data-bind="0.00">¥0.00</span></div>
				   	  <div class="total fr" align="right">总计（免配送费）：<span class="finalPrice" style="color: #F76120;font-size: 20px;font-weight: 400;" data-bind="0.00">¥0.00</span></div>
				   </li>
				   
				   
			 
			</ul>
		
    	</div>
    	
    	<a name="orderremarka"></a>
    	<div class="row" style="margin-top:15px;border:1px dashed #ccc;padding:5px 0px;" >
			   <div class="col-md-12">
		    	<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-md-2 control-label">订单附言：</label>
				    <div class="col-md-10">
				      <textarea id="remark_id" style="height:60px;" class="form-control"></textarea>
				    </div>
				  </div>
				</form>
			</div>
			  
		</div>
    	<div class="row" style="margin-top:10px;" id="submit_tips">
    		<div style="float:right;height:30px;line-height: 30px;padding:0px 5px;color:#F60;font-size:12px;background-color: #FFFDEE;border: 1px solid #EDD28B;" id="tips_error">您需先保存<a href="#consigneeFocus" id="tips_miao">收货人信息</a>,在提交订单</div>
    	</div>
    	
    	<div class="row" style="margin-top:5px;" >
	    	<button disabled="disabled" type="button" id="submit_btn"  class="btn btn-lg btn-buy disabled" href="${ctx }/settlement" style="float:right;margin-right:5px;">提交订单</button>
		</div>
		
		
  	</div>
  	
  	<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">确认订单</h4>
      </div>
      <div class="modal-body">
      
      <div class="row didiao" id="addr_div_id" data-save="false">
    		<div class="col-md-12" style="padding:10px;">
    			<strong style="font-size:16px;">收货人信息</strong>
    		</div>
    		
    		<div class="col-md-12" style="padding-left:30px;">
		         <div class="radio">
				  	<label>
					    <input type="radio" name="" id="optionsRadios1" value="option1" checked>
					    <span class="name-id" style="margin-right:5px;"></span>
					    <span class="addr-id" style="margin-right:5px;"></span>
					    <span class="mobile-id" style="margin-right:5px;"></span>
				  	</label>
			   </div>	
			</div>
 
      </div>
      
      <div id="" style="margin-top:10px;" class="row didiao" data-save="false">
    		<div class="col-md-12" style="padding:10px;">
    			<strong style="font-size:16px;">支付及配送方式</strong>
    			<span style="font-size:13px;color:#666;"><a href="#orderremarka" class="orderremark-css" style="color:#ffb238;">（如有特殊要求请订单附言）</a></span>
    			<div style="padding-left:20px;margin-top:20px;" id="model_pay_type_div">
    			
	    			<div class="radio" style="display: none" id="zhifubaofukuan_id">
						  	<label>
							    <input type="radio" name="" id="" value="1" checked="checked">
							           <span style="font-weight: bold;">支付宝担保交易付款：</span>和淘宝网购物一样的支付方式，先付款到支付宝，收到货满意后在确认收货，安全有保障！
						  	</label>
					</div>
	    			<div class="radio" style="display: none" id="huodaofukuan_id">
					  	<label>
						    <input type="radio" name="" id="" value="0" checked="checked">
						           <span style="font-weight: bold;">满意后在付款：</span>
					  	</label>
					</div>
    			</div>
    		</div>
    		
   		</div>
   		
   		<div class="total fr" align="right">商品总计：<span class="totalPrice" style="color: #666;font-size: 14px;font-weight: 400;" data-bind="0.00">¥0.00</span></div>
   	    <div class="total fr" align="right">运费：<span class="express" style="color: #666;font-size: 14px;font-weight: 400;" data-bind="0.00">¥0.00</span></div>
   		<div class="total fr" align="right">总计（含运费）：<span class="finalPrice" style="color: #ffb238;font-size: 20px;font-weight: 400;" data-bind="0.00">¥0.00</span></div>
   		<div style="margin-top:10px;">
   			<button type="button" id="confirm_order_btn" class="btn btn-buy">确认订单</button>
   			<button type="buttom" class="btn btn-default" data-dismiss="modal">返回修改</button>
   		</div>
      
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	
	<div class="popup-modal" id="add_color_popup">
  			<form class="form-horizontal"  id="add_new_color_form">
 				<table id="clothes_table" class="table table-striped table-hover">
					<thead id="jq_1460423637610">
						<tr>
						<th width="" data-col="">选择</th>
						<th width="" data-col="name">名称</th>
						<th width="" data-col="price">价格</th>
						<th width="" data-col="num">数量</th>
						</tr>
					</thead>
						
					<tbody id="pop_tbody_id">
					</tbody>
				</table>
	  		</form>
  		</div>
	<tags:bottom/>
	
	<script type="text/tmpl" id="clothes_tr_model_id">
		<tr>
			<td data-col="addDate"><input class="chk" type="checkbox" /></td>
			<td data-col="addDate" class="name">毛衣</td>
			<td data-col="clothes_name" class="price">33</td>
			<td data-col="clothes_price">
				<div>
					<a href="#" style="text-decoration:none;color:#000;padding:5px 10px 5px 10px;border:1px solid #b5b5b5;background: #efefef;" class="reduce">-</a>
		            <span class="num" style="padding:6px 10px;color:#000;border:1px solid #ccc;">1</span>
		    		<a href="#" class="add" style="text-decoration:none;color:#000;padding:5px 10px 5px 10px;border:1px solid #b5b5b5;background: #efefef;">+</a> 
		        </div>
			</td> 
		</tr>
	</script>
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
			
			//修改地址按钮
			$("#edit_addr_a").click(function(){
				$("#addr_form").show();
				$("#addr_div_id").removeClass("didiao").addClass("outstanding");
				//状态设置为已经未保存地址，用于提交订单验证
				$("#addr_div_id").data("save",false);
				$("#submit_tips").show();
				$("#submit_btn").prop("disabled",true).addClass("disabled");
				return false;
			});
			
			//计算总价
			var calTotalPrice = function (){
				var totalPrice = 0;
				var payNum = 0;
				$(".shopboxs .price").each(function(){
					var price = $(this).data("price");
					if(price){
						totalPrice = totalPrice + parseFloat(price);
					}
					payNum++;
				});
				
				$(".totalPrice").each(function(){
					$(this).html("￥"+totalPrice);
				});
				
				 
				$(".finalPrice").each(function(){
						$(this).html("￥"+totalPrice).data("totalPrice",totalPrice).data("srcTotalPrice",totalPrice);	
				});
				//$(".payinfo .fz12").html(payNum);
			};
			
			
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
								model.find(":radio").data("addr",addr);
								if(addr.defaultAddr == 0){
									//显示删除、修改按钮
									model.find(".edit-btn").show();
									model.find(".del-btn").show();
									
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
			
			//获取购物车数据
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : '${ctx}/cart/getCartList.do',
				async:false,
				dataType : 'json',
				success : function(data) {
					var cartList = data.obj;
					if(cartList){
						var modelDiv = $("#cart_model_div");
						for(var i=0 ;i<cartList.length;i++){
							var goods = cartList[i].goods;
							var num = cartList[i].num;
							var color = cartList[i].color;
							var size = cartList[i].size;
							var pic = cartList[i].pic;
							var model = modelDiv.clone();
							$(".shopboxs").append(model);
						    model.find(".title").attr("href","./detailGoods/"+goods.id);
							model.find(".title").html(goods.title);
						    model.find("#color_size_id").html("颜色："+color);
							model.find(".shoppic").attr("src","./upload/download.do?fileName="+ pic);
							model.find(".num").html(num);
							var nowPrice = 0;
							for(var n = 0;n<num;n++){
								nowPrice = nowPrice +goods.nowPrice;
							}
							model.find(".price").html("¥"+nowPrice).data("price",nowPrice);
							model.find(".del").data("id",goods.id);
							model.show();
						}
						
						calTotalPrice();
						
					}else{
						alert("购物车为空！");
					}
					
				}
			});
			
			
			//提交订单按钮
			$("#submit_btn").click(function(){
				
				var size = $(".shopboxs li").size();
				if(size <=1){
					alert("请选择要送洗衣物！");
					return false;
				}
				
				//回复置灰确认按钮，防止表单重复提交
				$("#confirm_order_btn").prop("disabled",false).removeClass("disabled");
				//选择支付方式
				var val = $("#pay_type_id :radio:checked").eq(0).val();
				
				$("#myModal #model_pay_type_div .radio").each(function(){
					$(this).hide();
				});
				
				if(val == 0){
					$("#huodaofukuan_id").show();
					$("#zhifubaofukuan_id").hide();
				}else{
					$("#zhifubaofukuan_id").show();
					$("#huodaofukuan_id").hide();
				}
				
				$('#myModal').modal();
				return false;
			});
			
			
			//确认订单按钮
			$("#confirm_order_btn").click(function(){
				var payType = $("#pay_type_id :radio:checked").eq(0).val();
				//置灰确认按钮，防止表单重复提交
				$("#confirm_order_btn").prop("disabled",true).addClass("disabled");
				//货到付款方式
				if(payType == 0){
					var clothesIds = "";
					var nums="";
					
					$(".shopboxs .name").each(function(){
						var id = $(this).data("id");
						clothesIds = clothesIds + id +",";
					});
					
					
					$(".shopboxs .num").each(function(){
						var num = $(this).html();
						nums = nums + num +",";
					});
					//check 
					//alert($(".finalPrice").eq(0).data("totalPrice"));
					//alert($(".finalPrice").val());
					//alert($(".totalPrice").html().replace(/(^￥)|(￥$)/g,''));
					
					jQuery.ajax({
						type : 'POST',
						url : '${ctx}/order/add.do',
						data:{
							totalPrice:$(".totalPrice").html().replace(/(^￥)|(￥$)/g,''),
							remark:$("#remark_id").val(),
							name:$("#myModal").find(".name-id").html(),
							mobile:$("#myModal").find(".mobile-id").html(),
							addr:$("#myModal").find(".addr-id").html(),
							payType:payType,
							clothesIds:clothesIds,
							nums:nums
						},
						dataType : 'json',
						async:false,
						success : function(data) {
							if(data.result){
								var order = data.obj;
								window.location.href = "${ctx}/order/orderSuccess/"+order.outerid;						
							}else{
								alert(data.errorMsg);
							}
						}			
					});
				}else{
					$("body").load('${ctx}/order/add.do',{
						totalPrice:$(".finalPrice").eq(0).data("totalPrice"),
						remark:$("#remark_id").val(),
						name:$("#myModal").find(".name-id").html(),
						mobile:$("#myModal").find(".mobile-id").html(),
						addr:$("#myModal").find(".addr-id").html(),
						payType:payType
					},function(){
						
					});	
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
			
			//绑定地址单选按钮事件
			$("#has_addr_div_id").on("click",":radio",function(){
				$("#addr_form").hide();	
				//隐藏地址删除、修改按钮
				$("#has_addr_div_id").find(".edit-btn,.del-btn").each(function(){
					$(this).hide();
				});
				//显示当前选中地址删除、修改按钮
				$(this).parent().find(".edit-btn,.del-btn").each(function(){
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
			
			//如有特殊要求请订单附言
			$(".orderremark-css").click(function(){
				$('#myModal').modal('hide');
				$("#remark_id").focus();
			});
			
			$("#pop_tbody_id").on("click",".reduce",function(){
				var num = $(this).parent().find(".num").html();
				if(num >1){
					$(this).parent().find(".num").html(parseInt(num)-1);
				}else{
					$(this).parent().find(".num").html(1);
				}
				return false; 
			});
			
			$("#pop_tbody_id").on("click",".add",function(){
				var num = $(this).parent().find(".num").html();
				$(this).parent().find(".num").html(parseInt(num)+1);
				return false;
			});
			
			$(".shopboxs").on("click",".del",function(){
				$(this).closest("#cart_model_div").fadeOut(800,function(){
					$(this).remove();
					
					var totalPrice = 0;
					 
					 $(".shopboxs .price").each(function(){ 
						 var price = $(this).html();
						 var num = $(this).closest(".row").find(".num").html();
						 if(num && price){
							 totalPrice = totalPrice + parseFloat(price)*parseInt(num);
						 }
					 });
					 $(".totalPrice,.finalPrice").html("￥"+totalPrice);
				});


				
				 
				return false;
			});
			
			//绑定添加新衣物按钮
			$("#add_clothes_id").click(function(){
				$('#pop_tbody_id').html("");
				jQuery.ajax({
					type : 'Get',
					contentType : 'application/json',
					url : '${ctx}/clothes/getAll.do',
					dataType : 'json',
					async:false,
					success : function(data) {
						if (data.result) {
							var clothesList = data.obj;
							for(var i =0;i<clothesList.length;i++){
								var clothes = clothesList[i];
								var html = $('#clothes_tr_model_id').html();
								$('#pop_tbody_id').append(html);
								var newTr = $('#pop_tbody_id tr').last();
								newTr.find(".chk").val(clothes.id).data("clothes",clothes);
								newTr.find(".name").html(clothes.name);
								newTr.find(".price").html(clothes.price);
							}
							 
						} else {
							
						}
					},
					error : function(data) {
						 
					}
				});
				
				
				jWei.popUp({
					title:'选择清洗衣物',
					popUpId:'add_color_popup',
					width:'600px',
					ok:function(){
						 $("#pop_tbody_id .chk:checked").each(function(){
							 var clo = $(this).data("clothes");
							 var size = $(".shopboxs").find(".clothesId"+clo.id).size();
							 if(size == 0){
								 var newLi = $("#cart_model_div").clone();
								 $(".shopboxs").append(newLi);
								 newLi.find(".row").addClass("clothesId"+clo.id);
								 newLi.find(".name").html(clo.name).data("id",clo.id);
								 newLi.find(".price").html(clo.price);
								 var num = $(this).closest("tr").find(".num").html();
								 newLi.find(".num").html(num);
								 newLi.show(); 
							 }else{
								 var nm = $(".shopboxs").find(".clothesId"+clo.id).find(".num").html();
								 var newNm = $(this).closest("tr").find(".num").html();
								 var mm = parseInt(nm)+parseInt(newNm);
								 $(".shopboxs").find(".clothesId"+clo.id).find(".num").html(mm);
							 } 
							 
						 });
						 var totalPrice = 0;
						 
						 $(".shopboxs .price").each(function(){ 
							 var price = $(this).html();
							 var num = $(this).closest(".row").find(".num").html();
							 if(num && price){
								 totalPrice = totalPrice + parseFloat(price)*parseInt(num);
							 }
						 });
						 $(".totalPrice,.finalPrice").html("￥"+totalPrice);
					}
				});
			});
			
		});
	</script>
	
</body>