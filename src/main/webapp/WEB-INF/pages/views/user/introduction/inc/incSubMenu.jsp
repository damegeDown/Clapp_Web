<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
$(function() {
	var url = location.href;
	//브렌드 클앱 메뉴
	$(".brand > ul li.smtgbItem2").each(function() {
		var thisClass = $(this).attr("class").split(" ")[1];
		if(url.indexOf(thisClass) != -1) {
			$(this).find("a").addClass("cactive");
		} else {
			$(this).find("a").removeClass("cactive");
		}
	});
	//고객지원 메뉴
	$(".customer span").each(function() {
		var thisClass = $(this).attr("class").split(" ")[1];
		if(url.indexOf(thisClass) != -1) {
			$(this).addClass("subCISupportContentTabHover");
		}
	});
});
</script>
      <div class="subMTGnbBottomContainer">
        <div class="subMTGnbBottomBox">
          <div class="subMTGnbBottom brand">
            <ul>
              <li class="smtgbItem2 introductionMain"><a href="${contextPath}/introduction/introductionMain" class="ctci">클앱 소개</a></li>
              <li></li>
              <li class="smtgbItem2 newsArticleList"><a href="${contextPath}/introduction/newsArticleList" class="ctci">언론 기사</a></li>
              <li></li>
              <li class="smtgbItem2 personRecruit"><a href="${contextPath}/introduction/personRecruit" class="ctci">인재 채용</a></li>
              <li></li>
              <li class="smtgbItem2 cooperation"><a href="${contextPath}/introduction/cooperation" class="ctci">고객 · 협력사</a></li>
              <li></li>
              <li class="smtgbItem2 support"><a href="${contextPath}/introduction/supportCustomerList" class="ctci cactive">고객 지원</a></li>
            </ul>
          </div>
          <div class="subMTStartBox">
            <a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
          </div>
        </div>
      </div>
       