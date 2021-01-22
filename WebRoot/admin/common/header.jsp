<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<c:set var="ctx"><%=request.getContextPath()%></c:set>
		<link href="${ctx }/styles/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="${ctx }/styles/back/wei.css" rel="stylesheet" type="text/css" />
		<link href="${ctx }/styles/showLoading/css/showLoading.css" rel="stylesheet" type="text/css" />
		<link href="${ctx }/styles/uploadify.css" rel="stylesheet" type="text/css" />
		<link href="${ctx }/styles/magnific-popup.css" rel="stylesheet" type="text/css" />
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    	<!--[if lt IE 9]>
	   		<script src="${ctx}/js/bootstrap/respond.min.js"></script>
			<script src="${ctx}/js/bootstrap/html5shiv.min.js"></script>
    	<![endif]-->
		
		<script src="${ctx }/js/jquery1.9.1.js" type="text/javascript"></script>
		<script src="${ctx }/js/jquery.pager.js" type="text/javascript"></script>
		<script src="${ctx }/js/validation/back/validation.js" type="text/javascript"></script>
		<script src="${ctx }/js/wei.js?t_20140111" type="text/javascript"></script>
		<script src="${ctx }/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
		<script src="${ctx }/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<script src="${ctx }/js/showLoading/jquery.showLoading.min.js" type="text/javascript"></script>
		<script src="${ctx }/js/urlParams.js" type="text/javascript"></script>
		<script src="${ctx }/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
		<script language="javascript" type="text/javascript">  
    		//防止客户端缓存文件，造成uploadify.js不更新，而引起的“喔唷，崩溃啦”  
   			document.write("<script type='text/javascript' "  
           		+ "src='${ctx}/js/jquery.uploadify.js?" + $.now()  
           		+ "'></s" + "cript>");  
		</script> 
		
		<style>
			.container{
				width:98%;
			}
			.table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th {
				background-color: #fefbda;
			}
		</style>
	</head>
	
	<body>
	
	</body>
</html>
