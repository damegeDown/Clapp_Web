<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/ticket.js"></script>
<script>
$(function() {
  $.fn.ticketProductServiceList.init();
});
</script>
<div class="sub-content">
	<div>
		<h3 class="contents-title floatL">${CommonCode.navigation }</h3> 
		<div style="clear:both;"></div>
			<form id="searchForm" action="">
			 <div class="search-box">
				<div class="marT-5">
					<span class="span-w50">적용일</span>
					<input type="text" id="from" class="date" name="startDate" value="${ticketEntity.startDate}"/> ~ <input type="text" id="to" class="date" name="endDate" value="${ticketEntity.endDate }"/>
					<span class="marL-15 span-w60">회원구분</span>
					<select class="sel-w70" name="searchValue">
					<option value="">전체 보기</option>
						<c:forEach items="${serviceTargetTypeCode}" var="code">
						 <option value="${code.commonCode }"  <c:if test="${ticketEntity.searchValue eq code.commonCode }">selected</c:if>>${code.commonName }</option>
						</c:forEach>
					</select>
					<span class="marL-15 span-w60">사유</span>
					<select class="sel-w100" name="searchValue1">
					<option value="">전체</option>
						<c:forEach items="${serviceApplyReasonCode }" var="code">
						 <option value="${code.commonCode }" <c:if test="${ticketEntity.searchValue1 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="marT-5">
					<span class="span-w50">회원 ID</span>
					<input type="text" class="inp-w301" name="searchValue2" value="" placeholder="띄어쓰기 없이 입력"/>
					<span class="marL-15 span-w90">이름/기업,단체명</span>
					<input type="text" class="inp-w190" name="searchValue3" value="" placeholder="띄어쓰기 없이 입력"/>
					<span class="marL-5"></span>
					<input type="submit" class="btn" value="검색"/>
					<input type="reset" class="btn" value="초기화"/>
				</div>
				<div style="clear:both"></div>
		  </div>
				<div style="margin:5px; color:red">※ 해당 월에 적용한 티켓 및 상품 적용 서비스 내역을 제공해 드립니다. 특정 일자에 대한 검색은 기간검색 기능을 이용해 주시기 바랍니다.</div>
				<div style="margin:5px; color:red">※ 개별 계약건의 경우, 적용 티켓수는 계정 전체의 합계 수량으로 노출되어 있습니다.</div>
				<div style="border-top:2px dotted #999;margin-bottom:30px"></div>
				<div style="clear:both;"></div>
				<div style="width:100%;">
		 			<h3 class="floatL part-title">> 검색결과 <span class="colorSkyBlue">${ticketEntity.dataSize }</span> 건</h3>
		 			<div class=" floatR">
			          <select class="sel-w100 sortListSize" name="sortListSize">
			            <c:forEach items="${sortListSizeCode }" var="code">
			            <option value="${code.commonCode }" <c:if test="${ticketEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
			            </c:forEach>
			          </select>
			        </div>
	 			</div>
			</form>
	</div>
	<table class="board-list">
		 
		<thead>
			<tr>
			<th>No.</th>
			<th>회원 ID</th>
			<th>구분</th>
			<th>이름/기업,단체명</th>
			<th>적용일시</th>
			<th>적용 상품명</th>
			<th class="al-right">적용시간</th>
			<th>적용 사유</th>
			<th>적용 담당자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ticketEntity.ticketProductServiceList }" var="ticketProductServiceList" varStatus="i"> 
				<tr>
					<td>${ticketEntity.dataSize-(ticketEntity.pageListSize*(ticketEntity.currentPage-1))-i.index}</td>
					<td>${ticketProductServiceList.userId }</td>
					<td>${ticketProductServiceList.serviceTargetType }</td>
					<td>${ticketProductServiceList.serviceTargetName  }</td>
 					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${ticketProductServiceList.serviceApplyDate }" /></td>
					<td>${ticketProductServiceList.serviceProductName == null ? '-': ticketProductServiceList.serviceProductName }</td>
					<td class="al-right">${ticketProductServiceList.serviceApplyTicketTotalAmount} 분</td>
					<td>${ticketProductServiceList.serviceApplyReason }</td>
					<td>${ticketProductServiceList.serviceApplyOperatorName }</td>
				</tr>
			</c:forEach> 
			<c:if test="${ticketEntity.ticketProductServiceList.size() < 1 }">
			<tr>
			<td colspan="9">+++조회된 내용이 없습니다.+++</td>
			</tr> 
			</c:if>
		</tbody>
	</table>
	<div class="btn-area">
  	<a href="${contextPath}/admin/ticket/ticketProductServiceForm" class="floatR btn-bottom-orenge"><span>티켓 서비스 신규 적용</span></a> 
	</div>
	<div class="paging-area">
	 <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/ticket/ticketProductServiceList" pageNavigationEntity="${ticketEntity}" /> 
	</div>  
</div>