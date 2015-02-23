<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="statisticsLength" value="${statisticsEntity.statisticsList.size() }"/>
<h3 class="floatL" >> 수시 발송용 / 타켓 메일</h3>
<table class="board-list" style="width:1200px">
	<thead> 
		<tr>
			<th rowspan="2">날짜(요일)\메일분류</th>
			<th colspan="12">수시 발송용</th>
			<th colspan="3">타켓 메일</th>
		</tr>
		<tr>
			<th>일반가입</th>  
			<th>기업/단체<br/>가입</th>
			<th>회원탈퇴</th>
			<th>임시<br/>비번발송</th>
			<th>유료<br/>(신용,핸드폰)</th>
			<th>유료<br/>(가상계좌)</th>
			<th>결제취소</th>
			<th>계좌입금<br/>기한종료</th>
			<th>JNLP<br/>공유</th>
			<th>JNLP<br/>예약</th>
			<th>JNLP<br/>예약변경</th>
			<th>JNLP<br/>예약취소</th>
			<th>전체</th>
			<th>일반</th>
			<th>기업/단체</th>
		</tr>
	</thead>
	<c:if test="${statisticsLength == 0 }">
		<tbody>
			<td colspan="16">조회한 내용이 없습니다.</td>
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
			<td><fmt:formatDate pattern="yyyy/MM/dd " value="${statisticsList.statisticsDate}" /> <br/>(${statisticsList.dayName })</td> 
			<!-- 일반가입 -->
			<td> 
				<c:if test="${statisticsList.dayOfWeek < 5 }">
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
			<!-- 회원탈퇴 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayLeaveMember" value="${weekDayLeaveMember + statisticsList.leaveMember  }"/>
				</c:if>
				<c:set var="totalLeaveMember" value="${totalLeaveMember + statisticsList.leaveMember  }"/>	
				${statisticsList.leaveMember } 명
			</td>
			<!-- 임시 비번발송 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayTempPassword" value="${weekDayTempPassword + statisticsList.tempPassword  }"/>
				</c:if>
				<c:set var="totalTempPassword" value="${totalTempPassword + statisticsList.tempPassword  }"/>	
				${statisticsList.tempPassword } 명
			</td>
			<!-- 유료(신용,핸드폰) -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayPayCredit" value="${weekDayPayCredit + statisticsList.payCredit  }"/>
				</c:if>
				<c:set var="totalPayCredit" value="${totalPayCredit + statisticsList.payCredit  }"/>	
				${statisticsList.payCredit } 명
			</td>
			<!-- 유료(가상계좌) -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayPayVirtuarAccount" value="${weekDayPayVirtuarAccount + statisticsList.payVirtuarAccount  }"/>
				</c:if>
				<c:set var="totalPayVirtuarAccount" value="${totalPayVirtuarAccount + statisticsList.payVirtuarAccount  }"/>	
				${statisticsList.payVirtuarAccount } 명
			</td>
			<!-- 결제취소 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayRevokePayment" value="${weekDayRevokePayment + statisticsList.revokePayment  }"/>
				</c:if>
				<c:set var="totalRevokePayment" value="${totalRevokePayment + statisticsList.revokePayment  }"/>
				${statisticsList.revokePayment } 명
			</td>
			<!-- 계좌입금 기한종료 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayDepositTimeOut" value="${weekDayDepositTimeOut + statisticsList.depositTimeOut  }"/>
				</c:if>
				<c:set var="totalDepositTimeOut" value="${totalDepositTimeOut + statisticsList.depositTimeOut  }"/>	
				${statisticsList.depositTimeOut } 명
			</td>
			<!-- jnlp 공유 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayJnlpSync" value="${weekDayJnlpSync + statisticsList.jnlpSync  }"/>
				</c:if>
				<c:set var="totalJnlpSync" value="${totalJnlpSync + statisticsList.jnlpSync  }"/>	
				${statisticsList.jnlpSync } 명
			</td>
			<!-- jnlp 예약  -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayJnlpReservation" value="${weekDayJnlpReservation + statisticsList.jnlpReservation  }"/>
				</c:if>
				<c:set var="totalJnlpReservation" value="${totalJnlpReservation + statisticsList.jnlpReservation  }"/>	
				${statisticsList.jnlpReservation } 명
			</td>
			<!-- jnlp 예약변경 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayJnlpModifyReservation" value="${weekDayJnlpModifyReservation + statisticsList.jnlpModifyReservation  }"/>
				</c:if>
				<c:set var="totalJnlpModifyReservation" value="${totalJnlpModifyReservation + statisticsList.jnlpModifyReservation  }"/>	
				${statisticsList.jnlpModifyReservation } 명
			</td>
			<!-- jnlp 예약취소 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayJnlpCancleReservation" value="${weekDayJnlpCancleReservation + statisticsList.jnlpCancleReservation  }"/>
				</c:if>
				<c:set var="totalJnlpCancleReservation" value="${totalJnlpCancleReservation + statisticsList.jnlpCancleReservation  }"/>	
				${statisticsList.jnlpCancleReservation } 명
			</td>
			<!-- 전체 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayTargetAll" value="${weekDayTargetAll + statisticsList.targetAll  }"/>
				</c:if>
				<c:set var="totalTargetAll" value="${totalTargetAll + statisticsList.targetAll  }"/>	
				${statisticsList.targetAll } 명
			</td>
			<!-- 일반 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayTargetGeneral" value="${weekDayTargetGeneral + statisticsList.targetGeneral  }"/>
				</c:if>
				<c:set var="totalTargetGeneral" value="${totalTargetGeneral + statisticsList.targetGeneral  }"/>	
				${statisticsList.targetGeneral } 명
			</td>
			<!-- 기업/단체용 -->
			<td>
				<c:if test="${statisticsList.dayOfWeek < 5 }">
					<c:set var="weekDayTargetCompany" value="${weekDayTargetCompany + statisticsList.targetCompany  }"/>
				</c:if>
				<c:set var="totalTargetCompany" value="${totalTargetCompany + statisticsList.targetCompany  }"/>	
				${statisticsList.targetCompany } 명
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	 <tr class="first">
		 	<th>평일 평균</th>
		 	<td>
		 		<!-- 일반가입 -->
		 		<c:set var="aveWeekDayJoinMember" value="${weekDayJoinMember / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayJoinMember}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 기업/단체 가입 -->
		 		<c:set var="aveWeekDayJoinCompanyMember" value="${weekDayJoinCompanyMember / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayJoinCompanyMember}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 회원탈퇴 -->
		 		<c:set var="aveWeekDayLeaveMember" value="${weekDayLeaveMember / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayLeaveMember}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 임시비번 발송 -->
		 		<c:set var="aveWeekDayTempPassword" value="${weekDayTempPassword / statisticsLength }"/>
		 		<numbers:RoundTag value="${weekDayTempPassword}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 유료(신용/핸드폰) -->
		 		<c:set var="aveWeekDayPayCredit" value="${weekDayPayCredit / statisticsLength }"/>
		 		<numbers:RoundTag value="${weekDayPayCredit}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 유료(가상계좌) -->
		 		<c:set var="aveWeekDayPayVirtuarAccount" value="${weekDayPayVirtuarAccount / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayPayVirtuarAccount}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 결제취소  -->
		 		<c:set var="aveWeekDayRevokePayment" value="${weekDayRevokePayment / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayPayVirtuarAccount}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 계좌 입금 기한 종료   -->
		 		<c:set var="aveWeekDayDepositTimeOut" value="${weekDayDepositTimeOut / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayDepositTimeOut}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- jnlp 공유  -->
		 		<c:set var="aveWeekDayJnlpSync" value="${weekDayJnlpSync / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayJnlpSync}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- jnlp 예약  -->
		 		<c:set var="aveWeekDayJnlpReservation" value="${weekDayJnlpReservation / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayJnlpReservation}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!--  jnlp 예약 변경 -->
		 		<c:set var="aveWeekDayJnlpModifyReservation" value="${weekDayJnlpModifyReservation / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayJnlpModifyReservation}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- jnlp 예약 취소  -->
		 		<c:set var="aveWeekDayJnlpCancleReservation" value="${weekDayJnlpCancleReservation / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayJnlpCancleReservation}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 타켓 전체  -->
		 		<c:set var="aveWeekDayTargetAll" value="${weekDayTargetAll / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayTargetAll}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 타켓 일반  -->
		 		<c:set var="aveWeekDayTargetGeneral" value="${weekDayTargetGeneral / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayTargetGeneral}" type="half" digit="1"/> 명
		 	</td>
		 	<td>
		 		<!-- 타켓 기업/단체  -->
		 		<c:set var="aveWeekDayTargetCompany" value="${weekDayTargetCompany / statisticsLength }"/>
		 		<numbers:RoundTag value="${aveWeekDayTargetCompany}" type="half" digit="1"/> 명
		 	</td>
		 </tr>
		 <tr>
		 	<th>전체 평균</th>
			 	<td>
			 		<!-- 일반가입 -->
			 		<c:set var="aveTotalJoinMember" value="${totalJoinMember / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalJoinMember}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 기업/단체 가입 -->
			 		<c:set var="aveTotalJoinCompanyMember" value="${totalJoinCompanyMember / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalJoinCompanyMember}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 회원탈퇴 -->
			 		<c:set var="aveTotalLeaveMember" value="${totalLeaveMember / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalLeaveMember}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 임시비번 발송 -->
			 		<c:set var="aveTotalTempPassword" value="${totalTempPassword / statisticsLength }"/>
			 		<numbers:RoundTag value="${TotalTempPassword}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 유료(신용/핸드폰) -->
			 		<c:set var="aveTotalPayCredit" value="${totalPayCredit / statisticsLength }"/>
			 		<numbers:RoundTag value="${TotalPayCredit}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 유료(가상계좌) -->
			 		<c:set var="aveTotalPayVirtuarAccount" value="${totalPayVirtuarAccount / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalPayVirtuarAccount}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 결제취소  -->
			 		<c:set var="aveTotalRevokePayment" value="${totalRevokePayment / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalPayVirtuarAccount}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 계좌 입금 기한 종료   -->
			 		<c:set var="aveTotalDepositTimeOut" value="${TotalDepositTimeOut / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalDepositTimeOut}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- jnlp 공유  -->
			 		<c:set var="aveTotalJnlpSync" value="${totalJnlpSync / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalJnlpSync}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- jnlp 예약  -->
			 		<c:set var="aveTotalJnlpReservation" value="${totalJnlpReservation / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalJnlpReservation}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!--  jnlp 예약 변경 -->
			 		<c:set var="aveTotalJnlpModifyReservation" value="${totalJnlpModifyReservation / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalJnlpModifyReservation}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- jnlp 예약 취소  -->
			 		<c:set var="aveTotalJnlpCancleReservation" value="${totalJnlpCancleReservation / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalJnlpCancleReservation}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 타켓 전체  -->
			 		<c:set var="aveTotalTargetAll" value="${totalTargetAll / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalTargetAll}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 타켓 일반  -->
			 		<c:set var="aveTotalTargetGeneral" value="${totalTargetGeneral / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalTargetGeneral}" type="half" digit="1"/> 명
			 	</td>
			 	<td>
			 		<!-- 타켓 기업/단체  -->
			 		<c:set var="aveTotalTargetCompany" value="${totalTargetCompany / statisticsLength }"/>
			 		<numbers:RoundTag value="${aveTotalTargetCompany}" type="half" digit="1"/> 명
			 	</td>
		 </tr>
		 <tr class="last">
		 	<th>합계</th>
			<td>
		 		<!-- 일반가입 -->
		 		${ totalJoinMember} 명
		 	</td>
		 	<td>
		 		<!-- 기업/단체 가입 -->
		 		${ totalJoinCompanyMember} 명
		 	</td>
		 	<td>
		 		<!-- 회원탈퇴 -->
		 		${ totalLeaveMember} 명
		 	</td>
		 	<td>
		 		<!-- 임시비번 발송 -->
		 		${ totalTempPassword} 명
		 	</td>
		 	<td>
		 		<!-- 유료(신용/핸드폰) -->
		 		${ totalPayCredit} 명
		 	</td>
		 	<td>
		 		<!-- 유료(가상계좌) -->
		 		${ totalPayVirtuarAccount} 명
		 	</td>
		 	<td>
		 		<!-- 결제취소  -->
		 		${ totalRevokePayment} 명
		 	</td>
		 	<td>
		 		<!-- 계좌 입금 기한 종료   -->
		 		${ totalDepositTimeOut} 명
		 	</td>
		 	<td>
		 		<!-- jnlp 공유  -->
		 		${ totalJnlpSync} 명
		 	</td>
		 	<td>
		 		<!-- jnlp 예약  -->
		 		${ totalJnlpReservation} 명
		 	</td>
		 	<td>
		 		<!--  jnlp 예약 변경 -->
		 		${ totalJnlpModifyReservation} 명
		 	</td>
		 	<td>
		 		<!-- jnlp 예약 취소  -->
		 		${ totalJnlpCancleReservation} 명
		 	</td>
		 	<td>
		 		<!-- 타켓 전체  -->
		 		${ totalTargetAll} 명
		 	</td>
		 	<td>
		 		<!-- 타켓 일반  -->
		 		${ totalTargetGeneral} 명
		 	</td>
		 	<td>
		 		<!-- 타켓 기업/단체  -->
		 		${ totalTargetCompany} 명
		 	</td>
		 </tr>
		</tfoot>
		</c:if>
</table>
