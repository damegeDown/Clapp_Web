<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="mtGuide03ContentOneContainer">
    <div class="mtGuide03COCMainBox">
        <div class="mtGuide03COCMainTitle">
            <span>예약하기</span>
        </div>
        <div class="mtGuide03COContBox">
            <img src="${contextPath }/resources/images/popup_mtg3_cont_01.png" width="747" height="841" alt=""/>
        </div>
    </div><!-- .mtGuide01COCMainBox End -->
    <div class="mtGuide03COCBox01">
        <div class="mtGuide03COCContBox">
            <div class="mtGuide03COCContOneBox">
                <div class="mtGuide03COCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
                    <div class="mtGuide03COCContOneTitle">
                        <span>예약 날짜 선택</span>
                    </div>
                </div>
                <div class="mtGuide03COCContOneDesc">
                    <p>디바이스 목록에서 테스트할 디바이스를 선택한 후 테스트 할 날짜를 선택합니다.
                    </p>
                </div>
            </div><!-- .mtGuide03COCContOneBox End -->
            <div class="mtGuide03COCContTwoBox">
                <div class="mtGuide03COCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
                    <div class="mtGuide03COCContTwoTitle">
                        <span>예약 시간 선택</span>
                    </div>
                </div>
                <div class="mtGuide03COCContTwoDesc">
                    <p>
                        테스트를 시작 할 시간을 선택 한 후 사용할 시간을 선택합니다. <br>
                        테스트 시간은 디바이스당 5분 단위로 가능하며, 내가 보유한 시간만큼 표시됩니다.
                    </p>
                </div>
            </div><!-- .mtGuide03COCContTwoBox End -->
            <div class="mtGuide03COCContThreeBox">
                <div class="mtGuide03COCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
                    <div class="mtGuide03COCContThreeTitle">
                        <span>예약 실행 버튼</span>
                    </div>
                </div>
                <div class="mtGuide03COCContThreeDesc">
                    <p>[예약하기] 버튼을 클릭하면 예약이 실행되면서 선택한 시간이 차감됩니다. 차감 후 남은 시간은 프로그램창의 하단이나 상단<br>[마이클앱] 메뉴에서 확인 할 수 있습니다.<br>
                    </p>
                </div>
            </div><!-- .mtGuide03COCContThreeBox End -->
            <div class="mtGuide03COCContFourBox">
                <div class="mtGuide03COCContFourNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
                    <div class="mtGuide03COCContFourTitle">
                        <span>예약현황 바로가기 버튼</span>
                    </div>
                </div>
                <div class="mtGuide03COCContFourDesc">
                    <p>[나의 예약현황] 버튼을 클릭하면 이용현황 내역을 확인 할 수 있습니다.</p>
                </div>
            </div><!-- .mtGuide03COCContFourBox End -->
            <div class="mtGuide03COCContFiveBox">
                <div class="mtGuide03CTCContFiveDesc">
                    <p>잠깐!</p>
                </div>
                <div class="mtGuide03CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>예약된 일정은 예약된 시간이 되기 전에 취소가 가능하며 현재 시점 기준으로 예약된 시간 24시간 이전에 취소 시 예약은 취소되고<br>　시간이 반환됩니다. 그러나 현재 시점 기준으로 예약된 시간 24시간 이내에  취소를 할 경우 예약은 취소되나 시간은 반환되지<br>　않습니다.</li>
                        <li><span>&middot;</span>지나간 시간에 대해서는 선택이 불가능합니다.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- .mtGuide03ContentOneContainer End -->
