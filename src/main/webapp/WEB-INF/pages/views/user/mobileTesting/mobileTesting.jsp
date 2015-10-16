<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>

    // 다운로드 링크
    var autoJnlpDownload = function(){
        var orgFileName = "2015_MobileTestingService_CLAPP.pdf";
        location.href = contextPath + "/common/fileDownload?path=download&orgFileName="+orgFileName;

    };
</script>
<style>
    .frame {overflow: hidden; position: relative;}
    .frame ul {list-style: none; margin: 0; padding: 0; position: absolute;}
    .frame ul li { float: left; margin: 0 0 0 0; padding: 0; cursor: pointer; }
    .frame ul li img {width:100%;}
    .frame ul li.active { color: #eeeeee; background: #eeeeee; }

    /* Pages */
    .pages {
        list-style: none;
        margin: 0;
        padding: 0;
        text-align: center;
        background:#f6f7f8;
        padding-bottom:30px;
    }
    .pages li {
        display: inline-block;
        width: 15px; height: 15px;
        margin: 0 3px;
        border-radius: 10px;
        background: #aaa;
        cursor: pointer;
        overflow: hidden;
    }
    .pages li:hover {
        background: #666;
    }
    .pages li.active {
        background: #d1522d;
    }

    .sp01 {
        text-align:center;
        line-height:553px;
        background: url('${contextPath }/resources/images/mt_lol_1.png') no-repeat;
        width:960px;;
        height:508px;
    }

    .sp02 {
        text-align:center;
        line-height:553px;
        background: url('${contextPath }/resources/images/mt_lol_2.png') no-repeat;
        width:960px;
        height:508px;
    }

    .sp03 {
        text-align:center;
        line-height:553px;
        background: url('${contextPath }/resources/images/mt_lol_3.png') no-repeat;
        width:960px;
        height:508px;
    }
    .sp04 {
        text-align:center;
        line-height:553px;
        background: url('${contextPath }/resources/images/mt_lol_4.png') no-repeat;
        width:960px;
        height:508px;
    }
    .sp05 {
        text-align:center;
        line-height:553px;
        background: url('${contextPath }/resources/images/mt_lol_5.png') no-repeat;
        width:960px;
        height:508px;
    }
    .sp06 {
        text-align:center;
        line-height:553px;
        background: url('${contextPath }/resources/images/mt_lol_6.png') no-repeat;
        width:960px;
        height:508px;
    }
</style>
<div class="subMTHeaderGraphicContainer" >
    <div class="subMTHeaderGraphicBgBox">
        <div class="subMTHeaderGraphicBox">
            <div class="subMTHeaderTextContainer">
                <div class="subMTHeaderTextBox">
                    <span class="mtTitle">수동 테스트</span>
                    <p class="mtGpText">클앱의 수동 테스트 프로그램을 실행한 후, <br>
                        실제 디바이스에 접속하여 마우스로 직접 화면을<br>
                        컨트롤하면서 모바일웹 또는 앱웹을 테스트 할 수<br> 있습니다.
                    </p>
                </div>
            </div>
        </div>
    </div> <!-- .subHeaderGraphicContainer End -->


    <div class="subMTContentOneContainer">
        <div class="subMTContentOnebox">
            <div class="subMTCOBLine"></div>
            <span class="subMTCOBTitle">서비스 특징</span>
            <span class="subMTCOBItem3">실제 디바이스 기능 제공</span>
            <p class="subMTCOBItem3Text">
                실제 디바이스의 기능을<br />온라인으로 동작 및 체험 가능
            </p>
            <span class="subMTCOBItem4">디바이스 원격 액세스</span>
            <p class="subMTCOBItem4Text">
                Android 기반의 디바이스를<br />종류 상관없이 Remote Access
            </p>
				<span class="subMTCOBItem5">리얼타임<br>
                							오디오 / 비디오</span>
            <p class="subMTCOBItem5Text">
                구동중인 실 디바이스의<br />
                오디오와 비디오를 <br />온라인에서 바로 확인
            </p>
            <span class="subMTCOBItem6">버그 추적 및 검증</span>
            <p class="subMTCOBItem6Text">
                디버그 로그를<br />실시간으로 수신
            </p>
        </div>
    </div> <!-- .subContentOneContainer End -->


    <div class="subMTContentSevenContainer">
        <div class="subMTContentSevenBox">
            <div class="subMTCSevenBLine"></div>
            <span class="subMTCSevenBTitle">사용 방법</span>
            <div class="subMTCSevenFlowBox">
                <div class="subMTCSevenFlowItem1">
                    <span class="subMTCSevenFlowItem1Comment">사이트 최상단</span>
                    <p class="subMTCSevenFlowItem1Text">
                        “CLAPP 시작하기”<br />버튼 클릭
                    </p>
                </div>
                <div class="subMTCSevenFlowTab"></div>
                <div class="subMTCSevenFlowItem2">
                    <span class="subMTCSevenFlowItem1Comment">이메일, 비밀번호 입력</span>
                    <p class="subMTCSevenFlowItem1Text">
                        회원 로그인
                    </p>
                </div>
                <div class="subMTCSevenFlowTab"></div>
                <div class="subMTCSevenFlowItem3">
                    <span class="subMTCSevenFlowItem1Comment">수동테스트 프로그램<br>실행파일 최초 다운로드</span>
                    <p class="subMTCSevenFlowItem2Text">
                        JAVA 설치 및 실행
                    </p>
                </div>
                <div class="subMTCSevenFlowTab"></div>
                <div class="subMTCSevenFlowItem4">
                    <span class="subMTCSevenFlowItem1Comment">수동테스트 프로그램<br>자동 실행</span>
                    <p class="subMTCSevenFlowItem2Text">
                        프로그램<br />실행•테스트
                    </p>
                </div>
            </div>
        </div>
    </div> <!-- .subContentSevenContainer End -->

    <div class="subMTContentTContainer">
        <div class="subMTContentTBox">
            <div class="subMTCTBLine"></div>
            <span class="subMTCTBTitle">클앱 제공 서비스</span>
                <span class="subMTCTBText">수동 테스트(Manual Test)는  클앱 사이트에 접속하여 [CLAPP 테스팅 시작]버튼을 누른 후에,수동 테스트  전용 실행 프로그램을 실행하고<br>
                앱 또는 모바일웹을 테스트 할 수 있습니다. </span>
            <div class="subMTContentTBox2">
                <div id="rolling">
                    <ul>
                        <li class="sp01"></li>
                        <li class="sp02"></li>
                        <li class="sp03"></li>
                        <li class="sp04"></li>
                        <li class="sp05"></li>
                        <li class="sp06"></li>
                    </ul>
                </div>
                <ul class="pages"></ul>


                <script>
                    $("#rolling").rolling(960,508,{autoscroll:1, delay:6000});
                </script>
            </div>
        </div>
    </div>

    <div class="subMTContentFiveContainer">
        <div class="subMTContentFiveBox">
            <div class="subMTCFiveBLine"></div>
            <span class="subMTCFiveBTitle">주요 기능</span>
            <div class="subMTCFContentItemBox">
                <div class="smtcfItem1">
                    <div class="smtcfItem1Icon">
                        <img src="${contextPath }/resources/images/mt_cmt_function_st.png" alt="디바이스 Screen Touch" />
                    </div>
                    <span class="smtcfItem1Title">Mouse Control</span>
                    <p class="smtcfItem1Text">마우스로 디바이스 컨트롤</p>
                </div>
                <div class="smtcfItem2">
                    <div class="smtcfItem2Icon">
                        <img src="${contextPath }/resources/images/mt_cmt_function_hwkey.png" alt="디바이스 H/W Key" />
                    </div>
                    <span class="smtcfItem2Title">Hardware Key</span>
                    <p class="smtcfItem2Text">Home/Back/Menu 등<br />하드웨어 키 컨트롤</p>
                </div>
                <div class="smtcfItem3">
                    <div class="smtcfItem3Icon">
                        <img src="${contextPath }/resources/images/mt_cmt_function_resizing.png" alt="디바이스 Resizing" />
                    </div>
                    <span class="smtcfItem3Title">Resizing</span>
                    <p class="smtcfItem3Text">화면 크기 조정</p>
                </div>
                <div class="smtcfItem4">
                    <div class="smtcfItem4Icon">
                        <img src="${contextPath }/resources/images/mt_cmt_function_rotate.png" alt="Rotate" />
                    </div>
                    <span class="smtcfItem1Title">Rotate</span>
                    <p class="smtcfItem1Text">가로/세로 모드로 전환</p>
                </div>
            </div>
        </div>
    </div> <!-- .subContentFiveContainer End -->
    <div class="subMTContentSixContainer">
        <div class="subMTContentSixBox">
            <div class="subMTContentSixItemBox1">
                <div class="subMTContentSixItem1">
                    <p class="subMTContentSixTitle">세부지원 기능
                    </p>
                </div>
                <div class="subMTContentSixItem2">
                    <img src="${contextPath }/resources/images/mt_cmt_commends_inputtext.png" alt="" />
                    <span class="subMTContentSixItem2Title">Input Text</span>
                    <p class="subMTContentSixItem2Text">
                        실행 App의 편집창에<br />
                        Text 입력 가능</p>
                </div>
                <div class="subMTContentSixItem3">
                    <img src="${contextPath }/resources/images/mt_cmt_commends_log.png" alt="" />
                    <span class="subMTContentSixItem3Title">디바이스 Log</span>
                    <p class="subMTContentSixItem3Text">
                        Debug 로그<br />
                        실시간으로 수신</p>
                </div>
                <div class="subMTContentSixItem4">
                    <img src="${contextPath }/resources/images/mt_cmt_commends_install.png" alt="" />
                    <span class="subMTContentSixItem4Title">App Install</span>
                    <p class="subMTContentSixItem4Text">선택한 디바이스에<br> 앱 파일 설치
                    </p>
                </div>
            </div>
            <div class="subMTContentSixItemBox2">
                <div class="subMTContentSixItem5">
                    <img src="${contextPath }/resources/images/mt_cmt_commends_www.png" alt="" />
                    <span class="subMTContentSixItem5Title">Open Url</span>
                    <p class="subMTContentSixItem5Text">
                        디바이스 내 브라우저에<br />입력한 URL로 이동
                    </p>
                </div>
                <div class="subMTContentSixItem6">
                    <img src="${contextPath }/resources/images/mt_cmt_commends_screenshot.png" alt="" />
                    <span class="subMTContentSixItem6Title">Screen Shot</span>
                    <p class="subMTContentSixItem6Text">
                        디바이스 화면을 캡쳐하여<br />PC에 저장
                    </p>
                </div>
                <div class="subMTContentSixItem7">
                    <img src="${contextPath }/resources/images/mt_cmt_commends_videorecord.png" alt="" />
                    <span class="subMTContentSixItem7Title">Video Record</span>
                    <p class="subMTContentSixItem7Text">
                        디바이스의 동작 화면을<br />
                        동영상으로 저장</p>
                </div>
                <div class="subMTContentSixItem8">
                    <img src="${contextPath }/resources/images/mt_cmt_commends_android.png" alt="" />
                    <span class="subMTContentSixItem8Title">Android</span>
                    <p class="subMTContentSixItem8Text">
                        안드로이드 OS 기반의<br />
                        디바이스 사용 가능</p>
                </div>
            </div>
        </div>
    </div> <!-- .subContentSixContainer End -->

    <div class="subMTContentEightContainer">
        <div class="subMTContentEightBox">
            <div class="subMTContentEightItem1Box">
                <div class="subMTContentEightItem1TitleBox">
                    <span class="sMTCEItem1Title">시스템<br />요구사항</span>
                </div>
                <div class="subMTContentEightItem1TextBox">
                    <div class="sMTCEItemsTextDot"></div>
                    <div class="sMTCEItemsText1Box">
                        <p class="sMTCEItem1Text1">
                            Java Script를 지원하는 표준 웹 브라우저<br />
                            (인터넷 익스플로러,구글 크롬, 파이어폭스,<br />
                            사파리, 오페라)
                        </p>
                        <p class="sMTCEItem1Text2">
                            사파리 웹 브라우저는 수동테스트 프로그램<br />
                            자동 실행을 지원하지 않습니다.<br />
                            다운로드 후 실행하시기 바랍니다.
                        </p>
                        <p class="sMTCEItem1Text3">
                            Java Runtime Environment(JRE) 1.7 이상 (JRE는<br />
                            http://java.com/ko/download/index.jsp에<br />
                            접속 후 다운로드)
                        </p>
                        <p class="sMTCEItem1Text3">
                            운영 체제 : Windows Vista, Windows 7,<br />
                            Windows 8 (32/64 비트) 자바환경 : JRE7 이상<br />
                            프로세서 : 펜티엄2 266MHz 이상<br />
                            설치에 필요한 디스크 용량 : 300MB 이상<br />
                            (JRE + 자동화툴 + JNLP) 메모리 : 128MB 이상<br />
                        </p>
                    </div>
                </div>
            </div>
            <div class="subMTContentEightItem2Box">
                <div class="subMTContentEightItem2TitleBox">
                    <span class="sMTCEItem2Title">상세 이용<br />가이드</span>
                </div>
                <div class="subMTContentEightItem2TextBox">
                    <div class="sMTCEItemsText2Box">
                        <a href="/guide/testingGuide1">
                            <div class="sMTCEItems2Text1Box">
                                <p class="sMTCEItems2Text1">
                                    기본 정보
                                </p>
                            </div>
                        </a>

                        <a href="/guide/testingGuide2">
                            <div class="sMTCEItems2Text2Box">
                                <p class="sMTCEItems2Text2">
                                    시작 하기
                                </p>
                            </div>
                        </a>

                        <a href="/guide/testingGuide3">
                            <div class="sMTCEItems2Text3Box">
                                <p class="sMTCEItems2Text3">
                                    예약 하기
                                </p>
                            </div>
                        </a>

                        <a href="/guide/testingGuide4">
                            <div class="sMTCEItems2Text4Box">
                                <p class="sMTCEItems2Text4">
                                    디바이스 이용현황
                                </p>
                            </div>
                        </a>

                        <a href="/guide/testingGuide5">
                            <div class="sMTCEItems2Text5Box">
                                <p class="sMTCEItems2Text5">
                                    테스트 디바이스 화면
                                </p>
                            </div>
                        </a>

                        <a href="/guide/testingGuide6">
                            <div class="sMTCEItems2Text6Box">
                                <p class="sMTCEItems2Text6">
                                    디바이스 및 환경제어 기능
                                </p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- .subContentEightContainer End -->
