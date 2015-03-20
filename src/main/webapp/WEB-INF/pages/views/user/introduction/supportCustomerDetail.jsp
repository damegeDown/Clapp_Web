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
          <span>공지사항</span>
        </div>
      </div>
    </div>

    <!-- provide device List Start -->
    <div class="subCISupportViewOncContainer">

      <div class="subCISupportVOCViewTitleWrap">
        <div class="subCISupportVOCViewTitleBox">
          <div class="subCISupportVOCViewTitle">
            <span>
              ${supportCustomerDetail.noticeTitle}
            </span>
          </div><!-- .subCISupportVOCViewTitle End-->
          <div class="subCISupportVOCViewDate">
            <span><fmt:formatDate pattern="yyyy. MM. dd" value="${supportCustomerDetail.noticeInsertDate }" /></span>
          </div><!-- .subCISupportVOCViewDate End-->
        </div><!-- .subCISupportVOCViewTitleBox End -->
      </div><!-- .subCISupportVOCViewTitleWrap End -->

      <div class="subCISupportVOCViewContWrap">
        <div class="subCISupportVOCViewContBox">
          <p>
            ${supportCustomerDetail.noticeContents}
            <c:if test="${supportCustomerDetail.fileName ne null}">
		        <center><img src="${contextPath}/common/imgView?fileType=${supportCustomerDetail.fileTarget}&fileName=${supportCustomerDetail.fileSavedName}" style="max-width:800px"/></center>
		         <input type="hidden" name="fileName" value="${supportCustomerDetail.fileName }" data-flag="off"/>
		         <input type="hidden" name="fileSavedName" value="${supportCustomerDetail.fileSavedName }" data-flag="off"/>
            </c:if>
          </p>
        </div><!-- .subCISupportVOCViewContBox End-->
      </div><!-- .subCISupportVOCViewContWrap -->

    </div><!-- .subCISupportViewOncContainer End -->

    <div class="subCISupportVOCViewLinkWrap">
      <div class="subCISupportVOCViewLinkBox">
        <div class="subCISupportVOCLink">
          <div class="subTRIndustryContentBtnList">
            <a href="${contextPath}/introduction/supportCustomerList?currentPage=${boardNoticeEntity.currentPage}"><img src="${contextPath }/resources/images/contents_btn_list_board.png" onMouseOver="this.src='${contextPath }/resources/images/contents_btn_list_board_r.png';" onMouseOut="this.src='${contextPath }/resources/images/contents_btn_list_board.png';" alt="list" /></a>
          </div>
          <div class="subTRIndustryContentBtnBack">
          <c:if test="${supportCustomerDetail.noticePrevPage > 0}">
            <a href="${contextPath}/introduction/supportCustomerDetail?currentPage=${boardNoticeEntity.currentPage}&boardNoticeKey=${supportCustomerDetail.noticePrevPage}">
            <img src="${contextPath }/resources/images/contents_btn_prev_board.png"  onmouseover="this.src='${contextPath }/resources/images/contents_btn_prev_board_r.png';" onMouseOut="this.src='${contextPath }/resources/images/contents_btn_prev_board.png';" alt="prev" /></a>
          </c:if>
          <c:if test="${supportCustomerDetail.noticePrevPage eq 0}">
           <a href="javascript:alert('첫번째 글입니다')">
             <img src="${contextPath}/resources/images/contents_btn_prev_board.png" />
           </a>
          </c:if>
          </div>
          <div class="subTRIndustryContentBtnNext">
          <c:if test="${supportCustomerDetail.noticeNextPage > 0}">
            <a href="${contextPath}/introduction/supportCustomerDetail?currentPage=${boardNoticeEntity.currentPage}&boardNoticeKey=${supportCustomerDetail.noticeNextPage}">
            <img src="${contextPath}/resources/images/contents_btn_next_board.png"  onmouseover="this.src='${contextPath }/resources/images/contents_btn_next_board_r.png';" onMouseOut="this.src='${contextPath }/resources/images/contents_btn_next_board.png';" alt="next" /></a>
          </c:if>
          <c:if test="${supportCustomerDetail.noticeNextPage eq 0}">
            <a href="javascript:alert('마지막 글입니다')">
              <img src="${contextPath}/resources/images/contents_btn_next_board.png" />
            </a>
          </c:if>
          </div>
        </div><!-- .subCISupportVOCLink End -->
      </div><!-- .subCISupportVOCViewLinkBox End-->
    </div><!-- .subCISupportVOCViewLinkWrap End -->
</body>