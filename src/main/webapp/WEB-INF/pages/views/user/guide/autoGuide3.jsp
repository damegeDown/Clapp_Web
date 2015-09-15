<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="maGuide03ContentOneContainer">
    <div class="maGuide03COCMainBox">
        <div class="maGuide03COCMainTitle">
            <span>주요 기능</span>
        </div>
        <div class="maGuide03COCMainDesc">
            <p>
                Clapp Automation 툴의 주요 기능으로는 Script 작성하기와 테스트 예약하기가 있습니다.<br>
            </p>
        </div>
    </div><!-- .maGuide03COCMainBox End -->
</div><!-- .maGuide03ContentOneContainer End -->

<div class="maGuide03ContentTwoContainer">
    <div class="maGuide03CTCBox01">
        <div class="maGuide03CTCContBox">
            <div class="maGuide03CTCContOneBox">
                <div class="maGuide03CTCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_01.png" alt="01">
                    <div class="maGuide03CTCContOneTitle">Script 작성하기
                    </div>
                </div>
                <div class="maGuide03CTCContOneDesc">
                    <p>
                        1. Script를 생성 합니다.<br>
                        　- 방법 1 : [File] – [New] – [Script] 선택<br>
                        　- 방법 2 : Script Explorer창에서 오른쪽 마우스 선택 후 [New] –[Script] 선택<br>
                        　- 방법 3 : 툴바 아이콘 중 <img src="${contextPath }/resources/images/popup_tag2_cont_01.png" width="29" height="15" alt=""/> (New) – <img src="${contextPath }/resources/images/popup_tag2_cont_02.png" width="13" height="13" alt=""/> (Script) 선택<br>
                        2. Script Explorer창에서 작성할 Script를 더블 클릭하여 오픈 합니다.<br>
                        3. Script Editor창에 Script가 오픈 되었는지 확인 후 이벤트를 추가하여 Script를 작성 합니다.
                    </p>
                </div>
                <div class="maGuide03CTCContOneTitle2">이벤트 추가 하기
                </div>
                <div class="maGuide03CTCContOneCont">
                    <ul>
                        <li><span>&middot;</span>Scene View를 통한 이벤트 추가하기 <img src="${contextPath }/resources/images/popup_tag2_cont_03.png" width="222" height="24" align="right"/></li>
                        <li><span>&middot;</span>툴바를 통한 이벤트 추가하기</li>
                    </ul>
                </div>
                <div class="maGuide03CTCContOneDesc2">
                    <p>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_04.png" width="12" height="12" alt=""/> Keypad<br>
                        　 - Script에 디바이스의 기본 버튼 기능을 수행하는 이벤트를 추가 합니다.<br>
                        　 - 추가 가능한 버튼은 Home, Back, Menu, Power, Volume Up, Volume Down 버튼 중 하나 입니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_05.png" width="12" height="12" alt=""/> Capture<br>
                        　 - 디바이스의 화면을 캡처하는 이벤트를 추가 합니다. 이벤트 수행 시 디바이스의 화면을 캡처 합니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_06.png" width="12" height="12" alt=""/> Install<br>
                        　 - Script에 App을 설치하는 이벤트를 추가 합니다. 이벤트 추가 후 Script Editor창에서 설치할 apk 파일을 선택할 수<br>
                        　　있습니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_07.png" width="12" height="12" alt=""/> Uninstall<br>
                        　 - Script에 App을 제거하는 이벤트를 추가합니다. 이벤트 추가 후 Script Editor창에서 제거할 App의 패키지 명을 입력할 수<br>
                        　　있습니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_08.png" width="12" height="12" alt=""/> Open URL<br>
                        　 - Script에 디바이스의 웹 브라우저를 통해 URL을 실행하는 이벤트를 추가 합니다.<br>
                        　 - 이벤트 추가 후 Script Editor창에서 연결할 URL을 입력할 수 있습니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_09.png" width="12" height="12" alt=""/> Record<br>
                        　 - Script에 디바이스 화면을 녹화하는 이벤트를 추가 합니다.<br>
                        　 - 이벤트 추가 시 기본으로 작성 중인 Script의 가장 마지막 이벤트까지 녹화가 설정됩니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_10.png" width="12" height="12" alt=""/> Rotate<br>
                        　 - Script에 디바이스 화면을 가로 또는 세로로 회전하는 이벤트를 추가 합니다. 이벤트 추가 시 기본 모드는 Portrait 이며, <br>
                        　　휴대폰의 기본 모드와 같습니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_11.png" width="12" height="12" alt=""/> Run App<br>
                        　 - Script에 실행할 App을 설정하는 이벤트를 추가 합니다. 이전에 ‘Install’ 이벤트를 추가한 후 ‘RunApp’ 이벤트를 추가하면 <br>
                        　설치될 apk 파일 정보가 기본으로 입력 됩니다.<br>
                        　 - 이전에 ‘Install’ 이벤트를 추가한 적이 없는 경우엔 기본 값이 설정 되지 않으며, Script Editor창에서 실행할 App을 선택할<br>
                        　　수 있습니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_12.png" width="12" height="12" alt=""/> Wait For Log<br>
                        　 - Script에 로그를 대기하는 이벤트를 추가 합니다. 이벤트를 수행 하면 지정된 시간 동안 특정 로그가 전달될 때까지 다음 <br>
                        　이벤트를 수행하지 않고 대기 합니다.<br>
                        　 - 이벤트 추가 시 Timeout 시간을 0초가 설정 되며, Script Editor창에서 로그를 입력하거나 Timeout 시간을 변경할 수<br>
                        　　있습니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_13.png" width="12" height="12" alt=""/> Wake<br>
                        　 - Script에 디바이스의 슬립모드를 해제하는 이벤트를 추가 합니다. 이벤트 수행 시 디바이스가 슬립모드일 때 슬립모드를 <br>
                        　해제하며, 슬립모드가 아닌 경우 아무런 동작도 하지 않습니다.<br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.<br>
                        <br>
                        <img src="${contextPath }/resources/images/popup_tag2_cont_14.png" width="12" height="12" alt=""/> Script<br>
                        　 - Script에 다른 Script를 연결하는 이벤트를 추가합니다. 이벤트 수행 시 해당 순서에서 연결한 Script를 수행한 후 다음 <br>
                        　 이벤트를 수행합니다. <br>
                        　 - 오픈된 Script가 있을 때만 메뉴가 나타납니다.
                    </p>
                </div>
                <div class="maGuide03CTCContOneTitle3">메뉴를 통한 이벤트 추가하기
                </div>
                <div class="maGuide03CTCContOneCont2">
                    <ul>
                        <li><span>&middot;</span>[Insert] 메뉴를 통해 이벤트를 추가할 수 있으며, 추가 가능한 이벤트는 툴바 이벤트와 동일 합니다.</li>
                        <li><span>&middot;</span>Keypad, Capture, Install, Uninstall, Open URL, Record, Rotate, Run App, Menu, Wait, Wait For Log, Wake, Script 이벤트를 <br>
                            　추가할 수 있습니다.</li>
                        <li>※ [Insert] 메뉴는 Script가 열려 있을 때만 나타납니다.</li>
                    </ul>
                </div>
            </div><!-- .maGuide03CTCContOneBox End -->
            <div class="maGuide03CTCContTwoBox">
                <div class="maGuide03CTCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_02.png" alt="02">
                    <div class="maGuide03CTCContTwoTitle">테스트 예약하기
                    </div>
                </div>
                <div class="maGuide03CTCContTwoDesc">
                    <p>
                        작성한 스크립트를 원격 디바이스에서 테스트 할 수 있도록 예약합니다. 예약을 하기 위해서는 먼저 로그인이 필요합니다.<br>
                        1. [File] - [New] - [Test Reservation] 메뉴를 선택하여 Test를 생성 합니다.<br>
                        2. 스크립트 선택 화면에서 테스트를 수행할 스크립트를 선택하고, 각 스크립트의 실행 횟수를 설정 합니다.<br>
                        3. 디바이스 선택 화면에서 테스트를 수행할 시간을 설정한 후, 테스트 할 디바이스를 선택 합니다.<br>
                        <br><br>
                        < 스크립트 선택 화면 >
                    </p>
                    <img src="${contextPath }/resources/images/popup_tag3_cont_15.png" width="473" height="341" alt=""/>
                    <div class="maGuide03CTCContOneCont3">
                        <ul>
                            <li><br><span>&middot;</span>스크립트 목록</li>
                            <li>　- PC에 저장된 스크립트 목록을 보여줍니다. <br>
                                　- 스크립트 실행 시 필요한 관련 파일(설치 파일, 데이터 파일, 연결된 스크립트 파일)이 없는 경우 목록에 비활성화 상태로 보여집니다.<br>
                                　- 원격 단말기를 통해 테스트 할 스크립트를 선택할 수 있으며, '추가' 버튼을 통해 실행 목록에 추가할 수 있습니다.<br>
                                　- 스크립트는 하나 또는 여러 개를 한꺼번에 선택이 가능하며, 스크립트의 중복 추가가 가능합니다.<br>
                                　- 실행 불가능한(비활성화 상태) 스크립트는 실행 목록에 추가할 수 없으며, 폴더 또는 root(‘Scripts’)를 선택하여 추가하는 경우 <br>
                                　　해당 스크립트는 제외하고 추가 됩니다. <br>
                                　- '모두 추가' 버튼을 누르면 목록에 있는 전체 스크립트가 실행 목록에 추가 됩니다.<br>
                                　- 스크립트 1회 실행 시 예상 시간을 분 단위로 보여줍니다.<br>
                                　※ 스크립트 내용이 없는(예상시간 0분) 스크립트는 목록에 보여지지 않습니다.</li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContOneCont4">
                        <ul>
                            <li><br><span>&middot;</span>실행 목록</li>
                            <li>　- PC에 저장된 스크립트 목록을 보여줍니다. <br>
                                　- 원격 단말기를 통해 테스트 할 스크립트 목록으로 '스크립트 목록'에서 추가한 스크립트들을 순서대로 보여줍니다.<br>
                                　- 드래그 앤 드롭을 통해 실행 순서의 변경이 가능하고, 각각의 스크립트마다 실행횟수를 변경할 수 있습니다.<br>
                                　- 예상 시간은 스크립트의 내용과 실행횟수를 통해 자동으로 계산되며, 분 단위로 표시됩니다.<br>
                                　- 스크립트 목록에서 잘못 추가한 스크립트는 '삭제' 버튼을 통해 실행 목록에서 삭제할 수 있습니다. <br>
                                　- '모두 삭제' 버튼을 누르면 목록에 있는 모든 스크립트가 목록에서 삭제 됩니다.<br>
                                　- 테스트 진행 시 실행 목록 순서대로 진행됩니다.<br>
                                　- 목록 하단에 테스트 진행 시 차감되는 포인트를 계산하여 남은 시간을 보여줍니다.</li>
                        </ul>
                        <p><br><br>
                            < 디바이스 선택 화면 >
                        </p>
                        <img src="${contextPath }/resources/images/popup_tag3_cont_16.png" width="506" height="443" alt=""/></div>
                    <div class="maGuide03CTCContOneCont5">
                        <ul>
                            <li><br><span>&middot;</span>예약 시간</li>
                            <li>　- 테스트를 수행할 시간을 설정 합니다. 테스트를 바로 수행하거나 시간을 예약할 수 있습니다. <br>
                                　- '바로 실행' 항목을 체크하면 테스트를 바로 수행할 수 있고, 체크를 해제하면 날짜와 시간을 선택하여 테스트 예약이 가능합니다.<br>
                                　- 바로 실행하지 않는 경우 시간과 날짜를 선택한 후      (새로고침) 버튼을 선택하여 단말기 목록을 조회할 수 있습니다.<br>
                                　- ‘테스트 예상 소요 시간’ 은 스크립트 선택 화면에서 선택한 스크립트들의 전체 테스트 수행 예상 시간 입니다.</li>
                            <li><br><span>&middot;</span>단말기 목록</li>
                            <li>
                                　- 사용 가능한 전체 단말기 목록을 보여주며, 선택한 예약 시간을 기준으로 사용 가능시간을 알려줍니다.</br>
                                　- 제조사와 버전을 선택하면 선택한 단말기 목록만 조회할 수 있습니다.<br>
                                　- ‘사용 가능시간’ 은 현재 시간 또는 선택한 시간을 기준으로 사용 시작이 가능한 시간과 사용할 수 있는 시간을 나타내며, <br>
                                　　날짜 및 시간과 분으로 표시 됩니다.<br>
                                　- 괄호 안에 표시된 시간(분)은 해당 시간부터 이후로 사용 할 수 있는 시간 입니다.<br>
                                　　예시) 2015-01-19 14:01 (80분)  →  2015-01-19일 14:01분 부터 80분간 사용 가능<br>
                                　- ‘바로 실행 버튼을 체크한 경우 바로 사용이 가능한 단말기는 ‘사용 가능시간’에 날짜 대신 ‘바로 사용가능’ 으로 표시되며, <br>
                                　　괄호 안에 시간(분) 대신 무제한으로 표시된 경우 단말기 사용 시간에 제한이 없습니다.<br>
                                　　예시) 2015-01-19 14:01 (80분)  →  2015-01-19일 14:01분 부터 80분간 사용 가능<br>
                                　- 단말기를 선택하면 ‘선택 예약’ 버튼이 활성화 되며 버튼을 선택하면 예약 목록에 단말기가 추가 됩니다. <br>
                                　- 단말기 별로 다른 시간을 설정하여 한 번에 여러 시간대의 예약을 할 수 있으며, 단말기를 여러 개 선택하여 동일한 시간에도 <br>
                                　- 예약을 할 수 있습니다.</li>
                            <li><br><span>&middot;</span>예약 목록</li>
                            <li>
                                　- 예약 시간 항목에서 선택 예약한 단말기 목록을 보여줍니다.</br>
                                　- 선택 예약된 단말기 정보를 확인할 수 있으며, 목록에 나타난 단말기를 하나 또는 여러 개 선택하여 예약을 취소할 수 있습니다.<br>
                                　- 최소 하나의 단말기 목록이 있을 때 테스트 예약을 완료할 수 있습니다.<br>
                                　- 테스트 시작 시간’은 실제로 테스트가 시작될 시간으로 여러 시간대에 예약을 한 경우 테스트 시간 시간을 한 번에 확인할 수 <br>
                                　　있습니다.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="maGuide03CTCContThree">
                <div class="maGuide03CTCContThreeBox">
                    <div class="maGuide03CTCContThreeNum">
                        <img src="${contextPath }/resources/images/popup_mag_num_03.png" alt="03">
                        <div class="maGuide03COCContThreeTitle">
                            <span>Workspace 변경하기</span>
                        </div>
                    </div>
                    <div class="maGuide03CTCContThreeCont">
                        <ul>
                            <li><span>&middot;</span>[File] – [Switch Workspace…] 메뉴에서 작업 폴더<br>
                                　(Workspace)를 변경할 수 있습니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContThreeCont2">
                        <ul>
                            <li><span>&middot;</span>메뉴를 선택했을 때 선택되어 있는 폴더는 현재 작업 중인 <br>
                                　Workspace 이며, 새로운 폴더를 생성하거나 기존 폴더를 <br>
                                　선택하여 Workspace 위치를 변경할 수 있습니다.
                            </li>
                            <li><span>&middot;</span>폴더를 선택한 후 확인 버튼을 누르면 Workspace를 변경하기<br>
                                　전에 작업 중이던 Workspace의 내용을 삭제할 것인지를 <br>
                                　선택할 수 있습니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContThreeCont3">
                        <ul>
                            <li><span>&middot;</span>삭제 확인 창에서 ‘Yes’ 버튼을 선택하면 이전 Workspace 폴더를<br>
                                　포함한 하위의 모든 파일이 삭제 되며, ‘No’ 버튼을 선택하면<br>
                                　파일을 삭제하지 않습니다.
                            </li>
                            <li><span>&middot;</span>파일 삭제를 선택했을 때 편집 중이던 스크립트가 있으면 <br>
                                　저장 여부를 묻지 않고 삭제 됩니다. 삭제된 파일은 이후 복원을 <br>
                                　할 수 없으니 신중히 판단 후 삭제 여부를 선택해야 합니다. 특히 <br>
                                　필요한 파일은 미리 다른 위치에 백업을 해 두거나, 업로드 기능을<br>
                                　통해 서버에 백업을 한 후 삭제를 선택할 수 있도록 해야 합니다.
                            </li>
                            <li><span>&middot;</span>삭제 확인 창의 기본 버튼은 ‘No’ 버튼으로 되어 있습니다.
                            </li>
                        </ul>
                    </div>
                </div><!-- .maGuide03CTCContThreeBox End -->
                <div class="maGuide03CTCContThreeBox2">
                    <div class="maGuide03CTCContThreeimg">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_17.png"></div>
                    <div class="maGuide03CTCContThreeimg2">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_18.png"></div>
                </div>
            </div><!-- .maGuide03CTCContThree End -->

            <div class="maGuide03CTCContFour">
                <div class="maGuide03CTCContFourBox">
                    <div class="maGuide03CTCContFourNum">
                        <img src="${contextPath }/resources/images/popup_mag_num_04.png" alt="04">
                        <div class="maGuide03COCContFourTitle">
                            <span>업데이트 하기</span>
                        </div>
                    </div>
                    <div class="maGuide03CTCContFourCont">
                        <ul>
                            <li><span>&middot;</span>최신 업데이트를 통해 Clapp Automation 툴을 최신 버전으로 <br>
                                　업데이트 할 수 있습니다. 프로그램 시작 시 업데이트 할 <br>
                                　최신 버전이 있는 경우 알림 창을 통해 업데이트를 확인할 수 <br>
                                　있습니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContFourCont2">
                        <ul>
                            <li><span>&middot;</span>‘OK’ 버튼을 선택하면 업데이트를 진행하며, ‘Cancel’을 선택하면<br>
                                　업데이트 없이 프로그램을 실행 합니다. 업데이트를 진행하는 <br>
                                　경우 완료 후 프로그램이 재실행 됩니다. 업데이트를 취소한<br>
                                　경우에는 추후 프로그램 실행 시 또는 프로그램 내 [Help] – <br>
                                　[Check for Updates] 메뉴를 통해서도 업데이트 할 수 있습니다.
                            </li>
                            <li><span>&middot;</span>[Help] – [Check for Updates] 메뉴를 통해 업데이트 하는 경우<br>
                                　먼저 업데이트 할 최신 버전이 있는지 확인합니다. 업데이트 할 <br>
                                　내용이 없는 경우 아래와 같이 알림창이 나타납니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContFourCont3">
                        <ul>
                            <li><span>&middot;</span>업데이트할 내용이 있는 경우 최신 버전 업데이트 내역이 <br>
                                　나타납니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContFourCont4">
                        <ul>
                            <li><span>&middot;</span>업데이트 내역을 확인한 후 업데이트 할 버전을 체크한 다음<br>
                                　‘Next’ 버튼을 선택합니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContFourCont5">
                        <ul>
                            <li><span>&middot;</span>업데이트 내역을 확인한 후 업데이트 할 버전을 체크한 다음<br>
                                　‘Next’ 버튼을 선택합니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContFourCont6">
                        <ul>
                            <li><span>&middot;</span>라이선스 정보를 확인한 후 ‘Finish’ 버튼을 누르면 업데이트를<br>
                                　진행 합니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContFourCont7">
                        <ul>
                            <li><span>&middot;</span>경고창이 나타나면 ‘OK’ 버튼을 선택하여 업데이트를 계속 진행<br>
                                　합니다. ‘Cancel’ 버튼을 누르면 업데이트를 진행하지 않고 <br>
                                　취소 됩니다.
                            </li>
                        </ul>
                    </div>
                    <div class="maGuide03CTCContFourCont8">
                        <ul>
                            <li><span>&middot;</span>업데이트가 완료 되면 프로그램을 재 시작할지 물어보는 팝업 <br>
                                　창이 나타나며, ‘Yes’ 버튼을 누르면 프로그램을 다시 시작 합니다. <br>
                                　‘No’ 버튼을 누르면 프로그램을 다시 시작하지 않으며, 다음 <br>
                                　프로그램 실행 시 업데이트 된 버전을 사용할 수 있습니다.
                            </li>
                        </ul>
                    </div>
                </div><!-- .maGuide03CTCContFourBox End -->
                <div class="maGuide03CTCContFourBox2">
                    <div class="maGuide03CTCContFourimg">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_19.png"></div>
                    <div class="maGuide03CTCContFourimg2">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_20.png"></div>
                    <div class="maGuide03CTCContFourimg3">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_21.png"></div>
                    <div class="maGuide03CTCContFourimg4">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_22.png"></div>
                    <div class="maGuide03CTCContFourimg5">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_23.png"></div>
                    <div class="maGuide03CTCContFourimg6">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_24.png"></div>
                    <div class="maGuide03CTCContFourimg7">
                        <img src="${contextPath }/resources/images/popup_tag3_cont_25.png"></div>
                </div>
            </div><!-- .maGuide03CTCContFour End -->

        </div>
    </div>
</div><!-- .maGuide03ContentTwoContainer End -->
