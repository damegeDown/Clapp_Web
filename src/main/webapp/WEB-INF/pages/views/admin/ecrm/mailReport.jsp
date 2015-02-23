<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/ecrm.js"></script>
<c:set var="ecrmLength" value="${ecrmEntity.ecrmList.size() }"/>
<div class="sub-content" id="mailReport">
  <div>
		<h3 class="contents-title floatL">${CommonCode.navigation }</h3>
		<div style="clear:both;"></div>
	</div>
  <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
	<table class="board-list-r" >
		<thead> 
			<tr>
				<th class="al-center">분류</th>
				<th class="al-center">메일</th>
				<th>오늘 발송</th>
				<th>오늘 오픈(%)</th>
				<th>최근 7일</th>
				<th>최근 30일</th>
				<th>누적</th>
			</tr>
		</thead>
		<c:if test="${ecrmLength == 0 }">
			<tbody>
				<td colspan="7" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${ecrmLength > 0}">
		<tbody>
		<c:forEach items="${ecrmEntity.ecrmList }" var="ecrmList" varStatus="i">
			<tr>
				<td class="al-center">${ecrmList.mailSortText }</td> 
				<td class="al-center">
					<form>
					<span class="freeViewMailBtn cursor" data-id="${ecrmList.mailType }" onclick="MailUtils.openMailFreeView(this)">
							${ecrmList.mailTypeText }
					</span>
					</form>
				</td>
				<td>
					<c:set var="sumTodaySend" value="${sumTodaySend + ecrmList.toDaySend}"/>
					${ecrmList.toDaySend }
				</td>
				<td>
					<c:choose>
						<c:when test="${ecrmList.toDayOpen == 0 || ecrmList.toDaySend == 0 }">
							<c:set var="sumTodayOpen" value="${sumTodayOpen + 0}"/>
							0 %
						</c:when>
						<c:otherwise>
							<c:set var="sumTodayOpen" value="${sumTodayOpen + (ecrmList.toDayOpen / ecrmList.toDaySend * 100 )}"/>
							<fmt:formatNumber value="${ecrmList.toDayOpen / ecrmList.toDaySend * 100 }" type="number" pattern="##,###.##"/> %
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:set var="sumToDaySend7Ago" value="${sumToDaySend7Ago + ecrmList.toDaySend7Ago}"/>
					${ecrmList.toDaySend7Ago }
				</td>
				<td>
					<c:set var="sumToDaySend30Ago" value="${sumToDaySend30Ago + ecrmList.toDaySend30Ago}"/>
					${ecrmList.toDaySend30Ago }
				</td>
				<td>
					<c:set var="sumTotalSendCount" value="${sumTotalSendCount + ecrmList.totalSendCount}"/>
					${ecrmList.totalSendCount }
				</td>
			</tr>
		 </c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="2">합계</th>
				<td>${sumTodaySend }</td>
				<td> 
					<fmt:formatNumber value="${sumTodayOpen / ecrmLength }" type="number" pattern="##,###.##"/> %
				</td>
				<td>${sumToDaySend7Ago }</td>
				<td>${sumToDaySend30Ago }</td>
				<td>${sumTotalSendCount }</td>
			</tr>
		</tfoot>
		</c:if>
	</table>
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupFreeViewMail.jsp"%>
<script>
$(function() {
	$("#mailReport").rowspan(0);
});
</script>