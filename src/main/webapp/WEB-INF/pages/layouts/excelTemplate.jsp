<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="excelName" value="${excelName}" />
<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("Cache-Control", "no-cache, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("returnURI", request.getRequestURI());
	response.setHeader("Content-Disposition", "attachment; filename=excel_" + pageContext.getAttribute("excelName") + ".xls");
	response.setHeader("Content-Description", "JSP Generated Data");
	response.setContentType("application/vnd.ms-excel");
%>
<style>
	table, div{font-family: 나눔고딕}
	th,td { border: 1px solid #666; text-align:center; padding:12px 0 13px; ;width:100%; verticall-align:middle}
</style>
<tiles:insertAttribute name="body" />