<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body style="overflow-X:hidden">
    <div class="mtGuide04ContentOneContainer">
		<div class="mtGuide04COCMainBox">
			<div class="mtGuide04COCMainTitle">
				<span>테스트 디바이스 화면</span>
			</div>
			<div class="mtGuide04COCMainDesc">
				<p>
					클앱은 실제 디바이스와 같은 화면 터치, 파워, 볼륨 업/다운, 메뉴, 홈, 취소, 스와이프, 드래그 앤 드롭 기능을 모두 제공합니다.
				</p>
			</div>
		</div><!-- .mtGuide01COCMainBox End -->
	</div><!-- .mtGuide01ContentOneContainer End -->

	<div class="mtGuide04ContentTwoContainer">
		<div class="mtGuide04CTCBox01">
			<div class="mtGuide04CTCContBox">
				<div class="mtGuide04CTCContOneBox">
					<div class="mtGuide04CTCContOneNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
					</div>
					<div class="mtGuide04CTCContOneDesc">
						<p>
							디바이스 화면에는 다음과 같은 기능이 있습니다.
						</p>
					</div>
					<div class="mtGuide04CTCContOneCont">
						<ul>
							<li><span>&middot;</span>상단 : 상단에는 디바이스명과 사용 가능한 시간이 표시됩니다.</li>
							<li><span>&middot;</span>메뉴 : File, Command, Screen, Setting 메뉴를 지원합니다.</li>
							<li><span>&middot;</span>최소화 : 창이 최소화되며 작업 표시줄로 이동합니다.</li>
							<li><span>&middot;</span>최대화 : 최대화 시 화면 해상도를 기준으로 최대 확대 가능한 <br/>&nbsp;&nbsp;&nbsp;상태까지 디바이스의 크기를 변경합니다.</li>
							<li><span>&middot;</span>닫기 : 디바이스 실행창을 종료합니다. </li>
						</ul>
					</div>
				</div><!-- .mtGuide01CTCContOneBox End -->
				<div class="mtGuide04CTCContTwoBox">
					<div class="mtGuide04CTCContTwoNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
					</div>
					<div class="mtGuide04CTCContTwoDesc">
						<p>
							예약 시간 종료 5분 전에 예약 시간이 만료됨을 알리는 <br />알림 창이 발생합니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContTwoBox End -->
				<div class="mtGuide04CTCContThreeBox">
					<div class="mtGuide04CTCContThreeNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
					</div>
					<div class="mtGuide04CTCContThreeDesc">
						<p>
							예약 시간 종료 시 만료에 대한 알림 창이 발생하고<br />디바이스가 종료됩니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContThreeBox End -->
				<div class="mtGuide04CTCContFourBox">
					<div class="mtGuide04CTCContFourNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
					</div>
					<div class="mtGuide04CTCContFourDesc">
						<p>
							종료 시 알림 창이 발생하며 디바이스의 예약 상태를 <br />지정하도록 요청합니다.
						</p>
					</div>
					<div class="mtGuide04CTCContFourCont">
						<ul>
							<li><span>&middot;</span>대기 상태 : 예약을 대기 상태로 변경합니다.</li>
							<li><span>&middot;</span>사용 종료 : 예약을 종료합니다.</li>
							<li><span>&middot;</span>취소: 오른쪽 상단에 X 표시 버튼을 누르면 종료를 취소합니다.</li>
						</ul>
					</div>
				</div><!-- .mtGuide01CTCContFourBox End -->
			</div>
		</div>
		<div class="mtGuide04CTCBox02">
			<div class="mtGuide04CTCImgBox01">
				<div class="mtGuide04CTCImg">
					<img src="${contextPath }/resources/images/popup_mtg_monitor_jnlp_01.png" alt=""/>
				</div>
			</div>
			<div class="mtGuide04CTCImgBox02">
				<div class="mtGuide04CTCImg">
					<img src="${contextPath }/resources/images/popup_mtg_monitor_jnlp_02.png" alt="" />
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