<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="maGuide05ContentOneContainer">
    <div class="maGuide05COCMainBox">
        <div class="maGuide05COCMainTitle">
            <span>Script Test</span>
        </div>
        <div class="maGuide05COCMainDesc">
            <p>
                Script Test 는 Script Explorer, Scene Explorer,  Script Editor, Scene View, Device 가 있습니다.<br>
            </p>
        </div>
    </div><!-- .maGuide05COCMainBox End -->
</div><!-- .maGuide05ContentOneContainer End -->

<div class="maGuide05ContentTwoContainer">
    <div class="maGuide05CTCBox01">
        <div class="maGuide05CTCContBox">
            <div class="maGuide05CTCContOneBox">
                <div class="maGuide05CTCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_01.png" alt="01">
                    <div class="maGuide05CTCContOneTitle">Script Explorer</div>
                </div>
                <div class="maGuide05CTCContOneDesc">
                    <p>
                        Script Explorer는 원격 디바이스를 테스트 할 수 있는 Script를 생성하고, 관리 합니다.
                    </p>
                </div>
                <div class="maGuide05CTCContOneImg">
                    <img src="${contextPath }/resources/images/popup_tag5_cont_01.png">
                </div>
                <div class="maGuide05CTCContOneDesc2">
                    <p>
                        - 마우스 오른쪽 버튼을 눌러 팝업 메뉴를 이용할 수 있습니다.<br>
                        - 폴더를 생성하여 Script를 폴더 별로 관리할 수 있습니다.<br>
                        - Script를 마우스 더블 클릭해 Script Editor창에 오픈 할 수 있습니다.
                    </p>
                </div>
            </div><!-- .maGuide05CTCContOneBox End -->
            <div class="maGuide05CTCContTwo">
                <div class="maGuide05CTCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_02.png" alt="02">
                    <div class="maGuide05COCContTwoTitle">
                        <span>팝업 메뉴</span>
                    </div>
                </div>
                <div class="maGuide05CTCContTwoImg"></div>

                <span class="maGuide05CTCContTwoImg"><img src="${contextPath }/resources/images/popup_tag5_cont_02.png"></span>
                <div class="maGuide05CTCContTwoBox">
                    <div class="maGuide05CTCContTwoCont">
                        <ul>
                            <li><span>&middot;</span>New > Folder</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　선택한 위치에 새로운 폴더를 생성합니다.이름을 입력하고<br>
                            　 ‘OK’ 버튼을 눌러 폴더를 생성할 수 있습니다. <br>
                            　이름은 한글, 영문, 숫자 구분 없이 최대 100자까지 입력 <br>
                            　가능합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTwoCont2">
                        <ul>
                            <li><span>&middot;</span>New > Script</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　선택한 위치에 새로운 Script를 생성합니다. 이름을 입력하고 <br>
                            　‘OK’ 버튼을 눌러 Script를 생성할 수 있습니다.<br>
                            　이름은 한글, 영문, 숫자 구분 없이 최대 100자까지 입력 <br>
                            　가능합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTwoCont3">
                        <ul>
                            <li><span>&middot;</span>Copy</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　선택한 Script 또는 폴더를 복사합니다. 하나 또는 여러 개를 <br>
                            　선택하여 복사가 가능합니다. root(‘Scripts’)는 복사할 수 없습<br>
                            　니다.<br>
                            　생성 후 한번도 저장하지 않은 Script는 복사할 수 없습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTwoCont5">
                        <ul>
                            <li><span>&middot;</span>Cut</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　선택한 Script 또는 폴더를 잘라냅니다. 하나 또는 여러 개를 <br>
                            　선택하여 잘라내기가 가능합니다. root(‘Scripts’)는 잘라내기 <br>
                            　할 수 없습니다.
                        </>
                    </div>
                    <div class="maGuide05CTCContTwoCont6">
                        <ul>
                            <li><span>&middot;</span>Paste</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　복사하거나 잘라낸 Script 또는 폴더를 선택한 위치에 붙여넣기<br>
                            　합니다. 복사 및 잘라낸 아이템은 자기 자신이나 하위에 붙여넣기 <br>
                            　할 수 없습니다. 잘라낸 아이템은 동일한 위치에 붙여넣기 할 수<br>
                            　없습니다. Script를 선택한 상태에서는 붙여넣기 할 수 없습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTwoCont7">
                        <ul>
                            <li><span>&middot;</span>Delete</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　선택한 Script 또는 폴더를 삭제합니다. 폴더를 삭제하면 하위에<br>
                            　있는 모든 폴더와 Script가 함께 삭제 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTwoCont8">
                        <ul>
                            <li><span>&middot;</span>Import</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　외부로부터 Script를 가져와 선택한 위치에 추가합니다. 메뉴를<br>
                            　선택하면 파일 선택 다이얼로그를 통해 가져올 파일을 선택할 수 <br>
                            　있습니다.<br>
                            　Export 메뉴를 통해 내보내기 한 Script 파일(.sz)만 가져오기가<br>
                            　가능합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTwoCont9">
                        <ul>
                            <li><span>&middot;</span>Export</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　선택한 Script를 외부로 내보냅니다. 메뉴를 선택하면 Script를 <br>
                            　내보낼 경로 선택할 수 있습니다. 경로를 선택 후 ‘OK’ 버튼을 <br>
                            　누르면 선택한 경로에Script마다 하나의 파일로 저장이 됩니다. <br>
                            　폴더를 선택한 경우 하위에 포함된 모든 Script를 외부로 <br>
                            　내보냅니다.<br>
                            　내보내기 한 파일은 Script명으로 저장 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTwoCont10">
                        <ul>
                            <li><span>&middot;</span>Upload</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　선택한 Script 또는 폴더를 웹 서버로 업로드 합니다. 위치와<br>
                            　상관 없이 여러 개의 Script 또는 폴더를 선택할 수 있으며, <br>
                            　폴더를 선택하면 하위에 포함된 모든 Script와 폴더를 함께 <br>
                            　업로드 합니다.<br>
                            　root(‘Scripts’)를 선택하여 업로드 할 경우 서버의 내용을<br>
                            　덮어 쓸지 여부를 확인합니다.<br>
                            ※ Yes : 서버에 있는 모든 Script를 삭제하고, 로컬의 모든 <br>
                            　 Script를 업로드 합니다.<br>
                            　 동일한 이름의 Script는 업로드 한 새 파일로 변경됩니다.<br>
                            ※ Cancel : 업로드를 취소 합니다. 로컬의 Script를 업로드 <br>
                            　 하지 않습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTwoCont11">
                        <ul>
                            <li><span>&middot;</span>Download</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTwoDesc2">
                        <p>
                            　웹 서버로부터 Scene 또는 폴더를 선택하여 다운로드 합니다.
                        </p>
                    </div>
                </div><!-- .maGuide05CTCContTwoBox End -->
                <div class="maGuide05CTCContTwoBox2">
                    <div class="maGuide05CTCContTwoimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_03.png"></div>
                    <div class="maGuide05CTCContTwoimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_04.png"></div>
                    <div class="maGuide05CTCContTwoimg3">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_05.png"></div>
                    <div class="maGuide05CTCContTwoimg4">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_06.png"></div>
                    <div class="maGuide05CTCContTwoimg5">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_07.png"></div>
                </div>
                <div class="maGuide05CTCContTwoDesc">
                    <p>
                        < Script 다운로드 ><br>
                        1. 다운로드할 Script 또는 폴더를 선택합니다.<br>
                        2. ‘OK’ 버튼을 누르면 Script를 다운로드 합니다.<br>
                        ※ Script 다운로드 시 Script에 포함된 Scene과 관련 파일(설치파일, 데이터파일)이 함께 다운로드 되며, <br>
                        　 각각 Workspace 내 ‘scenes’ 폴더와 ‘downloads’ 폴더에 다운로드 됩니다. <br>
                        ※ 로컬에 동일한 이름의 Script가 있는 경우  다운로드 한 파일로 변경됩니다. Script 다운로드 시 Script에 포함된 Scene과  <br>
                        　 관련 파일(설치파일, 데이터파일)이 함께 다운로드 되며, 각각 Workspace 내 ‘scenes’ 폴더와 ‘downloads’ 폴더에 다운로드 <br>
                        　 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContTwoCont">
                    <ul>
                        <li><span>&middot;</span>Rename : 선택한 Script 또는 폴더의 이름을 변경 합니다. 이름은 한글, 영문, 숫자 구분 없이 최대 100자까지 변경 가능합니다.
                        </li>
                    </ul>
                </div>
            </div><!-- .maGuide05CTCContTwo End -->
            <div class="maGuide05CTCContThreeBox">
                <div class="maGuide05CTCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_03.png" alt="03">
                    <div class="maGuide05CTCContThreeTitle">Scene Explorer</div>
                </div>
                <div class="maGuide05CTCContThreeDesc">
                    <p>
                        Scene Explorer는 Script 작성 시 필요한 Scene들을 관리합니다. Scene은 직접 생성할 수 없으며, <br>
                        디바이스 연결 후 화면 캡처를 통해 생성할 수 있습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContThreeImg">
                    <img src="${contextPath }/resources/images/popup_tag5_cont_08.png">
                </div>
                <div class="maGuide05CTCContThreeDesc2">
                    <p>
                        - 마우스 오른쪽 버튼을 눌러 팝업 메뉴를 이용할 수 있습니다.<br>
                        - 폴더를 생성하여 Scene을 폴더 별로 관리할 수 있습니다.<br>
                        - 상단의 폴더 리스트 영역과 하단의 Scene 리스트 영역으로 구분 됩니다.<br>
                        - 폴더를 선택하면 해당 폴더에 포함된 Scene을 하단 화면에서 확인할 수 있습니다.<br>
                        - Scene View를 통해 Scene을 오픈할 수 있습니다.
                    </p>
                </div>
            </div><!-- .maGuide05CTCContThreeBox End -->
            <div class="maGuide05CTCContFour">
                <div class="maGuide05CTCContFourNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_04.png" alt="04">
                    <div class="maGuide05COCContFourTitle">
                        <span>폴더 리스트 팝업 메뉴</span>
                    </div>
                </div>
                <div class="maGuide05CTCContFourImg"></div>
                <span class="maGuide05CTCContFourImg"><img src="${contextPath }/resources/images/popup_tag5_cont_09.png"></span>
                <div class="maGuide05CTCContFourBox">
                    <div class="maGuide05CTCContFourCont">
                        <ul>
                            <li><span>&middot;</span>New > Folder</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFourDesc2">
                        <p>
                            　선택한 위치에 새로운 폴더를 생성합니다.이름을 입력하고<br>
                            　 ‘OK’ 버튼을 눌러 폴더를 생성할 수 있습니다. <br>
                            　이름은 한글, 영문, 숫자 구분 없이 최대 100자까지 입력 <br>
                            　가능합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFourCont2">
                        <ul>
                            <li><span>&middot;</span>Cut</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFourDesc2">
                        <p>
                            　Scene 또는 폴더를 잘라냅니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFourCont3">
                        <ul>
                            <li><span>&middot;</span>Paste</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFourDesc2">
                        <p>
                            　잘라낸 Scene 또는 폴더를 선택한 위치에 붙여넣기 합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFourCont4">
                        <ul>
                            <li><span>&middot;</span>Delete</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFourDesc2">
                        <p>
                            　선택한 Scene 또는 폴더를 삭제합니다.<br>
                            　폴더를 삭제하면 하위에 있는 모든 폴더와 Scene이 함께 <br>
                            　삭제 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFourCont5">
                        <ul>
                            <li><span>&middot;</span>Upload</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFourDesc2">
                        <p>
                            　선택한 폴더에 포함된 Scene을 웹 서버로 업로드 합니다.<br>
                            　위치와 상관 없이 여러 개의 Scene 또는 폴더를 선택할 수 <br>
                            　있으며, 폴더를 선택하면 하위에 포함된 모든 Scene과 폴더를 <br>
                            　함께 업로드 합니다.<br>
                            　root(‘Scenes’)를 선택하여 업로드 할 경우 서버의 내용을 덮어<br>
                            　쓸지 여부를 확인합니다.<br>
                            ※ Yes : 서버에 있는 모든 Scene을 삭제하고, 로컬의 모든 <br>
                            　Scene을 업로드 합니다.<br>
                            ※ No : 서버에 있는 Scene을 삭제 하지 않고, 로컬의 모든 <br>
                            　Scene을 업로드 합니다.<br>
                            　동일한 이름의 Scene은 업로드 한 새 파일로 변경되며, <br>
                            　동일한 폴더가 있는 경우 Scene 목록이 병합됩니다.<br>
                            ※ Cancel : 업로드를 취소합니다. 로컬의 Scene을 업로드 하지 <br>
                            　않습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFourCont6">
                        <ul>
                            <li><span>&middot;</span>Download</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFourDesc2">
                        <p>
                            　웹 서버로부터 Scene 또는 폴더를 선택하여 다운로드 합니다.
                        </p>
                    </div>
                </div><!-- .maGuide05CTCContFourBox End -->
                <div class="maGuide05CTCContFourBox2">
                    <div class="maGuide05CTCContFourimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_10.png"></div>
                    <div class="maGuide05CTCContFourimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_11.png"></div>
                    <div class="maGuide05CTCContFourimg3">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_12.png"></div>
                </div>
                <div class="maGuide05CTCContFourDesc">
                    <p>
                        < Script 다운로드 ><br>
                        1. 다운로드할 Script 또는 폴더를 선택합니다.<br>
                        2. ‘OK’ 버튼을 누르면 Script를 다운로드 합니다.<br>
                        ※ 로컬에 동일한 이름의 Scene이 있는 경우 다운로드 한 파일로 내용이 변경 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContFourCont">
                    <ul>
                        <li><span>&middot;</span>Rename : 선택한 폴더의 이름을 변경 합니다.
                        </li>
                    </ul>
                </div>
            </div><!-- .maGuide05CTCContFour End -->
            <div class="maGuide05CTCContFive">
                <div class="maGuide05CTCContFiveNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_05.png" alt="05">
                    <div class="maGuide05COCContFiveTitle">
                        <span>Scene 리스트 팝업 메뉴</span>
                    </div>
                </div>
                <div class="maGuide05CTCContFiveDesc">
                    <p>
                        Script Explorer는 원격 디바이스를 테스트 할 수 있는 Script를 생성하고, 관리 합니다.
                    </p>
                </div>
                <span class="maGuide05CTCContFiveImg"><img src="${contextPath }/resources/images/popup_tag5_cont_13.png"></span>
                <div class="maGuide05CTCContFiveBox">
                    <div class="maGuide05CTCContFiveCont">
                        <ul>
                            <li><span>&middot;</span>Open</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　Scene을 Scene View창에 오픈 합니다. 마우스 더블 클릭을 통해서도 Scene을 오픈 할 수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont2">
                        <ul>
                            <li><span>&middot;</span>Cut</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　선택한 하나 이상의 Scene을 잘라냅니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont3">
                        <ul>
                            <li><span>&middot;</span>Paste</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　잘라낸 Scene을 붙여넣기 합니다. 잘라낸 아이템이 폴더인 경우에는 붙여넣기를 할 수 없습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont4">
                        <ul>
                            <li><span>&middot;</span>Delete</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　선택한 하나 이상의 Scene을 삭제 합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont5">
                        <ul>
                            <li><span>&middot;</span>Select All</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　모든 Scene을 선택 합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont6">
                        <ul>
                            <li><span>&middot;</span>Small Image</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　Scene을 작은 이미지로 보여줍니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont7">
                        <ul>
                            <li><span>&middot;</span>Normal Image</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　Scene을 보통 크기 이미지로 보여줍니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont8">
                        <ul>
                            <li><span>&middot;</span>Large Image</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　Scene을 큰 이미지로 보여줍니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont9">
                        <ul>
                            <li><span>&middot;</span>Upload</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　선택한 Scene을 웹 서버로 업로드 합니다. <br>
                            　여러 개의 씬을 한 번에 선택하여 업로드 할 수 있습니다. 서버에 동일한 Scene이 있는 경우 업로드 하는 파일로 변경 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContFiveCont10">
                        <ul>
                            <li><span>&middot;</span>Download</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContFiveDesc2">
                        <p>
                            　웹 서버로부터 Scene 또는 폴더를 선택하여 다운로드 합니다. 메뉴를 선택하면 다운로드 창이 뜨며, <br>
                            　폴더 리스트의 ‘Download’ 메뉴와 동일하게 동작합니다.
                        </p>
                    </div>
                </div><!-- .maGuide05CTCContFiveBox End -->
            </div><!-- .maGuide05CTCContFive End -->
            <div class="maGuide05CTCContSixBox">
                <div class="maGuide05CTCContSixNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_06.png" alt="06">
                    <div class="maGuide05CTCContSixTitle">Script Editor</div>
                </div>
                <div class="maGuide05CTCContSixDesc">
                    <p>
                        Script Explorer는 원격 디바이스를 테스트 할 수 있는 Script를 생성하고, 관리 합니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixImg">
                    <img src="${contextPath }/resources/images/popup_tag5_cont_14.png">
                </div>
                <div class="maGuide05CTCContSixCont">
                    <ul>
                        <li><span>&middot;</span>여러가지 이벤트를 활용하여 원하는 내용의 스크립트를 작성할 수 있습니다. 이벤트는 Scene View,<br>
                            　툴바, Insert 메뉴를 통해 추가할 수 있으며, 각 이벤트의 세부 설정을 변경할 수 있습니다. <br>
                        </li>
                        <li><span>&middot;</span>디바이스가 연결되어 있는 경우 테스트를 예약하지 않아도 툴바의 실행 버튼을 통해 Script의 테스트가 가능합니다. <br>
                            　테스트가 진행 되는 동안 현재 수행 중인 이벤트가 선택 표시 되며, Device 창에서 진행 동작을 직접 확인할 수 있습니다.<br>
                        </li>
                    </ul>
                </div>
            </div><!-- .maGuide05CTCContSixBox End -->
            <div class="maGuide05CTCContSevenBox">
                <div class="maGuide05CTCContSevenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_07.png" alt="07">
                    <div class="maGuide05CTCContSevenTitle">표시 정보</div>
                </div>
                <div class="maGuide05CTCContSevenCont">
                    <ul>
                        <li><span>&middot;</span>No</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSevenDesc">
                    <p>
                        　이벤트의 순서 정보를 표시합니다.<br>
                        　테스트 진행 시 이벤트 수행 순서가 되며, 이벤트 추가 시 Index가 자동으로 부여 됩니다.<br>
                        　‘Search’ 이벤트와, ‘WaitLog’ 이벤트에는 Index 이외에도       (Check Point) 아이콘이 표시됩니다.<br>
                        　‘No’에 표시되는 Index는 테스트 진행 순서 이외에도 ‘Record’ 이벤트에서 녹화를 종료할 이벤트를 지정하거나,<br>
                        　‘IfNot’ 이벤트에서 건너 뛸 이벤트를 지정하는 정보로 활용 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSevenCont">
                    <ul>
                        <li><span>&middot;</span>Event</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSevenDesc">
                    <p>
                        　이벤트명을 표시하며, 이벤트 추가 시 자동으로 설정 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSevenCont">
                    <ul>
                        <li><span>&middot;</span>Value</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSevenDesc">
                    <p>
                        　이벤트에 필요한 설정 값 정보를 나타냅니다. 대부분 이벤트 추가 시 기본 값 또는 설정 값을 가지고 있으며 편집이 가능합니다.<br>
                        　설정 값의 편집은 추가적인 설정 창을 통해 가능하며, ‘Value’ 영역을 눌러 직접 편집이 가능한 이벤트도 있습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSevenCont">
                    <ul>
                        <li><span>&middot;</span>Result</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSevenDesc">
                    <p>
                        　테스트 결과를 나타냅니다. 이벤트만 추가한 경우에는 아무런 값을 가지고 있지 않으며 툴바의 ‘Play’ 버튼을 통해 <br>
                        　Script를 실행했을 때 해당 이벤트의 수행 결과가 표시 됩니다.
                    </p>
                </div>
            </div>
            <div class="maGuide05CTCContEightBox">
                <div class="maGuide05CTCContEightNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_08.png" alt="08">
                    <div class="maGuide05CTCContEightTitle">이벤트</div>
                </div>
                <div class="maGuide05CTCContEightCont">
                    <ul>
                        <li><span>&middot;</span>Capture</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContEightDesc2">
                    <p>
                        　화면 캡처 동작을 수행 합니다. ‘Value’ 값을 갖지 않으며, 이벤트 수행 후 캡처한 이미지가 저장 됩니다.<br>
                        　이미지 파일은 Script를 바로 실행한 경우에는 로컬 컴퓨터에 저장 되며, 테스트 예약을 통해 테스트를 진행한 경우에는 서버에 저장<br>
                        　됩니다.<br>
                        　서버에 저장된 이미지는 테스트 결과 창을 통해 확인할 수 있습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContEightCont">
                    <ul>
                        <li><span>&middot;</span>Install</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContEightDesc2">
                    <p>
                        　테스트 하고자 하는 애플리케이션의 apk 파일을 로컬 컴퓨터에서 선택하여 디바이스에 설치 합니다. <br>
                        　설치한 애플리케이션은 디바이스 종료 시 삭제 됩니다. ‘Value’ 항목을 선택하여 값을 직접 설정할 수 있습니다.<br>
                        - 값 직접 설정<br>
                        　‘Value’ 항목 선택 시 파일 경로 선택 버튼이 나타나며, 버튼을 선택하여 설치할 apk 파일을 선택할 수 있습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContEightCont">
                    <ul>
                        <li><span>&middot;</span>OpenURL</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContEightDesc2">
                    <p>
                        　입력한 주소로 인터넷을 연결 실행 합니다. Timeout 시간을 두어 웹 페이지가 열리는 대기 시간을 설정할 수 있습니다.<br>
                        　웹 페이지가 열리는 동안 최대 Timeout 시간만큼 대기 합니다.
                    </p>
                </div>
                <div class="maGuide05CTCContEightContBox">
                    <div class="maGuide05CTCContEightDesc">
                        <p>
                            - 값 직접 설정<br>
                            　‘Value’ 항목 선택 시 텍스트 입력 가능 상태가 되며, 웹 페이지 <br>
                            　주소를 바로 입력할 수 있습니다. 기본 Timeout 시간은 1초로<br>
                            　설정 됩니다.<br>
                            - 설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의 <br>
                            　‘Event Properties…’를 선택하면 설정 창이 나타납니다. URL과 <br>
                            　Timeout 값 입력 후 ‘OK’ 버튼을 누르면 창이 닫히고, ‘Value’ <br>
                            　항목에 URL이 표시 됩니다.<br>
                            ※ URL : 웹 페이지 주소를 입력합니다.<br>
                            ※ Timeout : 초단위로 Timeout 시간을 설정합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>Record</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　테스트 진행 과정을 동영상으로 녹화 합니다. ‘Record’ 이벤트가 <br>
                            　추가된 다음 이벤트부터 녹화가 진행되며, 지정된 이벤트까지 <br>
                            　수행이 끝나면 녹화가 종료 됩니다.<br>
                            　이벤트 추가 시 기본 값으로 가장 마지막 이벤트가 설정 되며,<br>
                            　‘Value’ 항목을 선택하여 값을 직접 설정할 수 있습니다.<br>
                            　녹화된 동영상은 Script를 바로 실행한 경우 로컬 컴퓨터에 저장 <br>
                            　되며, 테스트 예약을 통해 테스트를 진행한 경우 서버에 저장 <br>　됩니다.<br>
                            　서버에 저장된 동영상은 테스트 결과 창을 통해서 확인할 수 <br>　있습니다.<br>
                            ※ 동영상의 녹화 가능 시간은 최대 30분 입니다.<br>
                            - 값 직접 설정<br>
                            　‘Value’ 항목 선택 시 텍스트 입력 가능 상태가 되며, 녹화를 <br>
                            　종료할 이벤트를 ‘No’ 항목을 참고하여 숫자로 입력합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>Rotate</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　디바이스의 방향을 Portrait/Landscape 상태로 전환 합니다.<br>
                            　휴대폰의 기본 모드는 Portrait 이며, 태블릿은 Landscape 모드<br>
                            　입니다. 이벤트를 추가하면 ‘Portrait’이 기본 값으로 설정 됩니다.<br>
                            　이벤트를 수행 하면 디바이스 화면이 설정한 모드로 전환되어 <br>
                            　화면에 표시 됩니다. ‘Value’ 항목을 선택하여 값을 직접 설정할 수 <br>　있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>RunApp</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　테스트 하고자 하는 앱의 Package명을 입력하여 실행합니다. <br>
                            　앱을 선택하여 실행하는 방식이 아니라 Package를 직접 <br>
                            　실행시켜 디바이스의 화면과 상관없이 실행이 가능 합니다.<br>
                            - 값 직접 설정<br>
                            　‘Value’ 항목 선택 시 콤보박스가 나타나며 실행할 Package명을<br>
                            　선택할 수 있습니다.<br>
                            　디바이스가 연결 중일 때만 콤보박스가 나타나며, 디바이스가<br>
                            　연결 중이 아닐 때는 텍스트 입력 가능 상태가 되어 Package명을<br>
                            　직접 입력할 수 있습니다.<br>
                            - 설정 창을 통한 값 설정<br>
                            　 ‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의<br>
                            　‘Event Properties…’를 선택하면 설정 창이 나타납니다. <br>
                            　Package 명을 입력한 후 ‘OK’ 버튼을 누르면 창이 닫히고, <br>
                            　 ‘Value’ 항목에 Package명이 표시 됩니다.<br>
                            　Activity 는 필수 입력 항목이 아니며, 특정 Activity를 실행하려면<br>
                            　항목 옆에 체크를 선택한 후 입력할 수 있습니다.<br>
                            ※ Package : Package 명을 입력합니다.<br>
                            ※ Activity : Activity명을 입력합니다. 값을 입력하려면 체크를 <br>
                            　선택해야 합니다.<br>
                            　체크를 해제하면 항목이 비활성화 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>Wait</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　이벤트 대기 시간을 설정합니다. ‘Wait’ 이벤트를 수행하면 <br>
                            　설정된 시간 동안 다음 이벤트를 수행하지 않고 대기 합니다.<br>
                            　이벤트 추가 시 기본 값은 1초이며, 대기시간은 초 단위로 설정이 <br>
                            　가능합니다.<br>
                            　‘Value’ 항목을 선택하여 값을 직접 설정할 수 있습니다.<br>
                            - 값 직접 설정
                            　‘Value’ 항목 선택 시 텍스트 입력 가능 상태가 <br>　되며, 대기 시간을 초 단위로 입력 합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>WaitLog</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　특정 로그가 전달될 때까지 이벤트를 수행하지 않고 대기합니다. <br>
                            　확인할 로그를 텍스트로 입력할 수 있으며, 지정된 Timeout <br>
                            　시간까지 로그가 도착하지 않으면 진행 중인 테스트를 실패로<br>
                            　종료 합니다.<br>
                            　이벤트 추가 시 기본 Log 값은 없으며, Timeout 시간은 0초로 <br>
                            　설정 됩니다.  Timeout 시간이 0초인 경우 기존 전달 된 로그 중 <br>
                            　확인할 로그가 있는지 확인 후 바로 성공/실패 여부를 판단합니다.<br>
                            - 값 직접 설정<br>
                            　‘Value’ 항목 선택 시 텍스트 입력 가능 상태가 되며, <br>
                            　확인할 로그 키워드를 입력 합니다. 기본 Timeout 시간은 <br>
                            　0초로 설정 됩니다. <br>
                            - 설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의<br>
                            　‘Event Properties…’를 선택하면 설정 창이 나타납니다.<br>
                            　확인할 로그 키워드와 Timout 시간을 입력한 후 ‘OK’ 버튼을 <br>
                            　누르면 창이 닫히고, ‘Value’ 항목에 로그 키워드가 표시 됩니다.<br>
                            ※ Log : 확인할 로그 키워드를 입력합니다.<br>
                            ※ Activity : Timeout 시간을 입력합니다. 값을 입력하려면 체크를<br>
                            　선택해야 합니다.<br>
                            　체크를 해제하면 Timeout 시간이 무한대로 설정되어 설정한 <br>
                            　로그를 확인할 때까지 대기합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>Wake</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　디바이스의 슬립모드를 해제 합니다. ‘Value’ 값을 갖지 않으며,<br>
                            　디바이스가 슬립 상태가 아닌 경우 아무런 동작도 하지 않습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>Script</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　다른 스크립트를 연결할 수 있습니다. 이벤트를 수행 하면 <br>
                            　해당 순서에서 연결한 스크립트에 있는 이벤트를 순차적으로 <br>
                            　수행합니다. ‘Value’ 항목을 선택하여 Script를 선택할 수 있습니<br>　다.
                            - 값 직접 설정 <br>
                            　‘Value’ 항목 선택 시 콤보박스가 나타나며 수행할 스크<br>　립트를
                            　선택할 수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>Loop</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　반복적으로 수행해야 할 이벤트를 선택하여 ‘Loop’ 이벤트를<br>
                            　설정할 수 있습니다.<br>
                            　이벤트 추가 시 데이터 파일의 선택 여부를 확인합니다. 반복<br>
                            　수행할 작업에서 Data Set을 이용하는 경우 ‘Yes’ 버튼을 눌러<br>
                            　데이터 파일을 선택 합니다.<br>
                            　Data Set을 이용하지 않는 경우 ‘No’ 버튼을 누른 후 반복 횟수를 <br>
                            　설정 합니다.<br>
                            　데이터 파일의 선택 여부를 선택 하고 나면 이벤트 추가 전 <br>
                            　선택되어 있던 이벤트 목록이 ‘Loop’ 이벤트 하위 목록으로<br>
                            　변경 됩니다.<br>
                            　데이터 파일을 선택하지 않았을 때 기본 반복 횟수는 1회 입니다.<br>
                            　데이터 파일 설정은 ‘데이터 파일 설정’ 내용을 참조 합니다. <br>
                            - 값 직접 설정<br>
                            　데이터 파일을 선택한 경우 ‘Value’ 항목을 선택하면 파일 경로 <br>
                            　선택 버튼이 나타나며, 버튼을 선택하여 데이터 파일을 선택할 <br>
                            　수 있습니다.<br>
                            　데이터 파일을 선택하지 않은 경우 ‘Value’ 항목을 선택하면 <br>
                            　텍스트 입력 가능 상태가 되며 반복 횟수를 입력 할 수 있습니다.
                            <br>
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightDesc">
                        <p>
                            - 설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의<br>
                            　데이터 파일을 선택하지 않은 경우 ‘Count’ 항목만 활성화 되어 <br>
                            　있으며 반복 횟수를 입력할 수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightDesc">
                        <p>
                            　데이터 파일을 설정하려면 ‘Data File’ 항목을 체크 한 후 <br>
                            　파일 경로 선택 버튼을 통해 파일을 선택할 수 있습니다.<br>
                            　데이터 파일을 선택한 경우 설정 창을 열면 ‘Data File’ 항목만 <br>
                            　활성화 되어 있으며 파일 경로 선택 버튼을 통해 파일을 선택할<br>
                            　수 있습니다.<br>
                            　데이터 파일 설정을 해제하려면 ‘Data File’ 항목의 체크를 <br>
                            　해제 한 후 ‘Count’ 항목에 반복 횟수를 입력합니다.<br>
                            　데이터 파일 선택 시 파일 경로 선택 버튼 오른쪽의 이미지 <br>
                            　버튼을 선택하면 선택한 데이터 파일을 엑셀 프로그램을 통해 <br>
                            　확인할 수 있습니다. <br>
                            　반복횟수를 입력한 경우 ‘OK’ 버튼을 누르면 ‘Value’ 항목에<br>
                            　반복 횟수가 표시 되며, 데이터 파일을 설정한 경우 ‘OK’ 버튼을 <br>
                            　누르면 ‘Value’ 항목에 ‘Data Set(파일명)’ 형태로 표시 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>Select</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　디바이스 화면에서 특정 아이템을 선택 합니다. <br>
                            　이벤트 추가 시 Scene에서 선택한 아이템을 Object로 인식하여 <br>
                            　값으로 설정됩니다.<br>
                            　‘Value’ 항목을 선택하여 값을 직접 설정하는 것은 불가능하며, <br>
                            　설정 창을 통해서만 값 설정이 가능합니다.<br>
                            ※ 선택하려는 아이템이 하이브리드앱(HybridApp)의 <br>
                            　웹 뷰(Web View) 영역 또는 웹 브라우저(IE, Chrome 등) <br>
                            　영역에 포함되어 있는 경우에는 선택할 수 없습니다.<br>
                            - 설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의 <br>
                            　‘Event Properties…’를 선택하면 설정 창이 나타납니다.<br>
                            　Object의 type 및 Scroll 가능 여부는 선택한 아이템에 따라 <br>
                            　자동으로 설정되어지며, Object의 값을 입력하거나, Scroll <br>
                            　옵션 값을 설정할 수 있습니다.<br>
                            　‘Wait transition’ 항목을 체크하면 이벤트에 의해 화면이 <br>
                            　전환되는 경우 화면이 전환될 때까지 기다립니다.<br>
                            　‘Long-press’ 항목을 체크하면 디바이스에서 아이템 선택 시 <br>
                            　long press 동작으로 수행 합니다.<br>
                            ※ Select Object : Object의 값으로 Object의 타입이 Text 또는 <br>
                            　Description일 경우 직접 입력이 가능하며, Class인 경우에는 <br>
                            　입력란이 비활성화 됩니다.<br>
                            ※ Object는 Text / Description / Class 중에 하나의 타입을 <br>
                            　가질 수 있으며 타입은 항목명 옆에 보여집니다.<br>
                            ※ Class : 선택한 Object가 Scroll이 가능하거나, Scroll이 가능한<br>
                            　Object에 포함된 경우에 해당 Scroll Object의 Class 명이<br>
                            　표시됩니다.<br>
                            ※ Type : 선택한 Object가 Scroll이 가능하거나, Scroll이 가능한 <br>
                            　Object에 포함된 경우에 항목이 활성화 되며, 콤보박스를 통해 <br>
                            　Scroll 타입을 선택할 수 있습니다. <br>
                            　Scroll을 사용하지 않을 경우 None을 선택할 수 있으며, <br>
                            　None / Vertical / Horizontal 중 하나의 타입을 가질 수 <br>
                            　있습니다.<br>
                            ※ Count : 선택한 Object가 Scroll이 가능하거나, Scroll이 가능한 <br>
                            　Object에 포함된 경우에 항목이 활성화 되며, Scroll 하는 횟수를<br>
                            　설정할 수 있습니다. 이벤트 추가 시 기본 값은 3회입니다.<br>
                            ※ Long-press : 디바이스에서 선택 동작 시 long press로 수행 <br>
                            　합니다.<br>
                            ※ Wait transition : 이벤트에 의해 화면이 전환되는 경우 화면이 <br>
                            　다 전환될 때까지 대기 합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont">
                        <ul>
                            <li><span>&middot;</span>Text</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　디바이스 화면의 특정 위치에 텍스트를 입력합니다. 이벤트 <br>
                            　추가 시 Scene에서 선택한 아이템을 Object로 인식합니다. <br>
                            　Object의 타입 중 Class가 우선순위로 인식되며, 설정 창을 <br>
                            　통해 타입을 변경할 수 있습니다.<br>
                            　이벤트를 수행 하면 해당 Object를 찾아 텍스트를 입력합니다. <br>
                            　Object를 찾지 못한 경우 이벤트가 실패하며, 텍스트 입력 <br>
                            　또한 수행하지 않습니다.<br>
                            - 선택하려는 아이템이 하이브리드앱(HybridApp)의 <br>
                            　웹 뷰(Web View) 영역 또는 웹 브라우저(IE, Chrome 등) <br>
                            　영역에 포함되어 있는 경우에는 선택할 수 없습니다.<br>
                            - 값 직접 설정<br>
                            　‘Value’ 항목을 선택하면 텍스트 입력 가능 상태가 되며, <br>
                            　디바이스 화면에 입력할 텍스트를 입력할 수 있습니다.<br>
                            - 설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의 <br>
                            　‘Event Properties…’를 선택하면 설정 창이 나타납니다. <br>
                            　Object의 타입을 변경할 수 있으며 타입에 따라 Value 값의<br>
                            　입력이 가능합니다.<br>
                            　Scroll이 가능한 Object를 선택한 경우 Scroll Object 영역이 <br>
                            　활성화 되어 항목명 옆에 Class명이 보여지고, Scroll 옵션 값을<br>
                            　설정할 수 있습니다. Scroll 가능 여부는 선택한 아이템에 따라<br>
                            　자동으로 설정되어집니다.<br>
                            ※ Text Type : 콤보박스를 통해 Text 타입을 선택합니다. 이벤트 <br>
                            　추가 시 Class로 설정되어 있으며, Text / Description / Class <br>
                            　중에 하나의 타입을 가질 수 있습니다. <br>
                            ※ Text Value : Object 타입이 Text 또는 Description일 경우에 <br>
                            　값을 입력할 수 있으며, Class인 경우엔 영역이 비활성화 되고, <br>
                            　Object의 Class 명이 자동으로 입력됩 니다.<br>
                            　입력하는 값은 Object의 속성 값으로 텍스트를 입력하려는<br>
                            　Object의 Text 값 또는 Description 값을 입력해야 합니다.<br>
                            ※ Scroll Class : 선택한 Object가 Scroll이 가능하거나, Scroll이 <br>
                            　가능한 Object에 포함된 경우에 해당 Scroll Object의 Class <br>
                            　명이 표시됩니다.<br>
                            ※ Scroll Type : 선택한 Object가 Scroll이 가능하거나, Scroll이 <br>
                            　가능한 Object에 포함된 경우에 항목이 활성화 되며, <br>
                            　콤보박스를 통해 Scroll 타입을 선택합니다. <br>
                            　Scroll을 사용하지 않을 경우 None을 선택할 수 있으며, <br>
                            　None / Vertical / Horizontal 중 하나의 타입을 가질 수 <br>　있습니다.<br>
                            ※ Count : 선택한 Object가 Scroll이 가능하거나, Scroll이 가능한<br>
                            　Object에 포함된 경우에 항목이 활성화 되며, Scroll 하는 횟수를 <br>
                            　설정할 수 있습니다. 이벤트 추가 시 기본 값은 3회입니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont2">
                        <ul>
                            <li><span>&middot;</span>IfNot</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　디바이스 화면에서 특정 아이템을 찾아 검색 성공 여부에 따라 <br>
                            　다음에 수행할 이벤트를 서로 다르게 설정합니다.<br>
                            　특정 아이템을 찾는 동작은 ‘Search’ 이벤트와 동일하며, 검색 <br>
                            　성공 시 ‘No’ 항목에 따라 다음 이벤트를 수행 합니다.<br>
                            　아이템 검색을 실패하면 지정된 이벤트로 건너 뛰어 이벤트를 <br>
                            　수행 합니다. <br>
                            　‘Value’ 항목을 선택하여 검색 실패 시 수행할 이벤트를 지정할 <br>
                            　수 있습니다. 이벤트 추가 시 기본으로 지정된 이벤트의 index는<br>
                            　1 입니다.<br>
                            ※ 선택하려는 아이템이 하이브리드앱(HybridApp)의 웹 뷰<br>
                            　(Web View) 영역 또는 웹 브라우저(IE, Chrome 등) 영역에 <br>
                            　포함되어 있는 경우에는 선택할 수 없습니다.<br>
                            -  값 직접 설정<br>
                            　‘Value’ 항목 선택 시 텍스트 입력 가능 상태가 되며, <br>
                            　아이템 검색 실패 시 수행할 이벤트를 ‘No’ 항목을 참고하여<br>
                            　숫자로 입력합니다.<br>
                            - 설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의 ‘Event<br>
                            　Properties…’를 선택하면 설정 창이 나타납니다. 아이템 검색 <br>
                            　실패 시 수행할 이벤트를 입력할 수 있으며, Object의 설정이 <br>
                            　가능합니다.<br>
                            ※ Select Object : Object의 값으로 Object의 타입이 Text 또는 <br>
                            　Description일 경우 직접 입력이 가능하며, Class인 경우에는 <br>
                            　입력란이 비활성화 됩니다.<br>
                            　Object는 Text / Description / Class 중에 하나의 타입을<br>
                            　가질 수 있으며 항목명 옆에 보여집니다. <br>
                            ※ Class : 선택한 Object가 Scroll이 가능하거나, Scroll이 가능한 <br>
                            　Object에 포함된 경우에 해당 Scroll Object의 Class 명이<br>
                            　표시됩니다.<br>
                            ※ Type : 선택한 Object가 Scroll이 가능하거나, Scroll이 가능한<br>
                            　Object에 포함된 경우에 항목이 활성화 되며, 콤보박스를 통해 <br>
                            　Scroll 타입을 선택합니다. <br>
                            　Scroll을 사용하지 않을 경우 None을 선택할 수 있으며, <br>
                            　None / Vertical / Horizontal 중 하나의 타입을 가질 수 있습니다.<br>
                            ※ Count : 선택한 Object가 Scroll이 가능하거나, Scroll이 가능한<br>
                            　Object에 포함된 경우에 항목이 활성화 되며, Scroll 하는 횟수를 <br>
                            　설정할 수 있습니다. 이벤트 추가 시 기본 값은 3회입니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont2">
                        <ul>
                            <li><span>&middot;</span>Press</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　디바이스 화면에서 특정 위치를 선택 합니다. 이벤트 추가 시<br>
                            　Scene에서 선택했던 위치의 x, y 좌표 값이 이벤트의 Value <br>
                            　값으로 설정 됩니다.<br>
                            　좌표 값의 수정이 가능하며, 이벤트 수행 시 Script 작성에<br>
                            　활용된 Scene과 디바이스의 해상도가 다른 경우 디바이스의 <br>
                            　해상도에 맞게 위치 값이 조정 됩니다.<br>
                            　‘Value’ 항목을 선택하여 값을 직접 설정하는 것은 불가능하며, <br>
                            　설정 창을 통해서만 값 설정이 가능합니다.<br>
                            -  설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의<br>
                            　‘Event Properties…’를 선택하면 설정 창이 나타납니다.<br>
                            　선택할 위치의 x, y 좌표 값을 입력할 수 있으며, ‘Long-press’ <br>
                            　항목을 체크하면 디바이스에서 아이템 선택 시 long press <br>
                            　동작으로 수행 합니다.<br>
                            　‘OK’ 버튼을 누르면 창이 닫히고, ‘Value’ 항목에 X, Y 좌표 값이 <br>
                            　표시 됩니다.<br>
                            ※ X : 선택할 위치의 x 좌표 값을 입력합니다. 좌표 값은 이벤트 <br>
                            　추가 시 활용된 Scene의 좌표 값을 기준으로 합니다. <br>
                            ※ Y : 선택할 위치의 y 좌표 값을 입력합니다. 좌표 값은 이벤트<br>
                            　추가 시 활용된 Scene의 좌표 값을 기준으로 합니다.<br>
                            ※ Long-press : 디바이스에서 선택 동작 시 long press로 <br>
                            　수행 합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont2">
                        <ul>
                            <li><span>&middot;</span>Drag</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　디바이스 화면에서 드래그 동작을 수행 합니다. 이벤트 추가 시 <br>
                            　Scene에서 드래그 동작을 수행한 시작 위치 값과, 종료 위치<br>
                            　값이 이벤트의 Value 값으로 설정 됩니다.<br>
                            　좌표 값 및 수행 시간의 설정이 가능하며, 이벤트 수행 시 Script <br>
                            　작성에 활용된 Scene과 디바이스의 해상도가 다른 경우<br>
                            　디바이스의 해상도에 맞게 위치 값이 조정 됩니다.<br>
                            　‘Value’ 항목을 선택하여 값을 직접 설정하는 것은 불가능하며, <br>
                            　설정 창을 통해서만 값 설정이 가능합니다.<br>
                            -  설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의 ‘Event <br>
                            　Properties…’를 선택하면 설정 창이 나타납니다. 드래그 시작 <br>
                            　위치와 종료 위치의 x, y 좌표 값을 입력할 수 있으며, 드래그 <br>
                            　동작의 수행 시간을 설정 할 수 있습니다.<br>
                            　‘OK’ 버튼을 누르면 창이 닫히고, ‘Value’ 항목에 시작 위치와 <br>
                            　종료 위치의 좌표 값이 표시 됩니다.<br>
                            ※ Start : 시작 위치의 X, Y 좌표 값을 입력합니다. 좌표 값은 <br>
                            　이벤트 추가 시 활용된 Scene의 좌표 값을 기준으로 합니다. <br>
                            ※ End : 종료 위치의 X, Y 좌표 값을 입력합니다. 좌표 값은 <br>
                            　이벤트 추가 시 활용된 Scene의 좌표 값을 기준으로 합니다.<br>
                            　추가 시 활용된 Scene의 좌표 값을 기준으로 합니다.<br>
                            ※ Time : 드래그 동작을 수행하는 시간을 밀리 초(ms) 단위로<br>
                            　입력 합니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContEightCont2">
                        <ul>
                            <li><span>&middot;</span>Keypad</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContEightDesc2">
                        <p>
                            　디바이스의 기본 버튼 기능을 수행 합니다. 선택 가능한 버튼은<br>
                            　Home, Back, Menu, Power, Volume Up/Down 버튼 중 하나 <br>
                            　입니다.<br>
                            　이벤트 추가 시 선택한 아이콘에 의해 값이 설정 됩니다.<br>
                            -  값 직접 설정<br>
                            　‘Value’ 항목 선택 시 콤보박스가 나타나며 6개의 버튼 중 하나를 <br>
                            　선택 합니다.<br>
                            -  설정 창을 통한 값 설정<br>
                            　‘Event’ 항목을 더블 클릭하거나 마우스 우클릭 메뉴의 ‘Event <br>
                            　Properties…’를 선택하면 설정 창이 나타납니다. 콤보박스를 <br>
                            　통해 키패드 종류를 선택한 후 ‘OK’ 버튼을 누르면 창이 닫히고, <br>
                            　‘Value’ 항목에 선택한 키패드가 표시 됩니다.<br>
                            　‘Long-press’ 항목을 체크하면 디바이스에서 버튼 동작 시 long <br>
                            　press 동작으로 수행 합니다.<br>
                            ※ Keypad : 키패드 종류를 선택 합니다.<br>
                            ※ Long-press : 디바이스에서 버튼 동작 시 long press로 <br>
                            　수행 합니다.
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContEightBox2">
                    <div class="maGuide05CTCContEightimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_15.png"></div>
                    <div class="maGuide05CTCContEightimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_16.png"></div>
                    <div class="maGuide05CTCContEightimg3">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_17.png"></div>
                    <div class="maGuide05CTCContEightimg4">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_18.png"></div>
                    <div class="maGuide05CTCContEightimg5">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_19.png"></div>
                    <div class="maGuide05CTCContEightimg6">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_20.png"></div>
                    <div class="maGuide05CTCContEightimg7">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_21.png"></div>
                    <div class="maGuide05CTCContEightimg8">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_22.png"></div>
                    <div class="maGuide05CTCContEightimg9">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_23.png"></div>
                    <div class="maGuide05CTCContEightimg10">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_24.png"></div>
                    <div class="maGuide05CTCContEightimg11">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_25.png"></div>
                </div>
            </div>

            <div class="maGuide05CTCContNineBox">
                <div class="maGuide05CTCContNineNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_09.png" alt="09">
                    <div class="maGuide05CTCContNineTitle">팝업 메뉴</div>
                </div>
                <span class="maGuide05CTCContNineImg"><img src="${contextPath }/resources/images/popup_tag5_cont_26.png"></span>
                <div class="maGuide05CTCContNineCont">
                    <ul>
                        <li><span>&middot;</span>Copy</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContNineDesc2">
                    <p>
                        　선택한 이벤트를 복사합니다. 여러 개의 이벤트를 한꺼번에 복사 가능합니다.
                    </p>
                </div>
                <div class="maGuide05CTCContNineCont">
                    <ul>
                        <li><span>&middot;</span>Cut</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContNineDesc2">
                    <p>
                        　선택한 이벤트를 잘라냅니다. 여러 개의 이벤트를 한꺼번에 잘라낼 수 있습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContNineCont">
                    <ul>
                        <li><span>&middot;</span>Paste</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContNineDesc2">
                    <p>
                        　복사 또는 잘라낸 이벤트를 선택한 위치에 붙여넣기 합니다.
                    </p>
                </div>
                <div class="maGuide05CTCContNineCont">
                    <ul>
                        <li><span>&middot;</span>Delete</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContNineDesc2">
                    <p>
                        　선택한 이벤트를 삭제합니다. 여러 개의 이벤트를 한꺼번에 삭제할 수 있습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContNineCont">
                    <ul>
                        <li><span>&middot;</span>Select All</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContNineDesc2">
                    <p>
                        　이벤트 목록을 전체 선택합니다.
                    </p>
                </div>
                <div class="maGuide05CTCContNineContBox">
                    <div class="maGuide05CTCContNineCont">
                        <ul>
                            <li><span>&middot;</span>Loop</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContNineDesc2">
                        <p>
                            　선택한 이벤트를 반복 수행하도록 설정 합니다. 이벤트들을 <br>
                            　선택한 뒤 메뉴를 선택하면 선택한 이벤트들이 반복 설정 됩니다. <br>
                            　반복 수행되는 이벤트들은 ‘Loop’ 이벤트의 하위 목록으로 <br>
                            　변경되며, Loop 이벤트를 선택한 뒤 ‘Unloop’ 메뉴를 선택하면 <br>
                            　반복 설정이 해제 됩니다.<br>
                            　선택한 이벤트가 연속적이지 않은 경우 선택된 이벤트 중 맨 <br>
                            　처음 이벤트와 맨 마지막 이벤트 사이의 이벤트가 반복 설정 <br>
                            　됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContNineCont2">
                        <ul>
                            <li><span>&middot;</span>Unloop</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContNineDesc2">
                        <p>
                            　이벤트 목록에서 ‘Loop’ 이벤트를 선택했을 때 활성화 되며, <br>
                            　반복 설정 되어있던 이벤트들의 반복 수행을 해제 합니다.<br>
                            　 ‘Loop’ 이벤트의 하위 목록에 있던 이벤트들이 기존 이벤트 <br>
                            　목록으로 변경 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContNineCont2">
                        <ul>
                            <li><span>&middot;</span>Show Column</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContNineDesc2">
                        <p>
                            　숨겨져 있는 Column이 있을 때 메뉴가 나타납니다. 숨김 처리 <br>
                            　된 Column들이 하위 메뉴로 나타나며, 선택 시 해당 Column이<br>
                            　화면에 다시 보여 집니다.<br>
                            　모든 Column이 숨겨져 있는 경우 No, Value, Result Column을<br>
                            　다시 나타나게 할 수 있습니다.<br>
                            　‘Hide Column’ 메뉴를 통해 다시 Column을 숨길 수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContNineCont">
                        <ul>
                            <li><span>&middot;</span>Hide Column</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContNineDesc2">
                        <p>
                            　화면에 나타난 Column을 안보이게 숨길 수 있습니다. Event<br>
                            　Column을 제외한 No, Value, Result Column을 숨길 수 있으며,<br>
                            　모든 Column이 숨겨져 있는 경우엔 메뉴가 나타나지 않습니다.<br>
                            　메뉴를 선택하면 하위에 숨김 가능한 Column들이 하위 메뉴로<br>
                            　나타납니다. <br>
                            　‘Show Column’ 메뉴를 통해 숨김 처리한 Column을 다시 볼 <br>
                            　수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContNineCont">
                        <ul>
                            <li><span>&middot;</span>Open File</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContNineDesc2">
                        <p>
                            　테스트 수행 후 파일로 저장된 결과 파일을 오픈 합니다. Script <br>
                            　실행 시 파일이 저장되는 이벤트에 한해 파일을 오픈 할 수 <br>
                            　있습니다.<br>
                            　‘Capture’ 이벤트, ‘Record’ 이벤트의 경우 이벤트 수행 시 각각 <br>
                            　이미지 파일과 동영상 파일이 저장되며, Script를 실행하면 <br>
                            　Result 항목에 파일 저장 경로가 나타납니다.<br>
                            　오픈 할 파일이 있는 경우에만 메뉴가 활성화 되며, 메뉴를 <br>
                            　선택하면 해당 파일이 오픈 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContNineCont">
                        <ul>
                            <li><span>&middot;</span>Open Scene</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContNineDesc2">
                        <p>
                            　선택한 이벤트에 연결된 Scene을 Scene View 창을 통해 보여 <br>
                            　줍니다. 연결된 Scene 파일이 로컬 내 존재하지 않거나, Scene이 <br>
                            　연결되지 않은 이벤트의 경우에는 메뉴가 비활성화 됩니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContNineCont">
                        <ul>
                            <li><span>&middot;</span>Event Properties…</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContNineDesc2">
                        <p>
                            　선택한 이벤트의 속성 창을 보여줍니다. 속성 창을 통해 <br>
                            　이벤트의 세부 설정을 할 수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContNineCont">
                        <ul>
                            <li><span>&middot;</span>Script Properties…</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContNineDesc2">
                        <p>
                            　리소스 사용량을 측정할 패키지를 설정 합니다.
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContNineBox2">
                    <div class="maGuide05CTCContNineimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_31.png"></div>
                    <div class="maGuide05CTCContNineimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_32.png"></div>
                    <div class="maGuide05CTCContNineimg3">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_33.png"></div>
                    <div class="maGuide05CTCContNineimg4">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_34.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContTenBox">
                <div class="maGuide05CTCContTenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_10.png" alt="10">
                    <div class="maGuide05CTCContTenTitle">데이터 파일 설정</div>
                </div>
                <div class="maGuide05CTCContTenContBox">
                    <div class="maGuide05CTCContTenDesc">
                        <p>
                            선택 가능한 데이터 파일의 기본 형식은 .dat 입니다. 그 외 파일<br>
                            도 내용이 탭으로 구분되어 있는 경우 선택 가능 합니다.<br>
                            아래는 주소록에 이름과 연락처를 등록하기 위해 데이터 파일을 <br>
                            사용하는 예시 입니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTenCont">
                        <ul>
                            <li><span>&middot;</span>데이터 파일 작성하기</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTenDesc2">
                        <p>
                            　주소록에 등록할 이름과 연락처를 탭으로 구분하여 입력합니다. <br>
                            　여러 명을 등록하기 위해 줄을 바꿔 새로운 이름과 전화번호를<br>
                            　입력합니다.<br>
                            　Script 작성 시 ‘이름’은 첫 번째 값으로 인식 되며, ‘연락처’는 <br>
                            　두 번째 값으로 인식 됩니다.<br>
                            　엑셀 프로그램을 통해 작성한 후 [다른 이름으로 저장] – <br>
                            　[텍스트 (탭으로 분리) (*.txt)] 선택을 통해 저장하면 탭으로<br>
                            　분리된 데이터 파일을 작성할 수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTenCont2">
                        <ul>
                            <li><span>&middot;</span>Script에서 데이터 파일 내용 읽어오기</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTenDesc2">
                        <p>
                            　주소록에 이름과 연락처를 입력한 후 저장하는 Script를  <br>
                            　작성합니다. 데이터 파일에서 이름과 연락처 정보를 가져오기 <br>
                            　위해 2 개의 Text 이벤트를 추가 합니다.<br>
                            　이름을 가져오기 위해 첫 번째 ‘Text’ 이벤트의 값을 ‘#1’로 작성 <br>
                            　합니다.<br>
                            　연락처를 가져오기 위해 두 번째 ‘Text’ 이벤트의 값을 ‘#2’로 <br>
                            　작성 합니다.<br>
                            　‘#숫자’ 형태는 데이터 파일에서 값을 읽어오는 형식이며 숫자는 <br>
                            　탭으로 구분된 데이터에서 순서를 나타냅니다.<br>
                            　‘#1’은 예시로 사용된 데이터 파일에서 ‘이름’을 나타내며,<br>
                            　‘#2’는 ‘연락처’를 나타냅니다.<br>
                            ※ ‘#1’ 이라는 문자를 입력하고 싶을 때는 ‘##1’ 로 작성하면 됩니다.<br>
                            　입력 상태가 아닐 때 ‘Value’ 항목에는 ‘#1’로 나타납니다.<br>
                            ※ 데이터 파일의 속성 값을 나타낼 때는 진한 파란색 이태릭체로 <br>
                            　나타나며, 텍스트 일 때는 검은색 일반 글꼴로 나타납니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContTenCont3">
                        <ul>
                            <li><span>&middot;</span>테스트 실행 결과</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContTenDesc2">
                        <p>
                            　위의 예시에서 사용한 데이터 파일과, Script를 실행하면<br>
                            　다음과 같이 추가 됩니다.
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContTenBox2">
                    <div class="maGuide05CTCContTenimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_35.png"></div>
                    <div class="maGuide05CTCContTenimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_36.png"></div>
                    <div class="maGuide05CTCContTenimg3">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_37.png"></div>
                    <div class="maGuide05CTCContTenimg4">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_38.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContElevenBox">
                <div class="maGuide05CTCContElevenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_11.png" alt="11">
                    <div class="maGuide05CTCContElevenTitle">Script 실행</div>
                </div>
                <div class="maGuide05CTCContElevenContBox">
                    <div class="maGuide05CTCContElevenDesc">
                        <p>
                            툴바의 ‘Start Script Test’ 버튼(Play.png) 또는 ‘Debug From <br>
                            Selected Event’ 버튼(PlayHere.png)을 통해 Script를 실행할 <br>
                            수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContElevenCont">
                        <ul>
                            <li><span>&middot;</span>디바이스가 연결 중일 때만 실행 가능 합니다.</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContElevenCont">
                        <ul>
                            <li><span>&middot;</span>편집 중인 Script를 현재 연결된 디바이스를 통해 실행 합니다.<br>
                                　Script 작성을 돕기 위한 기능으로 실행 결과가 서버에 저장<br>
                                　되지 않습니다.</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContElevenCont">
                        <ul>
                            <li><span>&middot;</span>Script 실행 후 로그 파일이 로컬 컴퓨터에 저장 되며, <br>
                                　‘Capture’, ‘Record’ 이벤트의 경우 해당 이미지 또는 동영상 <br>　파일이
                                　로컬 컴퓨터에 저장 됩니다.<br>
                                　로컬 컴퓨터에 저장된 파일은 Script를 재실행하거나 다른 <br>
                                　Script를 실행하면 삭제 됩니다.</li>
                        </ul>
                    </div>
                    <div class="maGuide05CTCContElevenDesc2">
                        <p>
                            < 로그 저장 레벨 설정 ><br>
                            [File] – [Settings…] 메뉴에서 로그 레벨을 설정할 수 있습니다.<br>
                            설정한 로그 레벨은 Script 실행 또는 테스트 실행 후 저장되는 <br>
                            로그 파일의 레벨로 적용 됩니다.<br>
                            콤보박스에서 레벨 선택 후 ‘OK’ 버튼을 누르면 로그 레벨이 <br>
                            설정 됩니다.<br>
                            로그 레벨은 목록에서 아래로 내려갈수록 더 중요한 로그이며, <br>
                            레벨이 높아집니다. 레벨 선택 시 선택한 레벨을 포함한 상위 <br>
                            레벨의 로그가 저장 됩니다.
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContElevenBox2">
                    <div class="maGuide05CTCContElevenimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_39.png"></div>
                    <div class="maGuide05CTCContElevenimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_40.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCConttwelveBox">
                <div class="maGuide05CTCConttwelveNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_12.png" alt="12">
                    <div class="maGuide05CTCConttwelveTitle">Scene View</div>
                </div>
                <div class="maGuide05CTCConttwelveDesc">
                    <p>
                        오픈된 Scene을 이용하여 Script에 이벤트를 추가 합니다.
                    </p>
                </div>
                <div class="maGuide05CTCConttwelveImg">
                    <img src="${contextPath }/resources/images/popup_tag5_cont_41.png">
                </div>
                <div class="maGuide05CTCConttwelveCont">
                    <ul>
                        <li><span>&middot;</span>Scene Explorer에서 Scene을 오픈 하면 창이 활성화 되고, Scene이 오픈 됩니다.<br>
                        </li>
                        <li><span>&middot;</span>Scene 이미지가 보여지며 Script에 이벤트를 추가를 위해 이미지 상에서의 선택, 드래그 동작 및 텍스트 입력을 할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>Hierachy View를 통해 Scene의 구조를 확인할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>Scene 이미지 선택 시 Hierachy View의 해당 아이템이 표시됩니다.<br>
                        </li>
                        <li><span>&middot;</span>Hierachy View에서 아이템을 선택하여 Scene의 아이템을 선택할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>이벤트 아이콘을 통해 Script에 이벤트를 추가할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>디바이스에 연결되어 있는 경우 Scene View에서 수행되는 이벤트를 디바이스에 전달할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>디바이스에 연결되어 있는 경우 디바이스 화면을 캡처 할 수 있습니다.<br>
                        </li>
                    </ul>
                </div>
            </div><!-- .maGuide05CTCConttwelveBox End -->
            <div class="maGuide05CTCContThirteenBox">
                <div class="maGuide05CTCContThirteenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_13.png" alt="13">
                    <div class="maGuide05CTCContThirteenTitle">캡처 하기</div>
                </div>
                <div class="maGuide05CTCContThirteenContBox">
                    <div class="maGuide05CTCContThirteenDesc">
                        <p>
                            Scene View 창의 오른쪽 상단에서 ‘Screen Capture’ 아이콘을 <br>
                            통해 연결된 디바이스 화면을 캡처 할 수 있습니다.<br>
                            디바이스가 연결된 상태일 때만 아이콘이 활성화 되며,<br>
                            디바이스가 연결 중이어도 스크립트가 실행 중이면 아이콘이 <br>
                            비활성화 됩니다.<br>
                            캡처한 이미지는 Scene Explorer에 새로운 Scene으로 추가<br>
                            되며,  캡처 후 Scene View에 캡처한 Scene이 보여집니다.<br>
                            ※ 스크립트 실행 중에는 디바이스 조작이 불가능하여 메뉴가 <br>
                            　비활성화 됩니다.
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContThirteenBox2">
                    <div class="maGuide05CTCContThirteenimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_42.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContFourteenBox">
                <div class="maGuide05CTCContFourteenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_14.png" alt="14">
                    <div class="maGuide05CTCContFourteenTitle">디바이스와 동기화하기</div>
                </div>
                <div class="maGuide05CTCContFourteenContBox">
                    <div class="maGuide05CTCContFourteenDesc">
                        <p>
                            Scene View 창의 오른쪽 상단에서 ‘Sync Device’ 아이콘을 <br>
                            통해 연결된 디바이스와의 동기화가 가능합니다.<br>
                            디바이스가 연결된 상태일 때만 아이콘이 활성화 됩니다.<br>
                            아이콘은 토글 형태로 되어 있으며, 아이콘 선택 시 디바이스와<br>
                            의 동기화가 이루어집니다. 아이콘 선택을 해제(아이콘 다시<br>
                            선택) 하면 디바이스와의 동기화가 해제 됩니다.<br>
                            디바이스와의 동기화 상태일 때 이벤트 아이콘을 통해 Script에 <br>
                            이벤트를 추가하면 연결된 디바이스에 이벤트가 전달 됩니다.<br>
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContFourteenBox2">
                    <div class="maGuide05CTCContFourteenimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_43.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContFifteenBox">
                <div class="maGuide05CTCContFifteenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_15.png" alt="15">
                    <div class="maGuide05CTCContFifteenTitle">화면 지우기</div>
                </div>
                <div class="maGuide05CTCContFifteenContBox">
                    <div class="maGuide05CTCContFifteenDesc">
                        <p>
                            Scene View 창의 오른쪽 상단에서 ‘Clear’ 아이콘을 통해<br>
                            Scene View 화면을 지울 수 있습니다.<br>
                            화면을 지우면 Scene 이미지와 Hierachy View의 내용이 <br>
                            초기화되며, 우측의 이벤트 버튼이 모두 비활성화 됩니다.
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContFifteenBox2">
                    <div class="maGuide05CTCContFifteenimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_44.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContSixteenBox">
                <div class="maGuide05CTCContSixteenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_16.png" alt="16">
                    <div class="maGuide05CTCContSixteenTitle">이벤트 추가하기
                    </div>
                </div>
                <div class="maGuide05CTCContSixteenDesc">
                    <p>
                        Script Editor 창이 활성화 되어 있을 때 Scene View에서 수행하는 이벤트가 Script Editor 창에 열려 있는 Script에 추가<br>
                        됩니다.
                        Scene View의 이미지 또는 Hierachy View를 이용하여 이벤트를 추가할 수 있습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_61.png"> Select</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 선택한 아이템을 선택합니다. Scene에서 아이템을 선택한 후 아이콘을 선택하면 Script에 이벤트가 추가 됩니다.<br>
                        ‘Select’ 이벤트는 아이템을 Object 단위로 선택 하는 이벤트로 현재 화면에서 해당 Object를 찾아 선택하는 동작을 수행 합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene에서 수행한 동작이 아이템 선택이 아닌 경우 아이콘이 비활성화 됩니다.<br>
                        ※ Scene에서 아이템 선택을 통해 정확한 Object를 선택할 수 없는 경우 Hierachy View를 통해 정확한 Object를 선택할 수 있습니다. <br>
                        ※ Scene에서 선택하려는 아이템이 하이브리드앱(HybridApp)의 웹 뷰(Web View) 영역 또는 웹 브라우저(IE, Chrome 등) 영역에 <br>
                        　포함되어 있는 경우에는 선택할 수 없습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_62.png"> Text</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 선택한 입력란에 글자를 입력합니다. Scene에서 입력란을 선택한 후 아이콘을 선택하면 해당 입력란이 텍스트 입력 가능 <br>
                        상태로 변경 됩니다.<br>
                        원하는 텍스트를 입력 후 엔터를 누르면 Script에 이벤트가 추가 됩니다.<br>
                        Script가 열려 있는 상태이거나, Scene에서 입력란을 선택했을 때만 아이콘이 활성화 됩니다.<br>
                        ※ Scene에서 선택하려는 아이템이 하이브리드앱(HybridApp)의 웹 뷰(Web View) 영역 또는 웹 브라우저(IE, Chrome 등) 영역에 <br>
                        　포함되어 있는 경우에는 선택할 수 없습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_63.png"> IfNot</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 선택한 아이템을 찾아 검색 성공 여부에 따라 서로 다른 이벤트를 수행하도록 설정합니다. Scene에서 아이템을 선택한 후 <br>
                        아이콘을 선택하면 Script에 이벤트가 추가 됩니다.<br>
                        아이템을 Object 단위로 인식하여 현재 화면에서 해당 Object를 찾고, 해당 Object를 찾지 못하면 지정된 이벤트로 건너 뛰어 수행합니다.<br>
                        Object를 찾지 못했을 때 수행할 이벤트는 Script Editor 창에서 설정할 수 있습니다.<br>
                        Object를 찾았을 때는 Script에 작성된 이벤트 순서대로 이벤트가 수행 됩니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene에서 수행한 동작이 아이템 선택이 아닌 경우 아이콘이 비활성화 됩니다.<br>
                        ※ Scene에서 아이템 선택을 통해 정확한 Object를 선택할 수 없는 경우 Hierachy View를 통해 정확한 Object를 선택할 수 있습니다. <br>
                        ※ Scene에서 선택하려는 아이템이 하이브리드앱(HybridApp)의 웹 뷰(Web View) 영역 또는 웹 브라우저(IE, Chrome 등) 영역에 <br>
                        　포함되어 있는 경우에는 선택할 수 없습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_64.png"> Press</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 선택한 위치를 선택합니다. 키보드의 Ctrl 버튼을 누른 상태에서 Scene이미지를 선택하면 Scene 이미지의 아이템 선택 <br>
                        표시가 Position 표시(‘+’)로 변경 되며, 아이콘이 활성화 됩니다.<br>
                        Position 표시가 나타난 상태에서 아이콘을 선택하면 Script에 이벤트가 추가 됩니다.<br>
                        ‘Press’ 이벤트는 아이템을 위치(좌표 값) 바탕으로 선택하는 이벤트로 현재 화면의 해당 위치 값을 터치 하는 동작을 수행 합니다. <br>
                        Script 작성 시 활용된 Scene이 실제 테스트를 수행하는 디바이스와 해상도가 다른 경우 수행 중인 디바이스에 맞게 위치 값이 조정 <br>
                        되어 터치 동작을 수행 합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene에서 수행한 동작이 아이템 선택이 아닌 경우 아이콘이 비활성화 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_65.png"> Drag</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 드래그 동작을 수행하면 Scene 이미지의 선택 표시가 화살표로 변경 되며, 아이콘을 선택하면 Script에 이벤트가 추가 됩니다.<br>
                        드래그 시작 위치와 종료 위치를 좌표 값으로 인식하여 이벤트 수행 시 현재 화면에서 드래그 동작을 수행합니다.<br>
                        Script 작성 시 활용된 Scene이 실제 테스트를 수행하는 디바이스와 해상도가 다른 경우 수행 중인 디바이스에 맞게 시작 위치와 종료 <br>
                        위치 값이 조정 되어 드래그 동작을 수행 합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene에서 드래그 동작을 수행했을 때만 아이콘이 활성화 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_66.png" > Search</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 선택한 아이템을 찾습니다. Scene에서 아이템을 선택한 후 아이콘을 선택하면 Script에 이벤트가 추가 됩니다.<br>
                        ‘Search’ 이벤트는 아이템을 Object 단위로 인식하여 이벤트 수행 시 현재 화면에서 해당 Object를 찾는 동작을 수행 합니다.<br>
                        테스트 진행 시 정상 동작을 확인하는 용도로 사용될 수 있으며, Object를 찾지 못하면 수행 중인 테스트가 실패로 종료 됩니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene에서 수행한 동작이 아이템 선택이 아닌 경우 아이콘이 비활성화 됩니다.<br>
                        - Scene에서 아이템 선택을 통해 정확한 Object를 선택할 수 없는 경우 Hierachy View를 통해 정확한 Object를 선택할 수 있습니다. <br>
                        - Scene에서 선택하려는 아이템이 하이브리드앱(HybridApp)의 웹 뷰(Web View) 영역 또는 웹 브라우저(IE, Chrome 등) 영역에 <br>
                        　포함되어 있는 경우에는 선택할 수 없습니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_67.png"> WaitLog</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 수행한 동작과 상관 없이 아이콘을 선택할 수 있으며 아이콘을 선택하면 Script에 이벤트가 추가 됩니다.<br>
                        ‘WaitLog’ 이벤트는 수행 시 지정된 시간 동안 특정 로그가 전달될 때까지 다음 이벤트를 수행하지 않고 대기 합니다.<br>
                        이벤트 추가 시 최초 Timeout 시간은 0초로 설정 됩니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene View에 열린 Scene이 없으면 버튼이 비활성화 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_68.png"> Home</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 수행한 동작과 상관 없이 아이콘을 선택할 수 있으며 이벤트 수행 시 디바이스의 홈 버튼 기능을 수행합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene View에 열린 Scene이 없으면 버튼이 비활성화 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_69.png"> Back</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 수행한 동작과 상관 없이 아이콘을 선택할 수 있으며 이벤트 수행 시 디바이스의 이전 버튼 기능을 수행합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene View에 열린 Scene이 없으면 버튼이 비활성화 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_70.png"> Menu</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 수행한 동작과 상관 없이 아이콘을 선택할 수 있으며 이벤트 수행 시 디바이스의 메뉴 버튼 기능을 수행합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene View에 열린 Scene이 없으면 버튼이 비활성화 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_71.png"> Power</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 수행한 동작과 상관 없이 아이콘을 선택할 수 있으며 이벤트 수행 시 디바이스의 전원 버튼 기능을 수행합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene View에 열린 Scene이 없으면 버튼이 비활성화 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_72.png"> VolumeUp</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 수행한 동작과 상관 없이 아이콘을 선택할 수 있으며 이벤트 수행 시 디바이스의 Volume Up 버튼 기능을 수행합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene View에 열린 Scene이 없으면 버튼이 비활성화 됩니다.
                    </p>
                </div>
                <div class="maGuide05CTCContSixteenCont">
                    <ul>
                        <li><img src="${contextPath }/resources/images/popup_tag5_cont_73.png"> VolumeDown</li>
                    </ul>
                </div>
                <div class="maGuide05CTCContSixteenDesc2">
                    <p>
                        Scene에서 수행한 동작과 상관 없이 아이콘을 선택할 수 있으며 이벤트 수행 시 디바이스의 Volume Down 버튼 기능을 수행합니다.<br>
                        Script가 열려 있지 않은 상태이거나, Scene View에 열린 Scene이 없으면 버튼이 비활성화 됩니다.

                    </p>
                </div>
            </div>
            <div class="maGuide05CTCContSeventeenBox">
                <div class="maGuide05CTCContSeventeenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_17.png" alt="17">
                    <div class="maGuide05CTCContSeventeenTitle">Hierarchy View</div>
                </div>
                <div class="maGuide05CTCContSeventeenContBox">
                    <div class="maGuide05CTCContSeventeenDesc">
                        <p>
                            Scene View에 보여지는 Scene의 구조를 트리 형태로 보여 <br>
                            줍니다.<br>
                            각각의 아이템들은 Class단위로 구성되어 있으며 하나의 <br>
                            Object로 인식 됩니다.<br>
                            Scene에서 아이템을 선택하면 해당 Object가 Hierarchy <br>
                            View에서도 선택 표시 되며, 반대로 Hierarchy View에서 <br>
                            아이템을 선택하면 해당 Object가 Scene에 표시 됩니다.<br>
                            Scene에서 선택한 아이템 영역이 여러 Object로 구성되어 있는 <br>
                            경우 정확한 Object 선택을 위해 Hierarchy View를 활용하여<br>
                            Object를 변경 선택할 수 있습니다.<br>
                            Hierarchy View는 Scene의 구조를 잘 알지 못하는 경우 활용이 <br>
                            어려울 수 있습니다.<br>
                            Hierarchy View를 참고하지 않을 때에는 영역 오른쪽의 <img src="${contextPath }/resources/images/popup_tag5_cont_74.png"> 를<br>
                            선택하여 내용을 안보이게 할 수 있고, <img src="${contextPath }/resources/images/popup_tag5_cont_75.png"> 을 선택하면 Hierarchy  <br>
                            View를 다시 볼 수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContSeventeenDesc2">
                        <p>
                            < 전화 Object 선택하기 ><br>
                            Scene에서 전화 아이콘을 선택했을 때 Hierachy View를 보면<br>
                            실제로는 LinearLayout Class가 선택된 것을 알 수 있습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContSeventeenDesc3">
                        <p>
                            이런 경우 Hierachy View에서 전화 Text를 선택하여 Object를<br>
                            좀 더 정확하게 지정할 수 있습니다.
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContSeventeenBox2">
                    <div class="maGuide05CTCContSeventeenimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_45.png"></div>
                    <div class="maGuide05CTCContSeventeenimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_46.png"></div>
                    <div class="maGuide05CTCContSeventeenimg3">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_47.png"></div>
                    <div class="maGuide05CTCContSeventeenimg4">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_48.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContEightteenBox">
                <div class="maGuide05CTCContEightteenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_18.png" alt="18">
                    <div class="maGuide05CTCContEightteenTitle">Device</div>
                </div>
                <div class="maGuide05CTCContEightteenDesc">
                    <p>
                        연결된 디바이스 화면을 보여줍니다. 디바이스를 직접 동작 시킬 수 있으며, Script 실행 시에는 실행 화면을 제공합니다.
                    </p>
                </div>
                <div class="maGuide05CTCContEightteenImg">
                    <img src="${contextPath }/resources/images/popup_tag5_cont_49.png">
                </div>
                <div class="maGuide05CTCContEightteenCont">
                    <ul>
                        <li><span>&middot;</span>마우스를 이용하여 디바이스를 직접 동작할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>오른쪽 상단의 세부 메뉴를 통해서도 디바이스를 동작할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>디바이스 화면을 캡처하여 Scene을 생성할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>Script Editor 창에서 Script를 실행할 때 동작이 진행되는 과정을 확인할 수 있습니다.<br>
                        </li>
                        <li><span>&middot;</span>타이틀에 연결된 디바이스명과 남은 사용 시간이 표시됩니다.<br>
                        </li>
                        <li>※ 스크립트 실행 중에는 디바이스를 직접 동작시킬 수 없습니다.
                        </li>
                    </ul>
                </div>
            </div><!-- .maGuide05CTCContEightteenBox End -->
            <div class="maGuide05CTCContNineteenBox">
                <div class="maGuide05CTCContNineteenNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_19.png" alt="19">
                    <div class="maGuide05CTCContNineteenTitle">디바이스 연결</div>
                </div>
                <div class="maGuide05CTCContNineteenDesc">
                    <p>
                        연결된 디바이스 화면을 보여줍니다. 디바이스를 직접 동작 시킬 수 있으며, Script 실행 시에는 실행 화면을 제공합니다.
                    </p>
                </div>
                <div class="maGuide05CTCContNineteenImg">
                    <img src="${contextPath }/resources/images/popup_tag5_cont_50.png">
                </div>
                <div class="maGuide05CTCContNineteenDesc">
                    <p>
                        1. 로그인을 하면 위와 같이 디바이스 연결 메뉴가 나타납니다.<br>
                        2. 연결하려는 디바이스의 제조사, OS 버전 및 디바이스명을 차례로 선택합니다.<br>
                        3. 오른쪽 연결 아이콘이 활성화 되면 아이콘을 눌러 디바이스를 연결 합니다.<br>
                        ※ 제조사 또는 OS 버전을 선택하지 않으면 연결 가능한 모든 제조사와 모든 OS 버전으로 설정 됩니다.<br>
                    </p>
                    <div class="maGuide05CTCContNineteenCont2">
                        <ul>
                            <li><span>&middot;</span>기존에 연결된 디바이스가 있는 경우<br>
                                　디바이스 연결은 한 개의 디바이스만 가능합니다.<br>
                                　기존에 연결된 디바이스가 있으면 연결되어 있던 디바이스를 종료 하고, 새로운 디바이스를 연결 합니다.</li>
                        </ul>
                    </div>
                </div>
            </div><!-- .maGuide05CTCContNineteenBox End -->
            <div class="maGuide05CTCContTwentyBox">
                <div class="maGuide05CTCContTwentyNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_20.png" alt="20">
                    <div class="maGuide05CTCContTwentyTitle">캡처 하기</div>
                </div>
                <div class="maGuide05CTCContTwentyContBox">
                    <div class="maGuide05CTCContTwentyDesc">
                        <p>
                            Device 창의 오른쪽 상단에서 캡처 아이콘을 통해 캡처를 할 수<br>
                            있습니다.<br>
                            캡처 아이콘을 누르면 현재 보여지는 디바이스 화면을 캡처 합니다.<br>
                            캡처한 이미지는 Scene Explorer에 새로운 Scene으로 추가가 <br>
                            되며, Scene View를 통해 확인할 수 있습니다.<br>
                            캡처 후 자동으로 Scene View 화면이 활성화 되며 현재 캡처한 <br>
                            이미지가 보여집니다.<br>
                            ※ 스크립트 실행 중에는 메뉴가 비활성화 됩니다.
                        </p>
                    </div>
                </div>
                <div class="maGuide05CTCContTwentyBox2">
                    <div class="maGuide05CTCContTwentyimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_51.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContT-OneBox">
                <div class="maGuide05CTCContT-OneNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_21.png" alt="21">
                    <div class="maGuide05CTCContT-OneTitle">디바이스 세부 메뉴</div>
                </div>
                <div class="maGuide05CTCContT-OneContBox">
                    <div class="maGuide05CTCContT-OneDesc">
                        <p>
                            오른쪽 상단의 화살표를 누르면 세부 메뉴를 이용할 수 있습니다.<br>
                            세부 메뉴는 File, Command, Screen, Settings로 구분 되며 <br>
                            각각의 기능은 아래와 같습니다.
                        </p>
                    </div>
                    <div class="maGuide05CTCContT-OneCont">
                        <ul>
                            <li><span>&middot;</span>File 메뉴</li>
                        </ul>
                        <div class="maGuide05CTCContT-OneDesc2">
                            <p>　App Insttall<br>
                                　테스트 하고자 하는 애플리케이션의 apk 파일을 로컬 컴퓨터에서 <br>
                                　선택하여 디바이스에 설치 합니다. 설치한 애플리케이션은 <br>
                                　디바이스 종료 시 삭제 됩니다. ‘Clean Up’ 메뉴를 통해 <br>
                                　애플리케이션을 삭제할 수 있습니다.<br>
                                ※ 스크립트 실행 중에는 디바이스 조작이 불가능하여 메뉴가 <br>
                                　비활성화 됩니다. <br>
                                - 메뉴 선택 시 파일 업로드를 할 수 있는 창이 표시됩니다.<br>
                                - Browse’ 버튼을 선택하여 업로드 할 apk 파일을 선택합니다.<br>
                                - 진행 바를 통해 설치 진행상황을 확인할 수 있습니다.<br>
                                - 애플리케이션 설치에 걸리는 시간은 사용자의 네트워크 환경과 <br>
                                - 애플리케이션 파일의 크기에 영향을 받습니다.
                            </p>
                        </div>
                    </div>
                    <div class="maGuide05CTCContT-OneCont2">
                        <ul>
                            <li><span>&middot;</span>Clean Up</li>
                        </ul>
                        <div class="maGuide05CTCContT-OneDesc2">
                            <p>　테스트에 사용한 애플리케이션 및 로그를 삭제 합니다.<br>
                                - 메뉴 실행 시 설치된 apk 파일을 삭제하고 디바이스 상태를 <br>
                                　처음 실행한 상태로 되돌립니다.<br>
                                - 앱과 로그가 지워지는 동안 디바이스를 사용할 수 없습니다.<br>
                                - 진행 바를 통해 설치 진행상황을 확인할 수 있습니다.<br>
                                - 디바이스 접속 종료 시 애플리케이션은 자동 삭제 됩니다.<br>
                                ※ 스크립트 실행 중에는 디바이스 조작이 불가능하여 메뉴가 <br>
                                　비활성화 됩니다.
                            </p>
                        </div>
                    </div>
                    <div class="maGuide05CTCContT-OneCont2">
                        <ul>
                            <li><span>&middot;</span>Device Log</li>
                        </ul>
                        <div class="maGuide05CTCContT-OneDesc2">
                            <p>　현재 사용 중인 디바이스의 로그 정보를 출력합니다. 또한 <br>
                                　파일로 저장하는 기능을 제공합니다.<br>
                                - Level : 레벨 검색 조건을 변경합니다.<br>
                                - Filter : 로그 정보 검색 키워드를 입력합니다.<br>
                                - Apply : ‘Filter’에 입력한 키워드를 검색 조건으로 적용합니다.<br>
                                - Clear : 현재 로그창에 출력된 로그 정보를 삭제 합니다<br>
                                - Save : 로그 정보를 로컬 컴퓨터에 저장 합니다.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="maGuide05CTCContT-OneBox2">
                    <div class="maGuide05CTCContT-Oneimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_52.png"></div>
                    <div class="maGuide05CTCContT-Oneimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_53.png"></div>
                    <div class="maGuide05CTCContT-Oneimg3">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_54.png"></div>
                    <div class="maGuide05CTCContT-Oneimg4">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_55.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContT-TwoBox">
                <div class="maGuide05CTCContT-TwoNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_22.png" alt="22">
                    <div class="maGuide05CTCContT-TwoTitle">Command 메뉴</div>
                </div>
                <div class="maGuide05CTCContT-TwoContBox">
                    <div class="maGuide05CTCContT-TwoCont">
                        <ul>
                            <li><span>&middot;</span>Input Text</li>
                        </ul>
                        <div class="maGuide05CTCContT-TwoDesc">
                            <p>　디바이스 내의 키보드를 입력하지 않고, 텍스트를 입력할 수 있는<br>
                                　기능으로 메시지, 인터넷 검색창, 메모 등의 각종 입력란에 <br>
                                　포커스를 위치 후 텍스트 박스를 통해 작성하면 됩니다.<br>
                                ※ 스크립트 실행 중에는 디바이스 조작이 불가능하여 메뉴가 <br>
                                　비활성화 됩니다.<br>
                                - 메뉴 선택 시 문자를 입력할 수 있는 창이 표시 됩니다.<br>
                                - 디바이스가 텍스트 입력 상태일 경우에만 동작하며 문자를 <br>
                                　키보드로 입력하여 디바이스에 전달할 수 있습니다.<br>
                                - 입력 상태가 아닐 경우에는 어떠한 동작도 하지 않습니다.<br>
                                - 300 bytes까지 입력 가능합니다.
                            </p>
                        </div>
                    </div>
                    <div class="maGuide05CTCContT-TwoCont2">
                        <ul>
                            <li><span>&middot;</span>Open URL</li>
                        </ul>
                        <div class="maGuide05CTCContT-TwoDesc">
                            <p>　입력한 주소로 인터넷을 연결 실행 합니다.<br>
                                ※ 스크립트 실행 중에는 디바이스 조작이 불가능하여 메뉴가 <br>
                                　비활성화 됩니다. <br>
                                - 메뉴 선택 시 웹 주소를 입력할 수 있는 창이 표시 됩니다.<br>
                                - 웹 주소를 입력하고 ‘Open’ 버튼을 선택하면 디바이스에 <br>
                                　브라우저가 실행됩니다.<br>
                                - 디바이스 사용 중 어느 화면에서도 사용할 수 있습니다.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="maGuide05CTCContT-TwoBox2">
                    <div class="maGuide05CTCContT-Twoimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_56.png"></div>
                    <div class="maGuide05CTCContT-Twoimg2">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_57.png"></div>
                    <div class="maGuide05CTCContT-Twoimg3">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_58.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContT-ThreeBox">
                <div class="maGuide05CTCContT-ThreeNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_23.png" alt="23">
                    <div class="maGuide05CTCContT-ThreeTitle">Screen 메뉴</div>
                </div>
                <div class="maGuide05CTCContT-ThreeContBox">
                    <div class="maGuide05CTCContT-ThreeCont">
                        <ul>
                            <li><span>&middot;</span>Rotate</li>
                        </ul>
                        <div class="maGuide05CTCContT-ThreeDesc">
                            <p>　디바이스 방향을 Portrait/Landscape 상태로 전환 합니다.<br>
                                - 휴대폰의 기본 모드는 Portrait이며, 태블릿은 Landscape 모드 <br>
                                　입니다. 현재 상태에서 다른 방향으로 전환 합니다.<br>
                                - 디바이스의 자동회전 기능이 활성화 되어야 정상 동작 합니다.<br>
                                - 선택 시 디바이스가 회전되어 화면에 표시 됩니다.<br>
                                ※ 스크립트 실행 중에는 디바이스 조작이 불가능하여 메뉴가 <br>
                                　비활성화 됩니다.
                            </p>
                        </div>
                    </div>
                    <div class="maGuide05CTCContT-ThreeCont2">
                        <ul>
                            <li><span>&middot;</span>Wake Up</li>
                        </ul>
                        <div class="maGuide05CTCContT-ThreeDesc">
                            <p>　디바이스가 슬립 상태일 때 슬립모드를 해제 합니다.<br>
                                ※ 스크립트 실행 중에는 디바이스 조작이 불가능하여 메뉴가 <br>
                                　비활성화 됩니다.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="maGuide05CTCContT-ThreeBox2">
                    <div class="maGuide05CTCContT-Threeimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_59.png"></div>
                </div>
            </div>
            <div class="maGuide05CTCContT-FourBox">
                <div class="maGuide05CTCContT-FourNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_24.png" alt="24">
                    <div class="maGuide05CTCContT-FourTitle">Settings 메뉴</div>
                </div>
                <div class="maGuide05CTCContT-FourContBox">
                    <div class="maGuide05CTCContT-FourCont">
                        <ul>
                            <li><span>&middot;</span>Sound On/Off</li>
                        </ul>
                        <div class="maGuide05CTCContT-FourDesc">
                            <p>　바이스의 사운드를 On/Off 합니다.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="maGuide05CTCContT-FourBox2">
                    <div class="maGuide05CTCContT-Fourimg">
                        <img src="${contextPath }/resources/images/popup_tag5_cont_60.png"></div>
                </div>
            </div>
        </div>
    </div>
</div><!-- .maGuide05ContentTwoContainer End -->
