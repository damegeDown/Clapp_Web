<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="paymentDateLength" value="${paymentDateList.size() }"/>
<!-- 일자별 -->
<div style="width:100%;">
	<h3 class="floatL" style="margin:15px 0 10px 0">일자별 개별계약 결제 통계</h3>
</div>
<table class="board-list">
	<thead> 
		<tr>
			<th>일자</th>
			<th>건수(합)</th>
			<th>신청금액(합)</th>
			<th>VAT 제외 결제금액(합)</th>
			<th>VAT 포함 결제금액(합)</th>
		</tr>
	</thead>
	<c:if test="${paymentDateLength == 0 }">
		<tbody>
			<td colspan="5">조회한 내용이 없습니다.</td>
		</tbody>
	</c:if>
	<c:if test="${paymentDateLength > 0}">
	<tbody>
	<c:forEach items="${paymentDateList }" var="paymentList" varStatus="i">
		<tr class="cursor" style="cursor:pointer;">
			<td>${paymentList.contractStartDate }</td>
			<td>
				<c:set var="sumPaymentDateCount" value="${sumPaymentDateCount + paymentList.paymentCount }"/>
				<fmt:formatNumber value="${paymentList.paymentCount }" type="number"/>
			</td>
			<td>
				<c:set var="sumPaymentDateTotalPrice" value="${sumPaymentDateTotalPrice + paymentList.contractTotalPrice }"/>
				<fmt:formatNumber value="${paymentList.contractTotalPrice }" type="number"/>
			</td>
			<td>
			  <c:set var="sumPaymentDateNotVatTotalPrice" value="${sumPaymentDateNotVatTotalPrice + paymentList.contractNotVatTotalPrice }"/>
				<fmt:formatNumber value="${paymentList.contractNotVatTotalPrice }" type="number"/>
			</td>
			<td>
				<fmt:formatNumber value="${paymentList.contractTotalPrice }" type="number"/>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot> 
	 <tr class="last">
	 		<td>합계</td>
	 		<td><fmt:formatNumber value="${sumPaymentDateCount }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentDateTotalPrice }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentDateNotVatTotalPrice }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentDateTotalPrice }" type="number"/></td>
	 </tr>
	</tfoot>
	</c:if>
</table>
<!-- 상품별 -->
<div style="width:100%;">
		<h3 class="floatL" style="margin:15px 0 10px 0">상품별 개별계약 결제 통계</h3>
 </div>
<c:set var="paymentDeviceLength" value="${paymentDeviceList.size() }"/>
<table class="board-list">
	<thead> 
		<tr>
			<th>상품명</th>
			<th>건수(합)</th>
			<th>신청금액(합)</th>
			<th>VAT 제외 결제금액(합)</th>
			<th>VAT 포함 결제금액(합)</th>
		</tr>
	</thead>
	<c:if test="${paymentDeviceLength == 0 }">
		<tbody>
			<td colspan="5">조회한 내용이 없습니다.</td>
		</tbody>
	</c:if>
	<c:if test="${paymentDeviceLength > 0}">
	<tbody>
	<c:forEach items="${paymentDeviceList }" var="paymentList" varStatus="i">
		<tr class="cursor" style="cursor:pointer;">
			<td>${paymentList.contractProductName }</td>
			<td>
				<c:set var="sumPaymentDeviceCount" value="${sumPaymentDeviceCount + paymentList.paymentCount }"/>
				<fmt:formatNumber value="${paymentList.paymentCount }" type="number"/>
			</td>
			<td>
				<c:set var="sumPaymentDeviceTotalPrice" value="${sumPaymentDeviceTotalPrice + paymentList.contractTotalPrice }"/>
				<fmt:formatNumber value="${paymentList.contractTotalPrice }" type="number"/>
			</td>
			<td>
			  <c:set var="sumPaymentDeviceNotVatTotalPrice" value="${sumPaymentDeviceNotVatTotalPrice + paymentList.contractNotVatTotalPrice }"/>
				<fmt:formatNumber value="${paymentList.contractNotVatTotalPrice }" type="number"/>
			</td>
			<td>
				<fmt:formatNumber value="${paymentList.contractTotalPrice }" type="number"/>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot> 
	 <tr class="last">
	 		<td>합계</td>
	 		<td><fmt:formatNumber value="${sumPaymentDeviceCount }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentDeviceTotalPrice }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentDeviceNotVatTotalPrice }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentDeviceTotalPrice }" type="number"/></td>
	 </tr>
	</tfoot>
	</c:if>
</table>
<!-- 기업명 방법별 -->
<div style="width:100%;">
		<h3 class="floatL" style="margin:15px 0 10px 0">기업명별 개별계약 결제 통계</h3>
 </div>
<c:set var="paymentCompanyLength" value="${paymentCompanyList.size() }"/>
<table class="board-list">
	<thead> 
		<tr>
			<th>기업명</th>
			<th>건수(합)</th>
			<th>신청금액(합)</th>
			<th>VAT 제외 결제금액(합)</th>
			<th>VAT 포함 결제금액(합)</th>
		</tr>
	</thead>
	<c:if test="${paymentCompanyLength == 0 }">
		<tbody>
			<td colspan="5">조회한 내용이 없습니다.</td>
		</tbody>
	</c:if>
	<c:if test="${paymentCompanyLength > 0}">
	<tbody>
	<c:forEach items="${paymentCompanyList }" var="paymentList" varStatus="i">
		<tr class="cursor" style="cursor:pointer;">
			<td>${paymentList.contractCompanyName }</td>
			<td>
				<c:set var="sumPaymentTypeCount" value="${sumPaymentTypeCount + paymentList.paymentCount }"/>
				<fmt:formatNumber value="${paymentList.paymentCount }" type="number"/>
			</td>
			<td>
				<c:set var="sumPaymentTypeTotalPrice" value="${sumPaymentTypeTotalPrice + paymentList.contractTotalPrice }"/>
				<fmt:formatNumber value="${paymentList.contractTotalPrice }" type="number"/>
			</td>
			<td>
			  <c:set var="sumPaymentTypeNotVatTotalPrice" value="${sumPaymentTypeNotVatTotalPrice + paymentList.contractNotVatTotalPrice }"/>
				<fmt:formatNumber value="${paymentList.contractNotVatTotalPrice }" type="number"/>
			</td>
			<td>
				<fmt:formatNumber value="${paymentList.contractTotalPrice }" type="number"/>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot> 
	 <tr class="last">
	 		<td>합계</td>
	 		<td><fmt:formatNumber value="${sumPaymentTypeCount }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentTypeTotalPrice }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentTypeNotVatTotalPrice }" type="number"/></td>
	 		<td><fmt:formatNumber value="${sumPaymentTypeTotalPrice }" type="number"/></td>
	 </tr>
	</tfoot>
	</c:if>
</table>
