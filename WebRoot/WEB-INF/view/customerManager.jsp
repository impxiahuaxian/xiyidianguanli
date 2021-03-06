<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./header.jsp" %>
<body>

	<tags:customerTop/>
	<div class="container" id="main_container">		
	
			<ol class="breadcrumb" style="margin-top:20px;">
			  <li><a href="${ctx }/" style="color:#ffb238;">首页</a></li>
			  <li class="active">我的订单</li>
			</ol>
			
			<div style="margin-top:20px;">
				<table id="goods_table">
			
				</table>
			
			</div>
	</div>	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">评价</h4>
	      </div>
	      <div class="modal-body">
	        <form role="form" id="comment_form_id">
	          <input type="hidden" name="comment.orderId" id="orderId_id"/>
			  <div class="form-group">
			    <label for="">内容：</label>
			    <textarea class="form-control" name="comment.content" id="content_id" style="height:40px"></textarea>
			  </div>
			  
			 
			  <div class="form-group">
			    <label for="">打分：</label>
			    <select class="form-control" name="comment.grade" id="grade_id">
			    	<option value="5">(5星)非常满意|质量非常好，与卖家描述的完全一致</option>
			    	<option value="4">(4星)满意|质量不错，与卖家描述的基本一致</option>
			    	<option value="3">(3星)一般|质量一般，没有卖家描述的那么好</option>
			    	<option value="2">(2星)不满意|部分有破损，与卖家描述的不符</option>
			    	<option value="1">(1星)很不满意|差得太离谱，与卖家描述的严重不符</option>
			    </select>
			  </div>
			  <div class="checkbox">
			    <label>
			      <input type="checkbox" name="niming" value="1" checked="checked"> 匿名评价
			    </label>
			  </div>
			  
			  <button type="buttom" id="comment_btn" class="btn btn-buy">发表评论</button>
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</form>
	      </div>
	     
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->		
	
	<!-- begin 操作按钮模板 -->
	<div id="oper_model" style="display: none;">
		<a  class="process-a memo-a for-state-0 for-state-1 for-state-4 for-state-9" href="#" data-state="2" title="处理" style="display: none;">确认</a>
	</div>
	
	<script>
		$(function() {
			
			var grid = new jWei.Datagrid({
				renderTo : $("#goods_table"),
				tabWidth:"",
				limit:10,
				showCols:false,
				fieldset:false,
				legendTitle:"",
				url : "${ctx}/order/pageListForCustomer.do",
				colModels : [ 
				
				{
					name : "order_outerid",
					displayName : "订单号",
				},
				/*
				{
					name : "",
					displayName : "商品信息",
					handler:function(v,data,td,tr){
						var html = '<div style="font-size:11px;">';
						for(var i =0;i<data.goodsList.length;i++){
							var cartVO = data.goodsList[i];
							html = html + '<a target="_blank" href="${ctx}/detailGoods/'+cartVO.goods.id+'">'+cartVO.goods.title+"</a>&nbsp;×"+cartVO.num+"</br>";
						}
						html = html + '</div>';
						td.html(html);
					}
				},
				*/
				{
					name : "order_name",
					displayName : "收货人",
				}, 
				
				{
					name : "order_addr",
					displayName : "地址",
					handler:function(v,data,td,tr){ 
						td.html('<div class="ellipsis" style="width:180px" title="'+v+'">'+v+'</div>');
					}
				}, 
				
				{
					name : "order_totalPrice",
					displayName : "订单总价格",
					handler:function(v,data,td,tr){
						td.html("￥"+v);
					}
				},
			
				{
					name : "order_tradeStatus",
					displayName : "状态",
					handler:function(v,data,td,tr){ 
							if(data.order.state == 1){
								td.html('<span style="color:#0099FF;font-size:11px;">已处理</span>');
							} else if(data.order.state == 2){
								td.html('<span style="color:#0099FF;font-size:11px;">已结束</span>');
							} else{
								td.html('<span style="color:#0099FF;font-size:11px;">未揽件</span>');
							}
					}
				}				
				]
			});
			
			//评价绑定事件
			$("#goods_table").on("click",".comment",function(){
				
				var goodsList = $(this).data("goods");
				var orderId = $(this).data("orderId");
				//还原表单数据
				$("#comment_form_id").find(".goodsIds").remove();
				$("#content_id").val("");
				$("#grade_id").val(5);
				if(goodsList){
					for(var i = 0 ;i<goodsList.length;i++){
						var id = goodsList[i].goods.id;
						var input = '<input type="hidden" name="goodsIds['+i+']" class="goodsIds" value="'+id+'"/>';
						$("#comment_form_id").append(input);		
					}
				}
				
				$("#orderId_id").val(orderId);
				
				$('#myModal').modal();
				return false;
			});
			
			//发表评论
			$("#comment_btn").click(function(){
				
				var formData = $('#comment_form_id').serialize();
				jQuery.ajax( {
					type : 'POST',
					url : '${ctx}/comment/addByCoustomer.do',
					dataType : 'json',
					data : formData,
					success : function(obj) {
						if(obj.result){
							alert("评论发表成功,等待工作人员审核通过后方可以查看！");
							window.location.reload();
						}else{
							alert(obj.errorMsg);
						}
					}
				});
				
				$('#myModal').modal('hide');
				
				return false;
			});
		});

	</script>

</body>
    
	<tags:bottom/>
	
</body>