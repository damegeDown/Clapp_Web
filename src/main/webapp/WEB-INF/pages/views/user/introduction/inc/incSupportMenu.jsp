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
            <span class="subCITitle">고객 지원</span>
          </div><!-- .subCIArticleGnbBottomBox End -->
        </div><!-- .subCIArticleGnbBottomBox -->
      </div><!-- .subCIArticleGnbBottomBg -->
    </div><!-- .subTCIArticleGnbBottomContainer End -->

    <div class="subCISupportContentOneContainer">
      <div class="subCISupportContentOnebox">
        <div class="subCISupportCOBTelBox">
          <div class="subCISupportCOBTelSubBox">
            <div class="subCISupportCOBTelIconBox">
              <div class="subCISupportCOBTelIcon">
                <img src="${contextPath }/resources/images/itr_support_call.png" alt="call" />
              </div>
            </div>
            <div class="subCISupportCOBTelTxtBox">
              <div class="subCISupportCOBTelTxt">
                <span>1661-7083</span>
              </div>
              <div class="subCISupportCOBTelDesc">
                <p>
                  평일 오전 10시 ~ 오후 6시  (점심시간 : 정오 ~ 오후 1시)<br />
                  토,일,공휴일 휴무
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="subCISupportCOBMailAddrBox">
          <div class="subCISupportCOBMailAddrSubBox">
            <div class="subCISupportCOBMailBox">
              <div class="subCISupportCOBMailICon">
                <img src="${contextPath }/resources/images/itr_support_mail.png" alt="mail" />
              </div>
              <div class="subCISupportCOBMailTxt">
                <span>support@clapp.co.kr</span>
              </div>
            </div>
            <div class="subCISupportCOBAddrBox">
              <div class="subCISupportCOBAddrICon">
                <img src="${contextPath }/resources/images/itr_support_pick.png" alt="pick" />
              </div>
              <div class="subCISupportCOBAddrTxt">
                <span>서울시 강남구 도곡로 182, 4층 (도곡동, 양제벤쳐타워)</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- .subCISupportContentOneContainer End -->
    <div class="subCISupportContentTwoContainer">
      <div class="subCISupportContentTwobox">
        <div class="subCISupportContentTabBox customer">
          <div class="subCISupportContentTab01">
            <a href="${contextPath}/introduction/supportCustomerList">
              <span class="subCISupportContentTab01Txt CustomerList">
                공지사항
              </span>
            </a>
          </div>
          <div class="subCISupportContentTab02">
            <a href="${contextPath}/introduction/supportQnaList">
              <span class="subCISupportContentTab02Txt QnaList">
                도움말
              </span>
            </a>
          </div>
          <div class="subCISupportContentTab03">
            <a href="${contextPath}/introduction/supportInquire">
              <span class="subCISupportContentTab03Txt Inquire">
                서비스별 문의
              </span>
            </a>
          </div>
        </div>
      </div>
    </div> <!-- .subCISupportContentOneContainer End -->