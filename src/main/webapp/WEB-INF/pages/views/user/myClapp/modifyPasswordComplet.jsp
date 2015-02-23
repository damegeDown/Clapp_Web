<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="subJoinGnbBottomContainer">
		<div class="subJoinGnbBottomBg">
			<div class="subJoinGnbBottomBox">
				<div class="subJoinGnbBottom">
					<span class="subJoinTitle">마이 클앱</span>
				</div>
				<div class="subStartBox">
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->
<%@ include file="/WEB-INF/pages/views/user/myClapp/inc/incSubMenu.jsp"%>
<div class="subPwChangeContentCmpContainer">
	<div class="subPwChangeContentCmpBox">
		<div class="sicCmpLeft">
			<img src="${contextPath }/resources/images/myclapp_complete.png" alt="비밀번호 변경 완료" />
		</div>
		<div class="sicCmpRight2">
			<p class="sicCmpRightText2">
				비밀번호 변경이 정상적으로 처리되었습니다.<br />
				변경된 비밀번호로 재 로그인을 해주시기 바랍니다.<br />
			</p>
		</div>
	</div>
</div> <!-- .subInquiryContentCmpContainer End -->

<div class="subPwChangeContentSendContainer">
	<div class="subInquiryContentSendBox">
		<a href="${contextPath }/members/login">
			<img src="${contextPath }/resources/images/buttons_login.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_login_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_login.png';" alt="로그인" />
		</a>
	</div>
</div>
