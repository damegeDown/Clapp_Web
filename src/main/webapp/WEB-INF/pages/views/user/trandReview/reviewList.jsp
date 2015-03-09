<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Strings" uri="/WEB-INF/tlds/Strings.tld" %>
<script type="text/javascript" src="${contextPath }/resources/js/board.js"></script>
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
              <li class="smtgbItem2"><a href="${contextPath}/trandReview/reviewList" class="smtGRTr smtGRTrActive">리뷰 · 전망</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/trandReview/caseList" class="smtGRTr">케이스 스터디</a></li>
              <li></li>
              <li class="smtgbItem2"><a href="${contextPath}/trandReview/socialList" class="smtGRTr">소셜 · 블로그</a></li>
            </ul>
          </div>
          <div class="subMTStartBox">
            <a href="#"><img src="${contextPath}/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath}/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath}/resources/images/gnb_start.png';" alt="시작하기" /></a>
          </div>
        </div>
      </div>
    <div class="subTRIndustryGnbBottomContainer">
      <div class="subTRIndustryGnbBottomBg">
        <div class="subTRIndustryGnbBottomBox">
          <div class="subTRIndustryGnbBottom">
            <span class="subTRIndustryTitle">리뷰&nbsp;&middot;&nbsp;전망</span>
          </div><!-- .subTRIndustryGnbBottomBox End -->
        </div><!-- .subTRIndustryGnbBottomBox -->
      </div><!-- .subTRIndustryGnbBottomBg -->
    </div><!-- .subTRIndustryGnbBottomContainer End -->

    <!-- provide device List Start -->
    <div class="subTRIndusrtyListContentOneContainer">
      <div class="subTRIndusrtyListContentBoxBg">
        <div class="subTRIndusrtyContentTopBox"></div><!-- .subTRIndusrtyContentTopBox -->

        <!-- provide device List Start -->
        <div class="subTRIndusrtyContentListBox">
        <c:forEach items="${boardEntity.boardTrandList }" var="boardTrandList" varStatus="i"> 
          <c:set var="isEven" value="${i.index % 2 == 0 ? true : false }"/>
          <c:if test="${isEven}">
          <div class="subTRIndusrtyContentList">
            <div class="subTRIndusrtyContentListCols">
          </c:if>
              <div class="subTRIndusrtyContentListRow direct" id="boardKey${boardTrandList.boardTrandKey}">
                <div class="subTRIndusrtyContentImgBox">
                  <div class="subTRIndusrtyContentImg">
                    <a class="trandReviewDetail" href="javascript:;" data-url="reviewDetail" data-key="${boardTrandList.boardTrandKey}">
                      <img src="${contextPath}/common/imgView?fileType=${boardTrandList.fileTarget}&fileName=${boardTrandList.fileSavedName}" style="max-width:160px;"/>
                    </a>
                  </div>
                </div><!-- subTRIndusrtyContentImgBox End-->
                  <div class="subTRIndusrtyContentTextBox">
                  <span class="subTRIndusrtyContentTit">
                  <a class="trandReviewDetail" href="javascript:;" data-url="reviewDetail" data-key="${boardTrandList.boardTrandKey}">
                  <%-- <a href="${contextPath}/trandReview/reviewDetail?boardTrandKey=${boardTrandList.boardTrandKey }"> --%>
                      ${boardTrandList.trandTitle}
                  </a>
                  </span>
                    <p class="subTRIndusrtyContentCont">
                     <Strings:cutTextTag length="85" text="${boardTrandList.trandContents}" ellipsis="..."/>
                    </p>
                  </div><!-- .subTRIndusrtyContentTextBox End-->
              </div><!-- .subTRIndusrtyContentListRow End -->
            <c:if test="${!isEven or i.last}">
            </div><!-- .subTRIndusrtyContentListCols -->
           </div><!-- .subTRIndusrtyContentList End -->
           </c:if>
           </c:forEach>
        <!-- provide device List End -->
        <div class="subTRIndusrtyContentBottomBox">
          <div class="subTRIndusrtyContentMoreImgBox">
            <div class="subTRIndusrtyContentMoreImg">
            	<c:if test="${boardEntity.dataSize > 12}">
	              <span class="nextPage" data-url="reviewList" alt="">
	               <img class="images" src="${contextPath}/resources/images/contents_btn_submit_board.png"  onmouseover="this.src='${contextPath}/resources/images/contents_btn_submit_board_more.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_submit_board.png';" alt="more" />
	              </span>
             	</c:if>
              <input type="hidden" id="currentPage" value="${boardEntity.currentPage}" name="currentPage"/>
            </div><!-- .subTRIndusrtyContentMoreImg End-->
          </div><!-- .subTRIndusrtyContentMoreImgBox End -->
        </div><!-- .subTRIndusrtyContentBottomBox End -->
      </div>
    </div>
  </body>
<script>
$(function() {
/*     $.fn.trandReviewList.init(); */
	  //scrollPage();
	  selectDetail();
	  $("#currentPage").val();
	  function selectDetail() {
	    $('.trandReviewDetail').on('click', function() {
	      var key = $(this).data('key');
	      var url = $(this).data('url');
	      var nextPage = parseInt($("#currentPage").val());
	      location.href = contextPath + '/trandReview/'+ url +'?currentPage=' + nextPage + '&boardTrandKey=' + key;
	    });
	  }
	  
	  /* $(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      //$(".nextPage").click().unbind("click");
	      
	    }
	  }); */
	  //function scrollPage() {
	    $(".nextPage").on("click", function() {
	      var nextPage = parseInt($("#currentPage").val()) + 1;
	      $.ajax({
	          /* url : 'rest/'+url , */
	          url : contextPath + 'rest/reviewList',
	          dataType : 'json',
	          data : {currentPage : nextPage},
	          success : function(result) {
	            flag = 1;
	            if (result.resultCode == 'success') {
	              var resultList = result.resultDATA.boardTrandList;
	              var pageTotalCount = result.resultDATA.pageTotalCount;
	              var currentPage = result.resultDATA.currentPage;
	              var contents = "";
	              
	            for(var i = 0; i < resultList.length; i++){
	              var isEven = i % 2 == 0 ? true : false;
	              if(isEven) { 
	                contents +=  "<div class='subTRIndusrtyContentList direct " + resultList[i].boardTrandKey +"'>"
	                          "<div class='subTRIndusrtyContentListCols'>";
	              }
	              contents += "<div class='subTRIndusrtyContentListRow'>"+
	                            "<div class='subTRIndusrtyContentImgBox'>"+
	                              "<div class='subTRIndusrtyContentImg'>"+
	                                "<a class='trandReviewDetail' href='javascript:;'data-url='reviewDetail ' data-key='" + resultList[i].boardTrandKey + "'>"+
	                                "<img src=" + contextPath +"'/common/imgView?fileType="+resultList[i].fileTarget+"&fileName="+resultList[i].fileSavedName+"' style='max-width:160px;'/>"+
	                                "</a>"+
	                                "</div>"+
	                             "</div>"+
	                             "<div class='subTRIndusrtyContentTextBox'>"+
	                              "<span class='subTRIndusrtyContentTit'>"+
	                              "<a class='trandReviewDetail' href='javascript:;'data-url='reviewDetail ' data-key='" + resultList[i].boardTrandKey + "'>"+
	                                resultList[i].trandTitle+ 
	                               "</a>"+
	                              "</span>"+
	                             "<p class='subTRIndusrtyContentCont'>"+
	                               resultList[i].trandContents.cut(85)+ 
	                             "</p>"+
	                              "</div>"+
	                          "</div>";
	              if(!isEven || i == resultList.length - 1)  {
	              contents += "</div>"+
	                     "</div>";
	                  }
	            }
	            var addHeight = $(".subTRIndusrtyContentList").height() * (i/2);
	            var baseHeight = $(".subTRIndusrtyListContentBoxBg").height();
	            /* $(".subTRIndusrtyListContentBoxBg").height(addHeight + baseHeight); */
	            $(".subTRIndusrtyContentList:last").after(contents); 
	            $("#currentPage").val(nextPage);
	            selectDetail();
	            //scrollPage();
	            if(pageTotalCount <= currentPage) {
	            	  $(".images").hide();
	                return false;
	              }
	        }
	      },
	      fail: function(){
	        alert('error');
	      }
	    });
	  });
	 //}
	  function directList() {
	    var directBoardKey = $('#directBoardKey').val();
	    if (directBoardKey > 0) {
	      $('.' + directBoardKey)[0].scrollElement.scrollIntoView(true);
	      $('.' + directBoardKey)[1].scrollElement.scrollIntoView(true);
	    }
	  }
	});
</script>