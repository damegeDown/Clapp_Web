<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
$(function() {
	$(".excelDownloadBtn").click(function() {
		var url = "${contextPath }/excel/paymentContractReport";
		$("#searchForm").attr("action", url).submit();
	});
	$(".searchBtn").click(function() {
		$("#searchForm").attr("action", "").submit();
	});

});
</script>
<div class="sub-content">
  <div>
			<h3 class="contents-title floatL">${CommonCode.navigation }</h3>
			<div style="clear:both;"></div>
	</div>
	<div class="search-box">
		<form id="searchForm" action="">
		  <span style="margin:right:20px">검색일</span>
		  <input type="text" class="monthpicker inp-cal" name="searchValue" value="${paymentEntity.getSearchValue() }" style="vertical-align:middle; height:20px"/>
			<input type="button" class="btn searchBtn" value="검색"/>
		</form>
	</div>
  <div style="margin:5px; color:red">* 해당 월의 결제 완료된 웹 결제 통계를 보실 수 있습니다. 자세한 내역은 개별 계약 관리에서 확인하시기 바랍니다.</div>
  <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
  <c:set var="paymentDateLength" value="${paymentDateList.size() }"/>
  <!-- 일자별 -->
	<div style="width:100%;">
 		<h3 class="floatL" style="margin:15px 0 10px 0">일자별 개별계약 결제 통계</h3>
 		<input type="button" class="btn floatR excelDownloadBtn" value="엑셀 다운로드"/>
  </div>
	<table class="board-list-r">
		<thead> 
			<tr>
				<th class="al-center">일자</th>
				<th>건수(합)</th>
				<th>신청금액(합)</th>
				<th>VAT 제외 결제금액(합)</th>
				<th>VAT 포함 결제금액(합)</th>
			</tr>
		</thead>
		<c:if test="${paymentDateLength == 0 }">
			<tbody>
				<td colspan="5" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${paymentDateLength > 0}">
		<tbody>
		<c:forEach items="${paymentDateList }" var="paymentList" varStatus="i">
			<tr class="cursor" style="cursor:pointer;">
				<td class="al-center"><fmt:formatDate  pattern="yyyy/MM/dd " value="${paymentList.contractStartDate }" /></td>
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
	<table class="board-list-r">
		<thead> 
			<tr>
				<th class="al-center">상품명</th>
				<th>건수(합)</th>
				<th>신청금액(합)</th>
				<th>VAT 제외 결제금액(합)</th>
				<th>VAT 포함 결제금액(합)</th>
			</tr>
		</thead>
		<c:if test="${paymentDeviceLength == 0 }">
			<tbody>
				<td colspan="5" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${paymentDeviceLength > 0}">
		<tbody>
		<c:forEach items="${paymentDeviceList }" var="paymentList" varStatus="i">
			<tr class="cursor" style="cursor:pointer;">
				<td class="al-center">${paymentList.contractProductName }</td>
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
	<table class="board-list-r">
		<thead> 
			<tr>
				<th class="al-center">기업명</th>
				<th>건수(합)</th>
				<th>신청금액(합)</th>
				<th>VAT 제외 결제금액(합)</th>
				<th>VAT 포함 결제금액(합)</th>
			</tr>
		</thead>
		<c:if test="${paymentCompanyLength == 0 }">
			<tbody>
				<td colspan="5" class="al-center">조회한 내용이 없습니다.</td>
			</tbody>
		</c:if>
		<c:if test="${paymentCompanyLength > 0}">
		<tbody>
		<c:forEach items="${paymentCompanyList }" var="paymentList" varStatus="i">
			<tr class="cursor" style="cursor:pointer;">
				<td class="al-center">${paymentList.contractCompanyName }</td>
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
</div>