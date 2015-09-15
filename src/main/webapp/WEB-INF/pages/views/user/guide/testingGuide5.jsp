<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="mtGuide05ContentOneContainer">
    <div class="mtGuide05COCMainBox">
        <div class="mtGuide05COCMainTitle">
            <span>테스트 디바이스 화면</span>
        </div>
        <div class="mtGuide05COCMainDesc">
            <p>
                클앱은 실제 디바이스와 같은 화면 터치, 파워, 볼륨 업/다운, 메뉴, 홈, 취소, 스와이프, 드래그 앤 드롭 기능을 모두 <br>
                제공합니다.
            </p>
        </div>
        <div class="mtGuide05COContBox">
            <img src="${contextPath }/resources/images/popup_mtg5_cont_01.png" width="717" height="423" alt=""/>
        </div>
    </div><!-- .mtGuide01COCMainBox End -->
    <div class="mtGuide05COCBox01">
        <div class="mtGuide05COCContBox">
            <div class="mtGuide05COCContOneBox">
                <div class="mtGuide05COCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
                    <div class="mtGuide05COCContOneTitle">
                        <span>디바이스 화면 기능</span>
                    </div>
                </div>
                <div class="mtGuide05COCContOneDesc">
                    <div class="mtGuide05CTCContOneCont">
                        <ul>
                            <li><span>&middot;</span>상단 : 상단에는 디바이스명과 사용 가능한 시간이 표시됩니다.</li>
                            <li><span>&middot;</span>메뉴 : File, Command, Screen, Setting 메뉴를 지원합니다.</li>
                            <li><span>&middot;</span>최소화 : 창이 최소화되며 작업 표시줄로 이동합니다.</li>
                            <li><span>&middot;</span>최대화 : 최대화 시 화면 해상도를 기준으로 최대 확대 가능한 상태까지 디바이스의 크기를 변경합니다.</li>
                            <li><span>&middot;</span>닫기 : 디바이스 실행창을 종료합니다.</li>
                        </ul>
                    </div>
                </div>
            </div><!-- .mtGuide05COCContOneBox End -->
            <div class="mtGuide05COCContTwoBox">
                <div class="mtGuide05COCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
                    <div class="mtGuide05COCContTwoTitle">
                        <span>예약 만료 안내</span>
                    </div>
                </div>
                <div class="mtGuide05COCContTwoDesc">
                    <p>사용 시간 종료 2분 전에 시간이 만료됨을 알리는 알림 창이 뜨고, 시간 연장을 할 것인지 바로 종료 할 것인지를 선택합니다.<br>
                        시간 연장을 선택하면 연장할 시간을 선택한 뒤 확인을 눌러 시간이 연장 된 것을 확인합니다.
                    </p>
                </div>
            </div><!-- .mtGuide05COCContTwoBox End -->
            <div class="mtGuide05COCContThreeicon">
                <img src="${contextPath }/resources/images/popup_mtg5_cont_02.png" width="380" height="198" alt=""/> </div>
            <div class="mtGuide05COCContThreeBox">
                <div class="mtGuide05COCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
                    <div class="mtGuide05COCContThreeTitle">
                        <span>화면 종료 시 안내</span>
                    </div>
                </div>
                <div class="mtGuide05COCContThreeDesc">
                    <p>테스트 도중 강제 화면 종료 시 종료 시 알림 창이 발생하며 디바이스의 예약 상태를 지정하도록 요청합니다.
                    </p>
                    <div class="mtGuide05CTCContOneCont">
                        <ul>
                            <li><span>&middot;</span>대기 상태 : 예약을 대기 상태로 변경합니다.</li>
                            <li><span>&middot;</span>사용 종료 : 예약을 종료합니다.</li>
                            <li><span>&middot;</span>취소: 오른쪽 상단에 X 표시 버튼을 누르면 종료를 취소합니다.</li>
                        </ul>
                    </div>
                </div>
            </div><!-- .mtGuide05COCContThreeBox End -->
        </div>
    </div>
</div><!-- .mtGuide05ContentOneContainer End -->
