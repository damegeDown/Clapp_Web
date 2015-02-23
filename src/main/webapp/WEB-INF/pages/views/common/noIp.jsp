<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="sub-content" style="padding:10px">
    <div class="textArea"style="text-align:center; padding-top:200px;font-size:16px;color:#585858">
      <img src="${contextPath }/resources/images/clappLogo.png" alt="clapp"/>
       <h3 style="margin:20px 0 10px 0">※본 관리자 접속 페이지는 권힌이 승인된 담당자 및 IP만 접근 가능합니다. </h3>
      <h3><span class="sec">5</span>초 후 CLAPP 사이트로 자동 이동 합니다.</h3>
	</div> 
</div>

<script>

var ChangeSec = (function() {
	setInterval("ChangeSec.change()",1000);
	var i = 5;
	var change = function() {
		if(i == 0) {
			ChangeSec.goUrl();
		}
		$(".sec").text(i--);
	};
	var goUrl = function() {
		location.href="/";		
	};
	return {
		change : change,
		goUrl : goUrl
	}
})($)
</script>