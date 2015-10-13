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
<!DOCTYPE HTML>
<HTML><HEAD><TITLE>Testing Anywhere, CLAPP</TITLE>
    <META content="text/html; charset=ks_c_5601-1987" http-equiv=Content-Type>
    <STYLE type=text/css>
        a, td { color: #444444; font-family: "gulim"; font-size: 12px; }
        a:link, a:visited, a:active { color: #444444; text-decoration: none; }
        a:hover { color: #fe8500; text-decoration: underline; }
        img {display: block;}
    </STYLE>
</HEAD>
<BODY>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F5F7">
    <tr>
        <td><img src="$contextPath/resources/images/ecrm_top.png" alt="" width="700" height="80" usemap="#Map"/></td>
    </tr>
	<tiles:insertAttribute name="body" />
    <tr>
        <td><img src="$contextPath/resources/images/ecrm_bottom.png" alt="" width="700" height="312" usemap="#Map2"/></td>
    </tr>
</table>

<map name="Map">
    <area shape="rect" coords="2,2,196,79" href="http://www.clapp.co.kr" target="_blank">
    <area shape="rect" coords="426,36,488,79" href="http://www.clapp.co.kr" target="_blank">
    <area shape="rect" coords="618,38,698,79" href="http://www.clapp.co.kr/introduction/supportCustomerList" target="_blank">
    <area shape="rect" coords="486,37,554,80" href="http://www.clapp.co.kr/myClapp/myTicket" target="_blank">
    <area shape="rect" coords="553,38,619,79" href="http://www.clapp.co.kr/product/productList" target="_blank">
</map>

<map name="Map2">
    <area shape="rect" coords="19,25,351,119" href="http://www.clapp.co.kr/serviceinfo/infoMain" target="_blank">
    <area shape="rect" coords="350,26,683,119" href="http://www.clapp.co.kr/product/productList" target="_blank">
    <area shape="rect" coords="2,137,156,310" href="http://www.clapp.co.kr" target="_blank">
    <area shape="rect" coords="155,137,698,222" href="http://www.clapp.co.kr/introduction/supportCustomerList" target="_blank">
</map>
</BODY></HTML>
