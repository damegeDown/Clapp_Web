<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
    // 다운로드 링크
    var autoJnlpDownload = function(){
        var orgFileName = "2015_CLAPP_Proposal.pdf";
        location.href = contextPath + "/common/fileDownload?path=download&orgFileName="+orgFileName;

    };
</script>
<div class="subSIOneContainer">
    <div class="subSIOneBg">
        <div class="subSIOneBox">
            <div class="subSIoneTxtBox">
                <div class="subSIOneTxt1">
                    <p>"당신의 앱(웹)은 <span style="color: rgb(255, 0, 0);">다양한 모바일<br>디바이스</span>에서 잘 동작되고 있나요?"</p>
                </div>
            </div>
            <div class="subSIiconBox">
                <div class="subSIiconTxtBox">
                    <div class="subSIiconTxt1">
                        <p><span style="color: rgb(51, 115, 185);">클앱</span>은 <span style="color: rgb(51, 115, 185);">실제 디바이스</span>에 <span style="color: rgb(51, 115, 185);">원격</span>으로 접속하여<br>
                            <span style="color: rgb(51, 115, 185);">모바일웹 또는 앱을 테스트</span> 할 수 있는 서비스 입니다.</p>
                    </div>
                    <div class="subSIiconBox2">
                        <div class="subSplay"><iframe width="761" height="455" src="https://www.youtube.com/embed/s_qyDP1s5q4" frameborder="0" allowfullscreen></iframe></div>
                    </div>
                    <div class="subSIiconTxt2">
                        <span>[클앱 홍보 동영상]</span>
                        <span class="clappblog"><a href="http://blog.naver.com/yesclapp" target="_blank"><img src="${contextPath }/resources/images/clappblog.png" width="38" height="38" alt=""/></a></span>
                        <span class="clappfacebook"><a href="https://www.facebook.com/clapp.co.kr" target="_blank"><img src="${contextPath }/resources/images/clappfacebook.png" width="38" height="38" alt=""/></a></span>
                        <span class="clappyoutube"><a href="https://www.youtube.com/channel/UC7YFNaezoU01exPFjLUAz9g" target="_blank"><img src="${contextPath }/resources/images/clappyoutube.png" width="38" height="38" alt=""/></a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="subSIContentTwoContainer">
    <div class="subSIContentTwoBox">
        <div class="subSIContentTwoTextBox">
            <div class="subSICTItem1">
                <span class="subSICTItemTitle1">안드로이드 디바이스</span>
                <div class="subSICTItemTitle1_1">
                    <span>※ IOS 지원은 준비중입니다.</span>
                </div>
            </div>
            <div class="subSICTItem2">
                <span class="subSICTItemTitle2">수동 테스트</span>
            </div>
            <div class="subSICTItem3">
                <span class="subSICTItemTitle3">자동화 테스트</span>
            </div>
            <div class="subSICTItem4">
                <span class="subSICTItemTitle4">5분단위 사용시간 차감</span>
                <div class="subSICTItemTitle4_1">
                    <span>(사용 디바이스 1대 기준)</span>
                </div>
            </div>
        </div> <!-- .subSIContentFourTextBox End -->
    </div>
</div> <!-- .subContentFourContainer End -->

<div class="subSIContentThreeContainer">
    <div class="subSIContentThreeBox">
        <div class="subSICThreeBLine"></div>
        <p class="subSICThreeBTitle">클앱의 <span style="color: rgb(255, 185, 169);">'수동 테스트'</span>란,</p>
				<span class="subSICThrBText">수동 테스트(Manual Test)는  클앱 사이트에 접속하여 [CLAPP 테스팅 시작]버튼을 누른 후에,수동 테스트  전용 실행 프로그램을 실행하고<br>
                앱 또는 모바일웹을 테스트 할 수 있습니다. </span>
        <div class="SIButton">
            <a href="${contextPath }/mobileTesting/mobileTestingMain/" class="SIButtonStart">
                <div>
                    <img src="${contextPath }/resources/images/sibutton.png" onMouseOver="this.src='${contextPath }/resources/images/sibutton_r.png';" onMouseOut="this.src='${contextPath }/resources/images/sibutton.png';" alt="클앱 테스팅 시작" />
                </div>
            </a>
        </div>

        <div class="SIbSICTContentItemBox">
            <div class="SIbSICTContentTxtBox">
                <div class="SIbSICTContentTxt1">
                    <span>클앱 사이트 접속</span></div>
                <div class="SIbSICTContentTxt2"><span>수동 테스트 화면</span>
                </div>
            </div>
        </div>
    </div>
</div> <!-- .subContentFiveContainer End -->

<div class="subSIContentFourContainer">
    <div class="subSIContentFourBox">
        <div class="subSIContentFourItemBox1">
            <div class="subSIContentFourItem1">
                <p class="subSIContentFourTitle">
                    제공 서비스
                </p>
            </div>
            <div class="subSIContentFourItem2">
                <img src="${contextPath }/resources/images/service_i_icon_1.png" alt="" />
                <span class="subSIContentFourItem2Title">설치 테스트<br>UI 테스트<br>버그 추적/검증<br>Moblie VNC(준비중)</span>
                </p>
            </div>
            <div class="subSIContentFourItem3">
                <img src="${contextPath }/resources/images/service_i_icon_2.png" alt="" />
                <span class="subSIContentFourItem3Title">모바일웹 UI 테스트<br>응형웹 호환성 테스트<br>크로스 브라우징 테스트</span>
            </div>
            <div class="subSIContentFourItem4">
                <img src="${contextPath }/resources/images/service_i_icon_3.png" alt="" />
                <span class="subSIContentFourItem4Title">앱 시연<br>앱 매뉴얼 제작<br>스마트폰 활용 교육<br>etc.</span>
            </div>
        </div>
    </div>
</div> <!-- .subContentFourContainer End -->

<div class="subSIContentFiveContainer">
    <div class="subSIContentFiveBox">
        <div class="subSICFiveBLine"></div>
        <p class="subSICFiveBTitle">클앱의 <span style="color: rgb(181, 172, 233);">'자동화 테스트'</span>란,</p>
				<span class="subSICFiBText">자동화 테스트 전용 프로그램을 다운로드 하여 설치한 후, 테스트 시나리오(스크립트 작성)를 생성하여 자동으로 테스트 할 수 있습니다.
				</span>
        <div class="SIButton2">
            <a href="${contextPath }/clappTesting/autoMain" class="SIButton2Start">
                <div>
                    <img src="${contextPath }/resources/images/sibutton2.png" onMouseOver="this.src='${contextPath }/resources/images/sibutton2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/sibutton2.png';" alt="클앱 테스팅 시작" />
                </div>
            </a>
        </div>

        <div class="SIbSICTContent2ItemBox">
            <div class="SIbSICTContent2TxtBox">
                <div class="SIbSICTContent2Txt1">
                    <span>전용 프로그램 다운로드 후 설치</span></div>
                <div class="SIbSICTContent2Txt2"><span>클앱 자동화 프로그램 실행화면</span>
                </div>
            </div>
        </div>
    </div>
</div> <!-- .subContentFiveContainer End -->

<div class="subSIContentSixContainer">
    <div class="subSIContentSixBox">
        <div class="subSIContentSixItemBox1">
            <div class="subSIContentSixItem1">
                <p class="subSIContentSixTitle">
                    제공 가능<br />서비스
                </p>
            </div>
            <div class="subSIContentSixItem2">
                <span class="subSIContentSixItem2Title">설치 테스트<br>UI 테스트<br>버그 추적/검증<br>Moblie VNC(준비중)</span>
                </p>
            </div>
            <div class="subSIContentSixItem3">
                <span class="subSIContentSixItem3Title">모바일웹 UI 테스트<br>응형웹 호환성 테스트<br>크로스 브라우징 테스트</span>
            </div>
            <div class="subSIContentSixItem4">
                <span class="subSIContentSixItem4Title">앱 시연<br>앱 매뉴얼 제작<br>스마트폰 활용 교육<br>etc.</span>
            </div>
        </div>
    </div>
</div> <!-- .subContentSixContainer End -->

<div class="subSIContentSevenContainer">
    <div class="subSIContentSevenBox">
        <div class="subSICSevenBLine"></div>
        <p class="subSICSevenBTitle">테스트는 최소 <span style="color: rgb(254, 235, 201);">5분</span></p>
				<span class="subSICSevenBText">클앱에서 상품을 구매하시기 전에 꼭 알아두세요~!<br>클앱은 최소 서비스 이용 시간 단위를 <span style="color: rgb(254, 235, 201);"><b>디바이스 1대당 5분</b></span>으로 하고 있습니다.
				</span>
        <div class="SIButton3">
        </div>
        <div class="SIbSICTContent3ItemBox">
            <div class="SIbSICTContent3TxtBox">
                <div class="SIbSICTContent3Txt1">
                    <span>3분 사용 ▶ 5분 차감</span></div>
                <div class="SIbSICTContent3Txt2"><span>7분 사용 ▶ 10분 차감</span>
                </div>
                <div class="SIbSICTContent3Txt3"><span>각각 8분/5분 사용<br>▶ 15분 차감</span>
                </div>
            </div>
        </div>
    </div>
</div> <!-- .subContentSevenContainer End -->

<div class="subSIContentEightContainer">
    <div class="subSIContentEightBox">
        <div class="SIbSICTContentEButtonBox">
            <div class="SIbSICTbutton1"><a href="${contextPath }/members/memberJoin"><img src="${contextPath }/resources/images/sibutton3.png"></a></div>
            <div class="SIbSICTbutton2"><a href="${contextPath }/product/productList"><img src="${contextPath }/resources/images/sibutton4.png"></a></div>
            <div class="SIbSICTbutton3"><a href="javascript:void(0)" onclick="autoJnlpDownload();">

                <img src="${contextPath }/resources/images/sibutton5.png"></a></div>
        </div>
    </div>
</div>

<div class="subSIContentNineContainer">
    <div class="subSIContentNineBox">
        <div class="subSINineTxtBox">
            <div class="subSINineTxt1">
                <p>"언제, 어디서나, 싸고, 편리한 <span style="color: rgb(51, 115, 185);">클앱 </span>테스팅</p>
            </div>
            <div class="subSINineTxt2">
                <span>당신의 모바일 비즈니스가 업그레이드 됩니다.</span>
            </div>
        </div>
        <div class="subSIiconNineBox">
            <div class="subSIiconNinebgBox">
                <div class="subSIiconNineTextBox">
                    <div class="subSIContentNineItem1Title">
                        <span> 디바이스 1대 가격으로<br>클앱 보유 전체 디바이스<br>확보</span>
                    </div>
                    <div class="subSIContentNineItem2Title">
                        <span> 나만의<br>테스트 센터 구축</span>
                    </div>
                </div>
                <div class="subSIiconNineTextBox2">
                    <div class="subSIContentNineItem3Title">
                        <span>모바일 테스팅 환경<br>구축으로 개발 프로젝트 <br>신뢰성 향상</span>
                    </div>
                    <div class="subSIContentNineItem4Title">
                        <span> 개발에만 집중,<br>테스트는 클앱이!!</span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>