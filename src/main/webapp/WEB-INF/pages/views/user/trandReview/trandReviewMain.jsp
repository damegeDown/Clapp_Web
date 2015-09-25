<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Strings" uri="/WEB-INF/tlds/Strings.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
        <div class="subMTGnbBottomContainer">
          <div class="subMTGnbBottomBox">
            <div class="subMTGnbBottom">
              <ul>
                <li class="smtgbItem2 "><a href="${contextPath}/trandReview/trandReviewMain" class="smtGRTr smtGRTrActive">트렌드 리뷰</a></li>
                <li></li>
                <li class="smtgbItem2"><a href="${contextPath}/trandReview/trandList" class="smtGRTr">업계 동향</a></li>
                <li></li>
                <li class="smtgbItem2"><a href="${contextPath}/trandReview/reviewList" class="smtGRTr">리뷰 · 전망</a></li>
                <li></li>
                <li class="smtgbItem2"><a href="${contextPath}/trandReview/caseList" class="smtGRTr">케이스 스터디</a></li>
                <li></li>
                <%--<li class="smtgbItem2"><a href="${contextPath}/trandReview/socialList" class="smtGRTr">소셜 · 블로그</a></li>--%>
              </ul>
            </div>
              <div class="subMTStartBox">
              <a href="#"><img src="${contextPath}/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()"  onmouseover="this.src='${contextPath}/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath}/resources/images/gnb_start.png';" alt="시작하기" /></a>
            </div>
          </div>
        </div>

      <div class="subTRIndustryGnbBottomContainer">
        <div class="subTRIndustryGnbBottomBg">
          <div class="subTRIndustryGnbBottomBox">
            <div class="subTRIndustryGnbBottom">
              <span class="subTRIndustryTitle">트렌드 리뷰</span>
            </div><!-- .subTRIndustryGnbBottomBox End -->
          </div><!-- .subTRIndustryGnbBottomBox -->
        </div><!-- .subTRIndustryGnbBottomBg -->
      </div><!-- .subTRIndustryGnbBottomContainer End -->
    <!-- provide device List Start -->
     <div class="subTRReviewListContentOneContainer">
      <div class="subTRReviewListCOCBoxBg">

        <div class="subTRReviewCOCTitleBox">
          <div class="subTRReviewCOCTitle">
            <span class="subTRReviewCOCTitleLine"></span>

            <div class="subTRReviewCOCTitleTxt">
              <span>업계 동향</span>
            </div><!-- subTRReviewCOCTitleTxt End-->
            <div class="subTRReviewCOCTitleMore">
              <a href="${contextPath}/trandReview/trandList"><img src="${contextPath}/resources/images/contents_btn_more_board.png" alt="more" onMouseOver="this.src='${contextPath}/resources/images/contents_btn_more_board_r.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_more_board.png';" /></a>
            </div><!-- subTRReviewCOCTitleMore End-->
              
          </div><!-- .subTRReviewCOCTitle -->
        </div><!-- .subTRReviewCOCTitleBox End -->
        
        <!-- provide device List Start -->
        <div class="subTRReviewCOCListBox">
         <c:forEach items="${boardEntity.trandList }" var="trandList" varStatus="i">
          <c:set var="isEven" value="${i.index % 2 == 0 ? true : false }"/>
          <c:if test="${isEven}">
          <div class="subTRReviewCOCList subTRReviewCOCListLine">
            <div class="subTRReviewCOCListCols">
           </c:if> 
              <div class="subTRReviewCOCListRow">
                <div class="subTRReviewCOCImgBox">
                  <div class="subTRReviewCOCImg">
                    <a href="${contextPath}/trandReview/trandDetail?boardTrandKey=${trandList.boardTrandKey}">
                      <img src="${contextPath}/common/imgView?fileType=${trandList.fileTarget}&fileName=${trandList.fileSavedName}" style="max-width:160px;"/>
                    </a>
                  </div>
                </div><!-- subTRReviewContentImgBox End-->
                
                <div class="subTRReviewCOCTextBox">
                  <span class="subTRReviewCOCTit">
                    <a href="${contextPath}/trandReview/trandDetail?boardTrandKey=${trandList.boardTrandKey}">
                      ${trandList.trandTitle}
                    </a>
                  </span>
                  <p class="subTRReviewCOCCont">
                    <Strings:cutTextTag length="85" text="${trandList.trandContents}" ellipsis="..."/>
                  </p>
                </div><!-- .subTRReviewContentTextBox End -->
              </div><!-- .subTRReviewContentListRow End -->
              <c:if test="${!isEven or i.last}">
            </div><!-- .subTRReviewContentListCols -->
          </div><!-- .subTRReviewContentList End -->
          </c:if>
          </c:forEach>
        </div><!-- .subTRIndusrtyContentListBox End --> 
                  
      </div><!-- .subTRReviewListContentBoxBg End -->
    </div><!-- .subTRReviewListContentOneContainer End -->


     <div class="subTRReviewListContentTwoContainer">
      <div class="subTRReviewListCTCBoxBg">

        <div class="subTRReviewCTCTitleBox">
          <div class="subTRReviewCTCTitle">
            <span class="subTRReviewCTCTitleLine"></span>

            <div class="subTRReviewCTCTitleTxt">
              <span>리뷰 · 전망</span>
            </div><!-- subTRReviewContentImgBox End-->
            <div class="subTRReviewCTCTitleMore">
              <a href="${contextPath}/trandReview/reviewList"><img src="${contextPath}/resources/images/contents_btn_more_board.png" alt="more" onMouseOver="this.src='${contextPath}/resources/images/contents_btn_more_board_r.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_more_board.png';" /></a>
            </div><!-- subTRReviewContentImgBox End-->
              
          </div><!-- .subTRReviewTitle -->
        </div><!-- .subTRReviewTitleBox End -->
        
        <!-- provide device List Start -->
        <div class="subTRReviewCTCListBox">
          <c:forEach items="${boardEntity.reviewList }" var="reviewList" varStatus="j">
          <c:set var="isEven" value="${j.index % 2 == 0 ? true : false }"/>
          <c:if test="${isEven}">
          <div class="subTRReviewCTCList subTRReviewCTCListLine">
            <div class="subTRReviewCTCListCols">
          </c:if>
              <div class="subTRReviewCTCListRow">
                <div class="subTRReviewCTCImgBox">
                  <div class="subTRReviewCTCImg">
                    <a href="${contextPath}/trandReview/reviewDetail?boardTrandKey=${reviewList.boardTrandKey}">
                      <img src="${contextPath}/common/imgView?fileType=${reviewList.fileTarget}&fileName=${reviewList.fileSavedName}" style="max-width:160px;"/>
                    </a>
                  </div>
                </div><!-- subTRReviewContentImgBox End-->
                
                <div class="subTRReviewCTCTextBox">
                  <span class="subTRReviewCTCTit">
                    <a href="${contextPath}/trandReview/reviewDetail?boardTrandKey=${reviewList.boardTrandKey}">
                      ${reviewList.trandTitle}
                    </a>
                  </span>
                  <p class="subTRReviewCTCCont">
                    <Strings:cutTextTag length="85" text="${reviewList.trandContents}" ellipsis="..."/>
                  </p>
                </div><!-- .subTRReviewContentTextBox End-->
              </div><!-- .subTRReviewContentListRow End -->
              <c:if test="${!isEven or j.last}">
            </div><!-- .subTRReviewContentListCols -->
          </div><!-- .subTRReviewContentList End -->
          </c:if>
         </c:forEach>
        </div><!-- .subTRIndusrtyContentListBox End -->

      </div><!-- .subTRReviewListContentBoxBg End -->
    </div><!-- .subTRReviewListContentOneContainer End -->

     <div class="subTRReviewListContentOneContainer">
      <div class="subTRReviewListCOCBoxBg">

        <div class="subTRReviewCOCTitleBox">
          <div class="subTRReviewCOCTitle">
            <span class="subTRReviewCOCTitleLine"></span>

            <div class="subTRReviewCOCTitleTxt">
              <span>케이스 스터디</span>
            </div><!-- subTRReviewCOCTitleTxt End-->
            <div class="subTRReviewCOCTitleMore">
              <a href="${contextPath}/trandReview/caseList"><img src="${contextPath}/resources/images/contents_btn_more_board.png" alt="more" onMouseOver="this.src='${contextPath}/resources/images/contents_btn_more_board_r.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_more_board.png';" /></a>
            </div><!-- subTRReviewCOCTitleMore End-->
              
          </div><!-- .subTRReviewCOCTitle -->
        </div><!-- .subTRReviewCOCTitleBox End -->
        
        <!-- provide device List Start -->
        <div class="subTRReviewCOCListBox">
          <c:forEach items="${boardEntity.caseList }" var="caseList" varStatus="k">
           <c:set var="isEven" value="${k.index % 2 == 0 ? true : false }"/>
           <c:if test="${isEven}">
          <div class="subTRReviewCOCList subTRReviewCOCListLine">
            <div class="subTRReviewCOCListCols">
           </c:if>
              <div class="subTRReviewCOCListRow">
                <div class="subTRReviewCOCImgBox">
                  <div class="subTRReviewCOCImg">
                    <a href="${contextPath}/trandReview/caseDetail?boardTrandKey=${caseList.boardTrandKey}">
                      <img src="${contextPath}/common/imgView?fileType=${caseList.fileTarget}&fileName=${caseList.fileSavedName}" style="max-width:160px;"/>
                    </a>
                  </div>
                </div><!-- subTRReviewContentImgBox End-->
                
                <div class="subTRReviewCOCTextBox">
                  <span class="subTRReviewCOCTit">
                    <a href="${contextPath}/trandReview/caseDetail?boardTrandKey=${caseList.boardTrandKey}">
                      ${caseList.trandTitle}
                    </a>
                  </span>
                  <p class="subTRReviewCOCCont">
                    <Strings:cutTextTag length="85" text="${caseList.trandContents}" ellipsis="..."/>
                  </p>
                </div><!-- .subTRReviewContentTextBox End -->
              </div><!-- .subTRReviewContentListRow End -->
              <c:if test="${!isEven or k.last}">
            </div><!-- .subTRReviewContentListCols -->
          </div><!-- .subTRReviewContentList End -->
          </c:if>
          </c:forEach>
        </div><!-- .subTRIndusrtyContentListBox End -->

      </div><!-- .subTRReviewListContentBoxBg End -->
    </div><!-- .subTRReviewListContentOneContainer End -->

    <%--<div class="subTRReviewListContentThreeContainer">--%>
      <%--<div class="subTRReviewListCHCBoxBg">--%>

        <%--<div class="subTRReviewCHCTitleBox">--%>
          <%--<div class="subTRReviewCHCTitle">--%>
            <%--<span class="subTRReviewCHCTitleLine"></span>--%>

            <%--<div class="subTRReviewCHCTitleTxt">--%>
              <%--<span>소셜 · 블로그</span>--%>
            <%--</div><!-- subTRReviewContentImgBox End-->--%>
            <%--<div class="subTRReviewCHCTitleMore">--%>
              <%--<a href="${contextPath}/trandReview/socialList"><img src="${contextPath}/resources/images/contents_btn_more_board.png" alt="more" onMouseOver="this.src='${contextPath}/resources/images/contents_btn_more_board_r.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_more_board.png';" /></a>--%>
            <%--</div><!-- subTRReviewContentImgBox End-->--%>
              <%----%>
          <%--</div><!-- .subTRReviewTitle -->--%>
        <%--</div><!-- .subTRReviewTitleBox End -->--%>
        <%----%>
        <%--<!-- provide device List Start -->--%>
        <%--<div class="subTRReviewCHCListBox">--%>
          <%--<c:forEach items="${boardEntity.socialBlogList }" var="socialBlogList">--%>
          <%--<div class="subTRReviewCHCList subTRReviewCHCListLine">--%>
            <%--<div class="subTRReviewCHCListCols">--%>
              <%--<div class="subTRReviewCHCImgBox">--%>
                <%--<div class="subTRReviewCHCImg">--%>
                  <%--<a href="#">--%>
                    <%--<img src="${contextPath}/common/imgView?fileType=${socialBlogList.fileTarget}&fileName=${socialBlogList.fileSavedName}" style="max-width:80px;"/>--%>
                  <%--</a>--%>
                <%--</div>--%>
              <%--</div><!-- .subTRReviewContentListRow End -->--%>
              <%--<div class="subTRReviewCHCTextBox">--%>
                <%--<div class="subTRReviewCHCText">--%>
                  <%--<p>--%>
                    <%--<a href="${socialBlogList.facebookLink }" target="_blank">--%>
                    <%--${socialBlogList.socialBlogTitle}</a>--%>
                  <%--</p>--%>
                  <%--<span>--%>
                    <%--<fmt:formatDate value="${socialBlogList.socialBlogInsertDate}" pattern="yyyy년 MM월 dd일"/>--%>
                  <%--</span>--%>
                <%--</div>--%>
              <%--</div><!-- .subTRReviewContentListRow End -->--%>
            <%--</div><!-- .subTRReviewContentListCols -->--%>
          <%--</div><!-- .subTRReviewContentList End -->--%>
        <%--</c:forEach>--%>
        <%--</div><!-- .subTRIndusrtyContentListBox End -->--%>

      <%--</div><!-- .subTRReviewListContentBoxBg End -->--%>
    <%--</div><!-- .subTRReviewListContentOneContainer End -->--%>
    
  </body>