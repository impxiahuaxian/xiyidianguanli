$(function() {
	var formatArr = [ "size", "color", "name", "addr", "mobile" ];
	var id = $.request.queryString["goodsId"];
	$("#goodsId").val(id);
	var valid = new jValidation.Validation('form_id', {
		immediate : true,
		onElementValidateForAjax : function(elm) {
			// 判断该元素是否为验证码输入框
			if ($(elm).attr("id") == 'validateCode') {
				var code = $("#validateCode").val();
				return validateCode(code);
			}
		}
	}

	);

	function validateCode(code) {
		var result = new jValidation.ajax.Result();
		jQuery.ajax({
			type : 'Get',
			contentType : 'application/json',
			url : './order/validateCode.do',
			dataType : 'json',
			async : false,
			data : {
				code : code
			},
			success : function(data) {
				if (!data.result) {
					result.setResult(false);
					result.setErrorMsg(data.errorMsg);
				} else {
					result.setResult(true);
				}
			},
			error : function(data) {
				result.setResult(false);
				result.setErrorMsg("服务器繁忙，请您稍后再试！");
			}
		});
		return result;

	}

	jQuery.ajax({
		type : 'Get',
		contentType : 'application/json',
		url : './goods/get.do',
		data : {
			id : id
		},
		dataType : 'json',
		async:false,
		success : function(data) {
			if (data.result) {
				var goods = data.obj.goods;
				$("#goods_name").html(goods.title);
				var price = goods.price;
				var discount = goods.discount;
				var now_price = Math.floor(price * discount / 100);
				$("#popup_price").html(now_price);
				if(data.obj.sizeList){
					var html = '<option value="">尺码选择</option>';
					for(var i = 0 ;i<data.obj.sizeList.length;i++){
						var size = data.obj.sizeList[i].size;
						html = html + '<option value="'+size+'">'+size+'</option>';
						$("#size").html(html);
					}
				}
				
				if(data.obj.colorList){
					var html = '<option value="">颜色选择</option>';
					for(var i = 0 ;i<data.obj.colorList.length;i++){
						var color = data.obj.colorList[i].color;
						html = html + '<option value="'+color+'">'+color+'</option>';
						$("#color").html(html);
					}
				}
			} else {
				alert('数据库异常,查询数据失败');
			}
		},
		error : function(data) {
			// alert("error")
		}
	});

	$("#gen_code_a").click(function() {
		$("#gen_code_img").attr("src", "./order/genCode.do?t=_" + $.now());
		return false;
	});
	$("#buy_btn_id").click(function() {
		var result = valid.validate();
		if (!result) {
			return;
		}

		for ( var i = 0; i < formatArr.length; i++) {
			$("#popup_" + formatArr[i]).html($("#" + formatArr[i]).val());
		}
		$("#popup_goods_name").html($("#goods_name").html());
		var addr = $("#province_sel").val().split("|")[1]+$("#city_sel").val().split("|")[1]+$("#area_sel").val().split("|")[1]+$("#street").val();
		$("#addr_hedui").html(addr);
		jWei.popUp({
			popUpId : "order_confirm_id",
			title : "核对订单",
			width : "600px",
			ok : function() {
				$(".btn-danger").html("提交中...");
				$(".btn-danger").prop("disabled", true);
				var postData = $("#form_id").serialize();
				$.ajax({
					type : "POST",
					url : "./order/add.do",
					data : postData,
					dataType : "json",
					success : function(data) {
						if (data.result) {
							window.location.replace("./success.jsp");
						} else {
							alert("系统繁忙，请您稍后再试！");
						}
					},
					error : function(data) {
						alert("系统繁忙，请您稍后再试！");
					}
				});
			}
		});
	});
	
	jQuery.ajax({
		type : 'Get',
		contentType : 'application/json',
		url : './address/getAll.do',
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
			url : './address/getByProvincecode.do',
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
			url : './address/getByCitycode.do',
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
});