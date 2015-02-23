<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ contextPath }/resources/js/myClapp.js"></script>
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
<div class="subMyClappTitleContainer">
	<div class="subMyClappTitleBox">
		<div class="subMyClappTitleLine"></div>
		<span class="subMyClappTitle">회원탈퇴</span>
	</div>
</div> <!-- .subMyClappTitleContainer End -->
<div class="subMemberWdContentCmpContainer">
	<div class="subMemberWdContentCmpBox">
		<div class="sicCmpLeft">
			<img src="${contextPath }/resources/images/myclapp_out_warning.png" alt="회원탈퇴" />
		</div>
		<div class="sicCmpRight3">
			<p class="memberWithdrawalTitle">
				잠깐! CLAPP의 회원탈퇴를 하시게 되면,
			</p>
			<p class="sicCmpRightText3">
				<span class="dot"></span>지금까지 등록된 회원님의 모든 정보(개인정보 포함, 사이트 이용 및 유료내역, 잔여 티켓, 메일 수신여부 등)는<br />
				&nbsp;&nbsp;&nbsp;모두 삭제되며, 복구 및 로그인 하실 수 없습니다.<br />
			</p>
			<p class="sicCmpRightText3">
				<span class="dot"></span>추후 재가입 시, 동일한 아이디(이메일주소)로는 재가입이 불가능 합니다.  
			</p>
			<p class="sicCmpRightText3">
				<span class="dot"></span>탈퇴와 동시에 해당 계정을 대상으로 발송한 쿠폰 및 프로모션 혜택 또한 취소 됩니다.
			</p>
			<p class="sicCmpRightText3">
				<span class="dot"></span>탈퇴일시 기준 이전에 발송한 이메일은 취소되지 않으며, 이후부터는 발송되지 않습니다.
			</p>
		</div>
		<div class="subMemWdContentAgreeBox">
			<input id="sjaTermsAgree" class="sjaTermsAgree" type="checkbox" name="agree_term" value="term_agree" />
			<label for="sjaTermsAgree" class="subJoinAgreeText">위 내용에 모두 동의하며 회원 탈퇴를 합니다.</label>
			<p class="subMemWdMessage">
				위 내용의 동의가 있어야 회원탈퇴가 가능합니다
			</p>
		</div>
	</div>
</div> <!-- .subInquiryContentCmpContainer End -->

<div class="subPwChangeContentSendContainer">
	<div class="subInquiryContentSendBox">
		<img src="${contextPath }/resources/images/buttons_withdrawal.png"  onmouseover="this.src='${contextPath }/resources/images/buttons_withdrawal_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_withdrawal.png';" alt="CLAPP 탈퇴" onclick="doDropOut()"/>
	</div>
</div>
