<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
<div id="cancelPaymentForm" style="display:none">
<form id="cancelForm">
	<input type="hidden" name="paymentMasterKey" value="${paymentInfo.paymentMasterKey }"/>
	<h3>
		결제번호 > 결제취소 
		<span class="cancelBtn"  onclick="javascript:popupUtils.popupClose('#cancelPaymentForm')">X</span>
	</h3>
	<div><span style="display:inline-block; width:80px">• 취소 담당자</span><input type="text" name="paymentCancelPerson" style="width:230px" value="${adminLoginSession.adminName}(${adminLoginSession.adminId})"/></div>
	<div><span style="display:inline-block; width:80px;vertical-align:top">• 취소 사유</span><textarea name="paymentCancelReason" style="width:220px">${paymentInfo.paymentCancelReason }</textarea></div>
	<div class="info">
		<p>※ 관리자단에서 결제취소는 CLAPP 사이트에서의 유료 상품을</p>
		<p style="padding-left:13px;">해제하는 기능이므로, 실 결제취소는 반드시 LG U플러스로</p>
		<p style="padding-left:13px;">접속하시어 해당 결제내역을 추가로 삭제해 주셔야 합니다.</p>
	</div>
	<div class="cancelBtnArea">
   	<div class="btn-bottom-orenge submitBtn" data-action="${contextPath}/admin/payment/rest/cancelPayment" data-msg="결제취소">결제취소</div> 
  </div>
</form>
</div>