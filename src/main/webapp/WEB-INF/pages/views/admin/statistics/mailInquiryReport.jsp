<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/statistics.js"></script>
<div class="sub-content">
  <div>
			<h3 class="contents-title floatL">${CommonCode.navigation }</h3>
			<div style="clear:both;"></div>
	</div>
	<div class="search-box">
		<form id="searchForm" action="">
			<input type="hidden" name="actionUrl" value="${contextPath }/excel/ticketProductReport"/>
		  <span style="margin:right:20px">검색일</span>
		  <input type="text" class="monthpicker inp-cal" name="searchValue" value="${statisticsEntity.getSearchValue() }" style="vertical-align:middle; height:20px"/>
			<input type="button" class="btn searchBtn" value="검색"/>
		</form>
	</div>
  <div style="margin:5px; color:red"></div>
  <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
  <div style="width:100%;">
 		<h3 class="floatL part-title">${CommonCode.searchResult }</h3>
 		<input type="button" class="btn floatR excelDownBtn" value="엑셀 다운로드"/>
  </div>
  <c:set var="statisticsLength" value="${statisticsEntity.statisticsList.size() }"/>
  <c:set var="dayOfLength" value="0"/>
	<table class="board-list-r">
		<colgroup>
			<col width="50%"/>
			<col width="50%"/>
		</colgroup>
		<thead> 
			<tr>
				<th>분류</th>
				<th>건수</th>
			</tr>
		</thead>
		<c:if test="${statisticsLength == 0 }">
			<tbody>
				<td colspan="2" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${statisticsLength > 0}">
		<tbody>
		<c:forEach items="${statisticsEntity.statisticsList }" var="statisticsList" varStatus="i">
			<tr class="cursor" style="cursor:pointer; ">
				<td>${statisticsList.inquiryText}</td> 
				<!-- 일반 -->
				<td> 
					${statisticsList.inquiryCount } 건
				</td>
			</tr>
		</c:forEach>
		</tbody>
		</c:if>
	</table>
	<!-- 만족도 -->
	<div style="width:100%;">
 		<h3 class="floatL" style="margin:15px 0 10px 0">${CommonCode.searchReason }</h3>
  </div>
  <c:set var="statisticsAnswerLength" value="${statisticsAnswerList.size() }"/>
	<table class="board-list-r">
		<colgroup>
			<col width="40%"/>
			<col width="30%"/>
			<col width="30%"/>
		</colgroup>
		<thead> 
			<tr>
				<th>점수(만족도)</th>
				<th>건수</th>
				<th>비율</th>
			</tr>
		</thead>
		<c:if test="${statisticsAnswerLength == 0 }">
			<tbody>
				<td colspan="3" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${statisticsAnswerLength > 0}">
		<tbody>
		<c:forEach items="${statisticsAnswerList }" var="statisticsList" varStatus="i">
			<tr class="cursor" style="cursor:pointer; ">
				<td>0</td> 
				<!-- 일반 -->
				<td> 
					0 건
				</td>
				<!-- 기업/단체가입 --> 
				<td>
					0 %
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot> 
			<tr class="last">
				<th>합계</th>
				<th>0 건</th>
				<th>100%</th>
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