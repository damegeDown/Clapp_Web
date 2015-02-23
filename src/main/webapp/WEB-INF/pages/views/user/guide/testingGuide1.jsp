<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body style="overflow-X:hidden">
	<div class="mtGuide01ContentOneContainer">
		<div class="mtGuide01COCMainBox">
			<div class="mtGuide01COCMainTitle">
				<span>테스트 시작</span>
			</div>
			<div class="mtGuide01COCMainDesc">
				<p>
					로그인 후 메인 페이지에서 “CLAPP 시작”, “CLAPP 시작하기”중 하나를 선택합니다.
				</p>
			</div>
			<div class="mtGuide01COCMainImg">
				<img src="${contextPath }/resources/images/popup_mtg_start_main.png" alt="" />
			</div>
		</div><!-- .mtGuide01COCMainBox End -->
	</div><!-- .mtGuide01ContentOneContainer End -->

	<div class="mtGuide01ContentTwoContainer">
		<div class="mtGuide01CTCBox01">
			<div class="mtGuide01CTCContBox">
				<div class="mtGuide01CTCContOneBox">
					<div class="mtGuide01CTCContOneNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
					</div>
					<div class="mtGuide01CTCContOneDesc">
						<p>
							JNLP 실행 시 기본 창이 표시되며 기본창에는<br /> 다음과 같은 기능이 있습니다.
						</p>
					</div>
					<div class="mtGuide01CTCContOneCont">
						<ul>
							<li><span>&middot;</span>최소화 : 창이 최소화되며 작업 표시줄로 이동합니다.</li>
							<li><span>&middot;</span>최대화 : 최대화 선택 시 “디바이스 예약” 화면이 최대화되어 <br />&nbsp;&nbsp;&nbsp;표시됩니다.</li>
							<li><span>&middot;</span>닫기 : JNLP를 종료합니다.</li>
							<li><span>&middot;</span>예약 : “디바이스 예약”과 “마이 페이지” 메뉴가 존재합니다.</li>
							<li><span>&middot;</span>디바이스 리스트 화면 : 등록된 모든 디바이스를 표시합니다.</li>
						</ul>
					</div>
				</div><!-- .mtGuide01CTCContOneBox End -->
				<div class="mtGuide01CTCContTwoBox">
					<div class="mtGuide01CTCContTwoNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
					</div>
					<div class="mtGuide01CTCContTwoDesc">
						<p>
							리스트 상단 검색은 단어를 입력하시면 <br />자동으로 검색된 결과가 리스트에 표시됩니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContTwoBox End -->
				<div class="mtGuide01CTCContThreeBox">
					<div class="mtGuide01CTCContThreeNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
					</div>
					<div class="mtGuide01CTCContThreeDesc">
						<p>
							리스트의 디바이스 정보에는 제품명, 제조사, OS가 표시되며<br />디바이스 상태를 이미지로 표시합니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContThreeBox End -->
				<div class="mtGuide01CTCContFourBox">
					<div class="mtGuide01CTCContFourNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
					</div>
					<div class="mtGuide01CTCContFourDesc">
						<p>
							디바이스 리스트에는 현재 제공중인 디바이스와 <br />상태를 확인할 수 있습니다.
						</p>
					</div>
					<div class="mtGuide01CTCContFourCont">
						<ul>
							<li><span>&middot;</span>디바이스 중 녹색 표시 : 사용 가능,<br/>&nbsp;&nbsp;&nbsp;디바이스를 실행 가능한 상태입니다.</li>
							<li><span>&middot;</span>디바이스 중 녹색 체크 표시 : 내 디바이스, 디바이스를 <br />&nbsp;&nbsp;&nbsp;실행 중이거나 현재 시간에 예약된 상태 일 경우 표시됩니다.</li>
							<li><span>&middot;</span>디바이스 중 빨간버튼 표시 : 사용 중, 다른 사람이 사용 중 이거나<br />&nbsp;&nbsp;&nbsp;현재 시간에 예약을 했을 경우 표시됩니다.</li>
							<li><span>&middot;</span>디바이스 중 회색 표시 : 사용 불가, 디바이스가 <br />&nbsp;&nbsp;&nbsp;사용 불가능 할 경우 표시됩니다. </li>
						</ul>
					</div>
				</div><!-- .mtGuide01CTCContFourBox End -->
				<div class="mtGuide01CTCContFiveBox">
					<div class="mtGuide01CTCContFiveNum">
						<img src="${contextPath }/resources/images/popup_mtg_num_05.png" alt="05">
					</div>
					<div class="mtGuide01CTCContFiveDesc">
						<p>
							“사용 불가” 상태를 제외한 경우에 디바이스를 선택하면<br/> “디바이스 예약” 화면이 표시됩니다.
						</p>
					</div>
				</div><!-- .mtGuide01CTCContFiveBox End -->
			</div>
		</div>
		<div class="mtGuide01CTCBox02">
			<div class="mtGuide01CTCImgBox">
				<div class="mtGuide01CTCImg">
					<img src="${contextPath }/resources/images/popup_mtg_start_jnlp_01.png" alt="" />
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