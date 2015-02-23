<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("Cache-Control", "no-cache, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("returnURI", request.getRequestURI());
	response.setContentType("text/html; charset=UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>error</title>
</head>
<body>
<script> 
	var contextPath = "${contextPath}";
	jQuery(document).ready(function($) {
		if ('${resultCode}' == 'authFail') {
			alert("로그인 후 이용해 주세요.");
			//parent.location.reload();
		} else if ('${resultCode}' == "grantFail") {
			alert("권한이 없습니다.");
		}
		if ('${redirect}' == "back") {
			history.back();
		} else if ('${redirect}' == "login") {
			if('${isAdmin}' == 1) {
				location.href = contextPath+"/admin/login";
			} else {
				location.href = contextPath+"/members/login";
			}
		}
	});
</script>
</body>
</html>
