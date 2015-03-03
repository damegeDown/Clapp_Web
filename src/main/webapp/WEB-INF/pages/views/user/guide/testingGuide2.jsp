<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body style="overflow-X:hidden">
<div class="mtGuide02ContentOneContainer">
	<div class="mtGuide02COCMainBox">
		<div class="mtGuide02COCMainTitle">
			<span>예약 기능</span>
		</div>
	</div><!-- .mtGuide01COCMainBox End -->
</div><!-- .mtGuide01ContentOneContainer End -->

<div class="mtGuide02ContentTwoContainer">
	<div class="mtGuide02CTCBox01">
		<div class="mtGuide02CTCContBox">
			<div class="mtGuide02CTCContTitleBox">
				<div class="mtGuide02CTCContTite">
					<span>디바이스 예약 화면</span>
				</div>
			</div><!-- .mtGuide01CTCContTwoBox End -->
			<div class="mtGuide02CTCContOneBox">
				<div class="mtGuide02CTCContOneNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
				</div>
				<div class="mtGuide02CTCContOneDesc">
					<p>
						예약일은 기본으로 실행한 날짜가 표시됩니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide02CTCContTwoBox">
				<div class="mtGuide02CTCContTwoNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
				</div>
				<div class="mtGuide02CTCContTwoDesc">
					<p>
						예약일 선택시 지정된 날짜의 디바이스 별 예약 현황이<br />리스트에 표시됩니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContTwoBox End -->
			<div class="mtGuide02CTCContThreeBox">
				<div class="mtGuide02CTCContThreeNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
				</div>
				<div class="mtGuide02CTCContThreeDesc">
					<p>
						예약 현황에서 시간 영역을 선택하면 예약 및 시작을<br />하실 수 있습니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContThreeBox End -->
			<div class="mtGuide02CTCContFourBox">
				<div class="mtGuide02CTCContFourNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
				</div>
				<div class="mtGuide02CTCContFourDesc">
					<p>
						예약 상태는 다음과 같이 표시됩니다.
					</p>
				</div>
				<div class="mtGuide02CTCContFourCont">
					<ul>
						<li><span>&middot;</span>회색 표시 : 예약 불가</li>
						<li><span>&middot;</span>흰색 표시 : 예약 가능</li>
						<li><span>&middot;</span>녹색 표시 : 내 예약 </li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContFourBox End -->
			<div class="mtGuide02CTCContFiveBox">
				<div class="mtGuide02CTCContFiveNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_05.png" alt="05">
				</div>
				<div class="mtGuide02CTCContFiveDesc">
					<p>
						예약된 일정은 예약된 시간이 되기 전에 취소가 가능하며<br />
						취소 시 예약이 삭제되고 티켓이 반환됩니다. 예약된 시간에<br />
						취소를 할 경우 예약은 취소되나 티켓은 반환되지 않습니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContFiveBox End -->
			<div class="mtGuide02CTCContSixBox">
				<div class="mtGuide02CTCContSixNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_06.png" alt="06">
				</div>
				<div class="mtGuide02CTCContSixDesc">
					<p>
						지나간 시간에 대해서는 선택이 불가능하며 비어 있는 <br />영역은 회색으로 표시됩니다.
					</p>
				</div>
			</div><!-- .mtGuide02CTCContSixBox End -->
			<div class="mtGuide02CTCContSevenBox">
				<div class="mtGuide02CTCContSevenNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_07.png" alt="07">
				</div>
				<div class="mtGuide02CTCContSevenDesc">
					<p>
						하단에는 사용자의 이름과 사용 가능한 <br />티켓이 표시됩니다.
					</p>
				</div>
			</div><!-- .mtGuide02CTCContSevenBox End -->
		</div>
	</div>
	<div class="mtGuide02CTCBox02">
		<div class="mtGuide02CTCImgBox">
			<div class="mtGuide02CTCImg">	
				<img src="${contextPath }/resources/images/popup_mtg_reserve_jnlp_01.png" alt="08" />
			</div>
		</div>
	</div>
</div><!-- .mtGuide01ContentTwoContainer End -->

<div class="mtGuide02ContentThreeContainer">
	<div class="mtGuide02CHCBox01">
		<div class="mtGuide02CHCContBox">
			<div class="mtGuide02CHCContTitleBox">
				<div class="mtGuide02CHCContTite">
					<span>디바이스 예약 및 시작</span>
				</div>
			</div><!-- .mtGuide01CTCContTwoBox End -->
			<div class="mtGuide02CHCContOneBox">
				<div class="mtGuide02CHCContOneNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
				</div>
				<div class="mtGuide02CHCContOneDesc">
					<p>
						디바이스는 30분 단위로 예약하실 수 있습니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide02CHCContTwoBox">
				<div class="mtGuide02CHCContTwoNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
				</div>
				<div class="mtGuide02CHCContTwoDesc">
					<p>
						여러 개의 영역을 선택하여 한 번에 예약을<br />진행 할 수 있습니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContTwoBox End -->
			<div class="mtGuide02CHCContThreeBox">
				<div class="mtGuide02CHCContThreeNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
				</div>
				<div class="mtGuide02CHCContThreeDesc">
					<p>
						현 시간을 기준으로 예약 및 시작을 선택할 경우 선택한 시간<br /> 뒤에 다른 사용자의 예약이 있고, 처음 선택한 시간이 30<br />
						분보다 짧다면 경고 창이 표시합니다. 팝업 창에서 “예”를<br /> 선택하면 티켓이 소모되고 예약이 등록됩니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContThreeBox End -->
			<div class="mtGuide02CHCContFourBox">
				<div class="mtGuide02CHCContFourNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
				</div>
				<div class="mtGuide02CHCContFourDesc">
					<p>
						예약된 시간이 되면 “시작” 버튼을 선택하여 디바이스를<br /> 실행하실 수 있습니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContFourBox End -->
		</div>
	</div>
	<div class="mtGuide02CHCBox02">
		<div class="mtGuide02CHCImgBox">
			<div class="mtGuide02CHCImg">
				<img src="${contextPath }/resources/images/popup_mtg_reserve_jnlp_02.png" alt="05" />
			</div>
		</div>
	</div>
</div><!-- .mtGuide01ContentTwoContainer End -->
<div class="mtGuideFloating">
	<a href="#mtGuideWrap">
		<img src="${contextPath }/resources/images/popup_guide_floating.png" onMouseOver="this.src='${contextPath }/resources/images/popup_guide_floating_r.png';" onMouseOut="this.src='${contextPath }/resources/images/popup_guide_floating.png';" alt="top" />
		</a>
	</div>
</div><!-- .mtGuideWrap End -->
</body>