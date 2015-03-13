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
		  <input type="hidden" name="actionUrl" value="${contextPath }/excel/usedTicketReport"/>
		  <span style="margin:right:20px">검색일</span>
		  <input type="text" class="monthpicker inp-cal" name="searchValue" value="${statisticsEntity.getSearchValue() }" style="vertical-align:middle; height:20px"/>
			<input type="button" class="btn searchBtn" value="검색"/>
		</form>
	</div>
  <div style="margin:5px; color:red">* 티켓 사용 내역 통계는 월간으로만 검색 가능합니다.<br/>* CLAPP 은 30분 : 2 티켓이 기본입니다.</div>
  <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
  <div style="width:100%;">
 		<h3 class="floatL part-title">${CommonCode.searchResult }</h3>
 		<input type="button" class="btn floatR excelDownBtn" value="엑셀 다운로드"/>
  </div>
  <c:set var="statisticsLength" value="${statisticsDateList.statisticsList.size() }"/>
	<table class="board-list-r">
		 <colgroup>
			<col width="15%"/>
			<col width="27%"/>
			<col width="14%"/>
			<col width="17%"/>
			<col width="27%"/>
		</colgroup>
		<thead> 
			<tr>
				<th>날짜(요일)</th>
				<th>일반</th>
				<th colspan="2">기업 / 단체 (일반 대비 사용률)</th>
				<th>일별 합계</th>
			</tr>
		</thead>
		<c:if test="${statisticsLength == 0 }">
			<tbody>
				<td colspan="5" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${statisticsLength > 0}">
		<tbody>
		<c:forEach items="${statisticsDateList.statisticsList }" var="statisticsDateList" varStatus="i">
			<c:choose>
				<c:when test='${statisticsDateList.dayOfWeek == 6 }'>
					<c:set var="color" value="color:red"/>
				</c:when>
				<c:when test='${statisticsDateList.dayOfWeek == 5 }'>
					<c:set var="color" value="color:blue"/>
				</c:when>
				<c:otherwise>
					<c:set var="color" value="color:black"/>
				</c:otherwise>  
			</c:choose>
			<tr class="cursor" style="cursor:pointer; ${color} ">
				<td>	<fmt:formatDate pattern="yyyy/MM/dd " value="${statisticsList.statisticsDate}" /> <br/>(${statisticsDateList.dayName })</td> 
				<!-- 일반 -->
				<td> 
					<c:if test="${statisticsDateList.dayOfWeek < 5 }">
						<c:set var="weekDayUsedTicketMember" value="${weekDayUsedTicketMember + statisticsDateList.usedTicketMember  }"/>
					</c:if>
					<c:set var="totalUsedTicketMember" value="${totalUsedTicketMember + statisticsDateList.usedTicketMember  }"/>	
					${statisticsDateList.usedTicketMember } 명
				</td>
				<!-- 기업/단체가입 -->
				<td>
					<c:if test="${statisticsDateList.dayOfWeek < 5 }">
						<c:set var="weekDayUsedTicketCompanyMember" value="${weekDayUsedTicketCompanyMember + statisticsDateList.usedTicketCompanyMember  }"/>
					</c:if>
					<c:set var="totalUsedTicketCompanyMember" value="${totalUsedTicketCompanyMember + statisticsDateList.usedTicketCompanyMember  }"/>	
					${statisticsDateList.usedTicketCompanyMember } 명
				</td>
				<!-- 기업/단체가입 -->
				<td>
					<numbers:RoundTag value="${(statisticsDateList.usedTicketCompanyMember / (statisticsDateList.usedTicketMember + statisticsDateList.usedTicketCompanyMember)) * 100 }" type="half" digit="1"/> %
				</td> 
				<!-- 일별합계 -->
				<td>
					<c:if test="${statisticsDateList.dayOfWeek < 5 }">
						<c:set var="weekDayLoginCount" value="${weekDayLoginCount + statisticsDateList.usedTicketMember + statisticsDateList.usedTicketCompanyMember }"/>
					</c:if>
					<c:set var="totalLoginCount" value="${totalLoginCount + statisticsDateList.usedTicketMember + statisticsDateList.usedTicketCompanyMember }"/>	
					${statisticsDateList.usedTicketMember + statisticsDateList.usedTicketCompanyMember} 명
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot> 
		 <tr class="first"> 
		 	<th>평일 평균</th>
		 	<td>
				<c:set var="aveWeekDayUsedTicketMember" value="${weekDayUsedTicketMember / statisticsLength }"/>		 		
		 		<fmt:formatNumber value="${aveWeekDayUsedTicketMember}" type="number"/> 명
		 	</td>
		 	<td>
		 		<c:set var="aveWeekDayUsedTicketCompanyMember" value="${weekDayUsedTicketCompanyMember / statisticsLength }"/>
		 		<fmt:formatNumber value="${aveWeekDayUsedTicketCompanyMember}" type="number"/> 명
		 	</td>
		 	<td><numbers:RoundTag value="${(aveWeekDayUsedTicketMember / (aveWeekDayUsedTicketMember + aveWeekDayUsedTicketCompanyMember)) * 100 }" type="half" digit="1"/> %</td>
		 	<td><fmt:formatNumber value="${aveWeekDayUsedTicketMember + aveWeekDayUsedTicketCompanyMember }" type="number"/> 명</td>
		 </tr>
		 <tr>
		 	<th>전체 평균</th>
		 	<td>
		 		<c:set var="aveTotalUsedTicketMember" value="${totalUsedTicketMember / statisticsLength }"/>
		 		<fmt:formatNumber value="${aveTotalUsedTicketMember}" type="number"/> 명
		 	</td>
		 	<td>
		 		<c:set var="aveTotalUsedTicketCompanyMember" value="${totalUsedTicketCompanyMember / statisticsLength }"/>
		 		<fmt:formatNumber value="${aveTotalUsedTicketCompanyMember}" type="number"/> 명
		 	</td>
		 	<td><numbers:RoundTag value="${(aveTotalUsedTicketMember / (aveTotalUsedTicketMember + aveTotalUsedTicketCompanyMember)) * 100 }" type="half" digit="1"/> %</td>
		 	<td><fmt:formatNumber value="${aveTotalUsedTicketMember + aveTotalUsedTicketCompanyMember }" type="number"/> 명</td>
		 </tr>
		 <tr class="last">
		 	<th>합계</th>
		 	<td>
		 		<c:set var="sumMember" value="${totalUsedTicketMember}"/> 
		 		<fmt:formatNumber value="${sumMember}" type="number"/> 명
		 	</td>
		 	<td>
		 		<c:set var="sumCompanyMember" value="${totalUsedTicketCompanyMember}"/>	
		 		<fmt:formatNumber value="${sumCompanyMember}" type="number"/> 명 
		 	</td>
		 	<td><numbers:RoundTag value="${(sumCompanyMember / (sumMember + sumCompanyMember)) * 100 }" type="half" digit="1"/> %</td>
		 	<td><fmt:formatNumber value="${sumMember + sumCompanyMember}" type="number"/> 명</td>
		 </tr>
		</tfoot>
		</c:if>
	</table>
	<!-- 사용시간대별 -->
	<div style="width:100%;">
 		<h3 class="floatL" style="margin:15px 0 10px 0">${CommonCode.usedTime }</h3>
  </div>
  <c:set var="statisticsLength" value="${statisticsTimeList.statisticsList.size() }"/>
	<table class="board-list-r">
		<colgroup>
			<col width="15%"/>
			<col width="27%"/>
			<col width="14%"/>
			<col width="17%"/>
			<col width="27%"/>
		</colgroup>
		<thead> 
			<tr>
				<th>사용 시간</th>
				<th>일반</th>
				<th colspan="2">기업 / 단체 (일반 대비 사용률)</th>
				<th>일별 합계</th>
			</tr>
		</thead>
		<c:if test="${statisticsLength == 0 }">
			<tbody>
				<td colspan="5" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${statisticsLength > 0}">
		<tbody>
		<c:forEach items="${statisticsTimeList.statisticsList }" var="statisticsTimeList" varStatus="i">
			<tr class="cursor" style="cursor:pointer; ">
				<td>${statisticsTimeList.usePoint * 15 } 분</td>
				<!-- 일반 -->
				<td> 
					${statisticsTimeList.usedTicketMember } 명
				</td>
				<!-- 기업/단체가입 -->
				<td>
					${statisticsTimeList.usedTicketCompanyMember } 명
				</td>
				<!-- 기업/단체가입 -->
				<td>
					<numbers:RoundTag value="${statisticsTimeList.aveUsedTicket}" type="half" digit="1"/> %
				</td> 
				<!-- 일별합계 -->
				<td>
					${statisticsTimeList.sumDayTotal } 명
				</td>
			</tr>
		</c:forEach>
		</tbody>
		</c:if>
	</table>
	<!-- 사용 디바이스별 -->
	<div style="width:100%;">
 		<h3 class="floatL" style="margin:15px 0 10px 0">${CommonCode.usedDevice }</h3>
  </div>
  <c:set var="statisticsLength" value="${statisticsDeviceList.statisticsList.size() }"/>
	<table class="board-list-r">
		<colgroup>
			<col width="15%"/>
			<col width="27%"/>
			<col width="14%"/>
			<col width="17%"/>
			<col width="27%"/>
		</colgroup>
		<thead> 
			<tr>
				<th>디바이스 모델명</th>
				<th>일반</th>
				<th colspan="2">기업 / 단체 (일반 대비 사용률)</th>
				<th>일별 합계</th>
			</tr>
		</thead>
		<c:if test="${statisticsLength == 0 }">
			<tbody>
				<td colspan="5" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${statisticsLength > 0}">
		<tbody>
		<c:forEach items="${statisticsDeviceList.statisticsList }" var="statisticsDeviceList" varStatus="i">
			<tr class="cursor" style="cursor:pointer; ">
				<td>${statisticsDeviceList.prodName} </td>
				<!-- 일반 -->
				<td> 
					${statisticsDeviceList.usedTicketMember } 명
				</td>
				<!-- 기업/단체가입 -->
				<td>
					${statisticsDeviceList.usedTicketCompanyMember } 명
				</td>
				<!-- 기업/단체가입 -->
				<td>
					<numbers:RoundTag value="${statisticsDeviceList.aveUsedTicket }" type="half" digit="1"/> 
				</td> 
				<!-- 일별합계 -->
				<td>
					${statisticsDeviceList.sumDayTotal } 명
				</td>
			</tr>
		</c:forEach>
		</tbody>
		</c:if>
	</table>
</div>
<script>
$(function() {
	$.fn.Form.searchForm();
});
</script>