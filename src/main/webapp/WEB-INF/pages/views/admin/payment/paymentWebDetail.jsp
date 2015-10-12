<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="sub-content">
	<form id="paymentForm">
		 <div> 
		   <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
		   <div style="clear:both;"></div>
		 </div>
		 <%-- <c:if test="${companyDetail.userMasterKey ne null}">
	     <input type="hidden" name="userMasterKey" value="${companyDetail.userMasterKey }"/>
	   </c:if> --%>
	   <table class="board-list">
	     <colgroup>
	       <col width="15%"/>
	       <col width="15%"/>
	       <col width="15%"/>
	       <col width="*"/>
	       <col width="15%"/>
	       <col width="15%"/>
	     </colgroup>
	     <thead>
	     	 <tr>
	     		 <th>회원 ID</th>
	     		 <th>결제번호</th> 
	     		 <th>결제여부</th>
	     		 <th>결제일시</th>
	     		 <th>결제금액<br/>(vat제외, 원)</th>
	     		 <th>결제금액<br/>(vat포함, 원)</th>
     		 </tr>
	     </thead>
    	 <tbody>
    	 	 <tr>
    	 		 <td>${paymentInfo.paymentUserId }</td>
    	 		 <td>${paymentInfo.paymentOid }</td>
    	 		 <td>${paymentInfo.paymentStateText }</td>
    	 		 <td>
    	 		 		${paymentInfo.payDt}
    	 		 </td>
    	 		 <td><fmt:formatNumber value="${paymentInfo.paymentNotVatTotalPrice }" type="number"/></td>
    	 		 <td><fmt:formatNumber value="${paymentInfo.paymentTotalPrice }" type="number"/></td>
    	 	 </tr>
    	 </tbody>
   	 </table>
   	 <div> 
		   <h3 class="floatL part-title">> 신청상품 정보</h3>
		   <div style="clear:both;"></div>
		 </div>
   	 <table class="board-list">
	     <colgroup>
	       <col width="15%"/>
	       <col width="15%"/>
	     </colgroup>
	     <thead>
	     	 <tr>
	     		 <th>신청상품</th>
	     		 <th>시간</th>
     		 </tr>
	     </thead>
    	 <tbody>
    	 	 <tr>
    	 		 <td>${paymentInfo.paymentProductName }</td>
    	 		 <td>${paymentInfo.paymentTicketAmount * 5 } 분</td>
    	 	 </tr>
    	 </tbody>
   	 </table>
   	 <div> 
		   <h3 class="floatL part-title">> 상세정보</h3>
		   <div style="clear:both;"></div>
		 </div>
   	 <table class="board-list">
	     <colgroup>
	       <col width="20%"/>
	       <col width="20%"/>
	       <col width="20%"/>
	       <col width="20%"/>
	       <col width="20%"/>
	     </colgroup>
	     <thead>
	     	 <tr>
	     		 <th>결제번호</th>
	     		 <th>전표/영수증 보기</th>
	     		 <th>승인일시</th>
	     		 <th>승인번호</th>
	     		 <th>실 결제금액</th>
     		 </tr>
	     </thead>
    	 <tbody>
    	 	 <tr>
    	 		 <td>${paymentInfo.paymentOid }</td>
    	 		 <td><input type="button" value="전표보기"/></td>
    	 		 <td>${paymentInfo.payDt }</td>
    	 		 <td>${paymentInfo.paymentTid }</td>
    	 		 <td><fmt:formatNumber value="${paymentInfo.paymentTotalPrice }" type="number"/></td>
    	 	 </tr>
    	 </tbody>
   	 </table>
   	 <c:if test="${paymentInfo.payTypeCd eq  'SC0010' }" >
   	 <!-- 신용카드 결제 -->
   	 <table class="board-list" style="margin-top:10px;">
	     <colgroup>
	       <col width="*"/>
	       <col width="15%"/>
	       <col width="15%"/>
	       <col width="15%"/>
	       <col width="15%"/>
	     </colgroup>
	     <thead>
	     	 <tr>
	     		 <th>신용카드</th>
	     		 <th>할부기간</th>
	     		 <th>신용카드사코드</th>
	     		 <th>입금은행</th>
	     		 <th>결제자명</th>
     		 </tr>
	     </thead>
    	 <tbody>
    	 	 <tr>
    	 		 <td>${paymentInfo.paymentCardNumber }</td>
    	 		 <td>${paymentInfo.cardInstallMonth }</td>
    	 		 <td>${paymentInfo.cardAcquirer }</td>
    	 		 <td>${paymentInfo.financeName }</td>
    	 		 <td>${paymentInfo.buyer }</td>
    	 	 </tr>
    	 </tbody>
   	 </table>
   	 </c:if>
   	 <c:if test="${paymentInfo.payTypeCd eq  'SC0040' }" >
   	 <div> 
		   <h3 class="floatL part-title">> 세금계산서 발행여부(가상계좌 입금완료분, 영수처리만 해당)</h3>
		   <div style="clear:both;"></div>
		 </div>
   	 <table class="board-list">
	     <colgroup>
	       <col width="15%"/>
	       <col width="15%"/>
	       <col width="20%"/>
	       <col width="*"/>
	     </colgroup>
	     <thead>
	     	 <tr>
	     		 <th>상태</th>
	     		 <th>발행일</th>
	     		 <th>수신 이메일주소</th>
	     		 <th>메모</th>
     		 </tr>
	     </thead>
    	 <tbody>
    	 	 <tr>
    	 		 <td>${paymentInfo.cashReceiptSelfYn }</td>
    	 		 <td>
    	 		   <c:choose>
	    	 		   <c:when test="${paymentInfo.paymentBillPublicationDate eq null }">
	    	 		     <input type="button" class="submitBtn" value="발행처리" data-type="ajax" data-id="${paymentInfo.paymentMasterKey }" data-msg="발행처리" data-action="${contextPath}/admin/payment/rest/insertRequestBill"/>
	    	 		   </c:when>
	    	 		   <c:otherwise>
	    	 		 		 ${paymentInfo.paymentBillPublicationDate }
	    	 		 	 </c:otherwise>
    	 		 	 </c:choose>
    	 		 </td>
    	 		 <td>${paymentInfo.paymentBillEmail }</td>
    	 		 <td>${paymentInfo.paymentBillMemo }</td>
    	 	 </tr>
    	 </tbody>
   	 </table>
   	 </c:if>
   	 <div> 
		   <h3 class="floatL part-title">> 결제관련 로그정보</h3>
		   <div style="clear:both;"></div>
		 </div>
   	 <table class="board-list">
	     <colgroup>
	       <col width="20%"/>
	       <col width="15%"/>
	       <col width="*"/>
	     </colgroup>
	     <thead>
	     	 <tr>
	     		 <th>로그출력일시</th>
	     		 <th>로그코드</th>
	     		 <th>메시지</th>
     		 </tr>
	     </thead>
    	 <tbody>
    	 	<c:forEach var="logs" items="${paymentInfo.paymentList }" varStatus="i">
    	 	 <tr>
    	 		 <td><fmt:formatDate value="${logs.insertLogsDate }" pattern="yyyy-MM-dd HH:mm"/> </td>
    	 		 <td>${logs.logsCode }</td>
    	 		 <td>${logs.logsMessage }</td>
    	 	 </tr>
   	 	 </c:forEach>
    	 </tbody>
   	 </table>
   	<div class="btn-area">
    	<div class="floatL btn-bottom-orenge goListBtn">목록</div>
			<div class="floatR btn-bottom-orenge cancelPaymentBtn">결제취소</div>	    
	  </div>
	</form>
</div>
<!-- 결제취소 팝업 -->
<%@ include file="/WEB-INF/pages/views/popup/popupCancelPayment.jsp"%>
<script>
	$(function() {
		$(".goListBtn").click(function() {
			history.back(-1);
		});
		$("form").delegate(".cancelPaymentBtn", "click", function() {
			disableScreen("#cancelPaymentForm");
		});
		$(".cancelBtn").click(function() {
			enableScreen("#cancelPaymentForm");
		});
		$(".billBtn").click(function() {
			enableScreen("#cancelPaymentForm");
		});
	});
</script>