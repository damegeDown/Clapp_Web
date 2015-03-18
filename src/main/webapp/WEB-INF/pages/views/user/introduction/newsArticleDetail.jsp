<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body>
      <div class="subMTGnbBottomContainer">
        <div class="subMTGnbBottomBox">
          <div class="subMTGnbBottom">
            <ul>
              <li class="smtgbItem2"><a href="${contextPath}/introduction/introductionMain" class="ctci">클앱 소개</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/introduction/newsArticleList" class="ctci cactive">언론 기사</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/introduction/personRecruit" class="ctci">인재 채용</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/introduction/cooperation" class="ctci">고객 · 협력사</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/introduction/supportCustomerList" class="ctci">고객 지원</a></li>
            </ul>
          </div>
          <div class="subMTStartBox">
            <a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
          </div>
        </div>
      </div>

    <div class="subCIGnbBottomContainer">
      <div class="subCIGnbBottomBg">
        <div class="subCIGnbBottomBox">
          <div class="subCIGnbBottom">
            <span class="subCITitle">언론 기사</span>
          </div><!-- .subCIArticleGnbBottomBox End -->
        </div><!-- .subCIArticleGnbBottomBox -->
      </div><!-- .subCIArticleGnbBottomBg -->
    </div><!-- .subTCIArticleGnbBottomContainer End -->

    <div class="subCIArticleViewContentOneContainer">
      <div class="subCIArticleContentOnebox">
        <div class="subCIArticleCOBLine"></div>
        <span class="subCIArticleCOBTitle">
          ${newsArticleDetail.socialBlogTitle }
        </span>
        <div class="subCIArticleCOBDOBox">
          <span class="subCIArticleCOBDate">
            <fmt:formatDate value="${newsArticleDetail.socialBlogInsertDate}" pattern="yyyy.MM.dd"/>
          </span>
          <span class="subCIArticleCOBOrigin ">
            출처 : <a href="http://${newsArticleDetail.socialLink }" target="new">${newsArticleDetail.socialOrigin }</a>
          </span>
        </div>
        <div class="subCIArticleCTBImg alignCenter" style="display:table">
            <div style="display:table-cell;vertical-align:middle;width:428px; height:270px">
                <img src="${contextPath}/common/imgView?fileType=${newsArticleDetail.fileTarget}&fileName=${newsArticleDetail.fileSavedName}" />
            </div>
        </div>

      </div><!-- .subTRIndustryContentOnebox End -->
    </div> <!-- .subContentOneContainer End -->

    <div class="subCIArticleViewContentTwoContainer">
      <div class="subCIArticleContentContBox">
        <div class="subCIArticleContentCont">
          <p class="subCIArticleContentContTit"></p>

          <p class="subCIArticleContentContTxt">
          ${newsArticleDetail.socialBlogContent}
          </p>


        </div><!-- subTRIndustryContentCont End -->
      </div><!-- .subTRIndustryContentContBox End -->
    </div> <!-- .subTRIndustryViewContentTwoContainer End -->
    <div class="subCIArticleViewContentThreeContainer">
      <div class="subCIArticleContentBtnBox">
        <div class="subCIArticleContentBtn">
          <div class="subTRIndustryContentBtnList">
            <%-- <a href="${contextPath}/introduction/newsArticleList?currentPage=${boardEntity.currentPage}&directBoardKey=${newsArticleDetail.boardSocialBlogKey}"> --%>
            <a href="${contextPath}/introduction/newsArticleList?currentPage=${boardEntity.currentPage}&mvType=detail#boardKey${newsArticleDetail.boardSocialBlogKey}">
             <img src="${contextPath}/resources/images/contents_btn_list_board.png" onMouseOver="this.src='${contextPath}/resources/images/contents_btn_list_board_r.png';" onMouseOut="this.src='${contextPath }/resources/images/contents_btn_list_board.png';" alt="list" />
            </a>
          </div>
          <div class="subTRIndustryContentBtnBack">
          <c:if test="${newsArticleDetail.trandPrevPage > 0}">
            <a href="${contextPath}/introduction/newsArticleDetail?currentPage=${boardEntity.currentPage}&boardSocialBlogKey=${newsArticleDetail.trandPrevPage}">
            <img src="${contextPath}/resources/images/contents_btn_prev_board.png"  onmouseover="this.src='${contextPath}/resources/images/contents_btn_prev_board_r.png';" onMouseOut="this.src='${contextPath }/resources/images/contents_btn_prev_board.png';" alt="prev" /></a>
          </c:if>
          <c:if test="${newsArticleDetail.trandPrevPage eq 0}">
          <a href="javascript:alert('첫번째 글입니다')">
            <img src="${contextPath}/resources/images/contents_btn_prev_board.png" />
          </a>
          </c:if>
          </div>
          <div class="subTRIndustryContentBtnNext">
          <c:if test="${newsArticleDetail.trandNextPage > 0}">
            <a href="${contextPath}/introduction/newsArticleDetail?currentPage=${boardEntity.currentPage}&boardSocialBlogKey=${newsArticleDetail.trandNextPage} "><img src="${contextPath}/resources/images/contents_btn_next_board.png"  onmouseover="this.src='${contextPath}/resources/images/contents_btn_next_board_r.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_next_board.png';" alt="next" /></a>
          </c:if>
          <c:if test="${newsArticleDetail.trandNextPage eq 0}">
            <a href="javascript:alert('마지막 글입니다')">
              <img src="${contextPath}/resources/images/contents_btn_next_board.png" />
            </a>
          </c:if>
          </div>
        </div><!-- subTRIndustryContentBtn End -->
      </div><!-- subTRIndustryContentBtnBox End -->
    </div> <!-- .subTRIndustryViewContentThreeContainer End -->
</body>''