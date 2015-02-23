<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
$(function() {
	$(".id").watermark("아이디", {useNative: false});
	$(".password").watermark("비밀번호", {useNative: false});
	$(".loginBtn").click(function() {
		var adminId = $("input[name=adminId]").val();
		var adminPassword = $("input[name=adminPassword]").val();
		$.ajax({
			url : '/admin/doLogin' ,
			data : { adminId : adminId , adminPassword : adminPassword }, 
			type : 'post',
			dataType : 'json',
			success: function (result) {
				setCookie("memberChkGrant", "Y", 1);
				if (result.resultCode == 'success') { 
				  location.href = "${contextPath}/admin/main";
				}
			},
			fail : function() {
				  alert('error');
			}
		});
	});
	
	//로그인 실패시
	var result = "${resultCode}";
	if(result == "authFail") alert("로그인 후 이용해 주세요.");
});
</script>
<div class="login-area">
	<div class="login-bg">
		<div class="login-box">
			<h1 class="logo"><img src="${contextPath }/resources/images/clapp_logo.png" alt="clapp"/></h1>
			<p class="title">관리자 페이지</p>
			<div class="login-form">
				<form id="loginForm" method="post">
					<div class="marB5"><input type="text" class="inp-w240 id watermark" name="adminId" value="아이디"/></div>
					 <div><input type="password" class="inp-w240 password watermark" name="adminPassword" value="비밀번호"/></div>
					<div class="btn-area"><input type="submit" class="login loginBtn" value="로그인">11</div>
				</form>
			</div>
		</div> 
	</div>
</div>
