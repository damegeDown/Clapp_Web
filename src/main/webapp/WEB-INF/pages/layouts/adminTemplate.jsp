<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding( "UTF-8" );
  response.setHeader( "Cache-Control", "no-cache, must-revalidate" );
  response.setHeader( "Pragma", "no-cache" );
  response.setDateHeader( "Expires", 0 );
  response.setHeader( "returnURI", request.getRequestURI() );
  response.setContentType( "text/html; charset=UTF-8" );
%>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript"> 
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Testing Anywhere, CLAPP</title>
	<link rel="shotcut icon" href="${contextPath }/resources/images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/admin.css"/> 
	<link rel="stylesheet" href="${contextPath }/resources/css/jquery/jquery-ui.min-1.11.2.css">
	<link rel="stylesheet" href="${contextPath }/resources/css/jquery/jquery.datetimepicker.css">
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery-ui.min-1.11.2.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery.datetimepicker.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery.blockUI.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery.datePicker.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery.monthpicker.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery.watermark.min.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/common.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
		var contextPath = "${contextPath}";
	</script>
</head>
<body>
	<div id="wrap-area">
		<div id="left-wrap">
		  <tiles:insertAttribute name="left"/>
		</div>
		<div id="right-wrap">
			<div class="top-gnb">
				<tiles:insertAttribute name="header"/>
			</div>
			<div class="contents">
				<tiles:insertAttribute name="body"/>
			</div>
		</div>
	</div>
</body>
</html>
