<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body>
      <div class="subMTGnbBottomContainer">
        <div class="subMTGnbBottomBox">
          <div class="subMTGnbBottom">
            <ul>
              <li class="smtgbItem2"><a href="${contextPath}/trandReview/trandReviewMain" class="smtGRTr">트렌드 리뷰</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/trandReview/trandList" class="smtGRTr">업계 동향</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/trandReview/reviewList" class="smtGRTr">리뷰 · 전망</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/trandReview/caseList" class="smtGRTr  smtGRTrActive">케이스 스터디</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/trandReview/socialList" class="smtGRTr">소셜 · 블로그</a></li>
            </ul>
          </div>
          <div class="subMTStartBox">
            <a href="#"><img src="${contextPath}/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath}/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath}/resources/images/gnb_start.png';" alt="시작하기" /></a>
          </div>
        </div>
      </div>

    <div class="subTRIndustryGnbBottomContainer">
      <div class="subTRIndustryGnbBottomBg">
        <div class="subTRIndustryGnbBottomBox">
          <div class="subTRIndustryGnbBottom">
            <span class="subTRIndustryTitle">케이스 스터디</span>
          </div><!-- .subTRIndustryGnbBottomBox End -->
        </div><!-- .subTRIndustryGnbBottomBox -->
      </div><!-- .subTRIndustryGnbBottomBg -->
    </div><!-- .subTRIndustryGnbBottomContainer End -->

    <div class="subTRIndustryViewContentOneContainer">
      <div class="subTRIndustryContentOnebox">
        <div class="subTRIndustryCOBLine"></div>
        <span class="subTRIndustryCOBTitle">
          ${trandReviewDetail.trandTitle }
        </span>
        <div class="subTRIndustryCOBDOBox">
          <span class="subTRIndustryCOBDate">
           <fmt:formatDate value="${trandReviewDetail.trandInsertDate}" pattern="yyyy. MM. dd"/>
          </span>
          <span class="subTRIndustryCOBOrigin ">
            출처 : <a href="http://${trandReviewDetail.trandOriginLink }" target="new">${trandReviewDetail.trandOrigin }</a>
          </span>
        </div>
        <div class="subTRIndustryCTBImg" style="display:table">
          	<div style="display:table-cell;vertical-align:middle;width:428px; height:270px">
          		<img src="${contextPath}/common/imgView?fileType=${trandReviewDetail.fileTarget}&fileName=${trandReviewDetail.fileSavedName}" />
          	</div>
        </div>
      </div><!-- .subTRIndustryContentOnebox End -->
    </div> <!-- .subContentOneContainer End -->

    <div class="subTRIndustryViewContentTwoContainer">
      <div class="subTRIndustryContentContBox">
        <div class="subTRIndustryContentCont">
          <p class="subTRIndustryContentContTit">
            ${fn:replace(trandReviewDetail.trandContents, newLineChar, '<br/>')}
          <p>
        </div><!-- subTRIndustryContentCont End -->
      </div><!-- .subTRIndustryContentContBox End -->
    </div> <!-- .subTRIndustryViewContentTwoContainer End -->

    <div class="subTRIndustryViewContentThreeContainer">
      <div class="subTRIndustryContentBtnBox">
        <div class="subTRIndustryContentBtn">
          <div class="subTRIndustryContentBtnList">
           <%--  <a href="${contextPath}/trandReview/caseList"> --%>
          <a href="${contextPath}/trandReview/caseList?currentPage=${boardEntity.currentPage}&mvType=detail#boardKey${trandReviewDetail.boardTrandKey}">
            <img src="${contextPath}/resources/images/contents_btn_list_board.png" onMouseOver="this.src='${contextPath}/resources/images/contents_btn_list_board_r.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_list_board.png';" alt="list" /></a>
          </div>
          <div class="subTRIndustryContentBtnBack">
           <c:if test="${trandReviewDetail.trandPrevPage > 0}">
            <a href="${contextPath}/trandReview/caseDetail?currentPage=${boardEntity.currentPage}&boardTrandKey=${trandReviewDetail.trandPrevPage}">
            <img src="${contextPath}/resources/images/contents_btn_prev_board.png" onmouseover="this.src='${contextPath}/resources/images/contents_btn_prev_board_r.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_prev_board.png';" alt="prev" /></a>
           </c:if>
           <c:if test="${trandReviewDetail.trandPrevPage eq 0}">
           <a href="javascript:alert('첫번째 글입니다')">
             <img src="${contextPath}/resources/images/contents_btn_prev_board.png" />
           </a>
           </c:if>
          </div>
          <div class="subTRIndustryContentBtnNext">
          <c:if test="${trandReviewDetail.trandNextPage > 0}">
            <a href="${contextPath}/trandReview/caseDetail?currentPage=${boardEntity.currentPage}&boardTrandKey=${trandReviewDetail.trandNextPage} "><img src="${contextPath}/resources/images/contents_btn_next_board.png"  onmouseover="this.src='${contextPath}/resources/images/contents_btn_next_board_r.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_next_board.png';" alt="next" /></a>
          </c:if>
          <c:if test="${trandReviewDetail.trandNextPage eq 0}">
	          <a href="javascript:alert('마지막 글입니다')">
	            <img src="${contextPath}/resources/images/contents_btn_next_board.png" />
	          </a>
          </c:if>
          </div>
        </div><!-- subTRIndustryContentBtn End -->
      </div><!-- subTRIndustryContentBtnBox End -->
    </div> <!-- .subTRIndustryViewContentThreeContainer End -->
  </body>