<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="bgColor" value=""/>
<div class="sub-content"> 
  <div>
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div> 
    <div class="search-box">
      <form id="searchForm" action=""> 
        <div class="marT-5">
        	<div class="marT-5"> 
	          <span class="span-w80">기간검색</span>
	          <select class="sel-w100" name="searchKey">
	          	<option value="payment_approval_date" <c:if test="${paymentEntity.searchKey eq 'paymentApprovalDate' }">selected</c:if>>결제일</option>
	          	<option value="payment_date" <c:if test="${paymentEntity.searchKey eq 'paymentDate' }">selected</c:if>>신청일</option>
	          </select>
	          <input type="text" class="inp-w100" id="from" name="startDate" value="${paymentEntity.startDate}"/> ~&nbsp; 
	          <input type="text" class="inp-w100" id="to" name="endDate" value="${paymentEntity.endDate}"/>
	          <span class="marL-15 span-w60">결제여부</span>
	          <select class="sel-w140" name="searchValue">
	          	<option value="1" <c:if test="${paymentEntity.searchValue eq '1' }">selected</c:if>>결제완료</option>
	          	<option value="2" <c:if test="${paymentEntity.searchValue eq '2' }">selected</c:if>>결제대기</option>
	          	<option value="3" <c:if test="${paymentEntity.searchValue eq '3' }">selected</c:if>>결제취소</option>
	          	<option value="4" <c:if test="${paymentEntity.searchValue eq '4' }">selected</c:if>>결제실패</option>
	          </select>
          </div>
          <div class="marT-5">
            <span class="span-w80">회원구분</span>
            <select class="sel-w100" name="searchValue1">	
            	<option value="">전체</option>
            	<option value="1" <c:if test="${paymentEntity.searchValue1 eq '1' }">selected</c:if>>일반</option>
            	<option value="2" <c:if test="${paymentEntity.searchValue1 eq '2' }">selected</c:if>>기업/단체</option>
            </select>
            <span class="marL-15 span-w80">회원아이디</span>
            <input type="text" class="inp-w200" name="searchValue2" value="${paymentEntity.searchValue2}" placeholder="회원아이디"/>
            <span class="marL-15 span-w80">계산서발행여부</span>
          	<select class="sel-w140" name="searchValue3">
          		<option value="">전체</option>
          		<option value="1" <c:if test="${paymentEntity.searchValue3 eq '1' }">selected</c:if>>미신청</option>
          		<option value="2" <c:if test="${paymentEntity.searchValue3 eq '2' }">selected</c:if>>신청</option>
          		<option value="3" <c:if test="${paymentEntity.searchValue3 eq '3' }">selected</c:if>>완료</option>
            </select>
          </div>
          <div class="marT-5">
            <span class="span-w80">결제자명</span>
            <input type="text" class="inp-w100" name="searchValue4" value="${paymentEntity.searchValue4}" placeholder="결제자명"/>
            <span class="marL-15 span-w80">신청상품</span>
            	<select class="sel-w210" name="searchValue5">
            		<option value="">전체</option>
		          <c:forEach items="${productInfo.productList }" var="code">
					<option value="${code.productName }" data-applyDate="${code.productExpirationDate }" <c:if test="${paymentEntity.searchValue5 eq code.productName }">selected</c:if>>${code.productName }</option>
				 </c:forEach>
	           </select>
            <span class="marL-15 span-w60">결제방법</span>
          	<label><input type="checkbox" value="1" name="searchValue6" <c:if test="${paymentEntity.searchValue6 eq '1' }">checked</c:if>/> 신용카드</label>
          	<label><input type="checkbox" value="3" name="searchValue8" <c:if test="${paymentEntity.searchValue8 eq '3' }">checked</c:if>/> 가상계좌</label>
          	
            <span class="marL-5 "></span>
            <input type="submit" class="btn" value="검색"/>
            <input type="reset" class="btn" value="초기화"/> 

          </div>
        </div>
      </form>
      <div style="clear:both"></div>
    </div>
    <div style="margin:5px; color:red">※ 해당 월에 대한 웹 결제 금액을 기본으로 제공합니다. 특정 일자에 대한 검색은 기간검색 기능을 이용해 주시기 바랍니다.</div>
    <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
    <div style="clear:both;"></div>
  </div>
  <div style="width:100%;">
  	<h3 class="floatL part-title">${CommonCode.searchResult }</h3>
  </div>
  <table class="board-list-r" style="">
	  <colgroup>
	  	<col width="2%"/>
	  	<col width="9%"/>
	  	<col width="9%"/>
	  	<col width="6%"/>
	  	<col width="5%"/>
	  	<col width="5%"/>
	  	<col width="5%"/>
	  	<col width="5%"/>
	  	<col width="5%"/>
	  	<col width="10%"/>
	  	<col width="7%"/>
	  	<col width="6%"/>
	  	<col width="7%"/>
	  	<col width="7%"/>
	  	<col width="5%"/>
  	  </colgroup>
    <thead>
    <tr>
      <th>No.</th>
		<th class="al-center">회원 ID</th>
		<th class="al-center">결제번호</th>
		<th class="al-center">신청일시</th>
		<th class="al-center">결제방법</th>
		<th class="al-center">계산서<br/>발행여부</th>
		<th class="al-center">결제여부</th>
		<th class="al-center">결제일시</th>
		<th class="al-center">결제자명</th>
		<th class="al-center">사업자등록번호</th>
		<th class="al-center">신청상품</th>
		<th>신청금액<br/>(원)</th>
		<th>결제금액<br/>(vat제외, 원)</th>
		<th>결제금액<br/>(vat포함, 원)</th>
		<th>티켓</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
	    <c:when test="${paymentEntity.dataSize < 1 }">
	      <tr>
	        <td colspan="15" class="al-center">+++조회된 내용이 없습니다.+++</td>
	      </tr>
	    </c:when>
	    <c:otherwise>
	    <c:forEach items="${paymentEntity.paymentList }" var="paymentList" varStatus="i">
	    	<c:if test="${paymentList.payStateCd == 3 }">
	    	<c:set var="bgColor" value="#FFD5E3"/>
	    	</c:if>
	      <tr class="cursor" style="cursor:pointer; background:${bgColor}" data-key="${paymentList.paymentMasterKey }">
	        <td class="al-center">${paymentEntity.dataSize-(paymentEntity.pageListSize*(paymentList.currentPage-1))-i.index}</td>
	        <td class="al-center">${paymentList.buyerId }</td>
	        <td class="al-center">${paymentList.oid }</td> 
	        <td class="al-center">${paymentList.regDt }</td>
	        <td class="al-center">${paymentList.paymentTypeText }</td> 
	        <td class="al-center">${paymentList.cashReceiptSelfYn }</td>
	        <td class="al-center">${paymentList.paymentStateText }</td>
	        <td class="al-center">${paymentList.payDt }</td>
	        <td class="al-center">${paymentList.buyer}</td>
	        <td class="al-center">${paymentList.paymentCompanyNumber}</td>
	        <td class="al-center">${paymentList.productInfo}</td>
	        <td><fmt:formatNumber value="${paymentList.paymentTotalPrice}" type="number"/></td>
	        <td><fmt:formatNumber value="${paymentList.paymentNotVatTotalPrice}" type="number"/></td>
	        <td><fmt:formatNumber value="${paymentList.paymentTotalPrice}" type="number"/></td>
	        <td><fmt:formatNumber value="${paymentList.paymentTicketAmount}" type="number"/></td>
	      </tr>
	    </c:forEach> 
	    </c:otherwise>
    </c:choose>
    </tbody>
  </table>
  <div class="paging-area">
    <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/payment/paymentWebList" pageNavigationEntity="${paymentEntity }" />
  </div>
</div>
<script>
$(function() {
	$(".board-list-r tr.cursor").click(function() { 
		var key = $(this).data("key");
		location.href = "${contextPath }/admin/payment/paymentWebDetail?paymentMasterKey="+key;
	});
});
</script>