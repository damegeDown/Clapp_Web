<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<<body style="overflow-X:hidden">
   <div class="mtGuide03ContentOneContainer">
		<div class="mtGuide03COCMainBox">
			<div class="mtGuide03COCMainTitle">
				<span>디바이스 이용현황</span>
			</div>
		</div><!-- .mtGuide01COCMainBox End -->
	</div><!-- .mtGuide01ContentOneContainer End -->

	<div class="mtGuide03ContentTwoContainer">
		<div class="mtGuide03CTCBox01">
			<div class="mtGuide03CTCContBox">
				<div class="mtGuide03CTCContOneBox">
					<div class="mtGuide03CTCContOneNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
					</div>
					<div class="mtGuide03CTCContOneDesc">
						<p>
							기본 화면의 “예약” 메뉴에서 선택하시면 새 창으로 <br />마이 페이지가 표시 됩니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContOneBox End -->
				<div class="mtGuide03CTCContTwoBox">
					<div class="mtGuide03CTCContTwoNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
					</div>
					<div class="mtGuide03CTCContTwoDesc">
						<p>
							화면에는 예약하신 내역이 리스트로 표시됩니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContTwoBox End -->
				<div class="mtGuide03CTCContThreeBox">
					<div class="mtGuide03CTCContThreeNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
					</div>
					<div class="mtGuide03CTCContThreeDesc">
						<p>
							“최근 10개” 버튼을 선택하시면 예약 시간이 늦은 순으로 <br />예약 현황 10개가 표시됩니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContThreeBox End -->
				<div class="mtGuide03CTCContFourBox">
					<div class="mtGuide03CTCContFourNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
					</div>
					<div class="mtGuide03CTCContFourDesc">
						<p>
							시작일과 종료일을 선택하시면 선택하신 날짜 사이의 <br />예약 현황이 표시됩니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContFourBox End -->

			</div>
		</div>
		<div class="mtGuide03CTCBox02">
			<div class="mtGuide03CTCContBox02">

				<div class="mtGuide03CTCContFiveBox">
					<div class="mtGuide03CTCContFiveNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_05.png" alt="05">
					</div>
					<div class="mtGuide03CTCContFiveDesc">
						<p>
							화면에는 번호, 예약시간, 제조사, 디바이스명, OS,<br /> 해상도,   차감티켓, 남은 시간, 현재상태가 표시됩니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContFiveBox End -->

				<div class="mtGuide03CTCContSixBox">
					<div class="mtGuide03CTCContSixNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_06.png" alt="06">
					</div>
					<div class="mtGuide03CTCContSixDesc">
						<p>
							현재상태는 다음과 같습니다.
						</p>
					</div>
					<div class="mtGuide03CTCContSixCont">
						<ul>
							<li><span>&middot;</span>예약 대기 : 예약된 일정 중 예약 시간이 되지 않은 상태일 때 <br />&nbsp;&nbsp;&nbsp;표시됩니다.</li>
							<li><span>&middot;</span>대기 중 : 예약된 시간이 되었으나 디바이스를 <br />&nbsp;&nbsp;&nbsp;사용하지 않을 경우 표시됩니다. </li>
							<li><span>&middot;</span>사용 중 : 디바이스를 사용 중 일 경우 표시됩니다.</li>
							<li><span>&middot;</span>사용 종료 : 예약시간이 지난 경우 “예약종료”로 표시됩니다. </li>
						</ul>
					</div>
				</div><!-- .mtGuide01CTCContFourBox End -->

			</div>
		</div>
	</div><!-- .mtGuide01ContentTwoContainer End -->

	<div class="mtGuide03ContentThreeContainer">
		<div class="mtGuide03CHCImgBox">
			<div class="mtGuide03CHCImg">
				<img src="${contextPath }/resources/images/popup_mtg_device_jnlp_01.png" alt="" />
			</div>
		</div><!-- .mtGuide01COCMainBox End -->
	</div><!-- .mtGuide01ContentOneContainer End -->
	<div class="mtGuideFloating">
		<a href="#mtGuideWrap">
			<img src="${contextPath }/resources/images/popup_guide_floating.png" onMouseOver="this.src='${contextPath }/resources/images/popup_guide_floating_r.png';" onMouseOut="this.src='${contextPath }/resources/images/popup_guide_floating.png';" alt="top" />
		</a>
	</div>
</div><!-- .mtGuideWrap End -->
</body>