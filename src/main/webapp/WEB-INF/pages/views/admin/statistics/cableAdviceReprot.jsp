<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/statistics.js"></script>
<div class="sub-content">
  <div>
			<h3 class="contents-title floatL">${CommonCode.navigation }( 누적 상담건수 : <span class="colorSkyBlue">${cableAdviceTotalCount.cableAdviceTotalCount}</span> 건)</h3>
			<div style="clear:both;"></div>
	</div>
	<div class="search-box">
		<form id="searchForm" action="">
			<input type="hidden" name="actionUrl" value="${contextPath }/excel/cableAdviceReprot"/>
		  <span style="margin:right:20px">검색일</span>
		  <input type="text" class="monthpicker inp-cal" name="searchValue" value="${statisticsEntity.getSearchValue() }" style="vertical-align:middle; height:20px"/>
			<input type="button" class="btn searchBtn" value="검색"/>
		</form>
	</div>
  <div style="margin:5px; color:red"></div>
  <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
  <div style="width:100%;">
 		<h3 class="floatL part-title">
            >검색결과 :
            <span class="colorSkyBlue">${cableAdviceSearchCount.cableAdviceSearchCount}</span> 건
        </h3>
 		<input type="button" class="btn floatR excelDownBtn" value="엑셀 다운로드"/>
  </div>
  <c:set var="statisticsLength" value="${statisticsEntity.statisticsList.size() }"/>
  <c:set var="dayOfLength" value="0"/>
	<table class="board-list-r">
		<thead> 
			<tr>
				<th>분류</th>
				<th>건수</th>
				<th>비율</th>
			</tr>
		</thead>
		<c:if test="${statisticsLength == 0 }">
			<tbody>
				<td colspan="3" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${statisticsLength > 0}">
		<tbody>
		<c:forEach items="${statisticsEntity.statisticsList }" var="statisticsList" varStatus="i">
			<tr class="cursor" style="cursor:pointer; ">
				<td>${statisticsList.adviceType}</td> 
				<!-- 일반 -->
				<td> 
					<c:set var="sumAdviceCount" value="${sumAdviceCount + statisticsList.adviceCount}"/>
					${statisticsList.adviceCount } 건
				</td>
				<td> 
			  	<c:set var="sumAdviceTotal" value="${sumAdviceTotal + (statisticsList.adviceCount / statisticsList.adviceTotal * 100)}"/>
					<numbers:RoundTag value="${statisticsList.adviceCount / statisticsList.adviceTotal * 100}" type="half" digit="1"/> %
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th>합계</th>
				<td>${sumAdviceCount }건</td>
				<td><numbers:RoundTag value="${sumAdviceTotal }" type="half" digit="1"/> %</td>
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