<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/statistics.js"></script>
<div class="sub-content">
    <div>
	  <h3 class="contents-title floatL">${CommonCode.navigation } ( 누적 탈퇴회원 수 : <span class="colorSkyBlue">${dropOutMemberCount.dropOutMemberCount}</span>명 )</h3>
	  <div style="clear:both;"></div>
	</div>
	<div class="search-box">
		<form id="searchForm" action="">
		  <input type="hidden" name="actionUrl" value="${contextPath }/excel/dropOutMemberReport"/>
		  <span style="margin:right:20px">검색일</span>
		  <%-- <input type="text" class="monthpicker inp-cal" name="searchValue" value="${dropOutList.getSearchValue() }" style="vertical-align:middle; height:20px"/> --%>
		  <select name="searchValue">
		  	<c:forEach begin="${year-10}" end="${year}" step="1" varStatus="i">
		  		<option value="${i.index }" <c:if test="${i.index eq statisticsEntity.searchValue }">selected</c:if>>${i.index }</option>
		  	</c:forEach>
		  </select>
		  <input type="button" class="btn searchBtn" value="검색"/>
		</form>
	</div>
  <%--<div style="margin:5px; color:red">* 월 단위 검색만 가능합니다.</div>--%>
  <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
  <div style="width:100%;">
  	<h3 class="floatL part-title">${CommonCode.searchResult }</h3>
  	<input type="button" class="btn floatR excelDownBtn" value="엑셀 다운로드"/>
  </div>
  <c:set var="dropOutLength" value="${dropOutList.size() }"/>
	<table class="board-list-r">
		<colgroup>
			<col width="50%"/>
			<col width="50%"/>
		</colgroup>
		<thead> 
			<tr>
				<th>년 / 월</th>  
				<th>탈퇴 회원수</th>
			</tr>
		</thead>
		<c:if test="${dropOutLength == 0 }">
			<tbody>
				<td colspan="2" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${dropOutLength > 0}">
		<tbody>
		<c:forEach items="${dropOutList }" var="dropOutList" varStatus="i">
			<tr class="cursor" style="cursor:pointer; ${color} ">
				<td>${dropOutList.dropOutDate}</td> 
				<!-- 일반가입 -->
				<td> 
					${dropOutList.dropOutCount } 명
					<c:set var="sumDropOutCount" value="${sumDropOutCount + dropOutList.dropOutCount }"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
		 <tr class="first">
		 	<th>평균</th>
		 	<td><fmt:formatNumber value="${sumDropOutCount  / dropOutLength}" type="number"/> 명  </td>
		 </tr>
		 <tr class="last">
		 	<th>합계</th>
		 	<td><fmt:formatNumber value="${sumDropOutCount}" type="number"/> 명 </td>
		 </tr>
		</tfoot>
		</c:if>
	</table>
	<div style="width:100%;">
  	<h3 class="floatL" style="margin-top:15px">${CommonCode.dropOutReason }</h3>
  </div>
  <c:set var="reasonLength" value="${dropOutReasonList.size() }"/>
	<table class="board-list-r">
		<colgroup>
			<col width="50%"/>
			<col width="50%"/>
		</colgroup>
		<thead> 
			<tr>
				<th>탈퇴 사유별</th>  
				<th>건 수</th>
			</tr>
		</thead>
		<c:if test="${reasonLength == 0 }">
			<tbody>
				<td colspan="2" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${reasonLength > 0}">
		<tbody>
		<c:forEach items="${dropOutReasonList }" var="reasonList" varStatus="i">
			<tr class="cursor" style="cursor:pointer; ${color} ">
				<td>${reasonList.dropOutReason }</td> 
				<!-- 일반가입 -->
				<td> 
					 ${reasonList.dropOutCount } 건
					 <c:set var="sumDropOutReasonCount" value="${sumDropOutReasonCount + reasonList.dropOutCount }"/>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
		 <tr class="first">
		 	<th>평균</th>
		 	<td><numbers:RoundTag value="${sumDropOutReasonCount  / reasonLength}" type="half" digit="1"/> 명  </td>
		 </tr>
		 <tr class="last">
		 	<th>합계</th>
		 	<td><fmt:formatNumber value="${sumDropOutReasonCount}" type="number"/> 명  </td>
		 </tr>
		</tfoot>
		</c:if>
	</table>
</div>
<script>
$(function() {
	$.fn.Form.searchForm();
});
</script>