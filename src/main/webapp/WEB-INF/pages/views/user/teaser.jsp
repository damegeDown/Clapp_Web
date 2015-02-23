<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("Cache-Control", "no-cache, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("returnURI", request.getRequestURI());
	response.setContentType("text/html; charset=UTF-8");
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shotcut icon" href="${contextPath }/resources/images/favicon.ico" type="image/x-icon" />
<title>Testing Anywhere, CLAPP</title>
</head>

<body bgcolor="#4f4b4a">
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="1903" height="964" scope="col"><table width="1903" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th scope="col"><img src="${contextPath }/resources/images/main_20150216.png" width="977" height="699"></th>
      </tr>
    </table></th>
  </tr>
</table>
</body>
</html>
