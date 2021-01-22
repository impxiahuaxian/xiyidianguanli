var id = $.request.queryString["goodsId"];
//获取评论信息
function getComments() {
	var aMsg = [ "", "很不满意|差得太离谱，与卖家描述的严重不符，非常不满", "不满意|部分有破损，与卖家描述的不符，不满意",
			"一般|质量一般，没有卖家描述的那么好", "满意|质量不错，与卖家描述的基本一致，还是挺满意的",
			"非常满意|质量非常好，与卖家描述的完全一致，非常满意" ];

	jQuery
			.ajax({
				type : 'Get',
				contentType : 'application/json',
				url : './comment/getByGoodsId.do',
				data : {
					goodsId : id
				},
				dataType : 'json',
				success : function(data) {
					if (data.result) {
						var voList = data.obj.commentVOList;
						var html = '<div class="rate-item">'
								+ $("#comment_model_id").html() + '</div>';
						for ( var i = 0; i < voList.length; i++) {
							var comment = voList[i].comment;
							var newDiv = $("#comment_model_id").before(html)
									.prev();
							newDiv.find(".name").html(comment.username);
							newDiv.find(".txt").html(comment.content);
							newDiv.find(".time").html(voList[i].updateDate);
							var grade = comment.grade;
							newDiv.find("#grade_id").html(grade + "分");
							newDiv.find("#star_des_id").text(aMsg[grade]);
							for ( var j = 1; j <= grade; j++) {
								newDiv.find("#li_" + j).addClass("on");
							}
						}
						if (voList.length == 0) {
							var html = '<div style="margin-top:20px;color:#666;font-size:14px;" align="center">该商品暂时没有评论信息！</div>';
							$("#comment_id").html(html);
						}
					} else {
						var html = '<div style="margin-top:20px;color:#666;font-size:14px;" align="center">加载评论信息失败！</div>';
						$("#comment_id").html(html);
					}
				},
				error : function(data) {
					var html = '<div style="margin-top:20px;color:#666;font-size:14px;" align="center">加载评论信息失败！</div>';
					$("#comment_id").html(html);
				}
			});
}
jQuery
		.ajax({
			type : 'Get',
			contentType : 'application/json',
			url : './goods/get.do',
			data : {
				id : id
			},
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					var goods = data.obj.goods;
					$("#goods_title_id").html(goods.title + "(全国包邮)");
					var price = goods.price;
					var discount = goods.discount;
					var now_price = Math.floor(price * discount / 100);
					$("#now_price_id").html("<em>¥</em>" + now_price);
					$("#now_price_id1").html("<em>¥</em>" + now_price);
					$("#price_id").html(" ¥" + price);
					$("#price_id1").html(" ¥" + price);
					$("#discount_id").html(discount / 10);
					$("#content_id").html(goods.content);

					$("#discount_id1").html(discount / 10);
					$("#save_price_id").html(" ¥" + (price - now_price));
					$("#save_price_id1").html(" ¥" + (price - now_price));
					$("#buyNum_id").html(goods.buyNum);
					$("#picName_id").attr("src",
							"./upload/download.do?fileName=" + goods.picName);
					$("#team_buy_id").attr("href",
							"./order.jsp?goodsId=" + goods.id);
					$("#team_buy_id1").attr("href",
							"./order.jsp?goodsId=" + goods.id);
					$("#team_buy_id2").attr("href",
							"./order.jsp?goodsId=" + goods.id);
					var picList = data.obj.picList;
					if (picList) {
						for ( var i = 0; i < picList.length; i++) {

							var img_html = ' <img alt="" src="./upload/download.do?fileName='
									+ picList[i].name + '"/>';
							$("#sub_img_id").before(img_html);
						}
					}
				} else {
					alert('数据库异常,查询数据失败');
				}
			},
			error : function(data) {
				//alert("error")
			}
		});

//默认加载  
function init(pagenumber) {

	jQuery.ajax({
		type : 'Get',
		contentType : 'application/json',
		url : './goods/goodsList.do',
		data : {
			currPage : pagenumber
		},
		dataType : 'json',
		success : function(data) {
			if (data.result) {
				var initHtml = $("#li_modle_id").html();
				initHtml = '<li>' + initHtml + '</li>';
				var goodsList = data.obj.goodsList;

				if (goodsList) {
					var n = 0;
					for ( var i = 0; i < 21; i++) {
						var goods = goodsList[i];
						if ($.request.queryString["goodsId"] != goods.id) {
							var price = goods.price;
							var discount = goods.discount;
							var now_price = Math.floor(price * discount / 100);
							var newGoods = $("#li_modle_id").before(initHtml)
									.prev();
							newGoods.find("#wrap_id").attr("href",
									"./detail.jsp?goodsId=" + goods.id);
							newGoods.find("#other_img_id").attr(
									"src",
									"./upload/download.do?fileName="
											+ goods.picName);
							newGoods.find("#other_real_price_id").html(
									goods.price + "元");
							newGoods.find("#other_now_price_id").html(
									now_price + "元");
							newGoods.find("#other_buy_num_id").html(
									goods.buyNum);
							n++;
							newGoods.find("#other_title_id").html(
									n + "、" + goods.title);
							newGoods.find("#other_title_id").attr("title",
									goods.title);
							newGoods.find("#other_title_id").attr("href",
									"./detail.jsp?goodsId=" + goods.id);
							newGoods.find("#go_look_id").attr("href",
									"./detail.jsp?goodsId=" + goods.id);
						}
					}
				}
			}

			else {

			}
		},
		error : function(data) {

		}
	});
}

$(function() {
	var goodsTabTop = $("#goods_tab_div").offset().top;

	window.onscroll = function() {
		var winScroll = document.documentElement.scrollTop
				|| document.body.scrollTop;
		if (winScroll > goodsTabTop) {
			$("#goods_tab_div").css({
				position : 'fixed',
				zIndex : 9999,
				top : 0
			});
		} else {
			$("#goods_tab_div").css({
				position : 'static'
			});
		}
	};
	init(1);

	$(".tab li a").each(function() {

		$(this).click(function() {
			var current = $(".tab").find(".current");
			current.removeClass("current");
			current.addClass("nocurrent");
			$(this).addClass("current");
			$(this).removeClass("nocurrent");
			if ($(this).attr("id") == 'comment_a') {
				$("#comment_id").show();
				$("#goods_detail_id").hide();
				if ($(this).attr("data-load") == "false") {
					getComments();
					$(this).attr("data-load", "true");
				}

			} else {
				$("#comment_id").hide();
				$("#goods_detail_id").show();
			}
			if (document.documentElement.scrollTop)
				document.documentElement.scrollTop = goodsTabTop + 1;
			if (document.body.scrollTop)
				document.body.scrollTop = goodsTabTop + 1;
			return false;
		});
	});
});