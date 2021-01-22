<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./common/header.jsp"%>
<body>

<%@ include file="./common/top.jsp"%>
		
		<div class="container" id="mainContainer">
		<form class="form-inline" style="margin-top: 15px;text-align: left;" id="search_form">
			 
			 <div class="form-group"> 
	    		<label class="sr-only" for=""></label>
	    		<input type="text" class="form-control" id="name_search_id" name="name" style="width:70px;" placeholder="收件人"/>
	  		 </div>
	  		 
	  		 <div class="form-group">
	    		<label class="sr-only" for=""></label> 
				<input type="text" class="form-control" id="mobile_search_id" name="mobile" style="width:110px;"  placeholder="手机号码"/>
	  		 </div>	  		 
	  		 
	  		 <div class="form-group">
	    		<label class="sr-only" for=""></label>
				<input type="text" id="startDate_search_id" name="startDate" class="form-control" style="width:120px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"  placeholder="下单起始时间"/>&nbsp;-&nbsp;
	  		 </div>
	  		 
	  		 <div class="form-group">
	    		<label class="sr-only" for=""></label>
				<input type="text" class="form-control" name="endDate" id="endDate_search_id" style="width:120px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" placeholder="下单截止时间"/>
	  		 </div>
	  		 			
			<button type="button"  id="search_id" class="btn btn-primary"><i class="icon-search icon-white"></i>搜索</button>
			<button type="reset"  id="reset" class="btn"> 重置</button>
			
			
			 
		</form>
		
		
		<ul id="myTab" class="nav nav-tabs" style="margin-top:40px;">
              <li class="active"><a href="#wait_order" id="wait_tab_a" class="tab-order" data-tab="wait" data-toggle="tab">未处理(<span id="wait_count"></span>)</a></li>
              <li class=""><a href="#processed_order"  id="processed_tab_a" class="tab-order"  data-tab="processed"  data-toggle="tab">已处理(<span id="processed_count"></span>)</a></li>
              <li class=""><a href="#canceled_order"  id="canceled_tab_a" class="tab-order"  data-tab="canceled"   data-toggle="tab">已取消(<span id="canceled_count"></span>)</a></li> 
        </ul>
        
        <div id="myTabContent" class="tab-content">
        	  <!-- begin未处理 -->
              <div class="tab-pane fade active in" id="wait_order">
	              	<table id="wait_data_table_id">
				
					</table>
        		</div>
        	   <!-- end未处理 -->
        	
        	<!-- begin已处理 -->
	         <div class="tab-pane fade" id="processed_order">
	                <table id="processed_data_table_id">
						
					</table>
	          </div>
	          <!-- end已处理 -->
	          
	          
	           
	          
	          <!-- begin已取消 -->
	         <div class="tab-pane fade" id="canceled_order">
	                <table id="canceled_data_table_id">
						
					</table>
	          </div>
	          <!-- end已取消 -->
	         　　　　
     </div>
     
     <div style="margin-top:50px;"></div>
		
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">确认发货</h4>
	      </div>
	      <div class="modal-body">
	        <form role="form" id="ship_form_id">
	          <input type="hidden" name="id" id="order_id"/>
			  <div class="form-group">
			    <label for="">物流公司名称：</label>
			     <select class="form-control"   name="expressName">
			    	<option value="顺丰">顺丰</option>
			    	<option value="宅急送">宅急送</option>
			    </select>
			  </div>
			  
			  <div class="form-group">
			    <label for="">物流发货单号：</label>
			    <input type="text" class="form-control" name="expressNo" placeholder="">
			  </div>
			  
			  <div class="form-group">
			    <label for="">物流运输类型：</label>
			    <select class="form-control"  id="express_type_id">
			    	<option value="0">快递</option>
			    	<option value="1">平邮</option>
			    	<option value="2">EMS</option>
			    </select>
			  </div>
			  
			   <div class="form-group">
			    <label for="">备注：</label>
			    <input type="text" class="form-control" name="memo" placeholder="">
			  </div>
			  
			  <button type="buttom" id="ship_btn" class="btn btn-primary">确认发货</button>
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</form>
	      </div>
	     
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- begin 操作按钮模板 -->
	<div id="oper_model" style="display: none;">
		<a  class="process-a memo-a remark" href="#"  title="备忘" style="">备忘</a>
		<a  class="process-a memo-a for-state-0 for-state-3 for-state-4 for-state-9" href="#" data-state="1" title="处理" style="display: none;">处理</a>
		<a  class="process-a  memo-a for-state-0 for-state-1 for-state-2 for-state-3 for-state-5 for-state-6 for-state-7 for-state-9" href="#" data-state="4" title="取消" style="display: none;color:red;">取消</a>
	</div>
	
	

	<script>
		$(function() {
			//标记目前tab页，用于搜索
			var currTab = "wait";
			//存储tab表格数据对象
			var grid = [];
			function drawTabGrid(tabName,state){
					grid[tabName]  = new jWei.Datagrid({
					renderTo : $("#"+tabName+"_data_table_id"),
					tabWidth:"",
					limit:10,
					showCols:false,
					fieldset:false, 
					legendTitle:"",
					url : "${ctx}/admin/order/list.do?state="+state,
					colModels : [ 
		         	{
						name : "addDate",
						displayName : "下单时间",
					},
					
					{
						name : "order_outerid",
						displayName : "订单号",
					},
					
					
					{
						name : "order_mobile",
						displayName : "手机",
					}, 
					
					{
						name : "order_name",
						displayName : "收货人",
					}, 
					
					{
						name : "order_addr",
						displayName : "地址",
						width:"100px",
					}, 
					
					{
						name : "order_totalPrice",
						displayName : "总价格",
						handler:function(v,data,td,tr){
							td.html("￥"+v);
						}
					},
					
					{
						name : "order_remark",
						displayName : "附言"
					},
					
					{
					name:"order_tradeStatus",
					displayName : "操作",
					width:"200px",
					handler:function(v,data,td,tr){
						var html = '<textarea placeholder="右下角可拖动大小"  class="memo-input" style="height:26px;width:200px;">'+data.order.memo+'</textarea>';
						var html = html+$("#oper_model").html();
						td.html(html);
						//根据状态显示相应的操作按钮
						td.find(".for-state-"+state).each(function(){
							$(this).show();
						});
						//为按钮绑定订单id
						td.find(".process-a").each(function(){
							$(this).attr("data-id",data.order.id);
							$(this).attr("data-tab",tabName);
						});
						//为备忘按钮绑定当前状态
						td.find(".remark").attr("data-state",state);
					}
				}
				]
				});
				
				$("#"+tabName+"_count").html(grid[tabName].totalCount);
			}
			//绘制未处理表格
			drawTabGrid("wait",0);
			//绘制已处理表格
			drawTabGrid("processed",1);
			//绘制已取消表格
			drawTabGrid("canceled",4);
			 
			//为操作按钮绑定处理事件
			$("#myTabContent").on("click",".memo-a",function(){
				var memo = $(this).parent().find(".memo-input").val();
				var id = $(this).data("id");
				var state = $(this).data("state");
				jQuery
				.ajax({
					type : 'Get',
					contentType : 'application/json',
					url : '../admin/order/memo.do',
					async:false,
					data : {
						id : id,
						state:state,
						memo:memo
					},
					dataType : 'json',
					success : function(
							data) {
						if (data.result) {
							//init(pagenumber);
							window.top.jWei.Tips.success("操作成功！");
							//刷新所有表格
							relodAllTab();
						} else {
							alert(data.errorMsg);
						}
					},
					error : function(data) {
						
					}
				});
				return false;
			});
			//发货绑定事件
			$("#myTabContent").on("click",".ship",function(){
				var id = $(this).data("id");
				$('#myModal form').find(":text").each(function(){
					$(this).val("");
				});
				$("#myModal #express_type_id").val(0);
				//赋值订单id
				$("#myModal #order_id").val(id);
				$('#myModal').modal();
				return false;
			});
			
			//搜索按钮事件
			$("#search_id").click(function(){
				grid[currTab].search("search_form");
				$("#"+currTab+"_count").html(grid[currTab].totalCount);
				return false;
			});
			
			//点击tab页面刷新当前表格
			$(".tab-order").click(function(){
				var tableName = $(this).data("tab");
				//标记当前tab
				currTab = tableName;
				//重置搜索表单并重新搜索
				$("#search_id").trigger("click");
				
			});
			
			function relodAllTab(){
				//重新刷新所有表格
				for(var item in grid){
					grid[item].reload();
					$("#"+item+"_count").html(grid[item].totalCount);
				}
			}
			
			//导出数据功能
			$("#export_id").click(function(){
				var param = "title ="+$("#title_search_id").val()+
				"&memo="+$("#memo_search_id").val()+
				"&name="+$("#name_search_id").val()+
				"&mobile="+$("#mobile_search_id").val()+
				"&addr="+$("#addr_search_id").val()+
				"&startDate="+$("#startDate_search_id").val()+
				"&endDate="+$("#endDate_search_id").val()+
				"&state="+$("#state_id").val();
				window.location = '../admin/order/export.do?'+param;
			});  
			
		});
	</script>

</body>
</html>