<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/payment.js"></script>
 <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<div class="sub-content">
	<form id="paymentForm">
		 <div>
		   <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
		   <div style="clear:both;"></div>
		 </div>
        <table class="board-write box-pd">
	     <colgroup>
	       <col width="15%"/>
	       <col width="*"/>
	     </colgroup>
    	 <tbody>
    	 	<c:choose>
	    	 	 <c:when test="${paymentInfo.contractMasterKey > 0 }">
	    	 	 	<c:forEach  items="${userList }" var="user" varStatus="i">
		    	 	 <tr class="trUserId">
		    	 	   <th>회원 ID</th>
		    	 	   <td>${user.contractUserId}</td>
	    	 	 		</tr>
	    	 	 	</c:forEach>
	    	 	 </c:when>
	    	 	 <c:otherwise>
	    	 	 <tr class="trUserId">
	    	 	   <th>회원 ID</th>
	    	 	   <td>${paymentInfo.contractUserId}</td>
	    	 	 </tr>
	    	 	 </c:otherwise>
    	 	 </c:choose>
    	 	 <tr>
    	 	   <th>계약기간</th>
    	 	   <td>
	    	 	   <fmt:formatDate pattern="yyyy/MM/dd " value="${paymentInfo.contractStartDate }" /> ~
	    	 	   <fmt:formatDate pattern="yyyy/MM/dd " value="${paymentInfo.contractEndDate }" />
    	 	   </td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>계산서 발행일</th>
    	 	   <td><fmt:formatDate pattern="yyyy/MM/dd " value="${paymentInfo.contractBillPublicationDate }" /></td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>발행금액</th>
    	 	   <td><fmt:formatNumber value="${paymentInfo.contractTotalPrice }" type="number" pattern="##,###"/> 원</td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>결제방법</th>
    	 	   <td>${paymentInfo.contractPaymentMethod }</td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>기업명</th>
    	 	   <td>${paymentInfo.contractCompanyName }</td>
    	 	 </tr>
            <tr>
                <th>신청인</th>
                <td>${paymentInfo.contractApplicant}</td>
            </tr>
    	 	 <tr>
    	 	   <th>사업자등록번호</th>
    	 	   <td>${paymentInfo.contractCompanyNumber}</td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>신청상품</th>
    	 	   <td>${paymentInfo.contractProductName}</td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>적용티켓</th>
    	 	   <td>${paymentInfo.contractTicketAmount} 개</td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>유효기간</th>
    	 	   <td>
                   <fmt:formatDate value="${paymentInfo.ticketStartExpirationDate}" pattern="yyyy/MM/dd  HH:mm" var="toDay"/>
                   <fmt:formatDate value="${paymentInfo.ticketEndExpirationDate}" pattern="yyyy/MM/dd  HH:mm" var="lastDay"/>
                   ${toDay} ~ ${lastDay} </td>
    	 	 </tr>
    	 	 <c:if test="${paymentInfo.contractMasterKey > 0 }">
    	 	 <tr>
    	 	   <th>이용정지/해제</th>
    	 	   <td>${paymentInfo.contractStateText }</td>
    	 	 </tr>
    	 	 </c:if>
    	 	 <tr>
    	 	   <th>담당자</th>
    	 	   <td>${paymentInfo.contractOperatorName}</td>
    	 	 </tr>
    	 </tbody>
   	 </table>
   	<div class="btn-area">
   		<c:set var="message" value="관리자 권한으로 '${paymentInfo.contractMasterKey }' 계약을 종료합니다. 관련된 계정 전체의 이용이 해지되오니 주의 바랍니다."/>
    	<div class="floatL btn-bottom-orenge goListBtn">목록</div> 
			<div class="btn-bottom-orenge editBtn">계약수정</div>	    
			<div class="btn-bottom-orenge submitBtn" data-action="${contextPath }/admin/payment/rest/modifyContractState" data-message="${message }" data-type="ajax" data-id="${paymentInfo.contractMasterKey}">계약종료</div>	    
	  </div>
	</form>
</div>
<!-- 회원 검색 팝업 -->
<%@ include file="/WEB-INF/pages/views/popup/popupSearchUserId.jsp"%>
<script>
	$(function() {
		$(".goListBtn").click(function() {
			location.href = "${contextPath}/admin/payment/paymentContractList";
		});
		$(".editBtn").click(function() { 
			var key = '${paymentInfo.contractMasterKey}';
			location.href = "${contextPath }/admin/payment/paymentContractEdit?contractMasterKey="+key;
		});
	});
</script>