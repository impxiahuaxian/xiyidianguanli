<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./common/header.jsp" %>
<body>
<%@ include file="./common/top.jsp"%>

<div class="container">
	<form class="form-inline" id="search_form" role="form" style="margin-bottom:20px;">
	  <div class="form-group">
	    <label class="sr-only" for="exampleInputEmail2"></label>
	    <select id="category_search_id" class="form-control" name="categoryId">
				<option value="">所有</option>
		</select>
	  </div>
	  
	  <div class="form-group">
	    <label class="sr-only" for=""></label>
	    <input type="text" class="form-control" name="title" id="title_search_id" placeholder="名称"/>
	  </div>
	  
	   
	  
	  <button type="button"  id="search_id" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>搜索</button>
	</form>		
			  
				
	<a href="${ctx }/admin/addClothes.jsp"  class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>新增</a>
	
	<div style="margin-top:20px;margin-bottom:20px;">
		<table id="clothes_table">
	
		</table>
	
	</div>
	</div>
	<script>
		$(function(){
			
			if("${user.status}" == 1){
				$(".nav-li").each(function(){
					$(this).show();
				});
				
			}
			$(".nav-li").each(function(){
				
				$(this).click(function(){
					$(".active").removeClass("active");
					$(this).addClass("active");
				});
			});
			//退出系统
			$('#a_logout').click(
				function(){
					if(!confirm("确定要退出系统!")){
						return;
					}
					jQuery.ajax({
						type : 'Get',
						contentType : 'application/json',
						url : '../admin/login/logout.do',
						dataType : 'json',
						success : function(obj) {
							if (obj.result)
								location.href = "./login.html";
						},
						error : function(data) {
							
						}
					});
				}		
			);
		});
	</script>
	
	<script>
		$(function() {
			var grid = new jWei.Datagrid({
				renderTo : $("#clothes_table"),
				tabWidth:"",
				fieldset:false,
				legendTitle:"商品列表",
				url : "../admin/clothes/pageList.do",
				colModels : [ 
				
				{
					name : "addDate",
					displayName : "最后更新时间",
				}, 
				{
					name : "clothes_name",
					displayName : "名称"
				},
				
				{
					name : "clothes_price",
					displayName : "价格"
				},
				
				{
					name:"clothes_id",
					displayName : "操作",
					handler:function(v,data,td,tr){
						var mark = data.clothes.mark;
						var str ="下架";
						if(mark == -1){
							str = '<span style="color:red;">上架</span>';
						}
						var html = 	'<a id="edit_id" href="./editClothes.jsp?id='+data.clothes.id+'" data-id="'+v+'" title="编辑" target="_blank" style="margin-right:3px;"><span class="glyphicon glyphicon-edit"></span>编辑</a>'+
							'<a id="del_id" href="#" class="del" data-id="'+data.clothes.id+'" title="删除"><span class="glyphicon glyphicon-trash"></span></a>'+
							'<a id="" href="#" class="off" data-id="'+data.clothes.id+'">'+str+'</a>';
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
			 
			$("#search_id").click(function(){
				grid.search("search_form_id");
			});
		});

		
		$("#clothes_table").on("click",".del",function(){
				if (!confirm("确定要彻底删除该商品！")) {
					return;
				}
				var delObj = $(this);
				jQuery.ajax({
					type : 'Get',
					contentType : 'application/json',
					url : '../admin/clothes/del.do',
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
		 
		$("#clothes_table").on("click",".off",function(){
			if (!confirm("确定要下架该商品！")) {
				return;
			}
			var that = $(this);
			var htm = $(this).html();
			
			var delObj = $(this);
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : '../admin/clothes/offShelf.do',
				data : {
					id : delObj.data("id")
				},
				dataType : 'json',
				success : function(data) {
					if (data.result) {
						window.top.jWei.Tips.success("操作成功");
						if(htm == '下架'){
							that.html('<span style="color:red;">上架</span>');
						}else{
							that.html('下架');
						}
						//grid.reload();
						//window.location.reload(true);
					} else {
						window.top.jWei.Tips.success(data.errorMsg);
					}
				},
				error : function(data) {
					
				}
			});
		});

	</script>
</body>
</html>