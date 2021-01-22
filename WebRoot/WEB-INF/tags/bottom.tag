<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx"><%=request.getContextPath()%></c:set>

<div style="border:1px solid #ccc;margin-top:40px;padding-top:24px;background-color: #fff;">
<div class="container" id="promise">
		<div class="row">
		  <div class="col-xs-4 col-md-4">
		    <div class="thumbnail" style="border: 0px;">
		      <img src="${ctx}/images/pc_bao_new.png" alt="...">
		      <div class="caption" align="center">
        		<h6 style="color:#666;">免费派送</h6>
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-xs-4 col-md-4">
		    <div class="thumbnail" style="border: 0px;">
		      <img src="${ctx}/images/pc_seven_new.png" alt="...">
		      <div class="caption" align="center">
        		<h6 style="color:#666;">7天无理由退款</h6> 
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-xs-4 col-md-4">
		    <div class="thumbnail" style="border: 0px;">
		      <img src="${ctx}/images/pc_pei_new.png" alt="...">
		      <div class="caption" align="center">
        		<h6 style="color:#666;">满意在付款</h6>
		      </div>
		    </div>
		  </div>
		  
		</div>
</div>
</div>

<div class="copyright" style="margin-top:20px;margin-bottom:0px;margin-left:auto;margin-right:auto; text-align: center;color:#666;font-size:12px;padding-bottom:20px;">
	<p>
		洁衣库 &nbsp; &nbsp;&nbsp;
	</p>
	<p>
		©&nbsp;<span></span>&nbsp;洁衣库&nbsp;版权所有&nbsp; 
		&nbsp;
	</p>
	
</div>

<div style="display: none;">
	<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?a1838a27f4332f5c3dd32ff236ba5e27";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
	
</div>
<script>
$(function(){
	
	$.get("${ctx}/cart/getCartNum.do",function(data){
		$(".topcart").html(data);
		$(".cart_num").html(data);
		if(data >0){ 
			$(".cart_nums").show().html(data);
		}else{
			$(".cart_nums").hide().html("");
		}
	});
	
	//获取待付款订单
	jQuery.ajax({
		type : 'Get',
		contentType : 'application/json',
		url : '${ctx}/order/getWaitPayTotalCount.do',
		cache:true,
		async:false,
		dataType : 'json',
		success : function(data) {
			if(data.result){
				if(data.obj){
					$("#wait_pay_order_id").show();
					$("#wait_pay_order_num_id").html(data.obj);	
				}
			}
		}
	});
});
</script>

