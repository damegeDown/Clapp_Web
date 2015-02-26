<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/pages/views/user/introduction/inc/incSubMenu.jsp"%>

    <div class="subCIGnbBottomContainer">
      <div class="subCIGnbBottomBg">
        <div class="subCIGnbBottomBox">
          <div class="subCIGnbBottom">
            <span class="subCITitle">클앱 소개</span>
          </div><!-- .subCIArticleGnbBottomBox End -->
        </div><!-- .subCIArticleGnbBottomBox -->
      </div><!-- .subCIArticleGnbBottomBg -->
    </div><!-- .subTCIArticleGnbBottomContainer End -->

    <div class="subCIContentOneContainer">
      <div class="subCIContentOnebox">
        <div class="subCICOBLine"></div>
        <span class="subCICOBTitle">클 앱은 클앱으로!</span>
        <p class="subCICOBItem1Text">
          클앱(CLAPP)은 다양한 스마트폰이나 웨어러블기기에서 구동되는 앱을 개발자 또는 <br /> 사용자가 언제 어디서나 원격으로 클앱 테스팅 센타에 접속하여 원하는 단말기를<br /> 선택하고 개발한 앱을 단말기에 설치하여 수동 또는 자동으로 원하는 시험을 할 수<br /> 있는 국내 최초 클라우드 기반의 원격 앱 테스팅 서비스 입니다.<br><br /> 다양한 스마트 기기의 보급으로 수 많은 기업들이 다양한 앱을 만들어 보급을 하고 <br /> 있으나, 현실적으로 일 년에도 백 개 이상씩 새롭게 쏟아지는 신형 스마트기기와<br/> 변화하는 운영체제에 맞추어 앱을 업데이트하거나 시험을 하기에는 어려움이<br /> 따르고 있는 것이 현실입니다.<br><br/>따라서 새로운 형태의 서비스인 클앱(CLAPP)으로 기업들은 앱 개발 비용을 줄이고, <br />다양한 동작 오류로부터 품질을 개선함으로써, 기존에 지적되었던 사용자 불만을<br />해결하고, 편의성을 개선할 수 있습니다!<br ><br />

          특허 출원번호 : 10-2014-0067899<br />
          상표 출원번호 : 제 40-2014-0084563호 (클앱) / 제 40-2014-0084564호 (CLAPP)<br />
                    서비스표 출원번호 : 제 41-2014-0051681호 / 제 41-2014-0051682호 
                    
        </p>
      </div>
    </div> <!-- .subContentOneContainer End -->

    <div class="subCIContentTwoContainer">
      <div class="subCIContentTwobox">
        <div class="subCICTBLine"></div>
        <span class="subCICTBTitle">CLAPP BI
          <span class="subCICTBSubTitle">Brand Identity</span>
        </span>
        <div class="subCICTBItem1Img">
          <img src="${contextPath}/resources/images/ci_ci_logo.png" alt="bi" />
        </div>
        <p class="subCICTBItem1Text">
          영문 이니셜 C를 모티브로 다양하게 출시된 디바이스 들을 CLAPP으로 연결,<br />
          언제 어디서나 테스트 할 수 있다는 의미를 가지고 있습니다.
        </p>
        <span class="subCICTBItem2">Logotype</span>
        <div class="subCICTBItem2Img">
          <img src="${contextPath}/resources/images/ci_ci_logotype.png" alt=""logotype />
        </div>
        <span class="subCICTBItem3">Symbol</span>
        <div class="subCICTBItem3Img">
          <img src="${contextPath}/resources/images/ci_ci_symbol.png" alt="symbol" />
        </div>
      </div>
    </div> <!-- .subContentTwoContainer End -->

    <div class="subCIContentThreeContainer">
      <div class="subCIContentThreebox">
        <div class="subCICHBbox1">
          <span class="subCICHBTitle">Contact Us</span>
          <div class="subCICHBLine"></div>
          <div class="subCICHBPosition">
            <img src="${contextPath}/resources/images/itr_intro_pick.png" alt="pick" class="subCICHBPositionImg"/>
            <div class="subCICHBPositionTxt">
              <span class="subCICHBPositionName">
                메디오피아테크
                <span class="subCICHBPositionDetails">(1F 기업은행)</span>
              </span>
            </div>
          </div>
        </div>
        <div class="subCICHBbox2">
          <div class="subCICHBSubBox1">
            <div class="subCICHBSub01">
              <div class="subCICHBSub01Title">
                <span>
                  클앱 오시는 길
                </span>
              </div>
              <div class="subCICHBSub01Address">
                <span>
                  주소 : 서울시 강남구 도곡 182, 4층<br />
                  (도곡동, 양제벤쳐타워)
                </span>
              </div>
              <a href="${contextPath}/introduction/popup/map"  onClick="mtPopup(this.href); return false;" target="new">
                <div class="subCICHBSub01Link" >
                  <img src="${contextPath}/resources/images/itr_introduce_contactus_map_detail.png" alt="map" />
                  <span>
                    지도<br />
                    자세히 보기
                   </span>
                </div>
              </a>
            </div>
          </div>
          <div class="subCICHBSubBox2">
            <div class="subCICHBSub02">
              <div class="subCICHBSub02Title">
                <span>
                  클앱 고객지원
                </span>
              </div>
              <div class="subCICHBSub02Phone">
                <img src="${contextPath}/resources/images/itr_introduce_contactus_customer.png" alt="phone" />
                <div class="subCICHBSub02PhoneText">
                  <span class="subCICHBSub02PhoneTxt">고객 지원</span>
                  <span class="subCICHBSub02PhoneNum">1661-7083</span>
                </div>
              </div>
              <div class="subCICHBSub02Headset">
                <img src="${contextPath}/resources/images/itr_introduce_contactus_phone.png" alt="tel" />
                <div class="subCICHBSub02HeadsetText">
                  <span class="subCICHBSub02PhoneTxt">영업 · 제휴</span>
                  <span class="subCICHBSub02PhoneNum">02-3460-8536</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- .subContentThreeContainer End -->
