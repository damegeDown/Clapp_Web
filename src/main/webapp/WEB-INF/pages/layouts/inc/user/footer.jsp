<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div id="wrapBgBottomNav"> 
  <div class="wrapBottomNavContainer">
    <div class="wbcBox1">
      <div class="wbcBox1Con">
        <div class="wbcBox1BtLogo">
          <a href="${contextPath}/"><img src="${contextPath }/resources/images/clapp_bt_logo.png" alt="CLAPP" /></a>
        </div>
        <div class="wbcBox1BtCompanyInfo">
          <span class="wbcCompanyName">(주)메디오피아테크</span>
          <span class="wbcCeo">대표이사: 신성균</span>
                        <span class="wbcCompanyAddress">주소: 서울 강남구 도곡로 182, 4층</span>
          <span class="wbcCompanyNumber">사업자번호: 220-87-36025<span class="mdash">|</span><a class="corpConfirm" href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2208736025" target="_blank">사업자정보확인</a><span class="corparrow"></span></span>
          <span class="wbcCompanyNumber2">통신판매업: 제 강남-15728호</span>
          <span class="wbcPatentNo">특허출원번호: 10-2014-0067899</span>
          <span class="wbcBrandNo">상표출원번호: 제 40-2014-0084564호 외 3건</span>
        </div>
      </div>
    </div>
    <div class="wbcBox2">
      <div class="wbcBox2Con">
        <span class="wbcMobileTesting"><a href="${contextPath}/mobileTesting/mobileTestingMain">클앱 테스팅</a></span>
        <ul>
          <li><a href="${contextPath}/mobileTesting/mobileTestingMain#cmt">클앱 테스팅</a></li> 
          <li><a href="${contextPath}/mobileTesting/mobileTestingMain#merit">특 · 장점</a></li>
          <li><a href="${contextPath}/mobileTesting/mobileTestingMain#introduction">도입 사례</a></li>
          <li><a href="${contextPath}/mobileTesting/mobileTestingMain#function">주요 기능</a></li>
          <li><a href="${contextPath}/mobileTesting/mobileTestingMain#howto">사용 방법</a></li>
          <li><a href="${contextPath}/mobileTesting/mobileTestingMain#devices">제공 디바이스</a></li>
          <li><a href="${contextPath}/guide/testingGuide1" onClick="mtPopup(this.href);return false;">이용 가이드</a></li>
        </ul>
        <span class="wbcTrendReview"><a href="${contextPath}/trandReview/trandReviewMain">트렌드 리뷰</a></span>
      </div>
    </div>
    <div class="wbcBox3">
      <div class="wbcBox3Con">
        <span class="wbcTestAutomattic"><a href="${contextPath}/clappTesting/autoMain">클앱 자동화</a></span>
        <ul>
          <li><a href="${contextPath}/clappTesting/autoMain#cta">클앱 자동화</a></li>
          <li><a href="${contextPath}/clappTesting/autoMain#tamerit">특 · 장점</a></li>
          <li><a href="${contextPath}/clappTesting/autoMain#diagram">구성도</a></li>
          <li><a href="${contextPath}/clappTesting/autoMain#tafunction">주요 기능</a></li>
          <li><a href="${contextPath}/clappTesting/autoMain#tahowto">사용 방법</a></li>
          <li><a href="${contextPath}/clappTesting/autoMain#tadevices">제공 디바이스</a></li>
          <li><a href="${contextPath}/guide/testingGuide1" onClick="mtPopup(this.href);return false;">이용 가이드</a></li>
        </ul>
        <span class="wbcCompanyIntro"><a href="${contextPath}/introduction/introductionMain">브랜드 클앱</a></span>
      </div>
    </div>
    <div class="wbcBox4">    
      <div class="wbcBox4Con">
        <span class="wbcQaConsulting"><a href="${contextPath}/clappConsulting/consulting">클앱 컨설팅</a></span>
        <ul>
          <li><a href="${contextPath}/clappConsulting/consulting#cqc">클앱 컨설팅</a></li>
          <li><a href="${contextPath}/clappConsulting/consulting#camerit">특 · 장점</a></li>
          <li><a href="${contextPath}/clappConsulting/consulting#process">프로세스</a></li>
        </ul>
        <span class="wbcProductIntro"><a href="${contextPath}/product/productList">상품 안내</a></span>
      </div>
    </div>
  </div> 

  <div id="wrapBgFooter">
    <div class="wrapFooterContainer">
      <div class="wrapFooterCopy">
        <span class="copyright">Copyright &copy; MEDIOPIA Tech. All rights reserved.</span>
      </div>
      <div class="wrapFooterMenu">
        <ul>
          <li><a href="${contextPath }/common/privacy">개인정보 처리방침</a></li>
          <li class="ftmLine"></li>
          <li><a href="${contextPath }/common/terms">이용약관</a></li>
          <li class="ftmLine"></li>
          <!-- <li><a href="./terms2.html">운영정책</a></li>
          <li class="ftmLine"></li> -->
          <li><a href="${contextPath}/introduction/supportCustomerList">고객 지원</a></li>
          <li class="ftmLine"></li>
          <li><a href="${contextPath}/introduction/supportInquire?inquiryCategory=3">상품·제휴 문의</a></li>
        </ul>
      </div>
      <div class="wrapFooterSns">
        <ul>
          <li><a href="https://www.facebook.com/profile.php?id=100009049548425" target="_blank"><img src="${contextPath }/resources/images/footer_facebook.png" onMouseOver="this.src='${contextPath}/resources/images/footer_facebook_r.png';" onMouseOut="this.src='${contextPath}/resources/images/footer_facebook.png';" alt="CLAPP FACEBOOK" /></a></li>
          <%-- <li><a href="https://www.twitter.com/" target="_blank"><img src="${contextPath }/resources/images/footer_tweeter.png" onMouseOver="this.src='${contextPath}/resources/images/footer_tweeter_r.png';" onMouseOut="this.src='${contextPath}/resources/images/footer_tweeter.png';" alt="CLAPP TWITTER" /></a></li> --%>
        </ul>
      </div>
    </div> <!-- .wrapFooterContainer End -->
  </div><!-- #wrapBgBottomNav End -->
 </div> <!-- wrapBgFooter End -->
 <%@ include file="/WEB-INF/pages/views/user/popup/popupCertification.jsp"%>
<script src="https://www.java.com/js/deployJava.js"></script>
<script>
var JnlpUtils = (function() {
	var startTest = function() {
		var userMasterKey = '${userLoginSession.userMasterKey}';
		if(!userMasterKey){
			if(confirm("로그인후 이용 가능합니다.이동하시겠습니까?")){
				location.href = contextPath + "/members/login";
			} else {
				return false;
			}
		} else {
			if(getCookie("certificationId") == "${userLoginSession.userMasterKey}") {
				getUserInfo();
			} else {
				popupUtils.popupOpen("#popCertification");
			}
		}
	};
	var getUserInfo = function() {
		var userMasterKey = '${userLoginSession.userMasterKey}';
		$.ajax({
			url : contextPath + "/api/setUserKey",
			dataType : "json",
			data : {userMasterKey : userMasterKey},
			success : function(data) {
				var userKey = data.resultDATA;
				callJnlp(userMasterKey, userKey);
			},
			error : function() {
				alert("error");
			}
		}); 
	};
	
	var callJnlp = function(userMasterKey , userKey) {
		var agt = navigator.userAgent.toLowerCase();
	    $.getJSON("//system.clapp.co.kr/test_base/jnlpDownload.do?id="+userMasterKey+"&userKey="+userKey,
	    	function(data) {
	            if(data.result) {
                    //사파리 브라우저에서는 파일 다운로드
                    if (agt.indexOf("chrome") == -1 && agt.indexOf("safari") > -1) {
                         window.location.href = data;
	                     //그외의 브라우저에서는 실행
                    } else {
                       //console.log(data.url);
                       deployJava.launchWebStartApplication(data.url);
               		}
	           } else {
                     console.log("error");
	           }
		});
	};
	return {
		startTest : startTest,
		getUserInfo : getUserInfo
	}
})();
//테스팅 시작하기  
</script>

