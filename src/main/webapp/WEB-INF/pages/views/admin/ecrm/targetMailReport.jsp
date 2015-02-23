<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/ecrm.js"></script>
<c:set var="ecrmLength" value="${ecrmEntity.ecrmList.size() }"/>
<div class="sub-content" id="targetMailReport">
  <div>
		<h3 class="contents-title floatL">${CommonCode.navigation }</h3>
		<div style="clear:both;"></div>
	</div>
	<div class="search-box">
		<form id="searchForm" action="">
		  <span style="margin:right:20px">검색일</span>
		  <input type="text" class="monthpicker inp-cal" name="searchValue" value="${ecrmEntity.getSearchValue() }" style="vertical-align:middle; height:20px"/>
			<input type="submit" class="btn " value="검색"/>
		</form>
	</div>
	<div style="margin:5px; color:red">* 해당 월의 결제 완료된 웹 결제 통계를 보실 수 있습니다. 자세한 내역은 웹결제 관리에서 확인하시기 바랍니다.</div>
  <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
  <div style="width:100%;">
 		<h3 class="floatL part-title">${CommonCode.searchResult }</h3>
 		<form id="sortForm" action=""> 
	 		<select name="searchKey" class="floatR" onchange="MailUtils.sortTable()">
	 			<option value="mail_send_date" <c:if test="${ecrmEntity.searchKey eq 'mail_send_date' }">selected</c:if>>발송일순</option>
	 			<option value="mailOpenCount" <c:if test="${ecrmEntity.searchKey eq 'mailOpenCount' }">selected</c:if>>오픈수 순</option>
	 			<option value="mailClickCount" <c:if test="${ecrmEntity.searchKey eq 'mailClickCount' }">selected</c:if>>클릭수 순</option>
	 		</select>
	 	</form>
  </div>
	<table class="board-list-r">
		<thead> 
			<tr>
				<th class="al-center">날짜 (요일)</th>
				<th class="al-center">대상</th>
				<th class="al-center">제목</th>
				<th>발송일</th>
				<th>발송전체</th>
				<th>성공</th>
				<th>실패</th>
				<th>오픈수 (%)</th>
				<th>클릭수 (%)</th>
			</tr>
		</thead>
		<c:if test="${ecrmLength == 0 }">
			<tbody>
				<td colspan="9" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${ecrmLength > 0}">
		<tbody>
		<c:forEach items="${ecrmEntity.ecrmList }" var="ecrmList" varStatus="i">
		<c:choose>
			<c:when test='${ecrmList.dayOfWeek == 6 }'>
				<c:set var="color" value="color:red"/>
			</c:when>
			<c:when test='${ecrmList.dayOfWeek == 5 }'>
				<c:set var="color" value="color:blue"/>
			</c:when>
			<c:otherwise>
				<c:set var="color" value="color:black"/>
			</c:otherwise> 
		</c:choose>
			<tr style="${color}">
				<td class="al-center"><fmt:formatDate pattern="yyyy/MM/dd " value="${ecrmList.mailSendDate }" /><br/>(${ecrmList.dayName })</td> 
				<td class="al-center"><input type="hidden" name="mailContent" value="${ecrmList.mailContent}"/>${ecrmList.mailTargetText }</td> 
				<td class="al-center">
					<form>
					<span class="freeViewMailBtn cursor" onclick="MailUtils.openTargetMailFreeView(this)">
							${ecrmList.mailTitle }
					</span>
					</form>
				</td>
				<td>
					<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${ecrmList.mailSendDate }" />
				</td>
				<td>
					<c:set var="sumTotalSendCount" value="${sumTotalSendCount + ecrmList.totalSendCount}"/>
					${ecrmList.totalSendCount }
				</td>
				<td>
					<c:set var="sumSendSuccessCount" value="${sumSendSuccessCount + ecrmList.sendSuccessCount}"/>
					${ecrmList.sendSuccessCount }
				</td>
				<td>
					<c:set var="sumSendFailCount" value="${sumSendFailCount + ecrmList.sendFailCount}"/>
					${ecrmList.sendFailCount }
				</td>
				<td>
					<c:set var="sumMailOpenCount" value="${sumMailOpenCount + (ecrmList.mailOpenCount / ecrmList.totalSendCount  * 100)}"/>
					${ecrmList.mailOpenCount / ecrmList.totalSendCount  * 100} %
				</td>
				<td>
					<c:set var="sumMailClickCount" value="${sumMailClickCount + (ecrmList.mailClickCount / ecrmList.totalSendCount  * 100)}"/>
					${ecrmList.mailClickCount / ecrmList.totalSendCount  * 100} %
				</td>
			</tr>
		 </c:forEach>
		</tbody>
		<tfoot>
			<tr class="first">
				<th colspan="4">전체 평균</th>
				<td>${sumTotalSendCount / ecrmLength}</td>
				<td>${sumSendSuccessCount / ecrmLength}</td>
				<td>${sumSendFailCount / ecrmLength }</td>
				<td>${sumMailOpenCount / ecrmLength } %</td>
				<td>${sumMailClickCount / ecrmLength } %</td>
			</tr>
			<tr class="last">
				<th colspan="4">합계</th>
				<td>${sumTotalSendCount }</td>
				<td>${sumSendSuccessCount }</td>
				<td>${sumSendFailCount }</td>
				<td>${sumMailOpenCount / ecrmLength } %</td>
				<td>${sumMailClickCount / ecrmLength } %</td>
			</tr>
		</tfoot>
		</c:if>
	</table>
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupFreeViewMail.jsp"%>
<script>
</script>
