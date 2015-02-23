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
		<form id="searchForm" action="" >
			<input type="hidden" name="actionUrl" value="${contextPath }/excel/loginCountReport"/>
		  <span style="margin:right:20px">검색타입</span>
		  <label><input type="radio" name="searchKey" value="1" <c:if test="${statisticsEntity.searchKey == 1 }">checked</c:if> /> 일별</label>
		  <label><input type="radio" name="searchKey" value="2" <c:if test="${statisticsEntity.searchKey == 2 }">checked</c:if>/> 요일별</label> 
		  <label><input type="radio" name="searchKey" value="3" <c:if test="${statisticsEntity.searchKey == 3 }">checked</c:if>/> 시간대별</label> <span style="margin:0 10px">/</span> 
  		<span style="margin:right:20px">가입일</span>
  		<input type="text" id="from" class="date" name="startDate" value="${statisticsEntity.startDate }"/> ~ <input type="text" id="to" class="date" name="endDate" value="${statisticsEntity.endDate }"/> 
			<input type="button" class="btn searchBtn" value="검색"/>
		</form>
	</div>
  <div style="margin:5px; color:red">* 1 계정이 로그인 한 횟수를 나타냅니다. (예 : A라는 사용자가 계정이 00월 00일에 7번 로그인 했을 시 7로 집계).</div>
  <div style="margin:5px; color:red">* 일별 통계는 최대 한 달 (31일)간의 내역만 나타납니다.</div>
  <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
  <div style="width:100%;">
  		<h3 class="floatL part-title">${CommonCode.searchResult }</h3>
  		<input type="button" class="btn floatR excelDownBtn" value="엑셀 다운로드"/>
  </div>
  <c:set var="statisticsLength" value="${statisticsEntity.statisticsList.size() }"/>
  <c:set var="weekDayLength" value="0"/>
	<table class="board-list-r">
		<colgroup>
			<col style="width:23%"/>
			<col style="width:23%"/>
			<col style="width:15%"/>
			<col style="width:15%"/>
			<col style="width:24%"/>
		</colgroup>
		<thead> 
			<tr>
				<th>
					<c:choose>
						<c:when test="${statisticsEntity.searchKey == 1 }">
							날짜(요일)
						</c:when>
						<c:when test="${statisticsEntity.searchKey == 2 }">
							요일
						</c:when>
						<c:when test="${statisticsEntity.searchKey == 3 }">
							시간
						</c:when>
					</c:choose>
				</th>  
				<th>일반 로그인</th>
				<th colspan="2">기업/단체 로그인(일반 대비 로그인률)</th>
				<th>	
					<c:choose>
						<c:when test="${statisticsEntity.searchKey == 1 }">
							일별 합계
						</c:when>
						<c:when test="${statisticsEntity.searchKey == 2 }">
							요일별 합계 
						</c:when>
						<c:when test="${statisticsEntity.searchKey == 3 }">
							시간대별 합계
						</c:when>
					</c:choose>
				</th>
			</tr>
		</thead>
		 <c:if test="${statisticsLength == 0 }">
			<tbody>
				<td colspan="9" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		 </c:if>
		<c:if test="${statisticsLength > 0}">
		<tbody>
		<c:forEach items="${statisticsEntity.statisticsList }" var="statisticsList" varStatus="i">
			<c:choose>
				<c:when test='${statisticsList.dayOfWeek == 6 }'>
					<c:set var="color" value="color:red"/>
				</c:when>
				<c:when test='${statisticsList.dayOfWeek == 5 }'>
					<c:set var="color" value="color:blue"/>
				</c:when>
				<c:otherwise>
					<c:set var="color" value="color:black"/>
				</c:otherwise> 
			</c:choose>
			<tr class="cursor" style="cursor:pointer; ${color} ">
				<td>
					<c:choose>
						<c:when test="${statisticsEntity.searchKey == 1 }">
								<fmt:formatDate pattern="yyyy/MM/dd " value="${statisticsList.statisticsDate}" />
								<br/>(${statisticsList.dayName })
						</c:when>
						<c:when test="${statisticsEntity.searchKey == 2 }">
							${statisticsList.dayName }
						</c:when>
						<c:when test="${statisticsEntity.searchKey == 3 }">
							${statisticsList.statisticsTime } 시
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="weekDayLength" value="${ weekDayLength + 1}"/>
						<c:set var="weekDayLoginCount" value="${weekDayLoginCount + statisticsList.loginCount  }"/>
					</c:if>
					<c:set var="totalLoginCount" value="${totalLoginCount + statisticsList.loginCount  }"/>	
					<fmt:formatNumber value="${statisticsList.loginCount }" type="number" pattern="##,###"/> 명
				</td>
				<td>
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="weekDayLoginCompanyCount" value="${weekDayLoginCompanyCount + statisticsList.loginCompanyCount  }"/>
					</c:if>
					<c:set var="totalLoginCompanyCount" value="${totalLoginCompanyCount + statisticsList.loginCompanyCount  }"/>	
					<fmt:formatNumber value="${statisticsList.loginCompanyCount }" type="number" pattern="##,###"/> 명
				</td>
				<td>
					<numbers:RoundTag value="${(statisticsList.loginCompanyCount / (statisticsList.loginCount + statisticsList.loginCompanyCount)) * 100 }" type="half" digit="1"/> %
				</td>
				<td>
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="sumWeekDayLoginCount" value="${weekDayLoginCount + statisticsList.loginCompanyCount + statisticsList.loginCount  }"/>
					</c:if>
					<c:set var="sumTotalLoginCount" value="${totalLoginCount + statisticsList.loginCompanyCount + statisticsList.loginCount  }"/>	
					<fmt:formatNumber value="${statisticsList.loginCompanyCount + statisticsList.loginCount }" type="number" pattern="##,###"/> 명
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot> 
		 <tr class="first">
		 	<th>평일 평균</th>
		 	<td>
		 		<c:set var="aveWeekDayLoginCount" value="${weekDayLoginCount / weekDayLength }"/>
		 		<fmt:formatNumber value="${aveWeekDayLoginCount}" type="number" /> 명
		 	</td>
		 	<td>
		 		<c:set var="aveWeekDayLoginCompanyCount" value="${weekDayLoginCompanyCount / weekDayLength }"/>
		 		<fmt:formatNumber value="${aveWeekDayLoginCompanyCount}" type="number"/> 명
		 	</td>
		 	<td><numbers:RoundTag value="${(aveWeekDayLoginCompanyCount / (aveWeekDayLoginCount + aveWeekDayLoginCompanyCount)) * 100 }" type="half" digit="1"/> %</td>
		 	<td><fmt:formatNumber value="${aveWeekDayLoginCount + aveWeekDayLoginCompanyCount }" type="number"/> 명</td>
		 </tr>
		 <tr>
		 	<th>전체 평균</th>
		 	<td>
		 		<c:set var="aveTotalLoginCount" value="${totalLoginCount / statisticsLength }"/>
		 		<fmt:formatNumber value="${aveTotalLoginCount}" type="number" /> 명
		 	</td>
		 	<td>
		 		<c:set var="aveTotalLoginCompanyCount" value="${totalLoginCompanyCount / statisticsLength }"/>
		 		<fmt:formatNumber value="${aveTotalLoginCompanyCount}" type="number"/> 명
		 	</td>
		 	<td><numbers:RoundTag value="${(aveTotalLoginCompanyCount / (aveTotalLoginCount + aveTotalLoginCompanyCount)) * 100 }" type="half" digit="1"/> %</td>
		 	<td><fmt:formatNumber value="${aveTotalLoginCount + aveTotalLoginCompanyCount }" type="number"/> 명</td>
		 </tr>
		 <tr class="last">
		 	<th>합계</th>
		 	<td> 
		 		<c:set var="sumMember" value="${ totalLoginCount}"/> 
		 		<fmt:formatNumber value="${sumMember}" type="number"/> 명
		 	</td>
		 	<td>
		 		<c:set var="sumCompanyMember" value="${totalLoginCompanyCount}"/>	
		 		<fmt:formatNumber value="${sumCompanyMember}" type="number"/> 명 
		 	</td>
		 	<td><numbers:RoundTag value="${(sumCompanyMember / (sumMember + sumCompanyMember)) * 100 }" type="half" digit="1"/> %</td>
		 	<td><fmt:formatNumber value="${sumMember + sumCompanyMember}" type="number"/> 명</td>
		 </tr>
		</tfoot>
		</c:if>
	</table>
</div>
<script>
$(function() {
	$.fn.Form.searchForm("month");
});
</script>