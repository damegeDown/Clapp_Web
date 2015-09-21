<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/management.js"></script>
<div class="sub-content">
  <div>
  
   <form id="searchForm">
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
			<select class="sel-w100 floatR" name="searchValue">
				<option value="">--상태 전체--</option>
        <c:forEach items="${bannerStatus}" var="code">
          <option value="${code.commonCode }" <c:if test="${bannerEntity.bannerStatus eq code.commonCode }">selected</c:if>>${code.commonName }</option>
        </c:forEach>
			</select>
			<div style="clear:both;"></div>
		</form>
	</div>
	<table class="board-list">
		<colgroup>
 			<col width="10%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="30%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>노출순서</th>
				<th>위치</th>
				<th>선택</th>
				<th>배너제목</th>
				<th>시작일시</th>
				<th>종료일시</th>
				<th>상태</th>
				<th>수정/종료</th>
			</tr>
		</thead>
		<tbody>
		  <c:forEach items="${bannerEntity.bannerList }" var="bannerList" varStatus="i">
			<tr>
				<td>${bannerList.bannerViewSeq}</td>
				<td>
					<a href="#" class="bannerViewUp" data-key="${bannerList.bannerInquiryKey}_${bannerList.bannerViewSeq}">▲</a>
					<a href="#" class="bannerViewDown" data-key="${bannerList.bannerInquiryKey}_${bannerList.bannerViewSeq}">▼</a>
				</td>
				<td>
					<input type="checkbox" name="bannerListKeyArr" class="chk" value="${bannerList.bannerInquiryKey}_${bannerList.bannerStatus}">
				</td>
				<td style="cursor:pointer" class="bannerTitle" data-key="${bannerList.bannerInquiryKey }">${bannerList.bannerTitle }</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${bannerList.bannerStartDate }" /></td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${bannerList.bannerEndDate }" /></td>
				<td>${bannerList.bannerStatus}</td>
				<td>
					<div class="btn-bottom-gray goModify" onclick="goModify('${bannerList.bannerInquiryKey }')">수정</div>
				</td>
			</tr>
			</c:forEach>
			 <c:if test="${bannerEntity.bannerList.size() < 1 }">
        <tr>
          <td colspan="9">+++조회된 내용이 없습니다.+++</td>
        </tr> 
        </c:if>
		</tbody>
	</table>
	<div class="btn-area">
		<a href="#" class="floatL btn-bottom-orenge bannerViewOn"><span>선택 노출</span></a>
		<a href="#" class="floatL btn-bottom-orenge bannerViewOff"><span>선택 비노출</span></a>

		<a href="${contextPath}/admin/management/bannerModify" class="floatR btn-bottom-orenge"><span>배너 등록</span></a>
  </div>
	<div class="paging-area">
    <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/management/bannerList" pageNavigationEntity="${bannerEntity}" />
  </div>
</div>
<script>
$(function() {
	$.fn.BannerList.init();
});
var goModify = function(id) {
	location.href = "${contextPath }/admin/management/bannerModify?bannerInquiryKey="+id;
}
</script>