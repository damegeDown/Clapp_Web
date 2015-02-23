<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
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
		  <select name="searchValue">
		  	<c:forEach begin="${year-10}" end="${year}" step="1" varStatus="i">
		  		<option value="${i.index }" <c:if test="${i.index eq ecrmEntity.searchValue }">selected</c:if>>${i.index }</option>
		  	</c:forEach>
		  </select>
			<input type="submit" class="btn " value="검색"/>
		</form>
	</div>
  <div style="margin-bottom:30px"></div>
  <div style="width:100%;">
 		<h3 class="floatL part-title">${CommonCode.searchResult }</h3>
  </div>
	<table class="board-list-r">
		<thead> 
			<tr>
				<th class="al-center">날짜 (요일)</th>
				<th class="al-center">제목</th>
				<th class="al-center">발송 일시</th>
				<th>발송 전체</th>
				<th>응답</th>
				<th>미응답</th>
			</tr>
		</thead>
		<c:if test="${ecrmLength == 0 }">
			<tbody>
				<td colspan="6" class="al-center">조회한 내용이 없습니다.</td>
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
				<td class="al-center">
					<fmt:formatDate pattern="yyyy/MM/dd " value="${ecrmList.surveySendDate }" />
           			 <br/>(${ecrmList.dayName })</td> 
				<td class="al-center">
					<form>
					<span class="surveyTitle cursor" data-key="${ecrmList.surveyMasterKey }" onclick="SurveyUtils.goDetail(this)">
							${ecrmList.surveyTitle }
					</span>
					</form>
				</td>
				<td class="al-center">
					<c:if test="${ecrmList.surveySendType == 1 }">
						예약발송<br/>
					</c:if>
				  <fmt:formatDate pattern="yyyy/MM/dd HH:MM" value="${ecrmList.surveySendDate }" />
				</td>
				<td>
					<c:set var="sumGroupCount" value="${sumGroupCount + ecrmList.groupCount}"/>
					${ecrmList.groupCount }
				</td>
				<td>
					<c:set var="sumAnswerCount" value="${sumMailOpenCount + (ecrmList.answerCount / ecrmList.groupCount  * 100)}"/>
					<numbers:RoundTag digit="1" type="half" value="${ecrmList.answerCount / ecrmList.groupCount  * 100}" />%
				</td>
				<td>
					<c:set var="sumNotAnswerCount" value="${sumNotAnswerCount + (ecrmList.notAnswerCount / ecrmList.groupCount  * 100)}"/>
					<numbers:RoundTag digit="1" type="half" value="${ecrmList.notAnswerCount / ecrmList.groupCount  * 100}" />%
				</td>
			</tr>
		 </c:forEach>
		</tbody>
		<tfoot>
			<tr class="first">
				<th colspan="3">전체 평균</th>
				<td>
					<numbers:RoundTag digit="1" type="half" value="${sumGroupCount / ecrmLength }" />
				</td>
				<td> 
					<numbers:RoundTag digit="1" type="half" value="${sumAnswerCount / ecrmLength }" />%
				</td>
				<td>
					<numbers:RoundTag digit="1" type="half" value="${sumNotAnswerCount / ecrmLength }" />%
				</td>
			</tr>
			<tr class="last">
				<th colspan="3">합계</th>
				<td>${sumGroupCount }</td>
				<td> 
					<numbers:RoundTag digit="1" type="half" value="${sumAnswerCount / ecrmLength }" />%
				</td>
				<td> 
					<numbers:RoundTag digit="1" type="half" value="${sumNotAnswerCount / ecrmLength }" />%
				</td>
			</tr>
		</tfoot>
		</c:if>
	</table>
	<div class="btn-area">
		<a href="${contextPath }/admin/ecrm/insertSurvey" class="floatR btn-bottom-orenge">등록</a>
	</div>
</div>
