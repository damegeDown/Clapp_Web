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
    <meta charset="UTF-8" />
  <meta http-equiv="Content-Script-Type" content="text/javascript">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Testing Anywhere, CLAPP</title>
  <link rel="shotcut icon" href="${contextPath }/resources/images/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/clapp.style.css" />
  <link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/clapp.style_psy.css" />
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
  <script type="text/javascript" src="${contextPath }/resources/js/clapp.js"></script>
  <script>
  	var contextPath = "${contextPath }";
  </script>
    <script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript">
        if(!wcs_add) var wcs_add = {};
        wcs_add["wa"] = "5cdfd898d6ee64";
        wcs_do();
    </script>
    <google analytics>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-64056275-1', 'auto');
        ga('send', 'pageview');

    </script>
</head>
<body >
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>
