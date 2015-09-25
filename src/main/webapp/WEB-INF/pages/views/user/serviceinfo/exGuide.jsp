<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="subNoticeOneContainer">
    <div class="subNoticeOneBg">
        <div class="subNoticeOneBox">
            <div class="subNoticeoneTxtBox">
                <div class="sunNoticeoneicon"><img src="${contextPath }/resources/images/system_n_i_info.png" width="50" height="57">
                </div>
                <div class="subNoticeOneTxt1">
                    <span>클앱을 원활하게 이용하는 방법</span>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="subNoticeContentTwoContainer">
    <div class="subNoticeContentTwoBox">
        <div class="subNoticeCTwoBLine"></div>
        <p class="subNoticeCTwoBTitle">클앱 시스템 요구 사항</p>
        <div class="subNoticeCTwoBText">
            <div class="subNoticeCTwoBdot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
            <span class="subNoticeCTwoText">Java Script를 지원하는 표준 웹 브라우저 : 인터넷 익스플로러, 구글 크롬, 파이어폭스, 사파리, 오페라</span>
        </div>
        <div class="subNoticeCTwoB2Text">
                <span class="subNoticeCTwoText2">1. 사파리 웹 브라우저는 수동 테스트 프로그램의 자동 실행을 지원하지 않습니다. 테스트 시작 버튼을 클릭 후 “열기”를 클릭해 주세요.<br>
                2. 크롬 웹 브라우저는 수동 테스트 프로그램의 실행을 위해 NPAPI 사용 설정이 필요합니다.</span>
        </div>
        <div class="subNoticeCTwoB3Text">
            <div class="subNoticeCTwoB3dot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
            <span class="subNoticeCTwoText3">Java Runtime Environment(JRE) 1.8 이상</span>
            <p class="subNoticeCTwoText4">→ JRE는 <a href="http://java.com/ko/download/index.jsp" target="new">http://java.com/ko/download/index.jsp</a>에 접속하여 다운로드 받을 수 있습니다.</p>
        </div>
    </div>
</div> <!-- .subContentFourContainer End -->

<div class="subNoticeContentThreeContainer">
    <div class="subNoticeContentThreeBox">
        <div class="subNoticeCThreeBLine"></div>
        <p class="subNoticeCThreeBTitle">브라우저 별 설정 안내</p>
    </div>
</div> <!-- .subNoticeContentThreeContainer End -->

<div class="subNoticeContentFourContainer">
    <div class="subNoticeContentFourBox">
        <div class="subNoticeContentFourItemBox1">
            <div class="subNoticeContentFourItem1">
                <p class="subNoticeContentFourTitle">
                    Internet Explorer</p>
                <div class="subNoticeContentFouricon"><img src="${contextPath }/resources/images/internet.png" width="74" height="72" alt=""/></div>
            </div>
            <div class="subNoticeContentFourItem2">
                <div class="subNoticeCFourBText">
                    <div class="subNoticeCFourBdot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCFourText">버전 10 이상에 최적화되어 있습니다.</span>
                </div>
                <div class="subNoticeCFourB2Text">
                    <div class="subNoticeCFourB2dot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCFourText2">컴퓨터의 사용자 계정(한글 또는 띄어쓰기, 특수문자 포함)에 따라 환경변수 설정이 필요합니다.</span>
                </div>
                <div class="subNoticeCFourB3Text">
                        <span class="subNoticeCFourText3">1) 제어판>(우측상단)보기기준을  큰 아이콘 또는 작은 아이콘으로 설정<br>
                        								  2) 시스템>(좌측 메뉴) 고급 시스템 설정 선택<br>
                                                          3) 시스템 속성창에서 고급탭>환경변수 선택<br>
                                                          4) (상단)사용자변수 TEMP, TMP의 %USERPROFILE%\AppData\Local\Temp를 <br>
                                                          　　편집 버튼을 클릭하여 C:\Windows\Temp로 변경 및 저장<br>
                                                          5) 실행중인 브라우저를 모두 종료하고 재시작<br>
                                                          6) 클앱 사이트 로그인 후 서비스 이용
                        </span>
                </div>
            </div>
        </div>
    </div>
</div> <!-- .subContentFourContainer End -->

<div class="subNoticeContentFiveContainer">
    <div class="subNoticeContentFiveBox">
        <div class="subNoticeContentFiveItemBox1">
            <div class="subNoticeContentFiveItem1">
                <p class="subNoticeContentFiveTitle">Chrome</p>
                <div class="subNoticeContentFiveicon"><img src="${contextPath }/resources/images/chrome.png" width="76" height="76"></div>
            </div>
            <div class="subNoticeContentFiveItem2">
                <div class="subNoticeCFiveBText">
                    <p>1. 44버전 이하 설정 방법
                    </p>
                    <div class="subNoticeCFiveBdot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCFiveText"> 크롬에서 수동 테스트 프로그램을 실행하려면 NPAPI 사용 설정이 필요합니다.​</span>
                </div>
                <div class="subNoticeCFiveB2Text">
                        <span class="subNoticeCFiveText2">1. 크롬 웹 브라우저를 실행한 뒤 URL에 chrome://flags/#enable-npapi 를 입력 합니다.<br>
                        								  2. ‘NPAPI 사용’ 설정 화면에서 ‘사용’ 을 선택 합니다. <br>
                                                          　 (‘사용 중지’ 로 표시 되어 있는 경우 이미 사용 설정이 되어 있는 상태입니다.) <br>
                                                          3. 설정 변경 후 웹 브라우저 하단의 ‘지금 다시 시작’ 버튼을 선택하여 웹 브라우저를 다시<br>
                                                          　 시작합니다.
                        </span>
                        <span class="subNoticeCFiveText3">※ <a href="http://java.com/en/download/faq/chrome.xml#npapichrome" target="new">http://java.com/en/download/faq/chrome.xml#npapichrome</a> 페이지를 통해서도<br>
                        								  　 확인할 수 있습니다.
                        </span>
                    <div class="subNoticeCFiveimg"><img src="${contextPath }/resources/images/system_n_i_1.png" width="533" height="376" alt=""/></div>
                </div>
                <div class="subNoticeCFiveBText2">
                    <p>2. 45버전 이상 설정 방법
                    </p>
                    <div class="subNoticeCFiveBdot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCFiveText">2015년 9월 1일부터 구글 크롬에서 NPAPI 플러그인 지원을 중단하였습니다.​</span>
                    <div class="subNoticeCFiveBdot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCFiveText">따라서 크롬 45버전부터는 클앱의 수동 테스트 프로그램의 자동 실행을 지원하지 않습니다.</span>
                    <div class="subNoticeCFiveBdot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCFiveText">크롬 45버전 이상으로 업데이트 하신 분들은 아래 안내를 확인하시고 클앱 서비스를 이용해 주시<br>기 바랍니다.​</span>
                    <div class="subNoticeCFiveBdot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCFiveText">향후 크롬 브라우저 이용자분들의 클앱 서비스 이용에 불편함이 없도록 지속적으로 개선하도록<br>노력하겠습니다.</span>
                </div>
                <div class="subNoticeCFiveB2Text3">
                    <div class="subNoticeCFiveimg2"><img src="${contextPath }/resources/images/system_n_i_3.png"/></div>
                        <span class="subNoticeCFiveText2">1. 로그인 후 [CLAPP 테스팅 시작]을 클릭<br>
                        2. 크롬 브라우저 하단에 클앱 수동 테스트 프로그램  다운로드 확인<br>
                        3. 다운로드 된 파일 클릭하여 수동 테스트 프로그램 실행
                        </span>
                        <%--<span class="subNoticeCFiveText3">※ 번거로우시겠지만 크롬에서 클앱 서비스 이용 시 동일하게 실행되오니 참고 바랍니다.--%>
                        <%--</span>--%>
                </div>
            </div>
        </div>
    </div>
</div><!-- .subContentFiveContainer End -->

<div class="subNoticeContentSixContainer">
    <div class="subNoticeContentSixBox">
        <div class="subNoticeContentSixItemBox1">
            <div class="subNoticeContentSixItem1">
                <p class="subNoticeContentSixTitle">
                    Safari</p>
                <div class="subNoticeContentSixicon"><img src="${contextPath }/resources/images/safari.png" width="79" height="86" alt=""/></div>
            </div>
            <div class="subNoticeContentSixItem2">
                <div class="subNoticeCSixBText">
                    <div class="subNoticeCSixBdot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCSixText">사파리는 수동 테스트 프로그램의 자동 실행을 지원하지 않습니다. </span>
                </div>
                <div class="subNoticeCSixB2Text">
                    <div class="subNoticeCSixB2dot"><img src="${contextPath }/resources/images/dot.png" width="3" height="3" alt=""/></div>
                    <span class="subNoticeCSixText2">테스트 시작 버튼을 클릭 후 “열기”를 클릭해 주세요.</span>
                </div>
                <div class="subNoticeCSixB3Text">
                    <div class="subNoticeContentSixicon"><img src="${contextPath }/resources/images/system_n_i_2.png" width="349" height="205" alt=""/></div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- .subContentSixContainer End -->

<div class="subNoticeContentSevenContainer">
    <div class="subNoticeContentSevenBox">
        <div class="NoticebNoticeCTContentSTxtBox">
            <div class="subNoticeContentSevenlogo"><img src="${contextPath }/resources/images/system_logo.png" width="122" height="41">
            </div>
            <div class="subNoticeContentSevenTex">이용 시 불편사항이 있으시면 고객지원으로 문의주시거나 고객센터로 전화 주시면 친절히 안내해 드리겠습니다.
            </div>
        </div>
        <div class="NoticebNoticeCTContentSButtonBox">
            <div class="NoticebNoticeCTbutton1"><a href="${contextPath }/introduction/supportCustomerList"><img src="${contextPath }/resources/images/system_btn_1.png" alt="고객지원 바로가기" onMouseOver="this.src='${contextPath }/resources/images/system_btn_1_r.png';" onMouseOut="this.src='${contextPath }/resources/images/system_btn_1.png';" /></a></div>
            <div class="NoticebNoticeCTbutton2"><a href="${contextPath }/introduction/supportQnaList"><img src="${contextPath }/resources/images/system_btn_2.png" alt="도움말 더보기" onMouseOver="this.src='${contextPath }/resources/images/system_btn_2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/system_btn_2.png';" /></a></div>
        </div>
    </div>
</div>