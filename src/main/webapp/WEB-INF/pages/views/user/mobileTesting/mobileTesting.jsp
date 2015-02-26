<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <div class="subMTGnbBottomContainer">
          <div class="subMTGnbBottomBox">
            <div class="subMTGnbBottom">
              <ul>
                <li class="smtgbItem"><a href="#cmt">클앱 테스팅</a></li>
                
                <li class="smtgbItem"><a href="#merit">특·장점</a></li>
                
                <li class="smtgbItem"><a href="#introduction">도입 사례</a></li>
                
                <li class="smtgbItem"><a href="#function">주요 기능</a></li>
                
                <li class="smtgbItem"><a href="#howto">사용 방법</a></li>
                
                <li class="smtgbItem"><a href="#devices">제공 디바이스</a></li>
              </ul>
            </div>
            <div class="subMTStartBox">
              <a href="# return false;">
              	<img src="${contextPath }/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" />
              </a>
            </div>
          </div>
        </div>
      </div> <!-- .subGnbContainer End -->
    </div> <!-- .subMenu End -->
    </div>
    <div class="subMTHeaderGraphicContainer" >
      <div class="subMTHeaderGraphicBgBox">
        <div class="subMTHeaderGraphicBox">
          <div class="subMTHeaderTextContainer">
            <div class="subMTHeaderTextBox">
              <span class="mtTitle">클앱 테스팅</span>
              <span class="mtSlogan">CLAPP TESTING</span>
              <p class="mtGpText">온라인 상의 실제 디바이스에 접속하여<br />365일 언제, 어디서나 쉽고 빠른 테스팅을 위해<br />국내 기술로 탄생한 Cloud Test Platform 입니다.</p>
            <div class="taButton">
                <a href="# return false" class="taButtonStart">
                    <img src="${contextPath }/resources/images/mt_cta_kv_tas.png" onclick="JnlpUtils.startTest()" onMouseOver="this.src='${contextPath }/resources/images/mt_cta_kv_tas_r.png';" onMouseOut="this.src='${contextPath }/resources/images/mt_cta_kv_tas.png';" alt="클앱 테스팅 시작" />
                </a>
             </div>
             </div>
          </div>
        </div>
      </div>
    </div> <!-- .subHeaderGraphicContainer End -->
    <div class="subMTContentOneContainer">
      <div class="subMTContentOnebox">
        <div class="subMTCOBLine"></div>
        <span class="subMTCOBTitle">특·장점</span>
        <p class="subMTCOBText">
          온라인에서 다양한 디바이스를 실제로 구동하여<br />
          애플리케이션을 테스트하므로,<br />
          장소와 시간에 제약 없이 편리하게<br />
          이용하실 수 있습니다.<br />
        </p>
        <span class="subMTCOBItem1">실제 디바이스<br /> 기능 제공</span>
        <p class="subMTCOBItem1Text">
          에뮬레이터가 아닌<br />실제 디바이스의 기능을<br />온라인에서 동작,체험 가능
        </p>
        <span class="subMTCOBItem2">리얼타임<br />오디오 / 비디오</span>
        <p class="subMTCOBItem2Text">
          구동중인 실 디바이스의<br />오디오와 비디오를<br />온라인에서 바로 확인
        </p>
        <span class="subMTCOBItem3">실시간 네트웍스</span>
        <p class="subMTCOBItem3Text">
          원격지에서 통신 및 방송<br />사업자의 N/W에 접속
        </p>
        <span class="subMTCOBItem4">디바이스 원격 액세스</span>
        <p class="subMTCOBItem4Text">
          Android 기반의 디바이스를<br />종류 상관없이 Remote Access
        </p>
        <span class="subMTCOBItem5">테스트 자동화</span>
        <p class="subMTCOBItem5Text">
          간단한 스크립트 작성만으로<br />테스트 자동화 가능 <br />(<a href="${contextPath}/clappTesting/autoMain">자세히보기</a>)
        </p>
        <span class="subMTCOBItem6">기술 경쟁력</span>
        <p class="subMTCOBItem6Text">
          글로벌 솔루션에 비교 시 <br />우월한 처리속도 및 기능,<br />국내 환경에 최적화된 기술
        </p>
      </div>
    </div> <!-- .subContentOneContainer End -->
    <div class="subMTContentTwoContainer">
      <div class="subMTContentTwoTableBox">
        <table class="subMTContentTwoTable">
          <tr>
            <th class="th1">항목</th>
            <th class="th2">K사</th>
            <th class="th3">P사</th>
            <th class="th4">CLAPP</th>
          </tr>
          <tr>
            <td class="td1">구성 방식<span class="tdLine"></span></td>
            <td class="td2">MHL/슬림포트 (표준 I/F)<span class="tdLine2"></span></td>
            <td class="td3">Camera<span class="tdLine2"></span></td>
            <td class="td4">MHL/슬림포트 (표준 I/F), Camera<span class="tdLine3"></span></td>
          </tr>
          <tr>
            <td class="td1">화면 추출<span class="tdLine"></span></td>
            <td class="td2">Image Capture<span class="tdLine2"></span></td>
            <td class="td3">Image Capture<span class="tdLine2"></span></td>
            <td class="td4">Image Capture, HDMI 동영상<span class="tdLine3"></span></td>
          </tr>
          <tr>
            <td class="td1">원격 화면 전송 속도<span class="tdLine"></span></td>
            <td class="td2">10f/s<span class="tdLine2"></span></td>
            <td class="td3">5f/s ~ 10f/s<span class="tdLine2"></span></td>
            <td class="td4">15f/s ~ 20f/s<span class="tdLine3"></span></td>
          </tr>
          <tr>
            <td class="td1">Log 지원<span class="tdLine"></span></td>
            <td class="td2"><img class="cx" src="${contextPath }/resources/images/circle.png" alt="O" /><span class="tdLine2"></span></td>
            <td class="td3"><img class="cx" src="${contextPath }/resources/images/x.png" alt="X" /><span class="tdLine2"></span></td>
            <td class="td4"><img class="cx" src="${contextPath }/resources/images/circle.png" alt="O" /><span class="tdLine3"></span></td>
          </tr>
          <tr>
            <td class="td1">지연속도<span class="tdLine"></span></td>
            <td class="td2">500~5000ms<span class="tdLine2"></span></td>
            <td class="td3">500~5000ms<span class="tdLine2"></span></td>
            <td class="td4">1000ms<span class="tdLine3"></span></td>
          </tr>
          <tr>
            <td class="td1">영상/음성 동기화(Sync)<span class="tdLine"></span></td>
            <td class="td2">오차발생<span class="tdLine2"></span></td>
            <td class="td3">오차발생<span class="tdLine2"></span></td>
            <td class="td4">완벽 동기화 (오차없음)<span class="tdLine3"></span></td>
          </tr>
          <tr>
            <td class="td1">테스트 자동화<span class="tdLine"></span></td>
            <td class="td2"><img class="cx" src="${contextPath }/resources/images/circle.png" alt="O" /><span class="tdLine2"></span></td>
            <td class="td3"><img class="cx" src="${contextPath }/resources/images/circle.png" alt="O" /><span class="tdLine2"></span></td>
            <td class="td4"><img class="cx" src="${contextPath }/resources/images/circle.png" alt="O" /><span class="tdLine3"></span></td>
          </tr>
          <tr>
            <td class="td1">Multi-디바이스</td>
            <td class="td2"><img class="cx" src="${contextPath }/resources/images/x.png" alt="X" /></td>
            <td class="td3"><img class="cx" src="${contextPath }/resources/images/x.png" alt="X" /></td>
            <td class="td4">동시 8대 까지 가능</td>
          </tr>
        </table>
      </div>
    </div> <!-- .subContentTwoContainer End -->
    <div class="subMTContentThreeContainer">
      <div class="subMTContentThreeBox">
        <div class="subMTCThrBLine"></div>
        <span class="subMTCThrBTitle">도입 사례</span>
        <span class="subMTCThrBsubTitle">QA전문업체 'O'사의 사례 :</span>
        <p class="subMTCThrBText">
          디바이스 구매 비용 절감과<br />
          개발 시•공간을 극복함에 따라<br />
          비용 절감 및 신속한 대응으로<br />
          퀄러티 높은 서비스를 제공하게<br />
          되었습니다.
        </p>
        <p class="subMTContentThreeText1">
          제한된 테스트 일정과 인력으로 테스트 생산성 및 어플리케이션 품질 저하
        </p>
        <p class="subMTContentThreeText2">
          다양한 사용자 환경 (데이터, 플랫폼)의 테스트 실행이 어려움
        <p class="subMTContentThreeText3">
          회귀 (반복) 테스트의 생산성 문제 발생
        </p>
        <p class="subMTContentThreeText4">
          테스터와 개발자 간의 어플리케이션 결함 재현이 어렵고 많은 시간 낭비
        </p>
        <p class="subMTContentThreeText5">
          디바이스 구매 및 임대 비용의 증가
        </p>
        <span class="subMTContentThreeBefore">도입 전</span>
        <span class="subMTContentThreeSubTitle1">원격 TEST 서비스로<br />개발, 검수기간<br />단축</span>
        <!-- <p class="subMTContentThreeSubText1">
          개발/검수기간 단축<br />개발비용 절감<br />디바이스 구매 비용 절감
        </p> -->
        <span class="subMTContentThreeSubTitle2">출시 전/후,<br />품질 관리 및<br />신속 대응 가능</span>
        <!-- <p class="subMTContentThreeSubText2">
          Server DB 일원화
        </p>
        <p class="subMTContentThreeSubText2-1">
          Mobile, TV<br />기타 디바이스 수용
        </p> -->
        <span class="subMTContentThreeSubTitle3">디바이스 구매 및<br />운영비 절감</span>
        <span class="subMTContentThreeAfter">도입 후</span>
      </div>
    </div> <!-- .subContentThreeContainer End -->
    <div class="subMTContentFourContainer">
      <div class="subMTContentFourBox">
        <div class="subMTContentFourTitleBox">
          <p class="subMTContentFourTitle">
            가용 디바이스  35대 기준, 효과 비교
          </p>
        </div>
        <div class="subMTContentFourTextBox">
          <div class="subMTCFItem1">
            <span class="subMTCFItemTitle1">일 테스트 가능 시간</span>
            <span class="subMTCFItemSubTitle1"><img src="${contextPath }/resources/images/3.png" alt="3" /> 배 이상</span>
          </div>
          <div class="subMTCFItem2">
            <span class="subMTCFItemTitle2">일 가용 최대 테스터 수</span>
            <span class="subMTCFItemSubTitle2"><img src="${contextPath }/resources/images/3g.png" alt="3" /> 배+ <img src="${contextPath }/resources/images/alpha.png" alt="Alpha" /></span>
          </div>
          <div class="subMTCFItem3">
            <span class="subMTCFItemTitle3">디바이스 투자비 절감</span>
            <span class="subMTCFItemSubTitle3"><img src="${contextPath }/resources/images/69.png" alt="69" /> % 절감</span>
          </div>
          <div class="subMTCFItem4">
            <span class="subMTCFItemTitle4">이동/ 복귀 시간</span>
            <span class="subMTCFItemSubTitle4"><img src="${contextPath }/resources/images/2.png" alt="2" /> h save</span>
          </div>
        </div> <!-- .subMTContentFourTextBox End -->
        <div class="subMTContentFourTextBox2">
          <span class="smcfTBText1">언제, 어디서든<br /><img src="${contextPath }/resources/images/365.png" alt="365" />일<br /><img class="twentyfourH" src="${contextPath }/resources/images/24h.png" alt="24Hours" />
          <span class="smcfTBText2">시/공간제약,<br />근무시간내 <img src="${contextPath }/resources/images/8h.png" alt="8Hours" /></span>
          <span class="smcfTBText3"><img src="${contextPath }/resources/images/140.png" alt="140" />명</span>
          <span class="smcfTBText4"><img src="${contextPath }/resources/images/420.png" alt="420" />명</span>
          <span class="smcfTBText5">최신 디바이스<br />구매/운영비<br /></span>
          <span class="smcfTBText5-1"><strong>월 <img src="${contextPath }/resources/images/130.png" alt="130" />만원</strong><br />(2년 기준)</span>
          <span class="smcfTBText6">자동화기능 포함,<br />Monthly Gold</span>
          <span class="smcfTBText6-1">월 <img src="${contextPath }/resources/images/40.png" alt="40" />만원<br /></span>
          <span class="smcfTBText7">디바이스 임대센터로<br />이동/복귀없이<br />바로 온라인으로 이용</span>
        </div> <!-- .subMTContentFourTextBox2 End -->
      </div>
    </div> <!-- .subContentFourContainer End -->
    <div class="subMTContentFiveContainer">
      <div class="subMTContentFiveBox">
        <div class="subMTCFiveBLine"></div>
        <span class="subMTCFiveBTitle">주요 기능</span>
        <div class="subMTCFContentItemBox">
          <div class="smtcfItem1">
            <div class="smtcfItem1Icon">
              <img src="${contextPath }/resources/images/mt_cmt_function_st.png" alt="디바이스 Screen Touch" />
            </div>
            <span class="smtcfItem1Title">디바이스 Screen Touch</span>
            <p class="smtcfItem1Text">화면 터치로 디바이스 컨트롤</p>
          </div>
          <div class="smtcfItem2">
            <div class="smtcfItem2Icon">
              <img src="${contextPath }/resources/images/mt_cmt_function_hwkey.png" alt="디바이스 H/W Key" />
            </div>
            <span class="smtcfItem2Title">디바이스 H/W Key</span>
            <p class="smtcfItem2Text">Home/Back/Menu 등<br />하드웨어 키 컨트롤</p>
          </div>
          <div class="smtcfItem3">
            <div class="smtcfItem3Icon">
              <img src="${contextPath }/resources/images/mt_cmt_function_resizing.png" alt="디바이스 Resizing" />
            </div>
            <span class="smtcfItem3Title">디바이스 Resizing</span>
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
            <p class="subMTContentSixTitle">
              Commands<br />세부지원 기능
            </p>  
          </div>
          <div class="subMTContentSixItem2">
            <img src="${contextPath }/resources/images/mt_cmt_commends_inputtext.png" alt="" />
            <span class="subMTContentSixItem2Title">Input Text</span>
            <p class="subMTContentSixItem2Text">
              실행 App의 편집창에<br />Text를 입력합니다.
            </p>
          </div>
          <div class="subMTContentSixItem3">
            <img src="${contextPath }/resources/images/mt_cmt_commends_log.png" alt="" />
            <span class="subMTContentSixItem3Title">디바이스 Log</span>
            <p class="subMTContentSixItem3Text">
              Debug 로그를<br />실시간으로 수신합니다.
            </p>
          </div>
          <div class="subMTContentSixItem4">
            <img src="${contextPath }/resources/images/mt_cmt_commends_install.png" alt="" />
            <span class="subMTContentSixItem4Title">App Install</span>
            <p class="subMTContentSixItem4Text">
              사용자 PC에 저장된 App을<br />선택하신 디바이스에 설치합니다.
            </p>
          </div>
        </div>
        <div class="subMTContentSixItemBox2">
          <div class="subMTContentSixItem5">
            <img src="${contextPath }/resources/images/mt_cmt_commends_www.png" alt="" />
            <span class="subMTContentSixItem5Title">Open Url</span>
            <p class="subMTContentSixItem5Text">
              디바이스의 Browser가 입력된<br />URL로 이동합니다.
            </p>
          </div>
          <div class="subMTContentSixItem6">
            <img src="${contextPath }/resources/images/mt_cmt_commends_screenshot.png" alt="" />
            <span class="subMTContentSixItem6Title">Screen Shot</span>
            <p class="subMTContentSixItem6Text">
              디바이스 화면을<br />PC에 저장합니다.
            </p>
          </div>
          <div class="subMTContentSixItem7">
            <img src="${contextPath }/resources/images/mt_cmt_commends_videorecord.png" alt="" />
            <span class="subMTContentSixItem7Title">Video Record</span>
            <p class="subMTContentSixItem7Text">
              디바이스 화면을<br />동영상 파일로 저장합니다.
            </p>
          </div>
          <div class="subMTContentSixItem8">
            <img src="${contextPath }/resources/images/mt_cmt_commends_android.png" alt="" />
            <span class="subMTContentSixItem8Title">Android 디바이스 Only</span>
            <p class="subMTContentSixItem8Text">
              안드로이드 OS에서<br />사용 가능합니다.
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .subContentSixContainer End -->
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
            <span class="subMTCSevenFlowItem2Comment">이메일, 비밀번호 입력</span>
            <p class="subMTCSevenFlowItem2Text">
              회원 로그인
            </p>
          </div>
          <div class="subMTCSevenFlowTab"></div>
          <div class="subMTCSevenFlowItem3">
            <span class="subMTCSevenFlowItem1Comment">JNLP 다운로드</span>
            <p class="subMTCSevenFlowItem1Text">
              JAVA 설치 및 실행
            </p>
          </div>
          <div class="subMTCSevenFlowTab"></div>
          <div class="subMTCSevenFlowItem4">
            <span class="subMTCSevenFlowItem1Comment">JNLP 파일 자동실행</span>
            <p class="subMTCSevenFlowItem1Text">
              응용 프로그램<br />실행•테스트
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .subContentSevenContainer End -->
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
                사파리 웹 브라우저는 JNLP 자동 실행을<br />
                지원하지 않습니다.<br />
                다운로드 후 실행하시기 바랍니다. 
              </p>
              <p class="sMTCEItem1Text3">
                Java Runtime Environment(JRE) 1.7 이상 (JRE는<br />
                http://java.com/ko/download/index.jsp에<br />
                접속 후 다운로드)
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
              <a href="${contextPath}/guide/testingGuide1" onClick="mtPopup(this.href); return false;">
                <div class="sMTCEItems2Text1Box">
                  <p class="sMTCEItems2Text1">
                    테스트 시작
                  </p>
                </div>
              </a>
              <a href="${contextPath}/guide/testingGuide2" onClick="mtPopup(this.href);return false;">
                <div class="sMTCEItems2Text2Box">
                  <p class="sMTCEItems2Text2">
                    예약 기능
                  </p>
                </div>
              </a>
              <a href="${contextPath}/guide/testingGuide3" onClick="mtPopup(this.href);return false;">
                <div class="sMTCEItems2Text3Box">
                  <p class="sMTCEItems2Text3">
                    디바이스 이용현황
                  </p>
                </div>
              </a>
              <a href="${contextPath}/guide/testingGuide4" onClick="mtPopup(this.href);return false;">
                <div class="sMTCEItems2Text4Box">
                  <p class="sMTCEItems2Text4">
                    테스트 디바이스 화면
                  </p>
                </div>
              </a>
              <a href="${contextPath}/guide/testingGuide5" onClick="mtPopup(this.href);return false;">
                <div class="sMTCEItems2Text5Box">
                  <p class="sMTCEItems2Text5">
                    디바이스 및 환경제어 기능
                  </p>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- .subContentEightContainer End -->
    <div class="clear"></div>
    <div class="subMTContentNineContainer">
      <div class="subMTSlider">
        <div class="subMTSliderLayer1">
          <div class="subMTSliderL1CotentBoxLeft">
            <div class="sMTSL1LTop">
              <div class="subMTCNineBLine"></div>
              <span class="subMTCNineBTitle">제공 디바이스</span>
              <span class="subMTCNineBQty">&nbsp;(총 ${insertDeviceCount} 대)</span>
              <p class="sMTSL1TopText">
                국내 출시되는 Android 기반 최신 디바이스 및<br />
                사용률이 높은 디바이스를 우선적으로 선별하여<br />
                제공해 드리고 있습니다.
              </p>
              <span class="subMTCNMore"><a href="${contextPath }/mobileTesting/testingDevice"></a></span>
            </div>
            <div class="sMTSL1LBottom">
              <div class="sMSL1LBLeft">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[0].fileTarget}&fileName=${deviceEntity.deviceList[0].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox1" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[0].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[0].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[0].deviceOsCode}</span>
                </div>
              </div>
              <div class="sMSL1LBRight">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[1].fileTarget}&fileName=${deviceEntity.deviceList[1].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox2" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[1].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[1].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[1].deviceOsCode}</span>
                </div>
              </div>
            </div>
          </div>
          <div class="subMTSliderL1CotentBoxRight">
            <div class="sMTSL1RTop">
              <div class="sMSL1RTLeft">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[2].fileTarget}&fileName=${deviceEntity.deviceList[2].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox3" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[2].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[2].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[2].deviceOsCode}</span>
                </div>
              </div>
              <div class="sMSL1RTRight">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[3].fileTarget}&fileName=${deviceEntity.deviceList[3].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox4" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[3].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[3].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[3].deviceOsCode}</span>
                </div>
              </div>
            </div>
            <div class="sMTSL1RBottom">
              <div class="sMSL1RBLeft">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[4].fileTarget}&fileName=${deviceEntity.deviceList[4].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox5" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[4].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[4].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[4].deviceOsCode}</span>
                </div>
              </div>
              <div class="sMSL1RBRight">
                <div class="sMSControl">
                  <span class="mtSliderLeftArrow mtslaDisabled"></span>
                  <span class="mtSliderTitle">제공 디바이스</span>
                  <span class="mtSliderRightArrow"><a></a></span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="clear"></div>
        <div class="subMTSliderLayer2" style="display:none;">
          <div class="subMTSliderL2CotentBoxLeft">
            <div class="sMTSL2LTop">
              <div class="subMTCNineBLine"></div>
              <span class="subMTCNineBTitle">제공 디바이스</span>
              <span class="subMTCNineBQty">&nbsp;(총 ${insertDeviceCount} 대)</span>
              <p class="sMTSL2TopText">
                국내 출시되는 Android 기반 최신 디바이스 및<br />
                사용률이 높은 디바이스를 우선적으로 선별하여<br />
                제공해 드리고 있습니다.
              </p>
              <span class="subMTCNMore"><a href="${contextPath }/mobileTesting/testingDevice"></a></span>
            </div>
            <div class="sMTSL2LBottom">
              <div class="sMSL2LBLeft">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[5].fileTarget}&fileName=${deviceEntity.deviceList[5].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox6" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[5].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[5].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[5].deviceOsCode}</span>
                </div>
              </div>
              <div class="sMSL2LBRight">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[6].fileTarget}&fileName=${deviceEntity.deviceList[6].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox7" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[6].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[6].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[6].deviceOsCode}</span>
                </div>
              </div>
            </div>
          </div>
          <div class="subMTSliderL2CotentBoxRight">
            <div class="sMTSL2RTop">
              <div class="sMSL2RTLeft">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[7].fileTarget}&fileName=${deviceEntity.deviceList[7].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox8" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[7].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[7].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[7].deviceOsCode}</span>
                </div>
              </div>
              <div class="sMSL2RTRight">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[8].fileTarget}&fileName=${deviceEntity.deviceList[8].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox9" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[8].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[8].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[8].deviceOsCode}</span>
                </div>
              </div>
            </div>
            <div class="sMTSL2RBottom">
              <div class="sMSL2RBLeft">
                <img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[9].fileTarget}&fileName=${deviceEntity.deviceList[9].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
                <div class="mtSliderTextBox10" style="display: none;">
                  <span class="mtsliderText1">${deviceEntity.deviceList[9].deviceModelEname}</span>
                  <span class="mtsliderText2">${deviceEntity.deviceList[9].deviceMakerCode}</span>
                  <span class="mtsliderText3">${deviceEntity.deviceList[9].deviceOsCode}</span>
                </div>
              </div>
              <div class="sMSL2RBRight">
                <div class="sMSControl">
                  <span class="mtSliderLeftArrow"><a></a></span>
                  <span class="mtSliderTitle">제공 디바이스</span>
                  <span class="mtSliderRightArrow mtsraDisabled"><a></a></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- .subMTSlider End -->
    </div> <!-- .subContentNineContainer End -->
  <div id="cmt"></div>
<div id="merit"></div>
<div id="introduction"></div>
<div id="function"></div>
<div id="howto"></div>
<div id="devices"></div>