<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/payment.js"></script>
<c:set var="bgColor" value=""/>
<div class="sub-content"> 
  <div>
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div> 
    <div class="search-box">
      <form id="searchForm" action=""> 
        <div class="marT-5">
        	<div class="marT-5"> 
	          <span class="span-w120">기간검색</span>
	          <select class="sel-w100" name="searchKey">
	          	<option value="contract_start_date" <c:if test="${paymentEntity.searchKey eq 'contract_start_date' }">selected</c:if>>계약일</option>
	          	<option value="contract_bill_publication_date" <c:if test="${paymentEntity.searchKey eq 'contract_bill_publication_date' }">selected</c:if>>계산서 발행일</option>
	          </select> 
	          <input type="text" class="inp-w100" id="from" name="startDate" value="${paymentEntity.startDate}"/> ~&nbsp; 
	          <input type="text" class="inp-w100" id="to" name="endDate" value="${paymentEntity.endDate}"/>
	          <span class="marL-15 span-w80">신청상품</span>
	          <select class="sel-w180" name="searchValue">
	          	<option value="">전체</option>
		          <c:forEach items="${productCode }" var="code">
					<option value="${code.commonCode }" <c:if test="${paymentEntity.searchValue eq code.commonCode }">selected</c:if>>${code.commonName }</option>
				 </c:forEach>
	          </select>
          </div>
          <div class="marT-5">
            <span class="span-w120">회원 ID(이메일 계정)</span>
            <input type="text" style="width:310px" name="searchValue1" value="${paymentEntity.searchValue1}" placeholder="sample@clapp.co.kr"/>
            <span class="marL-15 span-w80">이용현황</span>
            <select class="sel-w140" name="searchValue2">
	          	<option value="">전체</option>
		          <c:forEach items="${contractStateCode }" var="code">
					<option value="${code.commonCode }" <c:if test="${paymentEntity.searchValue2 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
				 </c:forEach>
	          </select>
          </div>
          <div class="marT-5">
            <span class="span-w120">기업명</span>
            <input type="text" style="width:310px" name="searchValue3" value="${paymentEntity.searchValue3}" placeholder="(주) 빼고 입력"/>
            <span class="marL-15 span-w80">사업자등록번호</span>
            <c:set var="companyNum" value="${fn:split(paymentEntity.searchValue4,'-')}"/>
          	<input type="text" class="inp-w50 phoneNum" value="${companyNum[0]}" maxlength="3"/> - 
          	<input type="text" class="inp-w40 phoneNum" value="${companyNum[1]}" maxlength="2"/> - 
          	<input type="text" class="inp-w60 phoneNum" value="${companyNum[2]}" maxlength="5"/>
          	<input type="hidden" class="phoneNumComp" name="searchValue4" value="${paymentEntity.searchValue4}"/>
            <span class="marL-5"></span>
            <input type="submit" class="btn" value="검색"/>
            <input type="reset" class="btn" value="초기화"/> 
          </div>
        </div>
      </form>
      <div style="clear:both"></div>
    </div>
    <div style="margin:5px; color:red">※ 해당 월에 발생한 개별 계약 매출 내역 (세금계산서 발행일 기준) 을 제공합니다.</div>
    <div style="margin:5px; color:red">※ 결제 건에 연결된 다중 회원 ID 정보 및 상세 내역은 결제번호를 클릭하시기 바랍니다.</div>
    <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
    <div style="clear:both;"></div>
  </div>
  <div style="width:100%;">
  	<h3 class="floatL part-title">${CommonCode.searchResult }</h3>
  </div>
  <table class="board-list-r">
    <thead>
    <tr>
        <th class="al-center">No.</th>
		<th class="al-center">회원 ID</th>
		<th class="al-center">계약기간</th>
		<th class="al-center">계약번호</th>
		<th class="al-center">계산서 발행일</th>
		<th class="al-center">기업명</th>
		<th class="al-center">사업자등록번호</th>
		<th class="al-center">신청상품</th>
		<th>발행금액<br/>(vat제외, 원)</th>
		<th>발행금액<br/>(vat포함, 원)</th>
		<th>적용티켓</th>
		<th>이용현황</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
	    <c:when test="${paymentEntity.dataSize < 1 }">
	      <tr>
	        <td colspan="12" class="al-center">+++조회된 내용이 없습니다.+++</td>
	      </tr>
	    </c:when>
	    <c:otherwise>
	    <c:forEach items="${paymentEntity.paymentList }" var="paymentList" varStatus="i">
	    	<c:if test="${paymentList.paymentState == 3 }">
	    	<c:set var="bgColor" value="#FFD5E3"/>
	    	</c:if>
	      <tr class="cursor" style="cursor:pointer; background:${bgColor}" data-key="${paymentList.contractMasterKey }">
	        <td class="al-center">${paymentEntity.dataSize-(paymentEntity.pageListSize*(paymentList.currentPage-1))-i.index}</td>
	        <td class="al-center">${paymentList.contractUserId }</td>
	        <td class="al-center"><fmt:formatDate pattern="yyyy/MM/dd " value="${paymentList.contractStartDate }" /> ~ <fmt:formatDate pattern="yyyy/MM/dd " value="${paymentList.contractEndDate }" /></td> 
	        <td class="al-center">${paymentList.contractMasterKey}</td>
	        <td class="al-center"><fmt:formatDate pattern="yyyy/MM/dd" value="${paymentList.contractBillPublicationDate }" /></td>
	        <td class="al-center">${paymentList.contractCompanyName }</td>
	        <td class="al-center">${paymentList.contractCompanyNumber }</td>
	        <td class="al-center">${paymentList.contractProductName }</td>
	        <td><fmt:formatNumber value="${paymentList.contractNotVatTotalPrice}" type="number"/></td>
	        <td><fmt:formatNumber value="${paymentList.contractTotalPrice}" type="number"/></td>
	        <td><fmt:formatNumber value="${paymentList.contractTicketAmount}" type="number"/></td>
	        <td>
	        		${paymentList.contractStateText }
	        		<c:if test="${paymentList.contractState == 4}">
							(<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${paymentList.contractUseCloseDate }" />)	        		
	        		</c:if>
                    <c:if test="${paymentList.contractState == 2}">
                        <c:if test="${paymentList.contractUseStopReason ne null and paymentList.contractUseStopReason ne ''}">
                        (${paymentList.contractUseStopReason})
                        </c:if>
                    </c:if>
	        </td>
	      </tr>
	    </c:forEach>
	    </c:otherwise>
    </c:choose>
    </tbody>
  </table>
  <input type="button" class="btn goInputBtn floatR" value="계약등록"/>
  <div class="paging-area">
    <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/payment/paymentContractList" pageNavigationEntity="${paymentEntity }" />
  </div>
</div>
<script>
$(function() {
	$(".board-list-r tr.cursor").click(function() { 
		var key = $(this).data("key");
		location.href = "${contextPath }/admin/payment/paymentContractDetail?contractMasterKey="+key;
	});
});
</script>