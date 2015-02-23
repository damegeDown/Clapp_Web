<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
      <div class="subJoinGnbBottomContainer">
        <div class="subJoinGnbBottomBg">
          <div class="subJoinGnbBottomBox">
            <div class="subJoinGnbBottom">
              <span class="subJoinTitle">클앱 가입</span>
            </div>
            <div class="subStartBox">
              <a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- .subGnbContainer End -->
    <div class="subJoinFlowContainer">
      <div class="subJoinFlowBox4">
        <div class="subJoinFlowStepBox">
          <span class="subJoinStep1">가입 유형</span>
          <span class="subJoinStep2">약관 동의</span>
          <span class="subJoinStep3">정보 입력</span>
          <span class="subJoinStep4 sjsActive4">가입 완료</span>
        </div>
      </div>
    </div> <!-- .subJoinFlowContainer End -->
    <div class="subJoinMemberCompleteContainer">
      <div class="subJoinMemberCompleteBox">
        <div class="subJoinMemberCompleteLogoBox"></div>
        <div class="subJoinMemberCompleteLine"></div>
        <div class="subJoinMemberCompleteArticleBox">
          <div class="subJoinMemberCompleteArticle">
            <span class="memberName">${userName}</span>
            <p class="memberMessage">
              님의 가입이 완료 되었습니다.
            </p>
            <p class="memberMessage2">
              365일 언제 어디서나 쉽고 빠른 테스팅이 가능한 클앱의 회원이 되신 것을 환영합니다.
            </p>
            <p class="memberMessage3">
              가입기념으로 클앱 테스팅 30분이 가능한 2티켓을 적용해 드렸습니다. 감사합니다!
            </p>
          </div>
        </div>
      </div>
    </div> <!-- .subJoinMemberCompleteContainer End -->
    <div class="subJoinMemberCompleteLoginContainer">
      <div class="subJoinMemberCompleteLoginBox">
        <a class="loginbtnlink" href="./login.html">
          <img src="${contextPath }/resources/images/buttons_login.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_login_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_login.png';" alt="로그인" />
        </a>
      </div>
    </div>