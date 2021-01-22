window.categoryId = 0;
		window.brandsId = 0;
		$(function() {
			//获取上架分类
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : './category/getAlllAddOn.do',
				cache:true,
				async:false,
				data : {
				},
				dataType : 'json',
				success : function(data) {
					if (data.result) {
						var categoryList = data.obj;
						if(categoryList){
							var html = "";
							for(var i = 0 ;i<categoryList.length;i++){
								var category = categoryList[i];
								if(category)
									var dd = '<dd><a href="#" data-categoryId="'+category.id+'" id="a_id">'+category.name+'</a></dd>';
									html = html+dd;
							}
							$("#category_id").append(html);
							$("#category_id").find("[id='a_id']").click(function(){
								window.categoryId = $(this).attr("data-categoryId");
								init(1);
								$("#category_id").find(".current").each(function(){
									$(this).removeClass("current");
								});
								$(this).addClass("current");
								return false;
							});
						}
						
					} else {
						//alert('数据库异常,查询数据失败');
					}
				},
				error : function(data) {
				}
			});	
			
			//获取上架品牌
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : './brands/getAlllAddOn.do',
				cache:true,
				async:false,
				data : {
				},
				dataType : 'json',
				success : function(data) {
					if (data.result) {
						var brandsList = data.obj;
						if(brandsList){
							var html = "";
							for(var i = 0 ;i<brandsList.length;i++){
								var brands = brandsList[i];
								if(brands)
									var dd = '<dd><a href="#" data-brandsId="'+brands.id+'"  id="a_brands_id">'+brands.name+'</a></dd>';
									html = html+dd;
							}
							$("#brands_id").append(html);
							$("#brands_id").find("[id='a_brands_id']").click(function(){
								window.brandsId = $(this).attr("data-brandsId");
								init(1);
								$("#brands_id").find(".current").each(function(){
									$(this).removeClass("current");
								});
								$(this).addClass("current");
								return false;
							});
						}
						
					} else {
						//alert('数据库异常,查询数据失败');
					}
				},
				error : function(data) {
				}
			});	
			
			//绑定搜索按钮
			$(".wg_btn_search").click(function(){
				init(1);
			});
			
			 $(".search-input").bind('keypress',function(event){
		            if(event.keyCode == "13")    
		            {
		            	$(".wg_btn_search").trigger("click");
		            	return false;
		            }
			 });
			
			//绑定分类不限按钮
			$("#no_limit").click(function(){
				window.categoryId = 0;
				init(1);
				$("#category_id").find(".current").each(function(){
					$(this).removeClass("current");
				});
				$(this).addClass("current");
				return false;
			});
			//绑定品牌不限按钮
			$("#no_brands_limit").click(function(){
				window.brandsId = 0;
				init(1);
				$("#brands_id").find(".current").each(function(){
					$(this).removeClass("current");
				});
				$(this).addClass("current");
				return false;
			});
			
			init(1);
			
			 
			
			
		});
		//默认加载  
		function init(pagenumber) {
			var timer;
			jQuery.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : './goods/goodsList.do',
				async:false,
				data : {
					currPage : pagenumber,
					categoryId:window.categoryId,
					brandsId:window.brandsId,
					title:$(".search-input").val()
				},
				dataType : 'json',
				success : function(data) {
					if (data.result) {
						$("#pager").pager({
							pagenumber : pagenumber,
							pagecount : data.obj.totalPage,
							buttonClickCallback : PageClick
						});
						
						//分页清空数据
						clearTimeout(timer);
						$("#goods_ul_model_id").html("");
						var html = "";
						var goodsList = data.obj.goodsList;
						if (goodsList) {
							 
							  for(var i = 	0 ;i<goodsList.length;i++){
								    var goods = goodsList[i];
								    
									var imgHtml = '<img id="pic1" src="./images/loading.gif" data-original="./upload/download.do?fileName='+goods.picName+'" class="lazy-img imgloading"  style="max-width:285px;max-height:192px;"/>';
									var initHtml = '<li class="J_dealbox deal-box">'+
										'<div class="inner-box">'+
											'<h3><a href="./detail.jsp?goodsId='+goods.id+'" title="" target="_blank"  id="title_a_id">'+goods.title+'&nbsp;&nbsp;&nbsp;(全国包邮)</a></h3>'+
											'<div class="pic"> '+
												'<div class="box-pic">'+
													'<a href="./detail.jsp?goodsId='+goods.id+'"  target="_blank"  id="img_a_id">'+imgHtml+
													'</a> '+
												'</div>'+
											'</div>'+
										'<div class="buy-mask"></div>'+
										'<div class="buy-state clearfix"> <span class="orig-price">原价<del id="price_id">'+goods.price+'元</del></span> <span class="orig-price">折扣 <strong id="discount_id">'+goods.discount/10+'</strong>折</span> <span class="buy-ed"><strong id="buyNum_id">'+goods.buyNum+'</strong>人已购买</span> </div>'+
										'<a target="_blank" href="./detail.jsp?goodsId='+goods.id+'" class="buy-action clearfix"  id="look_detail_id"> <span class="price J_MorePrice" ><em>￥</em><span id="dis_price_id">'+Math.floor(goods.price*goods.discount/100)+'</span></span> <b class=""></b> </a> </div>'+
										'</li>';
							  
								 html = html +initHtml;
								  
							  }
						}
						
						$("#goods_ul_model_id").html(html);
						
						var n = 1;
						timer = setTimeout(function(){
							$(".imgloading").each(function(){
								if(this.src.indexOf("loading.gif") != -1){
									this.src = $(this).data("original");
									n++;
									if(n>9){
										return false;
									}
								}
							}
							);
						},50);
						
						$(".lazy-img").lazyload();
						$("#pagebottom").html($("#pager").clone(true));
					}

					else {
						
					}
				},
				error : function(data) {
					
				}
			});
		}

		//回调函数  
		PageClick = function(pageclickednumber) {
			init(pageclickednumber);
		};