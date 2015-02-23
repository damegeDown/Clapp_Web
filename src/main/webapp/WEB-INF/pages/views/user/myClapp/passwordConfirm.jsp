<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<form id="confirmPassForm" action="${contextPath }/myClapp/rest/doPasswordConfirm" onsubmit="return false" method="post">
<%@ include file="/WEB-INF/pages/views/user/myClapp/inc/incSubMenu.jsp"%>
<div class="subInquiryContentCmpContainer2">
	<div class="subInquiryContentPwConfirmBox">
		<span class="sicPassConfirmTitle">비밀번호 재확인</span>
		<p class="sicPassConfirmText">
			안전한 클앱 사용을 위해, 이메일과 비밀번호를 다시 한번 입력해 주시기 바랍니다.
		</p>
		<input type="password" class="sicPw" placeholder="비밀번호 입력" name="userPassword" data-name="비밀번호"/>
		<span class="sicPwAlert">정확한 비밀번호를 입력해주세요</span>
	</div>
</div> <!-- .subInquiryContentCmpContainer End -->

<div class="subInquiryContentSendContainer">
	<div class="subInquiryContentSendBox">
		<input type="image" src="${contextPath }/resources/images/buttons_confirm.png"  class="submitBtn"
			onMouseOver="this.src='${contextPath }/resources/images/buttons_confirm_r.png';" 
			onMouseOut="this.src='${contextPath }/resources/images/buttons_confirm.png';" 
			alt="확인" 
			data-action="${contextPath }/myClapp/rest/doPasswordConfirm"
			data-msg="" data-flag="off"
			/>
	</div>
</div>
</form>