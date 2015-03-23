<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="statisticsLength" value="${statisticsDateList.size() }"/>
<div style="width:100%;">
		<div class="floatL" style="margin:15px 0 10px 0">티켓 / 상품적용 서비스</div>
</div>
<c:set var="dayOfLength" value="0"/>
<table class="board-list">
	<thead> 
		<tr>
			<th>날짜(요일)</th>
			<th>전체</th>
			<th>일반</th>
			<th>기업 / 단체</th>
			<th>개별</th>
			<th>일별 합계</th>
		</tr>
	</thead>
	<c:if test="${statisticsLength == 0 }">
		<tbody>
			<td colspan="6">조회한 내용이 없습니다.</td>
		</tbody>
	</c:if>
	<c:if test="${statisticsLength > 0}">
		<tbody>
		<c:forEach items="${statisticsDateList }" var="statisticsList" varStatus="i">
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
				<td>	<fmt:formatDate pattern="yyyy/MM/dd " value="${statisticsList.statisticsDate}" /> <br/>(${statisticsList.dayName })</td> 
				<!-- 전체 -->
				<td> 
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="dayOfLength" value="${dayOfLength + 1 }"/>
						<c:set var="weekDayTargetAll" value="${weekDayTargetAll + statisticsList.serviceTargetAll  }"/>
						<c:set var="weekDayAmountAll" value="${weekDayAmountAll + statisticsList.serviceAmountAll  }"/>
					</c:if>
					<c:set var="totalTargetAll" value="${totalTargetAll + statisticsList.serviceTargetAll  }"/>	
					<c:set var="totalAmountAll" value="${totalAmountAll + statisticsList.serviceAmountAll  }"/>	
					${statisticsList.serviceTargetAll } 건 (${statisticsList.serviceAmountAll} 개)
				</td>
				<!-- 일반 -->
				<td> 
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="weekDayTargetGeneral" value="${weekDayTargetGeneral + statisticsList.serviceTargetGeneral  }"/>
						<c:set var="weekDayAmountGeneral" value="${weekDayAmountGeneral + statisticsList.serviceAmountGeneral  }"/>
					</c:if>
					<c:set var="totalTargetGeneral" value="${totalTargetGeneral + statisticsList.serviceTargetGeneral  }"/>	
					<c:set var="totalAmountGeneral" value="${totalAmountGeneral + statisticsList.serviceAmountGeneral  }"/>	
					${statisticsList.serviceTargetGeneral } 건 (${statisticsList.serviceAmountGeneral} 개)
				</td>
				<!-- 기업/단체가입 -->
				<td>
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="weekDayTargetCompany" value="${weekDayTargetCompany + statisticsList.serviceTargetCompany  }"/>
						<c:set var="weekDayAmountCompany" value="${weekDayAmountCompany + statisticsList.serviceAmountCompany  }"/>
					</c:if>
					<c:set var="totalTargetCompany" value="${totalTargetCompany + statisticsList.serviceTargetCompany  }"/>	
					<c:set var="totalAmountCompany" value="${totalAmountCompany + statisticsList.serviceAmountCompany  }"/>	
					${statisticsList.serviceTargetCompany } 건 (${statisticsList.serviceAmountCompany} 개)
				</td>
				<!-- 개별 -->
				<td>
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="weekDayTargetUnit" value="${weekDayTargetUnit + statisticsList.serviceTargetUnit  }"/>
						<c:set var="weekDayAmountUnit" value="${weekDayAmountUnit + statisticsList.serviceAmountUnit  }"/>
					</c:if>
					<c:set var="totalTargetUnit" value="${totalTargetUnit + statisticsList.serviceTargetUnit  }"/>	
					<c:set var="totalAmountUnit" value="${totalAmountUnit + statisticsList.serviceAmountUnit  }"/>	
					${statisticsList.serviceTargetUnit } 건 (${statisticsList.serviceAmountUnit} 개)
				</td>
				<!-- 일별합계 -->
				<td>
					<c:if test="${statisticsList.dayOfWeek < 5 }">
						<c:set var="weekDayTargetTotal" value="${weekDayTargetTotal + statisticsList.dayOfTargetTotal }"/>
						<c:set var="weekDayAmountTotal" value="${weekDayAmountTotal + statisticsList.dayOfAmountTotal }"/>
					</c:if>
					<c:set var="totalTargetTotal" value="${totalTargetTotal + statisticsList.dayOfTargetTotal }"/>	
					<c:set var="totalAmountTotal" value="${totalAmountTotal + statisticsList.dayOfAmountTotal }"/>	
					${statisticsList.dayOfTargetTotal } 건 (${statisticsList.dayOfAmountTotal} 개)
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot> 
		 <tr class="first"> 
		 	<th>평일 평균</th>
		 	<td>
				<c:set var="aveWeekDayTargetTotal" value="${weekDayTargetAll / dayOfLength }"/>		 		
				<c:set var="aveWeekDayAmountTotal" value="${weekDayAmountAll / dayOfLength }"/>		 		
		 		<numbers:RoundTag value="${aveWeekDayTargetTotal}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${aveTotalAmountTotal}" type="half" digit="1"/> 개)
		 	</td>
		 	<td>
		 		<c:set var="aveWeekDayTargetGeneral" value="${weekDayTargetGeneral / dayOfLength }"/>
		 		<c:set var="aveWeekDayAmountGeneral" value="${weekDayAmountGeneral / dayOfLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayTargetGeneral}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${aveTotalAmountTotal}" type="half" digit="1"/> 개)
		 	</td>
		 	<td>
		 		<c:set var="aveWeekDayTargetCompany" value="${weekDayTargetCompany / dayOfLength }"/>
		 		<c:set var="aveWeekDayAmountCompany" value="${weekDayAmountCompany / dayOfLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayTargetCompany}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${aveTotalAmountTotal}" type="half" digit="1"/> 개)
		 	</td>
		 		<td>
		 		<c:set var="aveWeekDayTargetUnit" value="${weekDayTargetCompany / dayOfLength }"/>
		 		<c:set var="aveWeekDayAmountUnit" value="${weekDayAmountCompany / dayOfLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayTargetUnit}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${aveTotalAmountTotal}" type="half" digit="1"/> 개)
		 	</td>
		 		<td>
		 		<c:set var="aveWeekDayTargetTotal" value="${weekDayTargetTotal / dayOfLength }"/>
		 		<c:set var="aveWeekDayAmountTotal" value="${weekDayAmountTotal / dayOfLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayTargetTotal}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${aveTotalAmountTotal}" type="half" digit="1"/> 개)
		 	</td>
		 </tr>
		 <tr>
		 	<th>전체 평균</th>
		 	<td>
				<c:set var="aveTotalTargetAll" value="${totalTargetAll / statisticsLength }"/>		 		
				<c:set var="aveTotalAmountAll" value="${totalAmountAll / statisticsLength }"/>		 		
		 		<numbers:RoundTag value="${aveTotalTargetAll}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${aveTotalAmountAll}" type="half" digit="1"/> 개)
		 	</td>
		 	<td>
		 		<c:set var="aveTotalTargetGeneral" value="${totalTargetGeneral / statisticsLength }"/>
		 		<c:set var="aveTotalAmountGeneral" value="${totalAmountGeneral / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveTotalTargetGeneral}" type="half" digit="1"/>  건 (<numbers:RoundTag value="${aveTotalAmountGeneral}" type="half" digit="1"/> 개)
		 	</td>
		 	<td>
		 		<c:set var="aveTotalTargetCompany" value="${totalTargetCompany / statisticsLength }"/>
		 		<c:set var="aveTotalAmountCompany" value="${totalAmountCompany / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveTotalTargetCompany}" type="half" digit="1"/>  건 (<numbers:RoundTag value="${aveTotalAmountCompany}" type="half" digit="1"/> 개)
		 	</td>
		 		<td>
		 		<c:set var="aveTotalTargetUnit" value="${totalTargetUnit / statisticsLength }"/>
		 		<c:set var="aveTotalAmountUnit" value="${totalAmountUnit / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveTotalTargetUnit}" type="half" digit="1"/>  건 (<numbers:RoundTag value="${aveTotalAmountUnit}" type="half" digit="1"/> 개)
		 	</td>
		 		<td>
		 		<c:set var="aveTotalTargetTotal" value="${totalTargetTotal / statisticsLength }"/>
		 		<c:set var="aveTotalAmountTotal" value="${totalAmountTotal / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveTotalTargetTotal}" type="half" digit="1"/>  건 (<numbers:RoundTag value="${aveTotalAmountTotal}" type="half" digit="1"/> 개)
		 	</td>
		 </tr>
		 <tr class="last">
		 	<th>합계</th>
		 	<td>
		 		<numbers:RoundTag value="${totalTargetAll}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${totalAmountAll}" type="half" digit="1"/> 개)
		 	</td>
		 	<td>
		 		<numbers:RoundTag value="${totalTargetGeneral}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${totalAmountGeneral}" type="half" digit="1"/> 개)
		 	</td>
		 		<td>
		 		<numbers:RoundTag value="${totalTargetCompany}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${totalAmountCompany}" type="half" digit="1"/> 개)
		 	</td>
		 		<td>
		 		<numbers:RoundTag value="${totalTargetUnit}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${totalAmountUnit}" type="half" digit="1"/> 개)
		 	</td>
		 		<td>
		 		<numbers:RoundTag value="${totalTargetTotal}" type="half" digit="1"/> 건 (<numbers:RoundTag value="${totalAmountTotal}" type="half" digit="1"/> 개)
		 	</td>
		 </tr>
		</tfoot>
		</c:if>
	</table>
	<!-- 사유별 -->
	<div style="width:100%;">
 		<div class="floatL" style="margin:15px 0 10px 0">적용 사유별</div>
  </div>
  <c:set var="statisticsReasonLength" value="${statisticsReasonEntity.statisticsList.size() }"/>
	<table class="board-list">
		<thead> 
			<tr>
				<th>사유</th>
				<th>적용건수</th>
				<th>비율</th>
				<th>적용 티켓수(수량 합)</th>
			</tr>
		</thead>
		<c:if test="${statisticsReasonLength == 0 }">
			<tbody>
				<td colspan="4">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${statisticsReasonLength > 0}">
		<tbody>
		<c:forEach items="${statisticsReasonEntity.statisticsList }" var="statisticsList" varStatus="i">
			<tr class="cursor" style="cursor:pointer; ">
				<td>${statisticsList.serviceReason}</td>
				<!-- 일반 -->
				<td> 
					${statisticsList.dayOfTargetTotal } 건
				</td>
				<!-- 기업/단체가입 --> 
				<td>
					<numbers:RoundTag value="${ statisticsList.dayOfTargetTotal / statisticsReasonEntity.totDayOfTargetTotal * 100 }" type="half" digit="1"/> %
				</td>
				<!-- 기업/단체가입 -->
				<td>
					${statisticsList.dayOfAmountTotal } 개
				</td> 
			</tr>
		</c:forEach>
		</tbody>
		<tfoot> 
			<tr class="last">
				<th>합계</th>
				<th>${statisticsReasonEntity.totDayOfTargetTotal } 건</th>
				<th>100%</th>
				<th>${statisticsReasonEntity.totDayOfAmountTotal } 개</th>
			</tr>
		</tfoot>
		</c:if>
</table>
