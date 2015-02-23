<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
</script>
      <div class="subJoinGnbBottomContainer">
        <div class="subJoinGnbBottomBg">
          <div class="subJoinGnbBottomBox">
            <div class="subJoinGnbBottom">
              <span class="subJoinTitle">비밀번호 찾기</span>
            </div>
            <div class="subStartBox">
              <a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()"  onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
            </div>
          </div>
      </div>
    </div> <!-- .subGnbContainer End -->
    
    <div class="loginPFCmpContentTopContainer">
      <div class="loginPfCmpContentTopBox">
        <div class="loginPfCmpContentTopLeft">
          <img src="${contextPath }/resources/images/login_complete.png" alt="비밀번호 찾기 완료" />
        </div>
        <div class="loginPfCmpContentTopRight">
          <p class="pwFindCompleteMsg">
            등록하신 이메일로 임시 비밀번호를 발송하였습니다.<br />
            임시 비밀번호 확인 후 다시 로그인 해주세요.<br />
            감사합니다.
          </p>
        </div>
      </div>
    </div> <!-- .loginContentTopContainer End -->
    <div class="loginPFCmpContentBottomContainer">
      <div class="loginPFCmpContentBottomBox">
        <a href="${contextPath}/">
          <img src="${contextPath }/resources/images/buttons_main.png"  onmouseover="this.src='${contextPath }/resources/images/buttons_main_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_main.png';" alt="메인으로" />
        </a>
      </div>
    </div>