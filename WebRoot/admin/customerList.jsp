<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./common/header.jsp" %>
<body>
<%@ include file="./common/top.jsp"%>

<div class="container">
	<form class="form-inline" id="search_form" role="form" style="margin-bottom:20px;">
	  
      <div class="form-group">
	    <label class="sr-only" for=""></label>
	    <input type="text" class="form-control" name="email" id="title_search_id" placeholder="邮箱地址"/>
	  </div>
	  
	  <div class="form-group">
	    <label class="sr-only" for=""></label>
	    <input type="text" class="form-control" name="mobile" id="title_search_id" placeholder="手机号码"/>
	  </div>
	  
	  <button type="button"  id="search_id" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>搜索</button>
	</form>		
		<a href="${ctx }/admin/addCustomer.jsp"  class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>新增</a>	
	
	<div style="margin-top:20px;">
		<table id="customer_table">
	
		</table>
	
	</div>
	</div>
	
		
	
	<script>
		$(function() {
			var grid = new jWei.Datagrid({
				renderTo : $("#customer_table"),
				tabWidth:"",
				fieldset:false,
				legendTitle:"会员列表",
				url : "../customer/pageList.do",
				colModels : [ 
				
				{
					name : "regDate",
					displayName : "注册时间",
				}, 
				{
					name : "customer_email",
					displayName : "邮箱地址",
				},
				
				{
					name : "customer_nickname",
					displayName : "昵称",
				},
				
				{
					name : "customer_password",
					displayName : "密码",
				},
				
				{
					name : "customer_mobile",
					displayName : "手机号码"
					
				},
				
				{
					name:"customer_id",
					displayName : "操作",
					handler:function(v,data,td,tr){
						var html = 	'<a id="edit_id" href="./editCustomer.jsp?id='+data.customer.id+'" data-id="'+v+'" title="编辑" target="_blank" style="margin-right:3px;"><span class="glyphicon glyphicon-edit"></span>编辑</a>';
						td.html(html);
					}
				}
				
				]
			});
			
			$("#search_id").click(function(){
				grid.search("search_form");
				return false;
			});
		 
			$('#title_search_id').bind('keypress',function(event){
	            if(event.keyCode == "13")    
	            {
	            	$("#search_id").trigger("click");
	            	return false;
	            }
	        });
		
		
		$("#customer_table").on("click",".del",function(){
				if (!confirm("确定要彻底删除该用户！")) {
					return;
				}
				var delObj = $(this);
				jQuery.ajax({
					type : 'Get',
					contentType : 'application/json',
					url : '../customer/del.do',
					data : {
						id : delObj.data("id")
					},
					dataType : 'json',
					success : function(data) {
						if (data.result) {
							window.top.jWei.Tips.success("删除数据成功");
							window.location.reload(true);
						} else {
							window.top.jWei.Tips.success(data.errorMsg);
						}
					},
					error : function(data) {
						
					}
				});
		});
		
	});

	</script>
</body>
</html>