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
    <h3 class="contents-title floatL">${CommonCode.navigation } (진행 <span class='colorSkyBlue'>${popupEntity.dataSize }</span> 건)</h3>
			<select class="sel-w100 floatR" name="searchValue">
				<option value="">--상태 전체--</option>
        <c:forEach items="${popupOpen}" var="code">
          <option value="${code.commonCode }" <c:if test="${popupEntity.searchValue eq code.commonCode }">selected</c:if>>${code.commonName }</option>
        </c:forEach>
			</select>
			<div style="clear:both;"></div>
		</form>
	</div>
	<table class="board-list">
		<colgroup>
 			<col width="10%"/>
			<col width="30%"/>
			<col width="20%"/> 
			<col width="20%"/> 
			<col width="10%"/> 
			<col width="10%"/> 
		</colgroup>
		<thead>
			<tr>
				<th>No</th>
				<th>팝업제목</th>
				<th>팝업 시작일시</th>
				<th>팝업 종료일시</th>
				<th>상태</th>
				<th>종료</th>
			</tr>
		</thead>
		<tbody>
		  <c:forEach items="${popupEntity.popupList }" var="popupList" varStatus="i">
			<tr>
				<td>${popupEntity.dataSize-(popupEntity.pageListSize*(popupEntity.currentPage-1))-i.index}</td>
				<td style="cursor:pointer" class="popupTitle" data-key="${popupList.popupKey }">${popupList.popupTitle }</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${popupList.popupStartDate }" /></td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${popupList.popupEndDate }" /></td>
				<td>${popupList.popupOpen }</td>
				<td class="endPopup" data-key="${popupList.popupKey }"><a href="#" class="btnSmall-bottom-gray">종료</a></td> 
			</tr>
			</c:forEach>
			 <c:if test="${popupEntity.popupList.size() < 1 }">
        <tr>
          <td colspan="6">+++조회된 내용이 없습니다.+++</td>
        </tr> 
        </c:if>
		</tbody>
	</table>
	<div class="btn-area">
    <a href="${contextPath}/admin/management/popupModify" class="floatR btn-bottom-orenge"><span>팝업 등록</span></a> 
  </div>
	<div class="paging-area">
    <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/management/popupList" pageNavigationEntity="${popupEntity}" />
  </div>
</div>
<script>
$(function() {
  $.fn.PopupList.init();
});
</script>