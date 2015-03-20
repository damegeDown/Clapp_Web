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
		<input type="hidden" name="contractTid" value="${paymentInfo.contractTid}" data-flag="off"/>
		<c:if test="${paymentInfo.contractMasterKey > 0}">
		<input type="hidden" name="contractMasterKey" value="${paymentInfo.contractMasterKey}" data-flag="off"/>
		</c:if>
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
		    	 	   <td> 
		    	 	     <input type="hidden" name="userMasterKeyArr" value="${user.userMasterKey }" data-flag="off" data-id="${i.index + 1 }"/>
		    	 	     <input type="text" name="contractUserIdArr" value="${user.contractUserId}" placeholder="회원으로 가입된 계정만 검색 가능" readonly data-id="${i.index + 1 }"/>
		    	 	     <input type="button" class="btn searchUserIdBtn" value="검색"/><input type="button" class="btn addUserIdBtn" value="+"/>
		    	 	     <c:if test="${i.index >= 1 }">
		    	 	     	<input type="button" class="btn removeUserIdBtn" value="-"/>
		    	 	     </c:if>
		    	 	   </td>
	    	 	 		</tr> 
	    	 	 	</c:forEach> 
	    	 	 </c:when>
	    	 	 <c:otherwise>
	    	 	 <tr class="trUserId">
	    	 	   <th>회원 ID</th>
	    	 	   <td>
	    	 	   	 <input type="hidden" name="userMasterKeyArr"   data-flag="off" data-id="${i.index + 1 }"/>
	    	 	     <input type="text" class="inp-w180" name="contractUserIdArr" value="${paymentInfo.contractUserId}" placeholder="회원으로 가입된 계정만 검색 가능" readonly data-id="1"/>
	    	 	     <input type="button" class="btn searchUserIdBtn" value="검색"/><input type="button" class="btn addUserIdBtn" value="+"/>
	    	 	   </td>
	    	 	 </tr>
	    	 	 </c:otherwise>
    	 	 </c:choose>
    	 	 <tr>
    	 	   <th>계약기간</th>
    	 	   <td>
    	 	   	<fmt:formatDate var="startDate" pattern="yyyy/MM/dd " value="${paymentInfo.contractStartDate }" />
    	 	   	<fmt:formatDate var="endDate" pattern="yyyy/MM/dd " value="${paymentInfo.contractEndDate }" />
    	 	   	<input type="text" name="contractStartDate" value="${startDate}" id="from"/> ~ 
    	 	   	<input type="text" name="contractEndDate" value="${endDate }" id="to"/>
    	 	   </td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>계산서 발행일</th>
    	 	   <td>
    	 	   		<fmt:formatDate var="publicationDate" pattern="yyyy/MM/dd " value="${paymentInfo.contractBillPublicationDate }" />
    	 	   		<input type="text" name="contractBillPublicationDate" value="${publicationDate }" class="datepicker" data-flag="off">
    	 	   </td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>발행금액</th>
    	 	   <td><input class="inp-w185" type="text" name="contractTotalPrice" value="${paymentInfo.contractTotalPrice }" placeholder="공급가액 + 부가가치세 포함 총 금액"/></td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>결제방법</th>
    	 	   <td><input type="text" class="inp-w160" name="contractPaymentMethod" value="${paymentInfo.contractPaymentMethod }" placeholder="계산서 청구일 기준 25일 결제"/></td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>기업명</th>
    	 	   <td><input type="text" name="contractCompanyName" id="tags" value="${paymentInfo.contractCompanyName }" placeholder="(주) 빼고 입력"/><div class="btn-bottom-orenge searchCompanyBtn">검색</div></td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>사업자등록번호</th>
    	 	   <td>
 					 <c:set var="companyNum" value="${fn:split(paymentInfo.contractCompanyNumber,'-')}"/>
          	 <input type="text" class="inp-w120 phoneNum" value="${companyNum[0]}" maxlength="3"/> - 
          	 <input type="text" class="inp-w80 phoneNum" value="${companyNum[1]}" maxlength="2"/> - 
          	 <input type="text" class="inp-w140 phoneNum" value="${companyNum[2]}" maxlength="5"/>
          	 <input type="hidden" class="phoneNumComp" name="contractCompanyNumber" value="${paymentInfo.contractCompanyNumber}"/>
					 </td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>신청상품</th>
    	 	   <td>
    	 	   <input type="hidden" name="contractProductName" value="${paymentInfo.contractProductName}"/>
    	 	   	<select class="sel-w180" name="productMasterKey">
		          <c:forEach items="${productInfo.productList }" var="code">
					<option value="${code.productMasterKey }" data-applyDate="${code.productExpirationDate }" <c:if test="${paymentInfo.productMasterKey eq code.productMasterKey }">selected</c:if>>${code.productName }</option>
				 </c:forEach>
	           </select>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>적용티켓</th>
    	 	   <td><input type="text" name="contractTicketAmount" value="${paymentInfo.contractTicketAmount}" placeholder="숫자만 입력" data-format="num"/> 개</td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>유효기간</th>
    	 	   <td><input type="text" name="contractExpirationDate" value="${paymentInfo.contractExpirationDate }" placeholder="숫자만 입력" data-format="num"/> 일 (상품별로 자동입력. 단, 별도 계약건의 경우 Monthly는 31일 기준 / Annual은 365일 로 지정)</td>
    	 	 </tr>
    	 	 <c:if test="${paymentInfo.contractMasterKey > 0 }">
    	 	 <tr>
    	 	   <th>이용정지/해제</th>
    	 	   <td>
    	 	     <label><input type="radio" name="contractState" value="2" data-flag="off" <c:if test="${paymentInfo.contractState == 2 }">checked</c:if>/> <span style="margin:0 20px 0 5px">이용정지</span> <input type="text" name="contaractUseStopReason" placeholder="정지 사유입력" data-flag="off"/></label>
    	 	     <label style="margin-left:30px"><input type="radio" name="contractState" value="3" data-flag="off" <c:if test="${paymentInfo.contractState == 3 }">checked</c:if>/> <span style="margin:0 20px 0 5px">이용해제</span> <input type="text" name="contaractUseCloseReason" placeholder="해제 사유입력" data-flag="off"/></label>
    	 	   	</td>
    	 	 </tr>
    	 	 </c:if>
    	 	 <tr>
    	 	   <th>담당자</th>
    	 	   <td><input type="text" name="contractOperatorName" value="${adminLoginSession.adminName}(${adminLoginSession.adminId})" readonly/></td>
    	 	 </tr>
    	 </tbody>
   	 </table>
   	<div class="btn-area">
    	<div class="floatL btn-bottom-orenge goListBtn">목록</div>
    	<c:choose>
    		<c:when test="${paymentInfo.contractMasterKey > 0 }">
					<div class="btn-bottom-orenge submitBtn" data-action="${contextPath }/admin/payment/rest/modifyContract" data-msg="계약수정">계약수정</div>	    
    		</c:when>
    		<c:otherwise>
    			<div class="btn-bottom-orenge submitBtn" data-action="${contextPath }/admin/payment/rest/insertContract" data-msg="계약등록">계약등록</div>
    		</c:otherwise>
    	</c:choose> 
    	<input type="reset" class="btn-bottom-gray" value="취소"/>
	  </div>
	</form>
</div>
<!-- 회원 검색 팝업 -->
<%@ include file="/WEB-INF/pages/views/popup/popupSearchUserId.jsp"%>
<script>
	$(function() {
	  var companyName = '${companyNameList}';
		companyName = companyName.replace("[", "").replace("]","").split(",");
		var tagsArr = [];
		for(var i = 0; i < companyName.length; i++) {
			tagsArr.push(companyName[i].trim());
		}
		var availableTags = tagsArr;
		$( "#tags" ).autocomplete({
			source: availableTags
		});
		$("select[name=productMasterKey]").change(function() {
			var productName = $("select option[value="+$(this).val()+"]").text();
			var applyDate = $("select option[value="+$(this).val()+"]").attr("data-applyDate");
			$("input[name=contractProductName]").val(productName);
			$("input[name=contractExpirationDate]").val(applyDate);
		});
	});
	$(function() {
		//회원 아이디 함수
		$.fn.Common.init();
	});
</script>