<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body>
   	<div class="subMTGnbBottomContainer">
			<div class="subMTGnbBottomBox">
				<div class="subMTGnbBottom">
					<ul>
						<li class="smtgbItem"><a href="#cta">클앱 자동화</a></li>
						<li></li>
						<li class="smtgbItem"><a href="#tamerit">특·장점</a></li>
						<li></li>
						<li class="smtgbItem"><a href="#diagram">구성도</a></li>
						<li></li>
						<li class="smtgbItem"><a href="#tafunction">주요 기능</a></li>
						<li></li>
						<li class="smtgbItem"><a href="#tahowto">사용 방법</a></li>
						<li></li>
						<li class="smtgbItem"><a href="#tadevices">제공 디바이스</a></li>
					</ul>
				</div>
				<div class="subMTStartBox">
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div> <!-- .subGnbContainer End -->
</div> <!-- #subMenu End -->
<div class="subTAHeaderGraphicContainer">
	<div class="subTAHeaderGraphicBgBox">
		<div class="subTAHeaderGraphicBox">
			<div class="subTAHeaderTextContainer">
				<div class="subTAHeaderTextBox">
					<span class="taTitle">클앱 자동화</span>
					<span class="taSlogan">CLAPP AUTOMATION</span>
					<p class="taGpText">
						수동으로 수행하기 힘든 반복, 회귀 테스트를 <br/>
						자동화하여 APP의 품질 및 생산성을 향상시킬 수 있는 <br />
						설치형 프로그램 입니다.
					</p>
					<div class="taButton">
						<span class="taButtonStart" id="doAutoClappBtn" style="cursor: pointer;">
								<img src="${contextPath }/resources/images/at_cta_kv_tas.png" onMouseOver="this.src='${contextPath }/resources/images/at_cta_kv_tas_r.png';" onMouseOut="this.src='${contextPath }/resources/images/at_cta_kv_tas.png';" alt="테스트 자동화 시작" />
						</span>
						 <%-- <a href="#" class="taButtonDemo">
								<img src="${contextPath }/resources/images/at_cta_kv_demo.png" onMouseOver="this.src='${contextPath }/resources/images/at_cta_kv_demo_r.png';" onMouseOut="this.src='${contextPath }/resources/images/at_cta_kv_demo.png';" alt="데모 체험" />
						</a>  --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subHeaderGraphicContainer End -->

<div class="subTAContentOneContainer">
	<div class="subTAContentOnebox">
		<div class="subTACOBLine"></div>
		<span class="subTACOBTitle">특·장점</span>
		<span class="subTACOBItem1">Android 디바이스 기반 </span>
		<p class="subTACOBItem1Text">
			주요 기능 위주의 단축 아이콘 및<br />
			Script 작성으로 동작
		</p>
		<span class="subTACOBItem2">사용자 시나리오</span>
		<p class="subTACOBItem2Text">
			사용자가 원하는 대로,<br />
			Event 버튼을 이용하여 생성
		</p>
		<span class="subTACOBItem3">상황팝업 메뉴</span>
		<p class="subTACOBItem3Text">
			모든 View에 마우스<br /> 
                  우클릭으로 선택가능한<br />
			Context menu 제공
		</p>
		<span class="subTACOBItem4">세부 동작옵션 설정</span>
		<p class="subTACOBItem4Text">
			자동화 동작에 대한 세부 옵션<br />
			설정 및 실행 기능

		</p>
		<span class="subTACOBItem5">
			테스팅 화면 캡쳐 및<br/>
			&amp; 녹화
		</span>
		<p class="subTACOBItem5Text">
			실시간 디바이스의 화면을<br />
			캡쳐하거나 녹화 가능
		</p>
		<span class="subTACOBItem6">디바이스 정보 확인</span>
		<p class="subTACOBItem6Text">
			디바이스의 펌웨어 버전,<br />
			Model Number 등<br />
			디바이스 상세 정보 확인
		</p>
		<span class="subTACOBItem7">
                  결과 리포트 인쇄 및<br/>
			&amp; 파일 다운로드</span>
		<p class="subTACOBItem7Text">
			테스트 결과 리포트 인쇄 및<br />
			이메일 발송, <br />
                  캡쳐/녹화 파일 등 다운로드
		</p>
	</div>
</div> <!-- .subContentOneContainer End -->

<div class="subTAContentTwoContainer">
	<div class="subTAContentTwoBox">
		<div class="subTACTBLine"></div>
		<span class="subTACTBTitle">구성도</span>
		<p class="subTACTBText">
			해당 시스템은 기본 Scenario를 통해 Test Automation을 제공합니다.<br />
			지속적인 고도화를 통해 다양한 플랫폼(OS)에서 지원할 계획입니다.
		</p>
		<img src="${contextPath }/resources/images/at_two_c_bg2.png" alt="구성도" />
	</div>
</div> <!-- .subContentFourContainer End -->

<div class="subTAContentThreeContainer">
	<div class="subTAContentThreeBox">
		<div class="subTACThreeBLine"></div>
		<span class="subTACThreeBTitle">주요 기능</span>
		<div class="subTACFContentItemBox">
			<div class="stacfItem01">
				<div class="stacfItem01Icon">
					<img src="${contextPath }/resources/images/at_cta_function_mlt.png" alt="디바이스 Screen Touch" />
				</div>
				<span class="stacfItem01Title">Memory Leak Test</span>
				<div class="satcfItem01TextBox">
					<div class="satcfItem0101Text">
						<p>
							APP 실행에 따른 메모리 사용량을 자동으로 수집 및<br />
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
							Fail 검출의 정확한 분석을 위한<br />
							실시간 Logcat 수신 기능
						</p>
					</div>
				</div>
			</div>
			<div class="stacfItem02">
				<div class="stacfItem02Icon">
					<img src="${contextPath }/resources/images/at_cta_function_st.png" alt="디바이스 H/W Key" />
				</div>
				<span class="stacfItem02Title">Script Test</span>
				<div class="satcfItem02TextBox">
					<div class="satcfItem0201Text">
						<p>
							다양한 이벤트 아이템(키/터치/반복/App 실행 등)<br/>
							활용, 원하는 내용의 스크립트 작성 가능
						</p>
					</div>
					<div class="satcfItem0202Text">
						<p>
							Drag &amp; Drop, Redo/Undo 등의 편집 기능 제공,<br />
								시나리오 유지보수성을 강화
							</p>
					</div>
					<div class="satcfItem0203Text">
						<p>
							Report 창을 통하여 테스트 결과 및 데이터를<br />
							한 눈에 보기 쉽게 제공
						</p>
					</div>
				</div>
			</div>
			<div class="stacfItem0304">
				<div class="stacfItem03">
					<div class="stacfItem03Icon">
						<img src="${contextPath }/resources/images/at_cta_function_iv.png" alt="디바이스 Resizing" />
					</div>
					<span class="stacfItem03Title">
						디바이스<br />
						Information View
					</span>
				</div>
				<div class="stacfItem04">
					<div class="stacfItem04Icon">
						<img src="${contextPath }/resources/images/at_cta_function_ia.png" alt="Rotate" />
					</div>
					<span class="stacfItem04Title">
						Inject Action : Input text,<br />
						Send call, App Install
					</span>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subTAContentThreeContainer End -->

<div class="subTAContentFourContainer">
	<div class="subTAContentFourBox">
		<div class="subTACFourBLine"></div>
		<span class="subTACFourBTitle">사용 방법</span>
		<div class="subTACFourFlowBox">
			<div class="subTACFourFlowItem01">
				<p class="subTACFourFlowItem01Title">
					“클앱 자동화 시작"<br />
					버튼 클릭<br />
					(PC에 설치)
				</p>
			</div>
			<div class="subTACFourFlowItem02">
				<p class="subTACFourFlowItem02Title">
					사용자 로그인 후<br />
					디바이스 선택
				</p>
			</div>
			<div class="subTACFourFlowItem0304">
				<div class="subTACFourFlowItem03">
					<div class="subTACFourFlowItem03Title">
						<span>
							Memory<br />Leak Test
						</span>
					</div>
					<div class="subTACFourFlowItem0301">
						<p class="subTACFourFlowItem0301Text">
							Package &amp;<br />
							Activity 선택
						</p>
					</div>
					<div class="subTACFourFlowItem0302">
						<p class="subTACFourFlowItem0302Text">
							테스트 실행
						</p>
					</div>
					<div class="subTACFourFlowItem0303">
						<p class="subTACFourFlowItem0303Text">
							결과 파일 확인
						</p>
					</div>
				</div>
				<div class="subTACFourFlowItem04">
					<div class="subTACFourFlowItem04Title">
						<span>Script Test</span>
					</div>
					<div class="subTACFourFlowItem0401">
						<p class="subTACFourFlowItem0401Text">
							Script 작성<br />
							(시나리오별 <br />
                                  추가 가능)
						</p>
					</div>
					<div class="subTACFourFlowItem0402">
						<p class="subTACFourFlowItem0402Text">
							디바이스<br /> 선택
						</p>
					</div>
					<div class="subTACFourFlowItem0403">
						<p class="subTACFourFlowItem0403Text">
							테스트 실행
						</p>
					</div>
					<div class="subTACFourFlowItem0404">
						<p class="subTACFourFlowItem0404Text">
							Report View에서<br />
							결과 확인
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subContentFourContainer End -->
<div class="subTAContentFiveContainer">
	<div class="subTAContentFiveBox">
		<div class="subTAContentFiveItem1Box">
			<div class="subTAContentFiveItem1TitleBox">
				<span class="sTACEItem1Title">시스템<br />요구사항</span>
			</div>
			<div class="subTAContentFiveItem1TextBox">
				<div class="sTACEItemsTextDot"></div>
				<div class="sTACEItemsText1Box">
					<p class="sTACEItem1Text1">
						동반 설치 프로그램 : .Agent 파일
					</p>
					<p class="sTACEItem1Text2">
						테스트를 시행할 PC 내 JRE 6 이상 설치 필요
					</p>
					<p class="sTACEItem1Text3">
						Android SDK 설치 또는 파일 내 포함된<br />
						adb 경로를 환경변수에 추가요망 
					</p>
					<p class="sTACEItem1Text4">
						참고사항 : 디바이스나 사용환경에 따라 <br/>
						Screen capture – record 기능 사용시,JMF 필요
					</p>
					<p class="sTACEItem1Text5">
						디바이스 connect시 .Agent가 자동설치 되고,<br />
						Disconnect시 자동 삭제됨
					</p>
				</div>
			</div>
		</div>
		<div class="subTAContentFiveItem2Box">
			<div class="subTAContentFiveItem2TitleBox">
				<span class="sTACEItem2Title">상세 이용<br />가이드</span>
			</div>
			<div class="subTAContentFiveItem2TextBox">
				<div class="sTACEItemsText2Box">
					<a href="${contextPath}/autoGuide/autoGuide1" onClick="mtPopup(this.href); return false;">
						<div class="sTACEItems2Text1Box">
							<p class="sTACEItems2Text1">
								Over View
							</p>
						</div>
					</a>
					<a href="${contextPath}/autoGuide/autoGuide2" onClick="mtPopup(this.href); return false;">
						<div class="sTACEItems2Text2Box">
							<p class="sTACEItems2Text2">
								프로그램 시작하기
							</p>
						</div>
					</a>
					<a href="${contextPath}/autoGuide/autoGuide3" onClick="mtPopup(this.href); return false;">
						<div class="sTACEItems2Text3Box">
							<p class="sTACEItems2Text3">
								주요 기능
							</p>
						</div>
					</a>
					<a href="${contextPath}/autoGuide/autoGuide4" onClick="mtPopup(this.href); return false;">
						<div class="sTACEItems2Text4Box">
							<p class="sTACEItems2Text4">
								Memory Leak Test
							</p>
						</div>
					</a>
					<a href="${contextPath}/autoGuide/autoGuide5" onClick="mtPopup(this.href); return false;">
						<div class="sTACEItems2Text5Box">
							<p class="sTACEItems2Text5">
								Script Test
							</p>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subContentEightContainer End -->

<div class="clear"></div>
<div class="subTAContentNineContainer">
	<div class="subTASlider">
		<div class="subTASliderLayer1">
			<div class="subTASliderL1CotentBoxLeft">
				<div class="sTASL1LTop">
					<div class="subTACNineBLine"></div>
					<span class="subTACNineBTitle">제공 디바이스</span>
					<span class="subTACNineBQty">&nbsp;(총 ${insertDeviceCount} 대)</span>
					<p class="sTASL1TopText">
						국내 출시되는 Android 기반 최신 디바이스 및<br />
						사용률이 높은 디바이스를 우선적으로 선별하여<br />
						제공해 드리고 있습니다. 
					</p>
					<span class="subTACNMore"><a href="${contextPath }/clappTesting/autoDevice"></a></span>
				</div>
				<div class="sTASL1LBottom">
					<div class="sTASL1LBLeft">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[0].fileTarget}&fileName=${deviceEntity.deviceList[0].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox1" style="display:none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[0].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[0].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[0].deviceOsCode}</span>
						</div>
					</div>
					<div class="sTASL1LBRight">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[1].fileTarget}&fileName=${deviceEntity.deviceList[1].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox2" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[1].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[1].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[1].deviceOsCode}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="subTASliderL1CotentBoxRight">
				<div class="sTASL1RTop">
					<div class="sTASL1RTLeft">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[2].fileTarget}&fileName=${deviceEntity.deviceList[2].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox3" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[2].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[2].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[2].deviceOsCode}</span>
						</div>
					</div>
					<div class="sTASL1RTRight">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[3].fileTarget}&fileName=${deviceEntity.deviceList[3].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox4" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[3].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[3].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[3].deviceOsCode}</span>
						</div>
					</div>
				</div>
				<div class="sTASL1RBottom">
					<div class="sTASL1RBLeft">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[4].fileTarget}&fileName=${deviceEntity.deviceList[4].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox5" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[4].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[4].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[4].deviceOsCode}</span>
						</div>
					</div>
					<div class="sTASL1RBRight">
						<div class="sTASControl">
							<span class="mtSliderLeftArrow mtslaDisabled"></span>
							<span class="mtSliderTitle">제공 디바이스</span>
							<span class="mtSliderRightArrow"><a></a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="subTASliderLayer2" style="display:none;">
			<div class="subTASliderL2CotentBoxLeft">
				<div class="sTASL2LTop">
					<div class="subTACNineBLine"></div>
					<span class="subTACNineBTitle">제공 디바이스</span>
					<span class="subTACNineBQty">(총 ${insertDeviceCount} 대)</span>
					<p class="sTASL2TopText">
						언제 어디서나 이용이 가능한 CLAPP은<br />
						사용률이 높은 디바이스를 선별하여 제공해 드리고 있습니다.<br />
						APP의 품질 향상을 위하여 신규 디바이스를 지속적으로<br />
						제공해 드릴 예정 입니다. 
					</p>
					<span class="subTACNMore"><a href="${contextPath }/clappTesting/autoDevice"></a></span>
				</div>
				<div class="sTASL2LBottom">
					<div class="sTASL2LBLeft">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[5].fileTarget}&fileName=${deviceEntity.deviceList[5].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox6" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[5].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[5].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[5].deviceOsCode}</span>
						</div>
					</div>
					<div class="sTASL2LBRight">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[6].fileTarget}&fileName=${deviceEntity.deviceList[6].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox7" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[6].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[6].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[6].deviceOsCode}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="subTASliderL2CotentBoxRight">
				<div class="sTASL2RTop">
					<div class="sTASL2RTLeft">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[7].fileTarget}&fileName=${deviceEntity.deviceList[7].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox8" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[7].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[7].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[7].deviceOsCode}</span>
						</div>
					</div>
					<div class="sTASL2RTRight">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[8].fileTarget}&fileName=${deviceEntity.deviceList[8].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox9" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[8].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[8].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[8].deviceOsCode}</span>
						</div>
					</div>
				</div>
				<div class="sTASL2RBottom">
					<div class="sTASL2RBLeft">
						<img src="${contextPath}/common/imgView?fileType=${deviceEntity.deviceList[9].fileTarget}&fileName=${deviceEntity.deviceList[9].fileSavedName}" style="max-width:240px; max-height: 240px;"/>
						<div class="taSliderTextBox10" style="display: none;">
							<span class="mtsliderText1">${deviceEntity.deviceList[9].deviceModelEname}</span>
							<span class="mtsliderText2">${deviceEntity.deviceList[9].deviceMakerCode}</span>
							<span class="mtsliderText3">${deviceEntity.deviceList[9].deviceOsCode}</span>
						</div>
					</div>
					<div class="sTASL2RBRight">
						<div class="sTASControl">
							<span class="mtSliderLeftArrow"><a></a></span>
							<span class="mtSliderTitle">제공 디바이스</span>
							<span class="mtSliderRightArrow mtsraDisabled"><a></a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- .subTASlider End -->
</div> <!-- .subContentNineContainer End -->
</body>
<div id="cta"></div>
<div id="tamerit"></div>
<div id="diagram"></div>	
<div id="tafunction"></div> 
<div id="tahowto"></div>
<div id="tadevices"></div> 
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
 
</script>
