<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="mtGuide04ContentOneContainer">
    <div class="mtGuide04COCMainBox">
        <div class="mtGuide04COCMainTitle">
            <span>이용현황</span>
        </div>
        <div class="mtGuide04COContBox">
            <img src="${contextPath }/resources/images/popup_mtg4_cont_01.png" width="721" height="651" alt=""/>
        </div>
    </div><!-- .mtGuide01COCMainBox End -->


    <div class="mtGuide04COCBox01">
        <div class="mtGuide04COCContBox">
            <div class="mtGuide04COCContOneBox">
                <div class="mtGuide04COCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
                    <div class="mtGuide04COCContOneTitle">
                        <span>마이클앱 > 이용현황</span>
                    </div>
                </div>
                <div class="mtGuide04COCContOneDesc">
                    <p>상단 마이클앱 메뉴를 클릭하시면 이용현황 메뉴를 확인하실 수 있습니다.
                    </p>
                </div>
            </div><!-- .mtGuide04COCContOneBox End -->
            <div class="mtGuide04COCContTwoBox">
                <div class="mtGuide04COCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
                    <div class="mtGuide04COCContTwoTitle">
                        <span>이용기간별 내역 검색</span>
                    </div>
                </div>
                <div class="mtGuide04COCContTwoDesc">
                    <div class="mtGuide04CTCContTwoCont">
                        <ul>
                            <li><span>&middot;</span>시작일과 종료일을 선택하시면 선택하신 날짜 사이의 예약 현황이 표시됩니다.</li>
                            <li><span>&middot;</span>최근 10개 : “최근 10개” 버튼을 선택하시면 예약 시간이 늦은 순으로 예약 현황 10개가 표시됩니다. </li>
                            <li><span>&middot;</span>당일 : 오늘 사용한 내역이 표시됩니다.</li>
                            <li><span>&middot;</span>1주일 : 일주일 내에 사용한 내역이 표시됩니다.</li>
                            <li><span>&middot;</span>1개월 : 한달 내에 사용한 내역이 표시됩니다.</li>
                        </ul>
                    </div>
                </div>
            </div><!-- .mtGuide04COCContTwoBox End -->
            <div class="mtGuide04COCContThreeBox">
                <div class="mtGuide04COCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
                    <div class="mtGuide04COCContThreeTitle">
                        <span>목록</span>
                    </div>
                </div>
                <div class="mtGuide04COCContThreeDesc">
                    <p>사용했던 내역 또는 예약했던 내역이 리스트로 표시됩니다.<br>
                        리스트에는 번호, 예약시간, 예약기간, 실제 사용기간, 제조사, 디바이스명, OS버전, 해상도, 사용시간, 남은시간, 현재 상태가 <br>표시됩니다.
                    </p>
                </div>
            </div><!-- .mtGuide04COCContThreeBox End -->
            <div class="mtGuide04COCContFourBox">
                <div class="mtGuide04COCContFourNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
                    <div class="mtGuide04COCContFourTitle">
                        <span>현재상태 정의</span>
                    </div>
                </div>
                <div class="mtGuide04COCContFourDesc">
                    <div class="mtGuide04CTCContFourCont">
                        <ul>
                            <li><span>&middot;</span>예약 대기 : 예약된 일정 중 예약 시간이 되지 않은 상태일 때 표시됩니다.</li>
                            <li><span>&middot;</span>대기 중 : 예약된 시간이 되었으나 디바이스를 사용하지 않을 경우 표시됩니다.</li>
                            <li><span>&middot;</span>사용 중 : 디바이스를 사용 중 일 경우 표시됩니다.</li>
                            <li><span>&middot;</span>사용 종료 : 예약시간이 지난 경우 “예약종료”로 표시됩니다.</li>

                        </ul>
                    </div>
                </div>
            </div><!-- .mtGuide04COCContFourBox End -->
        </div>
    </div>
</div><!-- .mtGuide04ContentOneContainer End -->
