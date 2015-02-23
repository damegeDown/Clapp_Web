<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %> 
<%-- <%@ taglib prefix="dgCodeSelect" uri="/WEB-INF/tlds/CodeSelectTag.tld" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/management.js"></script>
<div class="sub-content">
	<div> 
		<form id="searchForm">
			<h3 class="contents-title floatL">${CommonCode.navigation }</h3>
			<select class="floatR" name="searchValue">
				<option value="">--권한 검색--</option>
				<c:forEach items="${commonCodeEntity }" var="code">
					<option value="${code.commonName }" <c:if test="${adminEntity.searchValue eq code.commonName }">selected</c:if>>${code.commonName }</option>
				</c:forEach>
			</select> 
			<%-- <dgCodeSelect:CodeSelectTag id="gwaCodeListBox" name="searchValue" type="select_all" code="${commonCodeEntity}" /> --%>
			<div style="clear:both;"></div>
		</form>
	</div>
	<table class="board-list">
		<%-- <colgroup> 
			<col width="100px"/>
			<col width="780px"/>
			<col width="100px"/>
		</colgroup> --%>
		<thead> 
			<tr>
				<th>No.</th> 
				<th>아이디</th>
				<th>이름</th>
				<th>소속(실/팀)</th>
				<th>권한구분</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${adminEntity.adminList }" var="adminList" varStatus="i">
			<tr class="cursor" style="cursor:pointer" data-key="${adminList.adminMasterKey }">
				<td>${adminEntity.dataSize-(adminEntity.pageListSize*(adminEntity.currentPage-1))-i.index}</td>
				<td>${adminList.adminId }</td>
				<td>${adminList.adminName }</td>
				<td>${adminList.adminCompanyName }(${adminList.adminTeamName })</td>
				<td>${adminList.adminGrant }</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${adminList.adminInsertDate }" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="btn-area">
		<a href="${contextPath }/admin/management/adminModify" class="floatR btn-bottom-orenge">관리자 등록</a>
	</div>
	<div class="paging-area">
    <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/management/adminList" pageNavigationEntity="${adminEntity}" />
  </div>
</div>
<script>
$(function() {
	$.fn.AdminList.init();
});
</script>
 


