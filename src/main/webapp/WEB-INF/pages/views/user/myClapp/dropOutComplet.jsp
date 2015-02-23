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
<div class="subMemberWdCmpContentContainer">
			<div class="subMemberWdCmpCompleteBox">
				<div class="subJoinMemberCompleteLogoBox"></div>
				<div class="subJoinMemberCompleteLine"></div>
				<div class="subJoinMemberCompleteArticleBox">
					<div class="subMemberWdCmpCompleteArticle">
						<p class="memberMessage">
							회원 탈퇴가 완료되었습니다.
						</p>
						<p class="memberMessage2">
							그동안 클앱을 이용해 주셔서 대단히 감사드립니다.
						</p>
						<p class="memberMessage3">
							다시 뵐 수 있기를 바라며, 고객님의 성공을 기원합니다!
						</p>
					</div>
				</div>
			</div>
		</div> <!-- .subJoinMemberCompleteContainer End -->
		
		<div class="subPwChangeContentSendContainer">
			<div class="subInquiryContentSendBox">
				<a href="/">
					<img src="${contextPath }/resources/images/buttons_main.png"  onmouseover="this.src='${contextPath }/resources/images/buttons_main_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_main.png';" alt="메인으로" />
				</a>
			</div>
		</div>
