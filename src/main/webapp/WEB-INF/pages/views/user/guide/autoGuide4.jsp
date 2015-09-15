<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="maGuide04ContentOneContainer">
    <div class="maGuide04COCMainBox">
        <div class="maGuide04COCMainTitle">
            <span>Memory Leak Test</span>
        </div>
        <div class="maGuide04COCMainDesc">
            <p>
                Memory Leak Test 는 Test History 와 Test Details 가 있습니다.<br>
            </p>
        </div>
    </div><!-- .maGuide04COCMainBox End -->
</div><!-- .maGuide04ContentOneContainer End -->

<div class="maGuide04ContentTwoContainer">
    <div class="maGuide04CTCBox01">
        <div class="maGuide04CTCContBox">
            <div class="maGuide04CTCContOneBox">
                <div class="maGuide04CTCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_01.png" alt="01">
                    <div class="maGuide04CTCContOneTitle">Test History</div>
                </div>
                <div class="maGuide04CTCContOneDesc">
                    <p>
                        Test History는 예약한 테스트 목록을 관리합니다.
                    </p>
                </div>
                <div class="maGuide04CTCContOneImg">
                    <img src="${contextPath }/resources/images/popup_tag4_cont_01.png">
                </div>
                <div class="maGuide04CTCContOneDesc2">
                    <p>
                        - 마우스 오른쪽 버튼을 눌러 팝업 메뉴를 이용할 수 있습니다.<br>
                        - 테스트는 상태에 따라 완료된 테스트와 예약된 테스트로 구분 됩니다.<br>
                        - 테스트를 선택하면 Test Details 창을 통해 테스트 세부 내역을 확인할 수 있습니다.
                    </p>
                </div>
            </div><!-- .maGuide04CTCContOneBox End -->
            <div class="maGuide04CTCContTwoBox">
                <div class="maGuide04CTCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_02.png" alt="02">
                    <div class="maGuide04CTCContTwoTitle">테스트 상태
                    </div>
                </div>
                <div class="maGuide04CTCContTwoCont">
                    <ul>
                        <li><span>&middot;</span>·테스트 상태는 아래의 4가지로 구분 됩니다.</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContTwoDesc">
                    <p>
                        <img src="${contextPath }/resources/images/popup_tag4_cont_02.png" width="12" height="12" alt=""/> 예약 대기중인 테스트<br>
                        　 - 테스트 시작 시간이 되지 않아 아직 테스트가 진행되지 않은 상태 입니다. 리스트에서 ‘예약된 테스트’로 구분 됩니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag4_cont_03.png" width="12" height="12" alt=""/> 진행 중인 테스트<br>
                        　 - 테스트 시작 시간이 되어 진행 중인 상태입니다. Test Details창을 통해 디바이스의 테스트 진행 상황을 확인할 수 있으며, <br>
                        　　리스트에서 ‘예약된 테스트’로 구분 됩니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag4_cont_04.png" width="12" height="12" alt=""/> 완료된 테스트<br>
                        　 - 테스트를 정상적으로 수행 후 완료된 상태입니다. Result View 창을 통해 수행 결과를 확인할 수 있으며, 리스트에서  <br>
                        　　‘예약된 테스트’로 구분 됩니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag4_cont_05.png" width="12" height="12" alt=""/> 취소한 테스트<br>
                        　 - 테스트가 예약 대기 중이거나 진행 중일 때 테스트를 취소한 상태입니다. 리스트에서 ‘완료된 테스트’로 구분 됩니다.<br>
                    </p>
                </div>
            </div>
            <div class="maGuide04CTCContThreeBox">
                <div class="maGuide04CTCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_03.png" alt="03">
                    <div class="maGuide04CTCContThreeTitle">팝업 메뉴</div>
                </div>
                <div class="maGuide04CTCContThreeImg">
                    <img src="${contextPath }/resources/images/popup_tag4_cont_06.png">
                </div>
                <div class="maGuide04CTCContThreeCont">
                    <ul>
                        <li><span>&middot;</span>Show Result</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContThreeDesc">
                    <p>
                        완료된 테스트에 한해 테스트 결과를 확인할 수 있습니다. 테스트 결과는 Result View창을 통해 제공되며, <br>
                        테스트 예약 시 선택한 모든 Script와 디바이스에 대한 결과를 보여줍니다.
                    </p>
                </div>
                <div class="maGuide04CTCContThreeCont">
                    <ul>
                        <li><span>&middot;</span>Rename</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContThreeDesc">
                    <p>
                        선택한 테스트의 이름을 변경 합니다. 테스트의 이름은 최대 20자를 넘을 수 없습니다.
                    </p>
                </div>
                <div class="maGuide04CTCContThreeCont">
                    <ul>
                        <li><span>&middot;</span>Cancel</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContThreeDesc">
                    <p>
                        테스트가 아직 예약 대기 상태이거나, 진행 중인 경우 테스트를 취소할 수 있습니다. 테스트를 취소하면 테스트 중인 경우<br>
                        테스트가 중단 됩니다.
                    </p>
                </div>
                <div class="maGuide04CTCContThreeCont">
                    <ul>
                        <li><span>&middot;</span>Delete</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContThreeDesc">
                    <p>
                        완료된 테스트에 한해 테스트를 삭제할 수 있습니다.
                    </p>
                </div>
            </div>
            <div class="maGuide04CTCContFourBox">
                <div class="maGuide04CTCContFourNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_04.png" alt="04">

                    <div class="maGuide04CTCContFourTitle">Test Details</div>
                </div>
                <div class="maGuide04CTCContFourDesc">
                    <p>
                        Test Details는 예약한 테스트의 상세 정보를 보여줍니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFourImg">
                    <img src="${contextPath }/resources/images/popup_tag4_cont_07.png">
                </div>
                <div class="maGuide04CTCContFourDesc2">
                    <p>
                        - Summary 영역과 Scripts 영역으로 구분됩니다.<br>
                        - Summary 영역에서는 테스트 상태 및 테스트 시작/종료 시간을 확인할 수 있습니다.<br>
                        - Scripts 영역에서는 테스트 예약 시 선택했던 Script와 실행 횟수 정보, 테스트 결과를 보여 줍니다.<br>
                        - 테스트가 완료 되면 Summary 영역에 ‘결과 보기’ 버튼이 나타나며 버튼을 누르면 Result View를 통해 결과를 확인할 수<br>　있습니다.<br>
                        - 테스트가 진행 중일 때 Script 영역의 각 디바이스 ‘결과’피드 옆에 ‘보기’버튼이 나타납니다. ‘보기’버튼을 선택하면 해당<br>
                        　디바이스의 화면을 띄워서 진행 중인 테스트 동작을 확인할 수 있습니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFourImg">
                    <img src="${contextPath }/resources/images/popup_tag4_cont_08.png">
                </div>
            </div><!-- .maGuide04CTCContFourBox End -->
            <div class="maGuide04CTCContFiveBox">
                <div class="maGuide04CTCContFiveNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_05.png" alt="05">
                    <div class="maGuide04CTCContFiveTitle">표시 정보
                    </div>
                </div>
                <div class="maGuide04CTCContFiveDesc">
                    <p>
                        < Summary 영역 >
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>테스트 상태</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        테스트 예약 상태를 나타냅니다.<br>
                        - 테스트 예약 대기 중 : 테스트가 아직 시작되지 않은 상태입니다.<br>
                        - 테스트 진행 중 :  테스트가 진행중인 상태입니다.<br>
                        - 테스트 완료 :  테스트가 완료된 상태입니다.<br>
                        - 테스트 취소 :  사용자에 의해 테스트가 취소된 상태입니다.<br>
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>시작 시간</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        테스트를 예약 시 설정한 시간으로 테스트가 시작되는 시간 입니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>종료 시간</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        테스트 수행 종료 시간 입니다.<br>
                        테스트가 완료된 경우 실제 테스트가 종료된 시간이 나타나며, 테스트가 아직 대기 상태이거나, 진행 중인 경우 예상 종료 시간을<br>
                        나타냅니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>결과 보기</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        테스트를 완료하면 나타나며, 버튼을 선택하면 Result View창을 통해 선택한 테스트 결과를 확인할 수 있습니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFiveDesc3">
                    <p>
                        < Summary 영역 >
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>이름</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        예약 시 선택한 Script 이름이 실행 순서대로 나타나며, Script마다 트리 구조로 예약 시 선택한 디바이스 목록을 확인할 수 <br>
                        있습니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>전체 횟수</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        해당 스크립트를 실행할 전체 횟수로 테스트 예약 시 선택했던 횟수입니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>진행 횟수</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        전체 횟수 중 실제로 테스트가 진행된 횟수입니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>결과</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        디바이스 단위로 표시되며 테스트의 성공/실패 여부를 나타냅니다. 진행 횟수가 2회 이상인 경우 실패 횟수가 숫자로 표시됩니다. <br>
                        - 성공 : 테스트가 모두 성공한 경우.<br>
                        - 실패 : 테스트가 모두 실패한 경우.<br>
                        전체 횟수가 2회 이상일 때 동일한 Script 테스트 중 진행 횟수에 따라 성공과 실패가 모두 발생할 경우 실패한 횟수를 표시해 줍니다. <br>
                        괄호 안 숫자가 실패한 횟수이며 전체 횟수에서 실패한 횟수를 제외하면 성공한 횟수를 알 수 있습니다.
                    </p>
                </div>
                <div class="maGuide04CTCContFiveCont">
                    <ul>
                        <li><span>&middot;</span>디바이스 이미지</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContFiveDesc2">
                    <p>
                        테스트 진행중에만 나타나며 이미지를 선택하면 해당 디바이스에서 테스트가 진행되는 과정을 확인 할 수 있습니다. <br>
                        디바이스 화면은 별도 창으로 나타나고, 테스트를 여러 디바이스에서 실행중인 경우 여러 개의 디바이스를 동시에 확인 가능합니다.
                    </p>
                </div>
            </div>
            <div class="maGuide04CTCContSixBox">
                <div class="maGuide04CTCContSixNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_06.png" alt="06">
                    <div class="maGuide04CTCContSixTitle">테스트 결과 확인
                    </div>
                </div>
                <div class="maGuide04CTCContSixDesc">
                    <p>
                        Test Details 화면에서 테스트를 확인할 수 있는 방법은 3가지 입니다.
                    </p>
                </div>
                <div class="maGuide04CTCContSixCont">
                    <ul>
                        <li><span>&middot;</span>전체 테스트 결과 확인</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContSixDesc2">
                    <p>
                        테스트가 완료된 후 Summary 영역의 결과 보기 버튼을 누르면 전체 테스트에 대한 결과를 확인할 수 있습니다. <br>
                        실행된 순서대로 Script마다 테스트를 진행한 디바이스의 테스트 결과를 보여 줍니다.
                    </p>
                </div>
                <div class="maGuide04CTCContSixCont">
                    <ul>
                        <li><span>&middot;</span>Script테스트 결과 확인</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContSixDesc2">
                    <p>
                        Scripts 영역에서 Script를 더블 클릭하면 선택한 Script의 테스트 결과를 확인할 수 있습니다. <br>
                        해당 Script를 진행한 디바이스의 테스트 결과를 보여 줍니다.
                    </p>
                </div>
                <div class="maGuide04CTCContSixCont">
                    <ul>
                        <li><span>&middot;</span>디바이스 테스트 결과 확인</li>
                    </ul>
                </div>
                <div class="maGuide04CTCContSixDesc2">
                    <p>
                        Scripts 영역에서 디바이스를 더블 클릭하면 선택한 디바이스의 테스트 결과를 확인할 수 있습니다.<br>
                        테스트 결과는 Scripts 영역에서 선택한 디바이스의 상위에 있는 Script를 수행한 결과 입니다.<br>
                        동일한 디바이스에서 다른 Script를 실행한 결과를 확인하려면 확인하려는 Script 하위 목록에서 다시 디바이스를 찾아 더블 클릭해야 <br>합니다.
                    </p>
                </div>
                <div class="maGuide04CTCContSixDesc3">
                    <p>
                        < 예시 >
                    </p>
                </div>
                <div class="maGuide04CTCContSixImg">
                    <img src="${contextPath }/resources/images/popup_tag4_cont_09.png">
                </div>
                <div class="maGuide04CTCContSixCont">
                    <ul>
                        <li><span>&middot;</span>‘결과 보기’ 버튼을 선택하면 Scripts에 나열된 순서대로 전체 테스트 결과를 확인할 수 있습니다.</li>
                        <li><span>&middot;</span>‘newScript6’ 를 더블 클릭하면 ‘G2’, ‘Galaxy S4’, ‘Vega Secret Note’ 디바이스에서 ‘newScript6’ Script을 테스트한 결과를 <br>　확인할 수 있습니다.</li>
                        <li><span>&middot;</span>‘newScript6’의 하위에 있는 ‘Galaxy S4’ 를 선택하면 ‘Galaxy S4’ 디바이스에서 ‘newScript6’ Script을 테스트한 결과를 확인할 <br>　수 있습니다.</li>
                        <li><span>&middot;</span>‘TestScript5’의 하위에 있는 ‘Galaxy S4’를 선택하면 ‘Galaxy S4’ 디바이스에서 ‘TestScript5’ Script를 테스트한 결과를 확인할 수<br>　있습니다.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div><!-- .maGuide04ContentTwoContainer End -->
