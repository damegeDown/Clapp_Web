<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="statisticsLength" value="${statisticsEntity.statisticsList.size() }"/>
<div class="floatL" >> 사이트현황</div>
<table class="board-list" style="width:1000px">
	<colgroup>
		<col width="*"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
	</colgroup>
	<thead> 
		<tr>
			<th>날짜(요일)</th>  
			<th>일반 가입</th>
			<th>기업/단체 가입</th>
			<th>일반 로그인</th>
			<th>기업 로그인</th>
			<th>탈퇴</th>
			<th>메일 수신</th> 
			<th>메일 거부</th>
			<th>이메일 문의</th>
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
			<td>${statisticsList.statisticsDate} <br/>(${statisticsList.dayName })</td> 
			<!-- 일반가입 -->
			<td> 
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayLength" value="${ weekDayLength + 1}"/>
					<c:set var="weekDayJoinMember" value="${weekDayJoinMember + statisticsList.joinMember  }"/>
				</c:if>
				<c:set var="totalJoinMember" value="${totalJoinMember + statisticsList.joinMember  }"/>	
				${statisticsList.joinMember } 명
			</td>
			<!-- 기업/단체가입 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayJoinCompanyMember" value="${weekDayJoinCompanyMember + statisticsList.joinCompanyMember  }"/>
				</c:if>
				<c:set var="totalJoinCompanyMember" value="${totalJoinCompanyMember + statisticsList.joinCompanyMember  }"/>	
				${statisticsList.joinCompanyMember } 명
			</td> 
			<!-- 일반로그인 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayLoginCount" value="${weekDayLoginCount + statisticsList.loginCount  }"/>
				</c:if>
				<c:set var="totalLoginCount" value="${totalLoginCount + statisticsList.loginCount  }"/>	
				${statisticsList.loginCount } 명
			</td>
			<!-- 기업로그인 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayLoginCompanyCount" value="${weekDayLoginCompanyCount + statisticsList.loginCompanyCount  }"/>
				</c:if>
				<c:set var="totalLoginCompanyCount" value="${totalLoginCompanyCount + statisticsList.loginCompanyCount  }"/>	
				${statisticsList.loginCompanyCount } 명
			</td>
			<!-- 탈퇴 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayLeaveMember" value="${weekDayLeaveMember + statisticsList.leaveMember  }"/>
				</c:if>
				<c:set var="totalLeaveMember" value="${totalLeaveMember + statisticsList.leaveMember  }"/>	
				${statisticsList.leaveMember } 명
			</td>
			<!-- 메일수신 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayReceptionMail" value="${weekDayReceptionMail + statisticsList.receptionMail  }"/>
				</c:if>
				<c:set var="totalReceptionMail" value="${totalReceptionMail + statisticsList.receptionMail  }"/>	
				${statisticsList.receptionMail } 명
			</td>
			<!-- 메일거부 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayRefusalMail" value="${weekDayRefusalMail + statisticsList.refusalMail  }"/>
				</c:if>
				<c:set var="totalRefusalMail" value="${totalRefusalMail + statisticsList.refusalMail  }"/>
				${statisticsList.refusalMail } 명
			</td>
			<!-- 이메일 문의 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayMailInquery" value="${weekDayMailInquery + statisticsList.mailInquery  }"/>
				</c:if>
				<c:set var="totalMailInquery" value="${totalMailInquery + statisticsList.mailInquery  }"/>	
				${statisticsList.mailInquery } 명
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	 <tr class="first">
	 	<th>평일 평균</th>
	 	<td><numbers:RoundTag value="${weekDayJoinMember / weekDayLength}" type="half" digit="1"/> 명  </td>
	 	<td><numbers:RoundTag value="${weekDayJoinCompanyMember / weekDayLength}" type="half" digit="1"/> 명</td>
	 	<td><numbers:RoundTag value="${weekDayLoginCount / weekDayLength}" type="half" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag value="${weekDayLoginCompanyCount / weekDayLength}" type="half" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag value="${weekDayLeaveMember / weekDayLength}" type="half" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag value="${weekDayReceptionMail / weekDayLength}" type="half" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag value="${weekDayRefusalMail / weekDayLength}" type="half" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag value="${weekDayMailInquery / weekDayLength}" type="half" digit="1"/> 명 </td>
	 </tr>
	 <tr>
	 	<th>전체 평균</th>
	 	<td><numbers:RoundTag type="half" value="${totalJoinMember / statisticsLength}" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag type="half" value="${totalJoinCompanyMember / statisticsLength}" digit="1"/> 명</td>
	 	<td><numbers:RoundTag type="half" value="${totalLoginCount / statisticsLength}" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag type="half" value="${totalLoginCompanyCount / statisticsLength}" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag type="half" value="${totalLeaveMember / statisticsLength}" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag type="half" value="${totalReceptionMail / statisticsLength}" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag type="half" value="${totalRefusalMail / statisticsLength}" digit="1"/> 명 </td>
	 	<td><numbers:RoundTag type="half" value="${totalMailInquery / statisticsLength}" digit="1"/> 명 </td>
	 </tr>
	 <tr class="last">
	 	<th>합계</th>
	 	<td><fmt:formatNumber value="${totalJoinMember}" type="number"/> 명 </td>
	 	<td><fmt:formatNumber value="${totalJoinCompanyMember}" type="number"/> 명 </td>
	 	<td><fmt:formatNumber value="${totalLoginCount}" type="number"/> 명 </td>
	 	<td><fmt:formatNumber value="${totalLoginCompanyCount}" type="number"/> 명 </td>
	 	<td><fmt:formatNumber value="${totalLeaveMember}" type="number"/> 명 </td>
	 	<td><fmt:formatNumber value="${totalReceptionMail}" type="number"/> 명 </td>
	 	<td><fmt:formatNumber value="${totalRefusalMail}" type="number"/> 명 </td>
	 	<td><fmt:formatNumber value="${totalMailInquery}" type="number"/> 명 </td>
	 </tr>
	</tfoot>
	</c:if>
</table>
