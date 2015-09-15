<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="maGuide01ContentOneContainer">
    <div class="maGuide01COCMainBox">
        <div class="maGuide01COCMainTitle">
            <span>Over View</span>
        </div>
        <div class="maGuide01COCMainDesc">
            <p>
                Clapp Automation 툴은 여러가지 이벤트를 활용하여, 원하는 내용의 스크립트를 작성할 수 있고, 테스트 예약을 통해 <br>
                원격 디바이스를 통한 실제 테스트 진행이 가능합니다. 아래에서는 프로그램의 주요 기능을 간단하게 설명 합니다.<br>
                Script Explorer, Scene Explorer, Script Editor, Scene View, Device, Test History, Test Details, Result View로 구성되어 있습니다.
            </p>
        </div>
    </div><!-- .maGuide01COCMainBox End -->
</div><!-- .maGuide01ContentOneContainer End -->

<div class="maGuide01ContentTwoContainer">
    <div class="maGuide01CTCBox01">
        <div class="maGuide01CTCContBox">
            <div class="maGuide01CTCContOneBox">
                <div class="maGuide01CTCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_01.png" alt="01">
                    <div class="maGuide01CTCContOneTitle">Short Cuts
                    </div>
                </div>
                <div class="maGuide01CTCContOneCont">
                    <ul>
                        <li><span>&middot;</span>Ctrl+A – Select All</li>
                        <li><span>&middot;</span>Ctrl+C – Copy</li>
                        <li><span>&middot;</span>Ctrl+X – Cut</li>
                        <li><span>&middot;</span>Ctrl+V – Paste</li>
                        <li><span>&middot;</span>Ctrl+Z – Undo</li>
                        <li><span>&middot;</span>Delete – Delete</li>
                        <li><span>&middot;</span>F2 – Rename</li>
                    </ul>
                </div>
            </div><!-- .maGuide01CTCContOneBox End -->
            <div class="maGuide01CTCContTwoBox">
                <div class="maGuide01CTCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_02.png" alt="02">
                    <div class="maGuide01COCContTwoTitle">
                        <span>Menu</span>
                    </div>
                </div>
                <div class="maGuide01CTCContTwoDesc">
                    <p>
                        상단 메뉴의 설명 입니다.
                    </p>
                </div>
                <div class="maGuide01COCContTwoTable">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td height="25" colspan="2" style="padding-left:10px; border-right:1px solid #ffffff;">Menu</td>
                            <td width="498" height="25" style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td width="72" height="339" align="center" valign="middle" style="border-bottom:1px solid #d5dce5;">File</td>
                            <td width="225" style="padding-left:10px; border-left:1px solid #d5dce5; border-right:1px solid #d5dce5; border-bottom:1px solid #d5dce5;">Log In/Log Out<br>Test Reservation<br>Folder<br>Script<br>Close<br>Close All<br>Save<br>Save As..<br>Save All<br>Download..<br>Switch Workspace…<br>Settings…<br>Exit</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">Clapp 웹 페이지에 로그인 또는 로그아웃 합니다.<br>Script 테스트를 예약 합니다.<br>Script 또는 Scene 폴더를 생성 합니다.<br>Script를 생성합니다.<br>열려 있는 Script를 종료합니다.<br>
                                열려 있는 모든 Script를 종료합니다.<br>수정된 Script를 저장합니다.<br>Script를 다른 이름으로 저장합니다.<br>수정된 모든 Script를 저장합니다.<br>웹 서버에서 파일을 다운로드 합니다.<br>Workspace를 변경 합니다.<br>
                                사용 환경을 설정합니다.<br>프로그램을 닫습니다.</td>
                        </tr>
                        <tr>
                            <td height="236" align="center" valign="middle" style="border-bottom:1px solid #d5dce5;">Edit</td>
                            <td style="padding-left:10px; border:1px solid #d5dce5;">Undo<br>Redo<br>Copy<br>Cut<br>Paste<br>Delete<br>Select All<br>Loop<br>Unloop</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;"><p>현재 작업의 이전으로 돌립니다.<br>사용자가 입력한 마지막 작업으로 다시 돌립니다.<br>선택항목을 복사합니다.<br>선택항목을 잘라냅니다.<br>선택한 곳에 복사하거나 잘라낸 항목을 붙여넣기 합니다.<br>
                                선택항목을 삭제합니다.<br>모두 선택 합니다.<br>Script에 선택한 이벤트의 반복 수행을 설정하는 이벤트를 추가합니다.<br>Script에서 선택한 반복 설정을 해제 합니다.</p></td>
                        </tr>
                        <tr>
                            <td height="446" align="center" style="border-bottom:1px solid #d5dce5;">Insert</td>
                            <td style="padding-left:10px; border:1px solid #d5dce5;">Home<br>
                                Back<br>Menu<br>Power<br>VolumeUp<br>VolumeDown<br>Capture<br>Install<br>Uninstall<br>Open URL<br>Record<br>Rotate<br>Run App<br>Wait<br>Wait For Log<br>Wake<br>Script</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">Script에 디바이스의 Home버튼 기능을 수행하는 이벤트를 추가합니다.<br>Script에 디바이스의 Back 버튼 기능을 수행하는 이벤트를 추가합니다.<br>Script에 디바이스의 Menu버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                Script에 디바이스의 Power버튼 기능을 수행하는 이벤트를 추가합니다.<br>Script에 디바이스의 Volume Up버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                Script에 디바이스의 Volume Down버튼 기능을 수행하는 이벤트를 추가합니다.<br>Script에 디바이스의 현재 화면을 캡처하는 이벤트를 추가합니다.<br>Script에 App을 설치하는 이벤트를 추가합니다.<br>
                                Script에 설치된 App을 제거하는 이벤트를 추가합니다.<br>Script에 디바이스의 웹 브라우저를 통해 URL을 오픈하는 이벤트를 추가합니다.<br>Script에 디바이스 화면을 녹화하는 이벤트를 추가 합니다.<br>
                                Script에 디바이스 화면을 가로 또는 세로로 회전하는 이벤트를 추가합니다.<br>Script에 실행할 App을 설정하는 이벤트를 추가합니다.<br>Script에 명령대기시간을 설정하는 이벤트를 추가합니다.<br>
                                Script에 로그대기를 설정하는 이벤트를 추가합니다.<br>Script에 디바이스의 슬립모드를 해제 하는 이벤트를 추가합니다.<br>Script에 다른 Script를 연결하는 이벤트를 추가합니다.</td>
                        </tr>
                        <tr>
                            <td height="54" align="center" style="border-bottom:1px solid #d5dce5;">Window</td>
                            <td style="padding-left:10px; border:1px solid #d5dce5;">Open Perspective<br>
                                Show View</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">Perspective를 변경할 수 있습니다.<br>현재 활성화된 Perspective에 따라 open 가능한 창 목록을 보여줍니다.</td>
                        </tr>
                        <tr>
                            <td height="82" align="center" style="border-bottom:1px solid #d5dce5;">Help</td>
                            <td style="padding-left:10px; border:1px solid #d5dce5;">Help Contents<br>
                                Check for Updates<br>About Clapp Automation</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">Clapp Automation툴의 도움말을 보여줍니다.<br>업데이트가 있는지 확인하고, 업데이트를 진행합니다.<br>Clapp Automation툴에 대한 정보를 보여줍니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div><!-- .maGuide01CTCContTwoBox End -->
            <div class="maGuide01CTCContThreeBox">
                <div class="maGuide01CTCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_03.png" alt="03">
                    <div class="maGuide01CTCContThreeTitle">
                        <span>ToolBar</span>
                    </div>
                </div>
                <div class="maGuide01CTCContThreeDesc">
                    <p>사용자가 자주 사용하는 명령어들을 모아 놓았습니다. <br>Script를 생성하거나 이벤트를 추가 또는 실행할 수 있습니다.
                    </p>
                </div>
                <div class="maGuide01COCContThreeTable">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td width="299px;" height="25px;" style="padding-left:10px; border-right:1px solid #ffffff;">ToolBar</td>
                            <td style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;" height="659px;">Test Reservation<br>Folder<br>Script<br>Save<br>Save All<br>Home<br>Back<br>Menu<br>Power<br>VolumeUp<br>VolumeDown<br>Capture<br>Install<br>Uninstall<br>
                                Open URL<br>Record<br>Rotate<br>Run App<br>Wait<br>Wait For Log<br>Wake<br>Script<br>Start Script Test<br>Debug From Selected Event<br>Stop</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">Script 테스트를 예약합니다.<br>
                                Script 또는 Scene 폴더를 생성합니다.<br>
                                Script를 생성합니다.<br>
                                수정된 Script를 저장합니다.<br>
                                수정된 모든 Script를 저장합니다.<br>
                                디바이스의 Home버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                디바이스의 Back 버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                디바이스의 Menu버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                디바이스의 Power버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                디바이스의 Volume Up버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                디바이스의 Volume Down버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                현재 화면을 캡처하는 이벤트를 추가합니다.<br>
                                디바이스에 App을 설치하는 이벤트를 추가합니다.<br>
                                디바이스에 설치된 App을 제거하는 이벤트를 추가합니다.<br>
                                디바이스의 웹 브라우저를 통해 URL을 실행하는 이벤트를 추가합니다.<br>
                                디바이스 화면을 녹화하는 이벤트를 추가합니다.<br>
                                디바이스 화면을 가로 또는 세로로 회전하는 이벤트를 추가합니다.<br>
                                실행할 App을 설정하는 이벤트를 추가합니다.<br>
                                명령대기 시간을 설정하는 이벤트를 추가합니다.<br>
                                로그대기를 설정하는 이벤트를 추가합니다.<br>
                                디바이스의 슬립모드를 해제 하는 이벤트를 추가합니다.<br>
                                다른 Script를 연결하는 이벤트를 추가합니다.<br>
                                활성화된 Script의 테스트를 시작합니다.<br>
                                활성화된 Script의 선택한 이벤트부터 테스트를 시작합니다.<br>
                                진행 중인 테스트를 중단합니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div><!-- .maGuide01CTCContThreeBox End -->
            <div class="maGuide01CTCContFourBox">
                <div class="maGuide01CTCContFourNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_04.png" alt="04">
                    <div class="maGuide01CTCContFourTitle">
                        <span>Script</span>
                    </div>
                </div>
                <div class="maGuide01CTCContFourDesc">
                    <p>
                        Script Perspective 에서는 Script를 생성, 오픈하여 편집하는 기능을 제공 합니다.
                    </p>
                </div>
            </div><!-- .maGuide01CTCContFourBox End -->
            <div class="maGuide01CTCContFiveBox">
                <div class="maGuide01CTCContFiveNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_05.png" alt="05">
                    <div class="maGuide01CTCContFiveTitle">
                        <span>Script Explorer</span>
                    </div>
                </div>
                <div class="maGuide01CTCContFiveDesc">
                    <p>
                        Script 목록을 관리하며, 새로운 Script 생성 및 오픈 기능을 제공 합니다.<br>
                        생성 및 오픈된 Script는 Script Editor창이나 Scene View창에서 수정 가능합니다.<br>
                        <br>
                        Option and Menu Commands
                    </p>
                </div>
                <div class="maGuide01COCContFiveTable">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td width="299px;" height="25px;" style="padding-left:10px; border-right:1px solid #ffffff;">Menu</td>
                            <td style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;" height="295px;">Folder<br>
                                Script<br>
                                Copy<br>
                                Cut<br>
                                Paste<br>
                                Delete<br>
                                Import…<br>
                                Export…<br>
                                Upload<br>
                                Download..<br>
                                Rename</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">폴더를 생성합니다.<br>
                                Script 또는 Scene 폴더를 생성합니다.<br>
                                선택한 폴더 또는 Script를 복사합니다.<br>
                                선택한 폴더 또는 Script를 잘라냅니다.<br>
                                복사 또는 잘라낸 항목을 선택한 위치에 붙여넣기 합니다.<br>
                                선택한 폴더 또는 Script를 삭제합니다.<br>
                                외부로부터 Script를 가져 옵니다.<br>
                                선택한 Script를 외부로 내보냅니다.<br>
                                선택한 폴더 또는 Script를 웹 서버로 업로드 합니다.<br>
                                웹 서버에서 폴더 또는 Script를 다운로드 합니다.<br>
                                폴더 또는 Script의 이름을 변경 합니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div><!-- .maGuide01CTCContFiveBox End -->
            <div class="maGuide01CTCContSixBox">
                <div class="maGuide01CTCContSixNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_06.png" alt="06">
                    <div class="maGuide01CTCContSixTitle">
                        <span>Scene View</span>
                    </div>
                </div>
                <div class="maGuide01CTCContSixDesc">
                    <p>
                        Scene을 이용하여 Script에 이벤트를 추가 합니다.<br>
                        <br>
                        Option and Menu Commands
                    </p>
                </div>
                <div class="maGuide01COCContSixTable">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td width="299px;" height="25px;" style="padding-left:10px; border-right:1px solid #ffffff;">ToolBar</td>
                            <td style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;" height="87px;">Scene Capture<br>
                                Sync Device<br>
                                Clear</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">연결된 디바이스의 현재 화면을 캡처 합니다.<br>
                                연결된 디바이스에 이벤트를 전달하고 화면을 동기화 합니다.<br>
                                화면에 보이는 이미지를 초기화 합니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <div class="maGuide01COCContSixTable2">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td width="299px;" height="25px;" style="padding-left:10px; border-right:1px solid #ffffff;">Event</td>
                            <td style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;" height="365px;">Select<br>
                                Text<br>
                                IfNot<br>
                                Press<br>
                                Drag<br>
                                Search<br>
                                WaitLog<br>
                                Home<br>
                                Back<br>
                                Menu<br>
                                Power<br>
                                VolumeUp<br>
                                VolumeDown</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">Scene에서 선택한 아이템을 선택하는 이벤트를 추가합니다.<br>
                                Scene에서 선택한 입력란에 글자를 입력하는 이벤트를 추가합니다.<br>
                                Scene에서 선택한 아이템을 검색하여 검색 성공 여부에 따라 서로 다른 <br>
                                이벤트를 수행하도록 설정하는 이벤트를 추가합니다.<br>
                                Scene에서 선택한 위치를 선택하는 이벤트를 추가합니다.<br>
                                Scene에서 드래그한 동작 이벤트를 추가합니다.<br>
                                Scene에서 선택한 아이템을 검색하는 이벤트를 추가합니다.<br>
                                특정 로그의 수신을 대기하는 이벤트를 추가합니다.<br>
                                디바이스의 Home버튼 기능을 수행하는 이벤트를 추가합니다.<br>
                                디바이스의 Back 버튼 기능을 수행하는 이벤트를 추가 합니다.<br>
                                디바이스의 Menu버튼 기능을 수행하는 이벤트를 추가 합니다.<br>
                                디바이스의 Power버튼 기능을 수행하는 이벤트를 추가 합니다.<br>
                                디바이스의 Volume Up버튼 기능을 수행하는 이벤트를 추가 합니다.<br>
                                디바이스의 Volume Down버튼 기능을 수행하는 이벤트를 추가 합니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div><!-- .maGuide01CTCContSixBox End -->
            <div class="maGuide01CTCContSevenBox">
                <div class="maGuide01CTCContSevenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_07.png" alt="07">
                    <div class="maGuide01CTCContSevenTitle">
                        <span>Device</span>
                    </div>
                </div>
                <div class="maGuide01CTCContSevenDesc">
                    <p>
                        연결된 디바이스 화면을 보여 줍니다. <br>
                        디바이스 내의 세부 메뉴를 통해 디바이스의 직접 사용이 가능하며, Sync Device를 통해 Scene View와의 연동이 가능합니다.<br>
                        <br>
                        Option and Menu Commands
                    </p>
                </div>
                <div class="maGuide01COCContSevenTable">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td width="299px;" height="25px;" style="padding-left:10px; border-right:1px solid #ffffff;">ToolBar</td>
                            <td style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;" height="25px;">Scene Capture</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">디바이스의 현재 화면을 캡처 합니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                        	<span>
								Device Sub Menu
						  </span>
                <div class="maGuide01COCContSevenTable2">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td height="25px;" colspan="2" style="padding-left:10px; border-right:1px solid #ffffff;">Menu</td>
                            <td style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td width="140px" height="81px;" align="center" style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">File</td>
                            <td width="155px" style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">App Install<br>
                                Clean Up<br>
                                Device Log</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">디바이스에 App을 설치합니다.<br>
                                디바이스에서 테스트에 사용한 App을 삭제 합니다.<br>
                                디바이스의 로그 정보를 출력합니다.</td>
                        </tr>
                        <tr>
                            <td height="50px;" align="center" style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">Command</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">Input Text<br>
                                Open URL</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">디바이스의 입력창에 글자를 입력합니다.<br>
                                디바이스의 웹 브라우저를 연결하여 URL을 실행 합니다.</td>
                        </tr>
                        <tr>
                            <td height="50px;" align="center" style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">Screen</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">Rotate<br>
                                Wake Up</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">디바이스의 방향을 가로/세로로 전환 합니다.<br>
                                디바이스의 슬립모드를 해제 합니다.</td>
                        </tr>
                        <tr>
                            <td height="25px;" align="center" style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">Settings</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">Sound On/Off</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">디바이스의 사운드를 On/Off 합니다.</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div><!-- .maGuide01CTCContSevenBox End -->
            <div class="maGuide01CTCContEightBox">
                <div class="maGuide01CTCContEightNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_08.png" alt="08">
                    <div class="maGuide01CTCContEightTitle">
                        <span>Script Editor</span>
                    </div>
                </div>
                <div class="maGuide01CTCContEightDesc">
                    <p>
                        Script에 이벤트를 추가하거나 추가된 이벤트를 수정할 수 있습니다.<br>
                        <br>
                        Option and Menu Commands
                    </p>
                </div>
                <div class="maGuide01COCContEightTable">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td width="299px;" height="25px;" style="padding-left:10px; border-right:1px solid #ffffff;">ToolBar</td>
                            <td style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;" height="322px;">Copy<br>
                                Cut<br>
                                Paste<br>
                                Delete<br>
                                Select All<br>
                                Loop<br>
                                Unloop<br>
                                Show Column<br>
                                Hide Column<br>
                                Open File<br>
                                Event Properties…<br>
                                Script Properties…</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">선택한 이벤트를 복사합니다.<br>
                                선택한 이벤트를 잘라냅니다.<br>
                                복사 또는 잘라낸 이벤트를 선택한 곳에 붙여넣기 합니다.<br>
                                선택한 이벤트를 삭제합니다.<br>
                                이벤트 목록을 전체 선택합니다.<br>
                                선택한 이벤트들의 동작을 반복 설정합니다.<br>
                                반복 설정을 해제합니다.<br>
                                숨김처리한 Column을 다시 나타냅니다.<br>
                                Column을 숨김처리 합니다.<br>
                                테스트 진행 후 테스트 결과 파일을 오픈합니다.<br>
                                선택한 이벤트의 세부 속성을 설정합니다.<br>
                                리소스 사용량을 측정할 패키지를 설정합니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <div class="maGuide01COCContEightTable2">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td height="25px;" colspan="2" style="padding-left:10px;">Display Info</td>
                        </tr>
                        <tr>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;" height="114px;">No<br>
                                Event<br>
                                Value<br>
                                Result</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">이벤트의 순서 정보를 나타냅니다.<br>
                                이벤트의 간략한 정보를 나타냅니다.<br>
                                이벤트에 필요한 설정 값 정보를 나타냅니다.<br>
                                테스트 수행 시 테스트 결과를 나타냅니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div><!-- .maGuide01CTCContEightBox End -->
            <div class="maGuide01CTCContNineBox">
                <div class="maGuide01CTCContNineNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_06.png" alt="06">
                    <div class="maGuide01CTCContNineTitle">
                        <span>Test</span>
                    </div>
                </div>
                <div class="maGuide01CTCContNineDesc">
                    <p>
                        Test Perspective에서는 예약된 테스트를 관리하고, 테스트 결과를 확인하는 기능을 제공 합니다.
                    </p>
                </div>
                <div class="maGuide01CTCContNineTitle2">
                    <span>Test History</span>
                </div>
                <div class="maGuide01CTCContNineDesc2">
                    <p>
                        예약한 테스트 목록을 관리하며, 완료된 테스트와 예약된 테스트를 구분하여 볼 수 있습니다.<br>
                        <br>
                        Option and Menu Commands
                    </p>
                </div>
                <div class="maGuide01COCContNineTable">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td width="299px;" height="25px;" style="padding-left:10px; border-right:1px solid #ffffff;">Menu</td>
                            <td style="padding-left:10px;">Description</td>
                        </tr>
                        <tr>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;" height="115px;">Show Result<br>
                                Rename<br>
                                Cancel<br>
                                Delete</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">테스트 결과를 확인합니다.<br>
                                선택한 항목의 이름을 변경합니다.<br>
                                테스트 예약을 취소합니다.<br>
                                테스트를 삭제합니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <div class="maGuide01CTCContNineTitle3">
                    <span>Test Details</span>
                </div>
                <div class="maGuide01CTCContNineDesc3">
                    <p>
                        테스트 진행 상황 및 세부 내역을 확인할 수 있습니다.<br>
                        <br>
                        Option and Menu Commands
                    </p>
                </div>
                <div class="maGuide01COCContNineTable2">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td height="25px;" colspan="2" style="padding-left:10px;">Summary</td>
                        </tr>
                        <tr>
                            <td width="299" height="140px;" style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">테스트 상태<br>
                                시작 시간<br>
                                예상 종료 시간<br>
                                종료 시간<br>
                                결과 보기</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">테스트의 현재 상태를 나타냅니다. <br>
                                테스트가 시작된 시간을 나타냅니다. <br>
                                테스트의 예상 종료 시간을 나타냅니다.<br>
                                테스트가 종료된 시간을 나타냅니다.<br>
                                테스트 결과를 나타냅니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <div class="maGuide01COCContNineTable3">
                    <table width="800" border="0" cellspacing="1" cellpadding="0">
                        <tbody>
                        <tr bgcolor="#d5dce5">
                            <td height="25px;" colspan="2" style="padding-left:10px;">Scripts</td>
                        </tr>
                        <tr>
                            <td width="299" height="115px;" style="padding-left:10px; border-bottom:1px solid #d5dce5; border-right:1px solid #d5dce5;">이름<br>
                                전체 횟수<br>
                                진행 횟수<br>
                                결과</td>
                            <td style="padding-left:10px; border-bottom:1px solid #d5dce5;">테스트를 진행한 Script와 디바이스의 이름을 나타냅니다. <br>
                                테스트 예약 시 Script에 설정한 실행 횟수를 나타냅니다. <br>
                                테스트 진행이 완료된 실행 횟수를 나타냅니다.<br>
                                테스트 성공/실패 여부를 나타냅니다.</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div><!-- .maGuide01CTCContNineBox End -->
        </div>
    </div>
</div><!-- .maGuide01ContentTwoContainer End -->
