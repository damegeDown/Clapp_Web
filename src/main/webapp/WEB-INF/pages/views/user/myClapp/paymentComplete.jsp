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
					<span class="subJoinTitle">결제</span>
				</div>
				<div class="subStartBox">
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->
<div class="subPGCompleteOneContainer">
	<div class="subPGCOCBg">
		<div class="subPGCOCBox">
			<div class="subPGCOCCont01">
				<div class="subPGCOCCont01Box">
					<div class="subPGCOCCont01TitBox">
						<div class="subPGCOCCont01Tit">
							<span>결제 정보</span>
						</div>
					</div>
					<div class="subPGCOCCont01TxtBox01">
						<div class="subPGCOCCont01TxtBox01Tit">
							<span>상품명</span>
						</div>
						<div class="subPGCOCCont01TxtBox01Cont">
							<span>${paymentInfo.paymentProductName }</span>
						</div>
					</div>
					<div class="subPGCOCCont01TxtBox02">
						<div class="subPGCOCCont01TxtBox02Tit">
							<span>결제금액</span>
						</div>
						<div class="subPGCOCCont01TxtBox02Cont">
							<span>￦ <fmt:formatNumber value="${paymentInfo.paymentTotalPrice }"/></span>
						</div>
					</div>
					<div class="subPGCOCCont01TxtBox03">
						<div class="subPGCOCCont01TxtBox03Tit">
							<span>사용시간</span>
						</div>
						<div class="subPGCOCCont01TxtBox03Cont">
							<span>${paymentInfo.paymentUseTime }시간 ( ${paymentInfo.paymentTicketAmount }티켓 제공 )</span>
						</div>
					</div>
					<c:choose>
						<c:when test="${paymentInfo.paymentType ne 'SC0040'}">
							<div class="subPGCOCCont01TxtBox04">
								<div class="subPGCOCCont01TxtBox04Tit">
									<span>결제일시</span>
								</div>
								<div class="subPGCOCCont01TxtBox04Cont">
									<span><fmt:formatDate value="${paymentInfo.paymentDate }" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></span>
								</div>
							</div>
							<div class="subPGCOCCont01TxtBox05">
								<div class="subPGCOCCont01TxtBox05Tit">
									<span>결제수단</span>
								</div>
								<div class="subPGCOCCont01TxtBox05Cont">
									<span>${paymentInfo.paymentTypeText }</span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="subPGCOCCont01TxtBox05">
								<div class="subPGCOCCont01TxtBox05Tit">
									<span>결제수단</span>
								</div>
								<div class="subPGCOCCont01TxtBox05Cont">
									<span>${paymentInfo.paymentTypeText }</span>
								</div>
							</div>
							<div class="subPGCOCCont01TxtBox05">
								<div class="subPGCOCCont01TxtBox05Tit">
									<span>입금은행</span>
								</div>
								<div class="subPGCOCCont01TxtBox05Cont">
									<span>${paymentInfo.financeName}(${paymentInfo.accountNum })</span>
								</div> 
							</div>
							<div class="subPGCOCCont01TxtBox05">
								<div class="subPGCOCCont01TxtBox05Tit">
									<span>입금자명</span>
								</div>
								<div class="subPGCOCCont01TxtBox05Cont">
									<span>${paymentInfo.buyer } </span>
								</div>
							</div>
							<div class="subPGCOCCont01TxtBox05">
								<div class="subPGCOCCont01TxtBox05Tit">
									<span>입금기한</span>
								</div>
								<div class="subPGCOCCont01TxtBox05Cont">
									<span>${paymentInfo.paymentTypeText }</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div><!-- subPGCOCCont01Box End -->
			
			<div class="subPGCOCCont02">
				<div class="subPGCOCCont02Box">
					<div class="subPGCOCCont02TitBox">
						<div class="subPGCOCCont02Tit">
							<span>구매자 정보</span>
						</div>
					</div>
					<div class="subPGCOCCont02TxtBox01">
						<div class="subPGCOCCont02TxtBox01Tit">
							<span>아이디</span>
						</div>
						<div class="subPGCOCCont02TxtBox01Cont">
							<span>${memberInfo.userId }</span>
						</div>
					</div>
					<div class="subPGCOCCont02TxtBox02">
						<div class="subPGCOCCont02TxtBox02Tit">
							<span>이름</span>
						</div>
						<div class="subPGCOCCont02TxtBox02Cont">
							<span>${memberInfo.userName }</span>
						</div>
					</div>
					<div class="subPGCOCCont02TxtBox03">
						<div class="subPGCOCCont02TxtBox03Tit">
							<span>연락처</span>
						</div>
						<div class="subPGCOCCont02TxtBox03Cont">
							<p>
								${memberInfo.userCellPhoneNumber }
							</p>
						</div>
					</div>
				</div><!-- subPGCOCCont02 End -->
			</div><!-- .subPGCOCCont02Box Emd -->

		</div><!-- .subPGCOCBox End -->
	</div><!-- .subPGCOCBg End -->
<div style="clear:both"></div>
</div><!-- .subPGCompleteOneContainer End -->
<div class="subPGCompleteTwoContainer">
	<div class="subPGCTCBg">
		<div class="subPGCTCBox">
			<div class="subPGCTCTextBox" style="text-align:center">
					<c:choose>
						<c:when test="${paymentInfo.paymentType ne 'SC0040'}">
							<h3>결제가 정상적으로 완료되어<br/>클앱테스팅 서비스를 바로 이용하실 수 있습니다.</h3>
							<div>바로 테스팅을 시작하시려면 화면 상단의 시작버튼을,<br/>클앱을 좀더 둘러보시려면, 아래 메인으로 버튼을 눌러주세요!</div>
						</c:when>
						<c:otherwise>
							<h3>클앱 서비스를 신청해 주셔서 감사합니다.<br/>가상계좌 결제는 입금 완료가 되어야 서비스를 이용하실 수 있습니다.</h3>
							<div>(관련 내용은 고객님의 이메일로 재발송 드렸습니다.)</div>
						</c:otherwise>
					</c:choose>
			</div>
			<div class="subPGCTCBtnBox">
				<div class="subPGCTCBtn">
					<a href="/">
					<img src="${contextPath }/resources/images/buttons_main.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_main_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_main.png';"alt="메인으로" />
					</a>
				</div>
			</div>
		</div><!-- .subPGPOCBox End -->
	</div><!-- .subPGPOCBg End -->
</div><!-- .subPGProductOneContainer End -->
 