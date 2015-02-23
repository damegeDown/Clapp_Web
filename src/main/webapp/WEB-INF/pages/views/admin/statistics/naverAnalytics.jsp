<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="sub-content">
  <div>
			<h3 class="contents-title floatL">${CommonCode.navigation }</h3>
			<div style="clear:both;"></div>
	</div>
	<div class="al-center">
		<h3>CLAPP Website 의 방문 / 유입 / 페이지 / 사용자환경 분석을 확인하실 수 있습니다.</h3>
		<h4 class="mar-10">아래 이미지를 클릭해 주시기 바랍니다.</h4>
		<a href="http://analytics.naver.com/summary/dashboard.html" target="new"><img src="${constextPath }/resources/images/analytics.png"></a>
	</div>
	
	<!-- <iframe src="http://analytics.naver.com/service/index.html" style="width:100%;height:700px"> -->	 
</div>

