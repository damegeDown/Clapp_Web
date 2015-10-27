<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="subTAHeaderGraphicContainer">
    <div class="subTAHeaderGraphicBgBox">
        <div class="subTAHeaderGraphicBox">
            <div class="subTAHeaderTextContainer">
                <div class="subTAHeaderTextBox">
                    <span class="taTitle">자동화 테스트</span>
                    <p class="taGpText">
                        수동으로 하기 힘든 반복, 회귀 테스트를 자동화하여<br> 모바일 서비스의 품질 및 생산성을 향상시킬 수 있는<br> 테스트로서 PC에 프로그램을 설치하여 실행할 수 있습니다.
                    </p>
                    <div class="taButton">
								<span class="taButtonStart" id="doAutoClappBtn" style="cursor: pointer;">
									<img src="${contextPath }/resources/images/at_cta_kv_tas.png" onMouseOver="this.src='${contextPath }/resources/images/at_cta_kv_tas_r.png';" onMouseOut="this.src='${contextPath }/resources/images/at_cta_kv_tas.png';" alt="테스트 자동화 시작" />
                                </span>
                    </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</div> <!-- .subHeaderGraphicContainer End -->
<div class="subTAContentOneContainer">
    <div class="subTAContentOnebox">
        <div class="subTAContentOneboxbg1">
            <div class="subTACOBLine"></div>
            <span class="subTACOBTitle">서비스 특징</span>
        </div>
        <div class="subTAContentOneboxbg2">
            <span class="subTACOBItem1">Android 디바이스 기반 </span>
            <p class="subTACOBItem1Text">
                주요 기능 위주의 단축 아이콘 및<br>
                Script 작성으로 동작
            </p>
            <span class="subTACOBItem2">사용자 시나리오</span>
            <p class="subTACOBItem2Text">
                사용자가 원하는 대로,<br>
                Event 버튼을 이용하여 생성
            </p>
            <span class="subTACOBItem3">상황팝업 메뉴</span>
            <p class="subTACOBItem3Text">
                모든 View에 마우스<br>
                우클릭으로 편리하게 선택가능한<br>
                Context menu 제공
            </p>
                    <span class="subTACOBItem5">
                        테스팅 화면 캡쳐 및<br>
                        & 녹화
                    </span>
            <p class="subTACOBItem5Text">
                실시간 디바이스의 화면을<br>
                캡쳐하거나 녹화 가능
            </p>
            <span class="subTACOBItem6">디바이스 정보 확인</span>
            <p class="subTACOBItem6Text">
                디바이스의 펌웨어 버전,<br>
                Model Number 등<br>
                디바이스 상세 정보 확인
            </p>
                    <span class="subTACOBItem7">
                        결과 리포트 인쇄 및<br>
                       & 파일 다운로드</span>
            <p class="subTACOBItem7Text">
                테스트 결과 리포트 인쇄 및<br>
                이메일 발송, 캡쳐/녹화<br>
                파일 등 다운로드
            </p>
        </div>
    </div>
</div> <!-- .subContentOneContainer End -->
<div class="subTAContentTwoContainer">
    <div class="subTAContentTwoBox">
        <div class="subTACTBLine"></div>
        <span class="subTACTBTitle">사용 방법</span>
        <div class="subTAContentTwoBoxbg">
            <p class="subTACTBText">
                클앱 자동화<br>프로그램 다운로드<br> 및 설치
            </p>
            <p class="subTACTBText2">
                자동화 프로그램<br>실행
            </p>
            <p class="subTACTBText3">
                로그인 후<br>디바이스 선택
            </p>
            <p class="subTACTBText4">
                스크립트 테스트
            </p>
            <p class="subTACTBText5">
                스크립트 작성<br>(시나리오별<br>추가 가능)
            </p>
            <p class="subTACTBText6">
                디바이스<br>선택
            </p>
            <p class="subTACTBText7">
                테스트<br>실행
            </p>
            <p class="subTACTBText8">Test Result<br>에서 결과<br>확인
            </p>
        </div>
    </div>
</div> <!-- .subContentFourContainer End -->

<div class="subTAContentThreeContainer">
    <div class="subTAContentThreeBox">
        <div class="subTACThreeBLine"></div>
        <span class="subTACThreeBTitle">주요 기능</span>
        <div class="subTACFContentItemBox">
            <div class="stacfItem02">
                <div class="stacfItem02Icon">
                    <img src="${contextPath }/resources/images/at_cta_function_st.png" alt="디바이스 H/W Key">
                </div>
                <span class="stacfItem02Title">Script Test</span>
                <div class="satcfItem02TextBox">
                    <div class="satcfItem0201Text">
                        <p>
                            다양한 이벤트 아이템(키/터치/반복/App 실행 등)<br>
                            활용, 원하는 내용의 스크립트 작성 가능
                        </p>
                    </div>
                    <div class="satcfItem0202Text">
                        <p>
                            Drag &amp; Drop, Redo/Undo 등의 편집 기능<br>
                            제공 → 시나리오 유지보수성을 강화
                        </p>
                    </div>
                    <div class="satcfItem0203Text">
                        <p>
                            Report 창을 통하여 테스트 결과 및 데이터를<br>
                            한 눈에 보기 쉽게 제공
                        </p>
                    </div>
                </div>
            </div>
            <div class="stacfItem01">
                <div class="stacfItem01Icon">
                    <img src="${contextPath }/resources/images/at_cta_function_mlt.png" alt="디바이스 Screen Touch">
                </div>
                <span class="stacfItem01Title">Memory Leak Test</span>
                <div class="satcfItem01TextBox">
                    <div class="satcfItem0101Text">
                        <p>
                            APP 실행에 따른 메모리 사용량을 자동으로 수집 및<br>
                            메모리 누수 여부 확인
                        </p>
                    </div>
                    <div class="satcfItem0102Text">
                        <p>
                            편집이 용이한 트리 구조의 Package/Activity List
                        </p>
                    </div>
                    <div class="satcfItem0103Text">
                        <p>
                            Fail 검출의 정확한 분석을 위한<br>
                            실시간 Logcat 제공
                        </p>
                    </div>
                </div>
            </div>
            <div class="stacfItem0304">
                <div class="stacfItem03">
                    <div class="stacfItem03Icon">
                        <img src="${contextPath }/resources/images/at_cta_function_iv.png" alt="디바이스 Resizing">
                    </div>
							<span class="stacfItem03Title">
								디바이스<br>
								Information View
							</span>
                </div>
                <div class="stacfItem04">
                    <div class="stacfItem04Icon">
                        <img src="${contextPath }/resources/images/at_cta_function_ia.png" alt="Rotate">
                    </div>
							<span class="stacfItem04Title">
								Inject Action : Input text,<br>
								Send call, App Install
							</span>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="subTAContentFiveContainer">
    <div class="subTAContentFiveBox">
        <div class="subTAContentFiveItem1Box">
            <div class="subTAContentFiveItem1TitleBox">
                <span class="sTACEItem1Title">시스템<br>요구사항</span>
            </div>
            <div class="subMTContentEightItem1TextBox">
                <div class="sTACEItemsTextDot2"></div>
                <div class="sTACEItemsText1Box">
                    <p class="sTACEItem1Text1">
                        디바이스 connect시 .Agent가 자동설치 되고,<br>Disconnect시 자동 삭제됨</p>
                    <p class="sTACEItem1Text2">
                        테스트를 시행할 PC 내 JRE 6 이상 설치 필요
                    </p>
                    <p class="sTACEItem1Text3">
                        참고사항 : 디바이스나 사용환경에 따라<br>
                        Screen capture – record 기능 사용시, JMF 필요
                    </p>
                </div>
            </div>
        </div>
        <div class="subTAContentFiveItem2Box">
            <div class="subTAContentFiveItem2TitleBox">
                <span class="sTACEItem2Title">상세 이용<br>가이드</span>
            </div>
            <div class="subMTContentEightItem2TextBox">
                <div class="sMTCEItemsText2Box">

                    <a href="/autoGuide/autoGuide1" onClick="mtPopup(this.href); return false;">
                        <div class="sMTCEItems2Text1Box">
                            <p class="sMTCEItems2Text1">
                                Over View
                            </p>
                        </div>
                    </a>

                    <a href="/autoGuide/autoGuide2" onClick="mtPopup(this.href); return false;">
                        <div class="sMTCEItems2Text2Box">
                            <p class="sMTCEItems2Text2">
                                프로그램 시작하기
                            </p>
                        </div>
                    </a>

                    <a href="/autoGuide/autoGuide3" onClick="mtPopup(this.href); return false;">
                        <div class="sMTCEItems2Text3Box">
                            <p class="sMTCEItems2Text3">
                                주요 기능
                            </p>
                        </div>
                    </a>

                    <a href="/autoGuide/autoGuide4" onClick="mtPopup(this.href); return false;">
                        <div class="sMTCEItems2Text4Box">
                            <p class="sMTCEItems2Text4">
                                Memory Leak Test
                            </p>
                        </div>
                    </a>

                    <a href="/autoGuide/autoGuide5" onClick="mtPopup(this.href); return false;">
                        <div class="sMTCEItems2Text5Box">
                            <p class="sMTCEItems2Text5">
                                Script Test
                            </p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div> <!-- .subContentEightContainer End -->
<!-- 팝업 미리보기 -->
<%-- <%@ include file="/WEB-INF/pages/views/user/popup/popupAutoDown.jsp"%> --%>

<script>
$("#doAutoClappBtn").click(function(){
	var message = "클앱 자동화는 파일 다운로드 후 설치, \n사이트에 별도 접속하지 않아도 회원 계정만 있으시면\n언제 어디서든 사용하실 수 있습니다."; 
	if(confirm(message)) {
		autoJnlpDownload();
	}
	//popupUtils.popupOpen("#popupAutoDown");
});


// 다운로드 링크
var autoJnlpDownload = function(){
    var orgFileName = "Clapp_Automation.zip";
    location.href = contextPath + "/common/fileDownload?path=download&orgFileName="+orgFileName;

};
function mtPopup(linkUrl){
    window.open(linkUrl,'이용 가이드','width=910,height=600,scrollbars=yes,resizeable=no,left=150,top=150');
}
</script>

