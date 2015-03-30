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
            <span class="subCITitle">언론 기사</span>
          </div><!-- .subCIArticleGnbBottomBox End -->
        </div><!-- .subCIArticleGnbBottomBox -->
      </div><!-- .subCIArticleGnbBottomBg -->
    </div><!-- .subTCIArticleGnbBottomContainer End -->

    <!-- provide device List Start -->
    <div class="subCIArticleListContentOneContainer">
      <div class="subCIArticleListContentBoxBg">
        <div class="subCIArticleContentTopBox"></div><!-- .subTRIndusrtyContentTopBox -->

        <!-- provide device List Start -->
        <div class="subCIArticleContentListBox">
        <c:forEach items="${boardEntity.boardSocialBlogList}" var="boardSocialBlogList" varStatus="i">
          <div class="subCIArticleContentList direct" id="boardKey${boardSocialBlogList.boardSocialBlogKey}">
            <div class="subCIArticleContentListWrap">
              <div class="subCIArticleContentDateBox">
                <div class="subCIArticleContentDate">
                  <span class="subCIArticleContentYear">${boardSocialBlogList.socialBlogInsertYear}</span>
                  <span class="subCIArticleContentDay">${boardSocialBlogList.socialBlogInsertDay}</span>
                </div>
              </div><!-- .subTRIndusrtyContentTextBox End-->
              <div class="subCIArticleContentLinkBox">
               <a class="reviewDetail" href="javascript:;" data-key="${boardSocialBlogList.boardSocialBlogKey}">
                  <div class="subCIArticleContentTextBox">
                    <div class="subCIArticleContentTit">
                      <p>
                        ${boardSocialBlogList.socialBlogTitle}
                      </p>
                    </div>
                  </div><!-- .subTRIndusrtyContentTextBox End-->
                </a>
              </div>
            </div>
          </div><!-- .subTRIndusrtyContentList End -->
          </c:forEach>
         </div>          
        </div><!-- .subTRIndusrtyContentListBox End -->
       </div>
        <!-- provide device List End -->      
       <div class="subTRIndusrtyContentBottomBox">
          <div class="subTRIndusrtyContentMoreImgBox">
            <div class="subTRIndusrtyContentMoreImg">
              <c:if test="${boardEntity.dataSize > 12}">
              <span class="nextPage" data-url="socialList" alt="">
                <img class="images" src="${contextPath}/resources/images/contents_btn_submit_board.png"  onmouseover="this.src='${contextPath}/resources/images/contents_btn_submit_board_more.png';" onMouseOut="this.src='${contextPath}/resources/images/contents_btn_submit_board.png';" alt="more" />
              </span>
              </c:if>
              <input type="hidden" id="currentPage" value="${boardEntity.currentPage}" name="currentPage"/>
            </div><!-- .subTRIndusrtyContentMoreImg End-->
          </div><!-- .subTRIndusrtyContentMoreImgBox End -->
        </div><!-- .subTRIndusrtyContentBottomBox End -->
</body>
<script>
$(function(){
	/* scrollPage(); */
	selectDetail();
	$("#currentPage").val(1);
	function selectDetail() {
		$('.reviewDetail').on('click', function() {
			var key = $(this).data('key');
			var nextPage = parseInt($("#currentPage").val());
			location.href = contextPath + '/introduction/newsArticleDetail?currentPage=' + nextPage + '&boardSocialBlogKey=' + key;
		});
	}
	
/* 	$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		  $(".nextPage").click().unbind("click");
		  
    }
  }); */
/* 	function scrollPage() { */
	  $(".nextPage").on("click", function() {
		  var nextPage = parseInt($("#currentPage").val()) + 1;
		  $.ajax({
          url : contextPath + 'rest/socialList',
          dataType : 'json',
          data : {currentPage : nextPage},
          success : function(result) {
            flag = 1;
            if (result.resultCode == 'success') {
              var resultList = result.resultDATA.boardSocialBlogList;
              var pageTotalCount = result.resultDATA.pageTotalCount;
              var currentPage = result.resultDATA.currentPage;
              var contents = "";
              for (var i = 0; i < resultList.length; i++) {
                contents +=
                  "<div class='subCIArticleContentList direct " + resultList[i].boardSocialBlogKey +"'>"
                    + "<div class='subCIArticleContentListWrap'>"
                        + "<div class='subCIArticleContentDateBox'>"
                            + "<div class='subCIArticleContentDate'>"
                                + "<span class='subCIArticleContentYear'>"
                                  + resultList[i].socialBlogInsertYear
                                + "</span>"
                                + "<span class='subCIArticleContentDay'>"
                                  + resultList[i].socialBlogInsertDay
                                + "</span>"
                            + "</div>"
                        + "</div>"
                        + "<div class='subCIArticleContentLinkBox'>"
                            + "<a class='reviewDetail' href='javascript:;' data-key='" + resultList[i].boardSocialBlogKey + "'>"
                            + "<div class='subCIArticleContentTextBox'>"
                                + "<div class='subCIArticleContentTit'>"
                                  + "<p>"
                                        + resultList[i].socialBlogTitle
                                  + "</p>"
                                + "</div>"
                            + "</div>"
                            + "</a>"
                        + "</div>"
                    + "</div>"
                + "</div>";
              }
              $(".subCIArticleContentList:last").after(contents);
              $("#currentPage").val(nextPage);
              selectDetail();
              /* scrollPage(); */
              if(pageTotalCount <= currentPage) {
                  $(".images").hide();
                  return false;
              }
            }
          },
          fail : function() {
            alert('error');
          }
        });
	  });
	/* } */
	function directList() {
		var directBoardKey = $('#directBoardKey').val();
		if (directBoardKey > 0) {
			$('.' + directBoardKey)[0].scrollElement.scrollIntoView(true);
		}
	}
});
</script>