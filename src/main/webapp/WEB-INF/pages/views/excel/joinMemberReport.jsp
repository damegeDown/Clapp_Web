<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="statisticsLength" value="${statisticsEntity.statisticsList.size() }"/>
<c:set var="weekDayLength" value="0"/>
<div class="floatL" >> 회원가입</div>
<table class="board-list" style="width:600px">
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
			<th>일반 가입</th>
			<th colspan="2">기업/단체 가입(일반 대비 가입률)</th>
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
			<td colspan="9">조회한 내용이 없습니다.</td>
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
				<td><!-- 날짜, 요일, 시간 -->
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
				<td><!-- 일반 -->
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="weekDayLength" value="${ weekDayLength + 1}"/>
						<c:set var="weekDayJoinMember" value="${weekDayJoinMember + statisticsList.joinMember  }"/>
					</c:if>
					<c:set var="totalJoinMember" value="${totalJoinMember + statisticsList.joinMember  }"/>	
					<fmt:formatNumber value="${statisticsList.joinMember }" type="number" pattern="##,###"/> 명
				</td>
				<td><!-- 기업/단체 -->
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="weekDayJoinCompanyMember" value="${weekDayJoinCompanyMember + statisticsList.joinCompanyMember  }"/>
					</c:if>
					<c:set var="totalJoinCompanyMember" value="${totalJoinCompanyMember + statisticsList.joinCompanyMember  }"/>	
					<fmt:formatNumber value="${statisticsList.joinCompanyMember }" type="number" pattern="##,###"/> 명
				</td>
				<td><!-- 일반대비 가입률 -->
					<numbers:RoundTag value="${(statisticsList.joinCompanyMember / (statisticsList.joinCompanyMember + statisticsList.joinMember)) * 100 }" type="half" digit="1"/> %
				</td>
				<td><!-- 일별합계 -->
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="sumWeekDayJoinMember" value="${weekDayJoinMember + statisticsList.joinCompanyMember + statisticsList.joinMember  }"/>
					</c:if>
					<c:set var="sumTotalJoinMember" value="${totalJoinMember + statisticsList.joinCompanyMember + statisticsList.joinMember  }"/>	
					<fmt:formatNumber value="${statisticsList.joinCompanyMember + statisticsList.joinMember }" type="number" pattern="##,###"/> 명
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot> 
		 <tr class="first">
		 	<th>평일 평균</th>
		 	<td>
		 		<c:set var="aveWeekDayJoinMember" value="${weekDayJoinMember / weekDayLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayJoinMember}" type="half" digit="1" /> 명
		 	</td>
		 	<td>
		 		<c:set var="aveWeekDayJoinCompanyMember" value="${weekDayJoinCompanyMember / weekDayLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayJoinCompanyMember}" type="half" digit="1"/> 명
		 	</td>
		 	<td><numbers:RoundTag value="${(aveWeekDayJoinCompanyMember / (aveWeekDayJoinMember + aveWeekDayJoinCompanyMember)) * 100 }" type="half" digit="1"/> %</td>
		 	<td><numbers:RoundTag value="${weekDayJoinMember + weekDayJoinCompanyMember }" type="half" digit="1"/> 명</td>
		 </tr>
		 <tr>
		 	<th>전체 평균</th>
		 	<td>
		 		<c:set var="aveTotalJoinMember" value="${totalJoinMember / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveTotalJoinMember}" type="half" digit="1"/> 명
		 	</td> 
		 	<td>
		 		<c:set var="aveTotalJoinCompanyMember" value="${totalJoinCompanyMember / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveTotalJoinCompanyMember}" type="half" digit="1"/> 명
		 	</td>
		 	<td><numbers:RoundTag value="${(aveTotalJoinCompanyMember / (aveTotalJoinMember + aveTotalJoinCompanyMember)) * 100 }" type="half" digit="1" /> %</td>
		 	<td><numbers:RoundTag value="${totalJoinMember + totalJoinCompanyMember }" type="half" digit="1"/> 명</td>
		 </tr>
		 <tr class="last">
		 	<th>합계</th>
		 	<td> 
		 		<c:set var="sumMember" value="${totalJoinMember}"/> 
		 		<fmt:formatNumber value="${sumMember}" type="number"/> 명
		 	</td>
		 	<td>
		 		<c:set var="sumCompanyMember" value="${totalJoinCompanyMember}"/>	
		 		<fmt:formatNumber value="${sumCompanyMember}" type="number"/> 명 
		 	</td>
		 	<td><numbers:RoundTag value="${(sumCompanyMember / (sumMember + sumCompanyMember)) * 100 }" type="half" digit="1"/> %</td>
		 	<td><fmt:formatNumber value="${sumMember + sumCompanyMember}" type="number"/> 명</td>
		 </tr>
		</tfoot>
		</c:if>
</table>
