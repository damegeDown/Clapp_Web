<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="mtGuide01ContentOneContainer">
    <div class="mtGuide01COCMainBox">
        <div class="mtGuide01COCMainTitle">
            <span>수동테스트 프로그램 실행 방법</span>
        </div>
        <div class="mtGuide01COCMainDesc">
            <p>
                로그인 후 마이클앱 페이지에서 “CLAPP 시작하기” 버튼을 클릭하면 수동 테스트 프로그램이 실행됩니다.
            </p>
        </div>
        <div class="mtGuide01COCMainImg">
            <img src="${contextPath }/resources/images/popup_mtg_myclapp_start.png" alt="" />
        </div>
    </div><!-- .mtGuide01COCMainBox End -->
</div><!-- .mtGuide01ContentOneContainer End -->

<div class="mtGuide01ContentTwoContainer">
    <div class="mtGuide01COCMainBox2">
        <div class="mtGuide01COCMainTitle2">
            <span>기본 구조</span>
        </div>
        <div class="mtGuide01COContBox">
            <img src="${contextPath }/resources/images/popup_mtg_cont_01.png" width="546" height="710" alt=""/> </div>
    </div>
    <div class="mtGuide01CTCBox01">
        <div class="mtGuide01CTCContBox">
            <div class="mtGuide01CTCContOneBox">
                <div class="mtGuide01CTCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
                    <div class="mtGuide01CTCContOneTitle">
                        <span>상단메뉴</span>
                    </div>
                </div>
                <div class="mtGuide01CTCContOneDesc">
                    <p>
                        수동 테스트 프로그램 실행 시 기본 창 상단에 2개의 메뉴가 표시됩니다.
                    </p>
                </div>
                <div class="mtGuide01CTCContOneCont">
                    <ul>
                        <li><span>&middot;</span>마이클앱 : 나의 사용내역을 확인 할 수 있습니다.</li>
                        <li><span>&middot;</span>도움말 : 수동 테스트 프로그램의 상세 이용 방법을 안내해드립니다.</li>
                    </ul>
                </div>
            </div><!-- .mtGuide01CTCContOneBox End -->
            <div class="mtGuide01CTCContTwoBox">
                <div class="mtGuide01CTCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
                    <div class="mtGuide01COCContTwoTitle">
                        <span>테스트 실행 시점 선택</span>
                    </div>
                </div>
                <div class="mtGuide01CTCContTwoDesc">
                    <p>
                        바로 테스트를 시작할 수 있는 [시작하기]와 원하는 시점에 테스트를 할 수 있는 [예약하기]가 있습니다.
                    </p>
                </div>
            </div><!-- .mtGuide01CTCContTwoBox End -->
            <div class="mtGuide01CTCContThreeBox">
                <div class="mtGuide01CTCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
                    <div class="mtGuide01CTCContThreeTitle">
                        <span>디바이스 목록</span>
                    </div>
                </div>
                <div class="mtGuide01CTCContThreeDesc">
                    <p>디바이스 목록에는 현재 제공중인 디바이스와 상태를 확인할 수 있고, 단어 검색으로 찾을 수도 있습니다.
                    </p>
                </div>
                <div class="mtGuide01CTCContOneCont">
                    <ul>
                        <li><span>&middot;</span>디바이스 중 녹색 표시 : <b>사용 가능</b>, 디바이스를 실행 가능한 상태입니다.</li>
                        <li><span>&middot;</span>디바이스 중 주황색 버튼 표시 : <b>사용 중</b>, 사용 중 이거나 현재 예약되어 있는 디바이스인 경우 표시됩니다.</li>
                        <li><span>&middot;</span>디바이스 중 회색 표시 : <b>사용 불가</b>, 디바이스가 사용 불가능 할 경우 표시됩니다.</li>
                    </ul>
                </div>
            </div><!-- .mtGuide01CTCContThreeBox End -->
            <div class="mtGuide01CTCContFourBox">
                <div class="mtGuide01CTCContFourNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
                    <div class="mtGuide01CTCContFourTitle">
                        <span>테스트 실행을 위한 설정 영역</span>
                    </div>
                </div>
                <div class="mtGuide01CTCContFourDesc">
                    <p>
                        상단에 [시작하기] 탭 또는 [예약하기] 탭을 선택하면 바로 테스트 할 수 있게 시간을 선택하거나 예약을 설정할 수 있는 화면으로<br>바뀝니다.
                    </p>
                </div>
            </div><!-- .mtGuide01CTCContFourBox End -->
            <div class="mtGuide01CTCContFiveBox">
                <div class="mtGuide01CTCContFiveNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_05.png" alt="05">
                    <div class="mtGuide01CTCContFiveTitle">
                        <span>사용 가능한 시간 표시</span>
                    </div>
                </div>
                <div class="mtGuide01CTCContFiveDesc">
                    <p>
                        수동 테스트 프로그램 하단에 내가 사용할 수 있는 시간이 표시됩니다.
                    </p>
                </div>
            </div><!-- .mtGuide01CTCContFiveBox End -->
        </div>
    </div>
</div><!-- .mtGuide01ContentTwoContainer End -->
