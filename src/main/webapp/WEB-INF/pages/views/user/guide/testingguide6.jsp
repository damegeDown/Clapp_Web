<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="mtGuide06ContentOneContainer">
    <div class="mtGuide06COCMainBox">
        <div class="mtGuide06COCMainTitle">
            <span>디바이스 및 환경제어 기능</span>
        </div>
        <div class="mtGuide06COCMainDesc">
            <p>
                CLAPP은 Command를 통해 디바이스 제어 및 테스트 환경 제어 기능을 제공합니다.
            </p>
        </div>
        <div class="mtGuide06COCMainImg">
            <img src="${contextPath }/resources/images/popup_mtg_control_jnlp_01.png" width="195" height="332" alt=""/> </div>
    </div><!-- .mtGuide01COCMainBox End -->
</div><!-- .mtGuide01ContentOneContainer End -->
<div class="mtGuide06ContentTwoContainer">
    <div class="mtGuide06CTCBox01">
        <div class="mtGuide06CTCContBox">
            <div class="mtGuide06CTCContOneBox">
                <div class="mtGuide06CTCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
                </div>
                <div class="mtGuide06CTCContOneTit">
							<span>
								앱 설치하기
							</span>
                </div>
                <div class="mtGuide06CTCContOneDesc">
                    <p>
                        테스트 하고자 하는 애플리케이션의 apk 파일을 로컬<br /> 컴퓨터에서 선택하여 디바이스에 설치 합니다. 설치한<br /> 애플리케이션은 디바이스 종료 시 삭제 됩니다. "앱 삭제 및<br /> 로그 지우기"를 이용해서 애플리케이션을 삭제할 수<br /> 있습니다.
                    </p>
                </div>
                <div class="mtGuide06CTCContOneCont">
                    <ul>
                        <li><span>&middot;</span>선택 시 파일 업로드를 하실 수 있는 창이 표시됩니다.</li>
                        <li><span>&middot;</span>“Browse”를 선택하여 업로드 하실 apk 파일을 선택합니다.</li>
                        <li><span>&middot;</span>“Install”을 선택하여 apk 파일을 설치합니다.</li>
                        <li><span>&middot;</span>진행 바를 통해 설치 진행상황을 확인하실 수 있습니다.</li>
                        <li><span>&middot;</span>애플리케이션 설치에 걸리는 시간은 사용자의 네트워크 환경과<br />&nbsp;&nbsp;&nbsp;애플리케이션 파일의 크기에 영향을 받습니다.</li>
                    </ul>
                </div>
            </div><!-- .mtGuide01CTCContOneBox End -->
            <div class="mtGuide06CTCContTwoBox">
                <div class="mtGuide06CTCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
                </div>
                <div class="mtGuide06CTCContTwoTit">
							<span>
								앱 삭제 및 로그 지우기
							</span>
                </div>
                <div class="mtGuide06CTCContTwoDesc">
                    <p>
                        테스트에 사용한 애플리케이션을 삭제 합니다.
                    </p>
                </div>
                <div class="mtGuide06CTCContTwoCont">
                    <ul>
                        <li><span>&middot;</span>"앱 삭제 및 로그 지우기" 실행 시 설치된 apk 파일을 삭제하고<br />&nbsp;&nbsp;&nbsp;디바이스 상태를 처음 실행한 상태로 되돌립니다.</li>
                        <li><span>&middot;</span>앱 및 로그가 지워지는 동안 디바이스를 사용하실 수 없습니다.</li>
                        <li><span>&middot;</span>디바이스 접속 종료 시 애플리케이션은 자동 삭제 됩니다.</li>
                    </ul>
                </div>
            </div><!-- .mtGuide01CTCContOneBox End -->
            <div class="mtGuide06CTCContThreeBox">
                <div class="mtGuide06CTCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
                </div>
                <div class="mtGuide06CTCContThreeTit">
							<span>
								디바이스 로그 보기
							</span>
                </div>
                <div class="mtGuide06CTCContThreeDesc">
                    <p>
                        현재 사용 중인 디바이스의 로그 정보를 출력합니다.<br />또한 파일로 저장하는 기능을 제공합니다.
                    </p>
                </div>
                <div class="mtGuide06CTCContThreeCont">
                    <ul>
                        <li><span>&middot;</span>Level : 레벨 검색 조건을 변경합니다.</li>
                        <li><span>&middot;</span>Filter : 로그 정보 검색 키워드를 입력 합니다.</li>
                        <li><span>&middot;</span>Clear : 현재 로그창에 출력된 로그 정보를 삭제 합니다.</li>
                        <li><span>&middot;</span>Stop : 디바이스로부터의 로그 수신을 중지 합니다.</li>
                        <li><span>&middot;</span>Save : 로그 정보를 로컬 컴퓨터에 저장 합니다</li>
                    </ul>
                </div>
            </div><!-- .mtGuide01CTCContOneBox End -->
            <div class="mtGuide06CTCContFourBox">
                <div class="mtGuide06CTCContFourNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
                </div>
                <div class="mtGuide06CTCContFourTit">
							<span>
								디바이스 공유하기
							</span>
                </div>

                <div class="mtGuide06CTCContFourCont">
                    <ul>
                        <li><span>&middot;</span>현재 사용 중인 디바이스를 공유합니다.</li>
                        <li><span>&middot;</span>이메일 주소를 입력하고 "Send"를 선택하면 입력하신 <br />&nbsp;&nbsp;&nbsp;메일 주소로 이메일이 발송됩니다.</li>
                        <li><span>&middot;</span>발송된, 이메일을 통해 디바이스를 공유합니다. <br />&nbsp;&nbsp;&nbsp;디바이스당 최대 5명까지 공유가 가능합니다.</li>
                    </ul>
                </div>
            </div><!-- .mtGuide01CTCContOneBox End -->
            <div class="mtGuide06CTCContFiveBox">
                <div class="mtGuide06CTCContFiveNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_05.png" alt="05">
                </div>
                <div class="mtGuide06CTCContFiveTit">
							<span>
								종료
							</span>
                </div>
                <div class="mtGuide06CTCContFiveDesc">
                    <p>
                        디바이스를 종료합니다.
                    </p>
                </div>
            </div><!-- .mtGuide01CTCContOneBox End -->
        </div>
    </div>
    <div class="mtGuide06CTCBox02">
        <div class="mtGuide06CTCImgOneBox01">
            <div class="mtGuide06CTCOneImg">
                <img src="${contextPath }/resources/images/popup_mtg_control_jnlp_02.png" alt="" />
            </div>
        </div>
        <div class="mtGuide06CTCImgTwoBox02">
            <div class="mtGuide06CTCTwoImg2">
                <img src="${contextPath }/resources/images/popup_mtg_control_jnlp_03.png" alt="" />
            </div>
        </div>
        <div class="mtGuide06CTCImgThreeBox03">
            <div class="mtGuide06CTCThreeImg">
                <img src="${contextPath }/resources/images/popup_mtg_control_jnlp_04.png" alt="" align="right" />
            </div>
        </div>
    </div>
</div><!-- .mtGuide01ContentTwoContainer End -->
<div class="mtGuide06ContentThreeContainer">
    <div class="mtGuide06CHCMainBox">
        <div class="mtGuide06CHCMainImg">
            <img src="${contextPath }/resources/images/popup_mtg_control_jnlp_05.png" alt="" />
        </div>
    </div><!-- .mtGuide01COCMainBox End -->
</div><!-- .mtGuide01ContentOneContainer End -->

<div class="mtGuide06ContentFourContainer">
    <div class="mtGuide06CFCBox01">
        <div class="mtGuide06CFCContBox">
            <div class="mtGuide06CFCContOneBox">
                <div class="mtGuide06CFCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
                </div>
                <div class="mtGuide06CTCContOneTit">
							<span>
								텍스트 입력하기
							</span>
                </div>
                <div class="mtGuide06CFCContOneDesc">
                    <p>
                        디바이스 내의 키보드를 이용하지 않고, 텍스트를 입력할 수<br /> 있는 기능으로 메시지, 익스플로어 검색창, 메모 등의 각종<br /> 입력란에 포커스를 위치 후 텍스트 박스를 통해 작성하면<br /> 됩니다.
                    </p>
                </div>
                <div class="mtGuide06CFCContOneCont">
                    <ul>
                        <li><span>&middot;</span>메뉴 선택 시 문자를 입력할 수 있는 창이 표시됩니다.</li>
                        <li><span>&middot;</span>디바이스가 텍스트 입력 상태일 경우에만 동작하며 문자를 <BR />&nbsp;&nbsp;&nbsp;키보드로 입력하여 디바이스에 전달할 수 있습니다.</li>
                        <li><span>&middot;</span>입력 상태가 아닐 경우에는 어떠한 동작도 하지 않습니다.</li>
                        <li><span>&middot;</span>300 bytes 까지 입력 가능합니다.</li>
                    </ul>
                </div>
            </div><!-- .mtGuide01CFCContOneBox End -->


            <div class="mtGuide06CFCContTwoBox">
                <div class="mtGuide06CTCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
                </div>
                <div class="mtGuide06CTCContOneTit">
							<span>
								웹페이지 열기
							</span>
                </div>
                <div class="mtGuide06CFCContTwoDesc">
                    <p>
                        입력한 주소로 인터넷을 연결 실행 합니다.
                    </p>
                </div>
                <div class="mtGuide06CFCContTwoCont">
                    <ul>
                        <li><span>&middot;</span>메뉴 선택 시 웹 주소를 입력할 수 있는 창이 표시됩니다.</li>
                        <li><span>&middot;</span>웹 주소를 입력하고 “Open”을 선택하면 디바이스에 <br />&nbsp;&nbsp;&nbsp;브라우저가 실행됩니다.</li>
                        <li><span>&middot;</span>디바이스 사용 중 어느 화면에서도 사용할 수 있습니다.</li>
                    </ul>
                </div>
            </div><!-- .mtGuide01CTCContOneBox End -->

        </div>
    </div>


    <div class="mtGuide06CFCOneImg">
        <img src="${contextPath }/resources/images/popup_mtg_control_jnlp_06.png" width="371px" height="334px" alt="" />
    </div>
    <div class="mtGuide06CFCBox02">
        <div class="mtGuide06CFCImgOneBox01">
            <div class="mtGuide06CFCOneImg"></div>
        </div>
        <div class="mtGuide06CFCImgTwoBox02">
            <div class="mtGuide06CFCThreeImg">
                <img src="${contextPath }/resources/images/popup_mtg_control_jnlp_07.png" alt="" />
            </div>
        </div>

    </div>
</div><!-- .mtGuide01ContentTwoContainer End -->
