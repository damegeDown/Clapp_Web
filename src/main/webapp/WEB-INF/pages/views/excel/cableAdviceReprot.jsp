<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
 <div style="width:100%;">
		<div class="floatL" style="margin-top:15px">유선상담 내역</div>
		<a href="${contextPath }/excel/ticketProductReport"><input type="button" class="btn floatR" value="엑셀 다운로드"/></a>
 </div>
 <c:set var="statisticsLength" value="${statisticsEntity.statisticsList.size() }"/>
 <c:set var="dayOfLength" value="0"/>
<table class="board-list">
	<thead> 
		<tr>
			<th>분류</th>
			<th>건수</th>
			<th>비율</th>
		</tr>
	</thead>
	<c:if test="${statisticsLength == 0 }">
		<tbody>
			<td colspan="3">조회한 내용이 없습니다.</td>
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
