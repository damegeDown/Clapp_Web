<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
	$(function() {
		$(".id").watermark("아이디", {
			useNative : false
		});
		$(".password").watermark("비밀번호", {
			useNative : false
		});
		$(".loginBtn").click(function() {
			var adminId = $("input[name=adminId]").val();
			var adminPassword = $("input[name=adminPassword]").val();
			if (!adminId) {
				alert("아이디를 입력해 주세요.");
				return false;
			} else if (!adminPassword) {
				alert("비밀번호를 입력해 주세요.");
				return false;
			}
			$.ajax({
				url : '/admin/doLogin',
				data : {
					adminId : adminId,
					adminPassword : adminPassword
				},
				type : 'post',
				dataType : 'json',
				success : function(result) {
					var referrer = document.referrer; //이전페이지 주소
					//로그인 성공시 이전 페이지 주소가 있을시 이동 
					if (result.resultCode == 'success') {
						/* if(referrer && referrer.indexOf("login") == -1) {
							location.href = referrer;
						} else { */
						location.href = "${contextPath}/admin/main";
						//}
					} else {
						alert(result.resultMSG);
						if (result.resultCode == 'noIp') {
							location.href = "${contextPath}/common/noIp";
						}
					}
				},
				fail : function() {
					alert('error');
				}
			});
		});
	});
	function Enter_Check(event) {
		if (window.event)
			e = window.event;
		if (event.keyCode == 13) {
			$(".loginBtn").click();
		}
	};
</script>
<div class="login-area" style="height: 100%">
	<div class="login-bg">
		<div class="login-box">
			<h1 class="logo">
				<img src="${contextPath }/resources/images/clapp_logo.png"
					alt="clapp" />
			</h1>
			<p class="title">관리자 페이지</p>
			<div class="login-form">
				<form id="loginForm" method="post">
					<div class="marB5">
						<input type="text" class="inp-w240 id watermark" name="adminId"
							placeholder="아이디" />
					</div>
					<div>
						<input type="password" class="inp-w240 password watermark"
							name="adminPassword" placeholder="비밀번호"
							onkeydown="Enter_Check(event)" />
					</div>
					<div class="btn-area">
						<a href="#" class="login loginBtn">로그인</a>
					</div>
					IP : <c:out value="${remoteIp }"/> 
					<%-- IP : <c:out value="${localIpAddress }"/> --%> 
				</form> 
			</div>
		</div>
	</div>
	<div class="textArea"
		style="text-align: center; padding: 20px 0 100px 0">
		<h3 style="margin-bottom: 5px">※본 관리자 접속 페이지는 권한이 승인된 담당자만 접근
			가능하며, 권한 승인 및 승격에 관한 부분은 아래 관리자에게 요청하시기 바랍니다.</h3>
		<h3>
			(CLAPP 관리자모드 운영 책임자  02-3460-8333 / <a
				href="mailto:support@clapp.co.kr?Subject=권한 승인 및 승격 문의"
				target="_top" style="text-decoration: underline;">support@clapp.co.kr</a>)
		</h3>
	</div>
</div>
