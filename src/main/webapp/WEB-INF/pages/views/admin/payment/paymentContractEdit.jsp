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
                   <span>(계약기간은 과금개시일부터 서비스 종료일까지 입니다.)</span>
    	 	   </td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>계산서 발행일(=과금개시일)</th>
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
    	 	   <td><input type="text" class="inp-w190" name="contractPaymentMethod" value="${paymentInfo.contractPaymentMethod }" placeholder="무통장 입금"/>
                    <span>계산서 발행일로부터 15일 이내 입금</span>
               </td>
    	 	 </tr>
    	 	 <tr>
    	 	   <th>기업명</th>
    	 	   <td>
                   <input type="text" name="contractCompanyName" id="tags" value="${paymentInfo.contractCompanyName }" placeholder="(주) 빼고 입력"/>
                   <div class="btn-bottom-orenge searchCompanyBtn">검색</div>
                   <span>(추후 검색 DB로 활용하기 위해서 정확하게 입력해 주시기 바랍니다.)</span>
               </td>
    	 	 </tr>
            <tr>
                <th>신청인명(담당자)</th>
                <td><input type="text" name="contractApplicant" class="inp-w100" value="${paymentInfo.contractApplicant }"/></td>
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
                    <option value="">상품</option>
		          <c:forEach items="${productInfo.productList }" var="code">
                      <c:if test="${code.productMasterKey >= 9}">
					    <option value="${code.productMasterKey }" data-applyDate="${code.productExpirationDate }" data-ticketAmount="${code.productTicketAmount}" <c:if test="${paymentInfo.contractProductName eq code.productName }">selected</c:if>>${code.productName }</option>
                      </c:if>
				 </c:forEach>
	           </select>
    	 	 </tr>
            <tr>
                <th>유효기간</th>
                <td>
                    <%--<input type="text" name="contractExpirationDate" value="${paymentInfo.contractExpirationDate }" placeholder="숫자만 입력" data-format="num"/> 일 (상품별로 자동입력. 단, 별도 계약건의 경우 Monthly는 31일 기준 / Annual은 365일 로 지정)--%>
                        <jsp:useBean id="toDay" class="java.util.Date" />
                        <fmt:formatDate value="${toDay}" pattern="yyyy/MM/dd  HH:mm" var="toDay"/>
                        <c:set value="" var="lastDay"/>
                        <c:if test="${paymentInfo.contractMasterKey > 0}">
                            <fmt:formatDate value="${paymentInfo.ticketStartExpirationDate}" pattern="yyyy/MM/dd  HH:mm" var="toDay"/>
                            <fmt:formatDate value="${paymentInfo.ticketEndExpirationDate}" pattern="yyyy/MM/dd  HH:mm" var="lastDay"/>
                        </c:if>
                    <input type="text" value="${toDay }" class="datetimepicker" name="ticketStartExpirationDate" data-flag="off"> ~
                    <input type="text" class="datetimepicker" value="${lastDay}" name="ticketEndExpirationDate" data-flag="off">
                </td>
            </tr>
    	 	 <tr>
    	 	   <th>적용시간</th>
    	 	   <td>
                   <input type="text" name="contractTicketAmount_h" value="${paymentInfo.contractTicketAmount*5}" readonly />분
                   <input type="hidden" name="contractTicketAmount" value="${paymentInfo.contractTicketAmount}" placeholder="숫자만 입력" data-format="num" />
               </td>
    	 	 </tr>
    	 	 <c:if test="${paymentInfo.contractMasterKey > 0 }">
    	 	 <tr>
    	 	   <th>이용정지/해제</th>
    	 	   <td>
                   <label><input type="radio" name="contractState" value="1" data-flag="off" <c:if test="${paymentInfo.contractState eq '1' }">checked</c:if>/> <span style="margin:0 20px 0 5px">이용중</span></label>
                   <label><input type="radio" name="contractState" value="2" data-flag="off" <c:if test="${paymentInfo.contractState eq '2' }">checked</c:if>/> <span style="margin:0 20px 0 5px">이용정지</span> <input type="text" name="contractUseStopReason" placeholder="정지 사유입력" value="${paymentInfo.contractUseStopReason}" data-flag="off"/></label>
    	 	     <label style="margin-left:30px"><input type="radio" name="contractState" value="3" data-flag="off" <c:if test="${paymentInfo.contractState eq '3' }">checked</c:if>/> <span style="margin:0 20px 0 5px">이용해제</span> <input type="text" name="contractUseCloseReason" value="${paymentInfo.contractUseCloseReason}" placeholder="해제 사유입력" data-flag="off"/></label>
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
            <c:when test="${paymentInfo.contractMasterKey > 0 && reContract eq 1}">
                <div class="btn-bottom-orenge submitBtn" data-action="${contextPath }/admin/payment/rest/insertContract" data-msg="재계약등록">재계약 등록</div>
            </c:when>
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
        $("input[name=ticketStartExpirationDate]").change(function() {
           var toDay = '${toDay}';
           var thisDay = $(this).val();
            var diffDay = fn_calcDayMonthCount(toDay, thisDay,'D');
            if(diffDay < 0) {
                alert("현재 시점보다 과거를 선택하실수 없습니다.");
                $(this).val(toDay);
                return false;
            }
        });
		$("select[name=productMasterKey]").change(function() {
			var productName = $("select option[value="+$(this).val()+"]").text();
			var applyDate = $("select option[value="+$(this).val()+"]").attr("data-applyDate");
            var ticketAmount = $("select option[value="+$(this).val()+"]").attr("data-ticketAmount");
            var toDay = $("input[name=ticketStartExpirationDate]").val();//'${toDay}';
            var myDate = new Date(toDay);
            myDate.setDate (myDate.getDate() + Number(applyDate));
			$("input[name=contractProductName]").val(productName);
			//$("input[name=contractExpirationDate]").val(applyDate);
			$("input[name=ticketEndExpirationDate]").val(myDate.format("yyyy/MM/dd HH:mm"));

            if(productName=="클앱멤버십"){
                $("input[name=contractTicketAmount_h]").val("300분/일");
            }else {
                $("input[name=contractTicketAmount_h]").val(ticketAmount * 5);
            }
            $("input[name=contractTicketAmount]").val(ticketAmount);
		});
	});
	$(function() {
		//회원 아이디 함수
		$.fn.Common.init();
	});
</script>