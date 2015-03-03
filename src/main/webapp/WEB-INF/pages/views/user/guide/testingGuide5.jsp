<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body style="overflow-X:hidden">
   <div class="mtGuide05ContentOneContainer">
	<div class="mtGuide05COCMainBox">
		<div class="mtGuide05COCMainTitle">
			<span>디바이스 및 환경제어 기능</span>
		</div>
		<div class="mtGuide05COCMainDesc">
			<p>
				CLAPP은 Command를 통해 디바이스 제어 및 테스트 환경 제어 기능을 제공합니다.
			</p>
		</div>
		<div class="mtGuide05COCMainImg" align="center">
			<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_01.png" alt=""/>
		</div>
	</div><!-- .mtGuide01COCMainBox End -->
</div><!-- .mtGuide01ContentOneContainer End -->

<div class="mtGuide05ContentTwoContainer">
	<div class="mtGuide05CTCBox01">
		<div class="mtGuide05CTCContBox">
			<div class="mtGuide05CTCContOneBox">
				<div class="mtGuide05CTCContOneNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
				</div>
				<div class="mtGuide01CTCContOneTit">
					<span>
						앱 설치하기
					</span>
				</div>
				<div class="mtGuide05CTCContOneDesc">
					<p>
						테스트 하고자 하는 애플리케이션의 apk 파일을 로컬<br /> 컴퓨터에서 선택하여 디바이스에 설치 합니다. 설치한<br /> 애플리케이션은 디바이스 종료 시 삭제 됩니다. "앱 삭제 및<br /> 로그 지우기"를 이용해서 애플리케이션을 삭제할 수<br /> 있습니다.
					</p>
				</div>
				<div class="mtGuide05CTCContOneCont">
					<ul>
						<li><span>&middot;</span>선택 시 파일 업로드를 하실 수 있는 창이 표시됩니다.</li>
						<li><span>&middot;</span>“Browse”를 선택하여 업로드 하실 apk 파일을 선택합니다.</li>
						<li><span>&middot;</span>“Install”을 선택하여 apk 파일을 설치합니다.</li>
						<li><span>&middot;</span>진행 바를 통해 설치 진행상황을 확인하실 수 있습니다.</li>
						<li><span>&middot;</span>애플리케이션 설치에 걸리는 시간은 사용자의 네트워크 환경과<br />&nbsp;&nbsp;&nbsp;애플리케이션 파일의 크기에 영향을 받습니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CTCContTwoBox">
				<div class="mtGuide05CTCContTwoNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
				</div>
				<div class="mtGuide01CTCContTwoTit">
					<span>
						앱 삭제 및 로그 지우기
					</span>
				</div>
				<div class="mtGuide05CTCContTwoDesc">
					<p>
						테스트에 사용한 애플리케이션을 삭제 합니다.
					</p>
				</div>
				<div class="mtGuide05CTCContTwoCont">
					<ul>
						<li><span>&middot;</span>"앱 삭제 및 로그 지우기" 실행 시 설치된 apk 파일을 삭제하고<br />&nbsp;&nbsp;&nbsp;디바이스 상태를 처음 실행한 상태로 되돌립니다.</li>
						<li><span>&middot;</span>앱 및 로그가 지워지는 동안 디바이스를 사용하실 수 없습니다.</li>
						<li><span>&middot;</span>디바이스 접속 종료 시 애플리케이션은 자동 삭제 됩니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CTCContThreeBox">
				<div class="mtGuide05CTCContThreeNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
				</div>
				<div class="mtGuide01CTCContThreeTit">
					<span>
						디바이스 로그 보기
					</span>
				</div>
				<div class="mtGuide05CTCContThreeDesc">
					<p>
						현재 사용 중인 디바이스의 로그 정보를 출력합니다.<br />또한 파일로 저장하는 기능을 제공합니다.
					</p>
				</div>
				<div class="mtGuide05CTCContThreeCont">
					<ul>
						<li><span>&middot;</span>Level : 레벨 검색 조건을 변경합니다.</li>
						<li><span>&middot;</span>Filter : 로그 정보 검색 키워드를 입력 합니다.</li>
						<li><span>&middot;</span>Clear : 현재 로그창에 출력된 로그 정보를 삭제 합니다.</li>
						<li><span>&middot;</span>Stop : 디바이스로부터의 로그 수신을 중지 합니다.</li>
						<li><span>&middot;</span>Save : 로그 정보를 로컬 컴퓨터에 저장 합니다</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CTCContFourBox">
				<div class="mtGuide05CTCContFourNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
				</div>
				<div class="mtGuide01CTCContFourTit">
					<span>
						디바이스 공유하기
					</span>
				</div>
				
				<div class="mtGuide05CTCContFourCont">
					<ul>
						<li><span>&middot;</span>현재 사용 중인 디바이스를 공유합니다.</li>
						<li><span>&middot;</span>이메일 주소를 입력하고 "Send"를 선택하면 입력하신 <br />&nbsp;&nbsp;&nbsp;메일 주소로 이메일이 발송됩니다.</li>
						<li><span>&middot;</span>발송된, 이메일을 통해 디바이스를 공유합니다. <br />&nbsp;&nbsp;&nbsp;디바이스당 최대 5명까지 공유가 가능합니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CTCContFiveBox">
				<div class="mtGuide05CTCContFiveNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_05.png" alt="05">
				</div>
				<div class="mtGuide01CTCContFiveTit">
					<span>
						종료
					</span>
				</div>
				<div class="mtGuide05CTCContFiveDesc">
					<p>
						디바이스를 종료합니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
		</div>
	</div>
	<div class="mtGuide05CTCBox02">
		<div class="mtGuide05CTCImgOneBox01">
			<div class="mtGuide05CTCOneImg">
				<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_02.png" alt="" />
			</div>
		</div>
		<div class="mtGuide05CTCImgTwoBox02">
			<div class="mtGuide05CTCThreeImg">
				<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_03.png" alt=""/>
			</div>
		</div>
		<div class="mtGuide05CTCImgThreeBox03">
			<div class="mtGuide05CTCThreeImg">
				<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_04.png" alt=""/>
			</div>
		</div>
	</div>
</div><!-- .mtGuide01ContentTwoContainer End -->
<div class="mtGuide05ContentThreeContainer">
	<div class="mtGuide05CHCMainBox">
		<div class="mtGuide05CHCMainImg" align="center">
			<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_05.png" alt="" />
		</div>
	</div><!-- .mtGuide01COCMainBox End -->
</div><!-- .mtGuide01ContentOneContainer End -->

<div class="mtGuide05ContentFourContainer">
	<div class="mtGuide05CFCBox01">
		<div class="mtGuide05CFCContBox">
			<div class="mtGuide05CFCContOneBox">
				<div class="mtGuide05CFCContOneNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
				</div>
				<div class="mtGuide01CFCContOneTit">
					<span>
						텍스트 입력하기
					</span>
				</div>
				<div class="mtGuide05CFCContOneDesc">
					<p>
						디바이스 내의 키보드를 이용하지 않고, 텍스트를 입력할 수<br /> 
						있는 기능으로 메시지, 익스플로어 검색창, 메모 등의 각종<br /> 
						입력란에 포커스를 위치 후 텍스트 박스를 통해 작성하면<br /> 됩니다.
					</p>
				</div>
				<div class="mtGuide05CFCContOneCont">
					<ul>
						<li><span>&middot;</span>메뉴 선택 시 문자를 입력할 수 있는 창이 표시됩니다.</li>
						<li><span>&middot;</span>디바이스가 텍스트 입력 상태일 경우에만 동작하며 문자를 <Br />&nbsp;&nbsp;&nbsp;키보드로 입력하여 디바이스에 전달할 수 있습니다.</li>
						<li><span>&middot;</span>입력 상태가 아닐 경우에는 어떠한 동작도 하지 않습니다.</li>
						<li><span>&middot;</span>300 bytes 까지 입력 가능합니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CFCContOneBox End -->
			<div class="mtGuide05CFCContTwoBox">
				<div class="mtGuide05CFCContTwoNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
				</div>
				<div class="mtGuide01CFCContTwoTit">
					<span>
						웹페이지 열기
					</span>
				</div>
				<div class="mtGuide05CFCContTwoDesc">
					<p>
						입력한 주소로 인터넷을 연결 실행 합니다.
					</p>
				</div>
				<div class="mtGuide05CFCContTwoCont">
					<ul>
						<li><span>&middot;</span>메뉴 선택 시 웹 주소를 입력할 수 있는 창이 표시됩니다.</li>
						<li><span>&middot;</span>웹 주소를 입력하고 “Open”을 선택하면 디바이스에 <br />&nbsp;&nbsp;&nbsp;브라우저가 실행됩니다.</li>
						<li><span>&middot;</span>디바이스 사용 중 어느 화면에서도 사용할 수 있습니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			
		</div>
	</div>
	<div class="mtGuide05CFCBox02">
		<div class="mtGuide05CFCImgOneBox01">
			<div class="mtGuide05CFCOneImg">
				<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_06.png" alt="" />
			</div>
		</div>
		<div class="mtGuide05CFCImgTwoBox02">
			<div class="mtGuide05CFCThreeImg">
				<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_07.png" alt="" />
			</div>
		</div>
		
	</div>
</div><!-- .mtGuide01ContentTwoContainer End -->

<div class="mtGuide05ContentFiveContainer">
	<div class="mtGuide05CVCMainBox">
		<div class="mtGuide05CVCMainImg" align="center">
			<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_08.png" alt="" />
		</div>
	</div><!-- .mtGuide01COCMainBox End -->
</div><!-- .mtGuide01ContentOneContainer End -->

<div class="mtGuide05ContentSixContainer">
	<div class="mtGuide05CSCBox01">
		<div class="mtGuide05CSCContBox">
			<div class="mtGuide05CSCContOneBox">
				<div class="mtGuide05CSCContOneNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
				</div>
				<div class="mtGuide01CSCContOneTit">
					<span>
						스크린샷하기
					</span>
				</div>
				<div class="mtGuide05CSCContOneDesc">
					<p>
						디바이스의 현재 사용 화면을 캡쳐하여 다운로드 받습니다.
					</p>
				</div>
				<div class="mtGuide05CSCContOneCont">
					<ul>
						<li><span>&middot;</span>메뉴 선택 시 화면 캡쳐를 저장할 수 있는 창이 표시됩니다.</li>
						<li><span>&middot;</span>“Browse”를 선택하여 파일을 저장할 폴더를 선택합니다.</li>
						<li><span>&middot;</span>“Folder”를 선택하여 지정된 폴더를 여실 수 있습니다.</li>
						<li><span>&middot;</span>“Capture”를 선택하시면 디바이스 화면이 캡쳐 됩니다.</li>
						<li><span>&middot;</span>캡쳐된 이미지는 “Open”으로 보실 수 있습니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CSCContTwoBox">
				<div class="mtGuide05CSCContTwoNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
				</div>
				<div class="mtGuide01CSCContTwoTit">
					<span>
						녹화하기
					</span>
				</div>
				<div class="mtGuide05CSCContTwoDesc">
					<p>
						디바이스의 화면을 동영상으로 녹화 합니다. 녹화 아이콘은 <br/>녹화 시작을, 녹화 중 STOP 아이콘을 선택 시에는 종료 됨과<br /> 동시에 로컬 컴퓨터로 저장됩니다.
					</p>
				</div>
				<div class="mtGuide05CSCContTwoCont">
					<ul>
						<li><span>&middot;</span>선택 시 동영상 녹화를 실행할 수 있는 창이 표시됩니다.</li>
						<li><span>&middot;</span>"Browse”를 선택하여 파일을 저장할 폴더를 선택합니다.</li>
						<li><span>&middot;</span>“Folder”를 선택하여 지정된 폴더를 여실 수 있습니다.</li>
						<li><span>&middot;</span>“Record”를 선택하시면 디바이스 화면이 녹화 됩니다.</li>
						<li><span>&middot;</span>녹화 중 “Stop”을 선택하면 동영상 파일이 저장됩니다.</li>
						<li><span>&middot;</span>진행 바를 통해 동영상 파일 다운로드상황을 확인하실 수 <br />&nbsp;&nbsp;&nbsp;있습니다.</li>
						<li><span>&middot;</span>파일은 “MP4”로 저장되며 저장된 파일은 “Open”으로 <br />&nbsp;&nbsp;&nbsp;실행하실 수 있습니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CSCContThreeBox">
				<div class="mtGuide05CSCContThreeNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
				</div>
				<div class="mtGuide01CSCContThreeTit">
					<span>
						가로/세로 전환
					</span>
				</div>
				<div class="mtGuide05CSCContThreeDesc">
					<p>
						디바이스의 방향을 Portrait/Landscape 상태로 전환 합니다.
					</p>
				</div>
				<div class="mtGuide05CSCContThreeCont">
					<ul>
						<li><span>&middot;</span>휴대폰의 기본 모드는 Portrait이며, 태블릿은 Landscape <br />&nbsp;&nbsp;&nbsp;모드 입니다. 현재 상태에서 다른 방향으로 전환 합니다.</li>
						<li><span>&middot;</span>디바이스의 자동회전 기능이 활성화 되어야 정상 동작 합니다.</li>
						<li><span>&middot;</span>선택 시 디바이스가 회전하며 화면에 표시됩니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CSCContFourBox">
				<div class="mtGuide05CSCContFourNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
				</div>
				<div class="mtGuide05CSCContFourTit">
					<span>
						크기 조정
					</span>
				</div>
				<div class="mtGuide05CSCContFourDesc">
					<p>
						디바이스 창의 크기를 조정합니다.
					</p>
				</div>
				<div class="mtGuide05CSCContFourCont">
					<ul>
						<li><span>&middot;</span>기본 : 디바이스 크기를 기본 크기로 변경합니다.</li>
						<li><span>&middot;</span>화면 맞춤 : 디바이스 크기를 PC의 해상도 크기로 변경합니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CSCContFiveBox">
				<div class="mtGuide05CSCContFiveNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_05.png" alt="05">
				</div>
				<div class="mtGuide01CSCContFiveTit">
					<span>
						슬립모드 깨우기
					</span>
				</div>
				<div class="mtGuide05CSCContFiveDesc">
					<p>
						디바이스의 슬립모드를 해제 합니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
		</div>
	</div>
	<div class="mtGuide05CFCBox02">
		<div class="mtGuide05CSCImgOneBox01">
			<div class="mtGuide05CFCOneImg">
				<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_09.png" alt="" />
			</div>
		</div>
		<div class="mtGuide05CSCImgTwoBox02">
			<div class="mtGuide05CFCThreeImg">
				<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_10.png" alt="" />
			</div>
		</div>
	</div>
</div><!-- .mtGuide01ContentTwoContainer End -->

<div class="mtGuide05ContentSevenContainer">
	<div class="mtGuide05CECMainBox">
		<div class="mtGuide05CECMainImg" align="center">
			<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_11.png" alt=""/>
		</div>
	</div><!-- .mtGuide01COCMainBox End -->
</div><!-- .mtGuide01ContentOneContainer End -->

<div class="mtGuide05ContentEightContainer">
	<div class="mtGuide05CGCBox01">
		<div class="mtGuide05CGCContBox">
			<div class="mtGuide05CGCContOneBox">
				<div class="mtGuide05CGCContOneNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
				</div>
				<div class="mtGuide01CGCContOneTit">
					<span>
						맨 위로 올리기
					</span>
				</div>
				<div class="mtGuide05CGCContOneDesc">
					<p>
						실행 시 체크 여부에 따라 디바이스를 모니터 상단에<br /> 위치하도록 설정할 수 있습니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CGCContTwoBox">
				<div class="mtGuide05CGCContTwoNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
				</div>
				<div class="mtGuide01CGCContTwoTit">
					<span>
						테두리 숨기기
					</span>
				</div>
				<div class="mtGuide05CGCContTwoDesc">
					<p>
						디바이스 창의 테두리와 메뉴를 제거합니다.<br />제거된 메뉴는 마우스 우클릭을 통해 표시되는 팝업 메뉴에서 접근할 수 있습니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CGCContThreeBox">
				<div class="mtGuide05CGCContThreeNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
				</div>
				<div class="mtGuide01CGCContThreeTit">
					<span>
						사운드 켜기/끄기

					</span>
				</div>
				<div class="mtGuide05CGCContThreeDesc">
					<p>
						디바이스의 사운드를 On/Off 합니다.
					</p>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			<div class="mtGuide05CGCContFourBox">
				<div class="mtGuide05CGCContFourNum">
					<img src="${contextPath }/resources/images/popup_mtg_num_04.png" alt="04">
				</div>
				<div class="mtGuide05CGCContFourTit">
					<span>
						화질 조정
					</span>
				</div>
				<div class="mtGuide05CGCContFourDesc">
					<p>
						사용자의 시스템 환경과 네트워크 환경을 고려하여 영상<br /> 품질을 조절합니다.<br />사용자의 시스템 환경과 네트워크 환경에 따라서 화면 반응<br /> 속도가 변할 수 있습니다.
					</p>
				</div>
				<div class="mtGuide05CGCContFourCont">
					<ul>
						<li><span>&middot;</span>선택 시 디바이스 팝업 창이 발생합니다.</li>
						<li><span>&middot;</span>디바이스에서 전달되는 영상의 품질을 변경합니다.</li>
						<li><span>&middot;</span>High Quality : 고품질의 영상은 반응 속도를 <br />&nbsp;&nbsp;&nbsp;느리게 할 수 있습니다.</li>
						<li><span>&middot;</span>Low Quality : 저사양의 사용자는 영상 품질을 낮춰 반응 속도를 <br />&nbsp;&nbsp;&nbsp;올립니다.</li>
					</ul>
				</div>
			</div><!-- .mtGuide01CTCContOneBox End -->
			
		</div>
	</div>
	<div class="mtGuide05CGCBox02">
		<div class="mtGuide05CGCImgOneBox01">
			<div class="mtGuide05CGCOneImg">
				<img src="${contextPath }/resources/images/popup_mtg_control_jnlp_12.png" alt="" style="padding-top: 500px;" />
			</div>
		</div>
	</div>
</div><!-- .mtGuide01ContentTwoContainer End -->
<div class="mtGuideFloating">
	<a href="#mtGuideWrap">
		<img src="${contextPath }/resources/images/popup_guide_floating.png" onMouseOver="this.src='${contextPath }/resources/images/popup_guide_floating_r.png';" onMouseOut="this.src='${contextPath }/resources/images/popup_guide_floating.png';" alt="top" />
			</a>
		</div>
	</div><!-- .mtGuideWrap End -->
</body>