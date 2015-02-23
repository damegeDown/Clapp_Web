<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/pages/views/user/introduction/inc/incSupportMenu.jsp"%>
    <div class="subCISupportCompleteTwoContainer">
      <div class="subCISupportCTXCOneBox">
        <div class="subCISupportCTCOneImgBox">
          <div class="subCISupportCTCOneImg">
            <img src="${contextPath }/resources/images/itr_popup_complete.png" alt="complete" />
          </div>
        </div><!-- .subCISupportITCOneContBox End-->
        <div class="subCISupportCTCOneContBox">
          <div class="subCISupportITCOneCont">
            <p>
              서비스 문의가 정상적으로 접수되었으며, <br />
              담당자가 확인 후 회신 드리겠습니다.<br />
              감사합니다.<br />
            </p>
          </div>
        </div><!-- .subCISupportITCOneContBox End-->
      </div><!-- .subCISupportITCOneBox End-->
    </div><!-- .subCISupportInquireTwoContainer End -->

    <div class="subCISupportInquireCompleteThreeContainer">
      <div class="subCISupportICHCOneBox">
        <div class="subCISupportICHCOneContBox">
          <a href="/user">
            <div class="subCISupportICHCOneContBtn">
              <img src="${contextPath }/resources/images/itr_support_main.png" />
              <span>메인으로</span>
            </div>
          </a>
        </div><!-- .subCISupportITCOneContBox End-->
      </div><!-- .subCISupportITCOneBox End-->
    </div>
</body>