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
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->

<div class="subMyClappMenuContainer">
	<div class="subMyClappMenuBox">
		<ul class="subMyClappMenu">
			<li class="myClappMenuLi "><a href="${contextPath }/myClapp/myTicket">이용 현황</a></li>
			<li class="myClappMenuLi "><a href="${contextPath }/myClapp/myHistory">티켓 적립/차감</a></li>
			<li class="myClappMenuLi " ><a href="${contextPath }/myClapp/myPayment">결제 내역</a></li>
			<li class="myClappMenuLi myClappMenuActive"><a href="${contextPath }/myClapp/myInquiry">1:1 문의</a></li>
			<li class="myClappMenuLi mcmLastRightLine"><a href="${contextPath }/myClapp/myInfo">정보 수정·확인</a></li>
		</ul>
	</div>
</div> <!-- .subMyClappMenuContainer End -->
<div class="subInquiryContentCmpContainer">
	<div class="subInquiryContentCmpBox">
		<div class="sicCmpLeft">
			<img src="${contextPath }/resources/images/myclapp_inquire_complete.png" alt="문의완료" />
		</div>
		<div class="sicCmpRight">
			<p class="sicCmpRightText">
				서비스 문의가 정상적으로 접수되었으며,<br />
				담당자가 확인 후 회신 드리겠습니다.<br />
				감사합니다.
			</p>
		</div>
	</div>
</div> <!-- .subInquiryContentCmpContainer End -->

<div class="subInquiryContentSendContainer">
	<div class="subInquiryContentSendBox">
		<a href="/">
			<img src="${contextPath }/resources/images/buttons_main.png" alt="메인으로" />
		</a>
	</div>
</div>