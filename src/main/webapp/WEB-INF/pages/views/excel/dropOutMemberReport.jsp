<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="numbers" uri="/WEB-INF/tlds/Numbers.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dropOutLength" value="${dropOutList.size() }"/>
<c:set var="reasonLength" value="${dropOutReasonList.size() }"/>
<div class="floatL">> 탈퇴회원</div>
<table class="board-list" style="width:600px">
<colgroup>
		<col width="50%"/>
		<col width="50%"/>
	</colgroup>
	<thead> 
		<tr>
			<th>년 / 월</th>  
			<th>탈퇴 회원수</th>
		</tr>
	</thead>
	<c:if test="${dropOutLength == 0 }">
		<tbody>
			<td colspan="2">조회한 내용이 없습니다.</td>
		</tbody>
	</c:if>
	<c:if test="${dropOutLength > 0}">
	<tbody>
	<c:forEach items="${dropOutList }" var="dropOutList" varStatus="i">
		<tr class="cursor" style="cursor:pointer; ">
            <td><fmt:formatDate pattern="yyyy–MM" value="${dropOutList.dropOutDate }" /></td>
			<!-- 일반가입 -->
			<td> 
				${dropOutList.dropOutCount } 명
				<c:set var="sumDropOutCount" value="${sumDropOutCount + dropOutList.dropOutCount }"/>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	 <tr class="first">
	 	<th>평균</th>
	 	<td><fmt:formatNumber value="${sumDropOutCount  / dropOutLength}" type="number"/> 명  </td>
	 </tr>
	 <tr class="last">
	 	<th>합계</th>
	 	<td><fmt:formatNumber value="${sumDropOutCount}" type="number"/> 명 </td>
	 </tr>
	</tfoot>
	</c:if>
</table>
<br/>
<div class="floatL" >> 탈퇴 사유별</div>
<table class="board-list" style="width:600px">
	<thead> 
		<tr>
			<th>탈퇴 사유별</th>  
			<th>건 수</th>
		</tr>
	</thead>
	<c:if test="${reasonLength == 0 }">
		<tbody>
			<td colspan="2">조회한 내용이 없습니다.</td>
		</tbody>
	</c:if>
	<c:if test="${reasonLength > 0}">
	<tbody>
	<c:forEach items="${dropOutReasonList }" var="reasonList" varStatus="i">
		<tr class="cursor" style="cursor:pointer; ">
			<td>${reasonList.dropOutReason }</td> 
			<!-- 일반가입 -->
			<td> 
				 ${reasonList.dropOutCount } 건
				 <c:set var="sumDropOutReasonCount" value="${sumDropOutReasonCount + reasonList.dropOutCount }"/>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	 <tr class="first">
	 	<th>평균</th>
	 	<td><numbers:RoundTag value="${sumDropOutReasonCount  / reasonLength}" type="half" digit="1"/> 명  </td>
	 </tr>
	 <tr class="last">
	 	<th>합계</th>
	 	<td><fmt:formatNumber value="${sumDropOutReasonCount}" type="number"/> 명  </td>
	 </tr>
	</tfoot>
	</c:if>
</table>
