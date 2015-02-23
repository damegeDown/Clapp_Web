<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/pages/views/user/introduction/inc/incSupportMenu.jsp"%>
    <div class="subCISupportContentThreeContainer">
      <div class="subCISupportContentTitlebox">
        <div class="subCISupportContentTitle">
          <span>서비스별 문의</span>
        </div>
        <div class="subCISupportContentDesc">
          <div class="subCISupportContentDescTitle">
            <span>클앱 서비스 이용 중, 궁금하신 사항에 대해 문의하실 수 있습니다.</span>
          </div>
          <div class="subCISupportContentDescSubTitle">
            <span>* 계산서 발행은 가상계좌로 입금처리 된 부분에 한해 가능합니다. (아래 내용란에 입금일, 입금자명, 금액을 반드시 적어주시기 바랍니다.)</span>
          </div>
        </div>
      </div>
    </div>

    <!-- provide device List Start -->
  <%@include file="insertSupportInquire.jsp"%>
</body>