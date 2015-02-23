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

    <div class="subCISupportListOneContainer">

        <div class="subCISupportLOCListArea">
          <c:forEach items="${boardNoticeEntity.boardNoticeList }" var="boardNoticeList" varStatus="i">
          <div class="subCISupportLOCList">
            <div class="subCISupportLOCListCont">
              <div class="subCISupportLOCDate">
                <span><fmt:formatDate pattern="yyyy. MM. dd" value="${boardNoticeList.noticeInsertDate }" /></span>
              </div><!-- .subCISupportLOCDate End-->
              <div class="ubCISupportLOCLinkBox">
                <a href="${contextPath}/introduction/supportCustomerDetail?currentPage=${boardNoticeEntity.currentPage}&boardNoticeKey=${boardNoticeList.boardNoticeKey}">
                  <div class="subCISupportLOCText">
                    <span>
                        ${boardNoticeList.noticeTitle}
                    </span>
                  </div><!-- .subCISupportLOCText End-->
                </a>
              </div>
            </div><!-- .subCISupportLOCListCont End -->
          </div><!-- .subCISupportLOCList End -->
          </c:forEach>
        </div><!-- .subCISupportLOCListArea End -->

        <div class="subCISupportLOCPagingWrap">
          <div class="subCISupportLOCPagingBox">
	            <div class="paging-area" style="padding-top:20px;">
	                 <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/introduction/supportCustomerList" pageNavigationEntity="${boardNoticeEntity}" />
	            </div>
          </div><!-- .subTRIndusrtyContentMoreImgBox End -->
        </div><!-- .subTRIndusrtyContentBottomBox End -->
    </div><!-- .subCIArticleListContentThreeContainer End -->
</body>