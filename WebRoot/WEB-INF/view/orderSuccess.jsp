<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./header.jsp" %>

<head>
	<style>
		.model-title{
			line-height:30px;
			height:30px;
			margin-top:0px;
			padding-left:10px;
			background: #eee;
			color:#333;
		}
	</style>
</head>
<body>
	<tags:top/>
	<div class="container">
		<div class="row" align="center" style="margin-top:20px;">
			<h3>请牢记您的订单号： <span class="label label-default" style="background:#ffb238;">${outerid }</span></h3>
			
		</div>
		<div class="row" align="center">
			
					<div class="col-sm-12 col-md-12">
						<span class="glyphicon glyphicon-ok" style="color:#7ABD54;font-size:56px"></span>
						<span style="color:#7ABD54;font-size:28px;margin-left:15px;">下单成功,我们将尽快服务人员上门取衣物！</span>
					</div>
		</div>
				<!-- begin model -->
				<div class="thumbnail goodsbox" style="display: none;" id="goods_required_model" >
					      <a href="#" target="_blank" class="title-a" style="text-decoration: none;"><h6 class="title ellipsis" style="color:#666;"></h6></a>
					      <a href="#" class="img-a"><img alt="" src=""></a>
					      <div class="caption">
					        
					        <p>
					        	<strong class="nowprice" style="color:#F76120;font-size:16px;"></strong>
					        	<span class="oldprice" style="color:#9F9F9F;font-size:14px;text-decoration:line-through;"></span>
					        </p>
					      </div>
				</div>
				<!-- end model -->
	</div>
	
	<!-- begin 非PC布局 -->
  	
  	<!-- col1 -->
  		<div id="not_pc_div_model">
 				<div class="col-sm-4 col-md-4 col0" id="col_id0">
					    	
		  		</div>
		  		
		  		<!-- col2 -->
		  		<div class="col-sm-4 col-md-4 col1" id="col_id1">
					    	
		  		</div>
		  		
		  		<!-- col3 -->
		  		<div class="col-sm-4 col-md-4 col2" id="col_id2">
					    	
		  		</div>
  		</div>
		<!-- end 非PC布局 -->
	
	
	<tags:bottom/>
	
	<script>
		$(function(){
			
			//非PC布局设置
			if(!jWei.util.isPC()){
				col = 3;
				var layoutHtml = $("#not_pc_div_model").html();
				$("#goods_required_id").html(layoutHtml);
			}
			
			//设置很多客户还买了
			  (function(currPage){
			        $.get("${ctx}/goods/goodsListByGrade.do?pageSize=12&grade=1&currPage="+currPage, function(data){
			        	
			        	var dataObj = $.parseJSON(data);
			        	
			        	var list = dataObj.obj.goodsList;
			        	for(var i = 0 ;i<list.length;i++){
			        		var model = $("#goods_required_model").clone();
			        		var goods = list[i];
			        		var price = goods.price;
			            	$("#goods_required_id #col_id"+i%3).append(model);
			            	model.find("img").attr("src","${ctx}/upload/download.do?fileName="+goods.picName).attr("title",goods.title).attr("alt",goods.title);
			            	model.find(".title-a").attr("href","${ctx}/upload/download.do?fileName="+goods.picName);
			            	model.find(".title").html(goods.title);
			            	model.find(".img-a,.btn-buy").attr("href","${ctx}/detailGoods/"+goods.id);
			            	model.find(".nowprice").html("￥"+goods.nowPrice);
			            	model.find(".oldprice").html("￥"+price);
			            	model.show();
			        	}

			        });	
					
				})(5);
		});
	</script>
	
</body>
