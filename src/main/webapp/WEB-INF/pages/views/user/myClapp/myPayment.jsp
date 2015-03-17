<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ contextPath }/resources/js/myClapp.js"></script>
<script language="JavaScript" src="http://pgweb.uplus.co.kr:7085/WEB_SERVER/js/receipt_link.js"></script>
<div class="subJoinGnbBottomContainer">
		<div class="subJoinGnbBottomBg">
			<div class="subJoinGnbBottomBox">
				<div class="subJoinGnbBottom">
					<span class="subJoinTitle">마이 클앱</span>
				</div>
				<div class="subStartBox">
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->
<%@ include file="/WEB-INF/pages/views/user/myClapp/inc/incSubMenu.jsp"%>
<div class="subMyClappTitleContainer">
	<div class="subMyClappTitleBox">
		<div class="subMyClappTitleLine"></div>
		<span class="subMyClappTitle">결제 내역</span>
		<p class="subMyClappSMessage">
			클앱 이용을 위해 결제하신 내역을 조회하실 수 있습니다. (별도 계약건은 영업담당 02-3460-8536 문의)
		</p>
              <div class="subMyClappTaxBox">
			<a href="${contextPath}/myClapp/myInquiry?inquiryCategory=4">
			<span class="subMyClappTaxTitle">계산서 요청</span>
                <img class="taxIcon" src="${contextPath }/resources/images/tax.png" alt="계산서"/>
			</a>
		</div>
	</div>
</div> <!-- .subMyClappTitleContainer End -->
<div class="subMyClappContentContainerT2">
<form id="paymentForm">
<input type="hidden" name="searchKey" value="all"/>
	<div class="subMyClappContentBox">
		<div class="subMyClappTitleSmallLine"></div>
		<span class="subMyClappSmallTitle">상세 내역 조회</span>
		<div class="subMyClappContentDetailsSearchBox">
			<div class="subMyClappContentDetailsSearchTopSection">
				<div class="subMyClappContentDetailsTopBox">
					<div class="smccdtTitleB">
						<span class="smccdtTitle">기간 설정</span>
					</div>
					<div class="smccdtTabs">
						<ul class="smccdtTab">
							<li class="smccdtTabLi smccdtTabLiActive" onclick="SearchUtils.setDataTerm(this, 'all')">전체</li>
							<li class="smccdtTabLi" onclick="SearchUtils.setDataTerm(this, 'toDay')">오늘</li>
							<li class="smccdtTabLi smccdtTabLiR" onclick="SearchUtils.setDataTerm(this, '7')">최근7일</li>
						</ul>
					</div>
					<div class="smccdtLine">
						<div class="smccdtLineR"></div>
					</div>
					<div class="smccdtDate">
						<div class="smccdtDatebox">
							<div class="smccdtDateStartBox">
								<input type="text" name="startDate" class="smccdtDateInput dateTerm" value="${paymentInfo.startDate}" placeholder="시작일" id="from" readonly />
							</div>
							<div class="smccdtDateFrom">~</div>
							<div class="smccdtDateEndBox">
								<input type="text" name="endDate" class="smccdtDateInput dateTerm" value="${paymentInfo.endDate}" placeholder="종료일" id="to" readonly />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="subMyClappContentDetailsSearchLine"></div>
			<div class="subMyClappContentDetailsSearchMiddleSection">
				<div class="subMyClappContentDetailsMiddleBox">
					<div class="smccdtTitleB">
						<span class="smccdtTitle">상세 구분</span>
					</div>
					<div class="smccdmSelect5">
						<select class="smccdmProducts" name="searchValue">
							<option value="">-상품별-</option>
							<c:forEach items="${productList }" var="code">
				              <option value="${code.productName }" <c:if test="${paymentInfo.searchValue eq code.productName }">selected</c:if>>${code.productName }</option>
				            </c:forEach>
						</select>
					</div>
					<div class="smccdmSelect6">
						<select class="smccdmPaymentMethod" name="searchValue1">
							<option value="">-결제 방법별-</option>
							 <c:forEach items="${paymentType }" var="code">
                  				<option value="${code.commonCode }" <c:if test="${paymentInfo.searchValue1 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
                			</c:forEach>
						</select>
					</div>
					<div class="smccdmSelect6">
						<select class="smccdmPaymentMethod" name="searchValue2">
							<option value="">-결제 상태별-</option>
							<option value="1" <c:if test="${paymentInfo.searchValue2 eq 1 }">selected</c:if>>결제 완료</option>
							<option value="2" <c:if test="${paymentInfo.searchValue2 eq 2 }">selected</c:if>>결제 대기</option>
							<option value="3" <c:if test="${paymentInfo.searchValue2 eq 3 }">selected</c:if>>결제 취소</option>
						</select>
					</div>
				</div>
			</div>
			<div class="subMyClappContentDetailsSearchBottomSection">
				<div class="smccdsbBox">
					<input type="submit" class="smccdsbSearch" value="검색" style="color:#fff; font-weight:700">
					<input type="reset" onclick="SearchUtils.setDataTerm('', 'all')" class="smccdsbReset" value="검색초기화" style="color:#fff; font-weight:700">
				</div>
			</div>
		</div> <!-- .subMyClappContentDetailsSearchBox End -->
		<div class="subMyClappContentResultBox">
			<div class="subMyClappContentResultTotalSectionBox">
				<div class="sccrtS1">
					<ul class="sccrtSLists">
						<li><span class="sccrtSTitle1">총 결제 건수 :&nbsp;</span><span class="sccrtSNo1">${paymentInfo.dataSize }</span><span class="sccrtSQty1"> 건</span></li>
						<li class="sccrtSListsLine"></li>
						<li><span class="sccrtSTitle2">결제 대기 : &nbsp;</span><span class="sccrtSNo2">${paymentInfo.paymentWaitCount }</span><span class="sccrtSQty2"> 건</span></li>
					</ul>
				</div>
				<div class="sccrtS2">
				<select class="searchL sccrtS2Select" name="searchListSize" onchange="submit();"> 
					<option value="10" <c:if test="${paymentInfo.searchListSize == 10}">selected</c:if>>10개씩 보기</option>
					<option value="30" <c:if test="${paymentInfo.searchListSize == 30}">selected</c:if>>30개씩 보기</option>
					<option value="50" <c:if test="${paymentInfo.searchListSize == 50}">selected</c:if>>50개씩 보기</option>
				</select>
			</div>
			</div>
			<div class="subMyClappPaidProductBox">
				<table class="subMyClappPaidProductList3">
					<tr>
						<th>No</th>
						<th>결제일</th>
						<th>상태</th>
						<th>상품명</th>
						<th>결제방법</th>
						<th>결제금액</th>
					</tr>
					<c:if test="${paymentInfo.dataSize < 1}">
						<tr>
							<td colspan="6">++조회내용이 없습니다.++</td>
						</tr> 
					</c:if>
					<c:forEach items="${paymentInfo.paymentList }" var="payment" varStatus="i"> 
					<tr>
						<td>${paymentInfo.dataSize-(paymentInfo.pageListSize*(paymentInfo.currentPage-1))-i.index}</td>
						<td><fmt:formatDate value="${payment.paymentDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${payment.paymentStateText }</td>
						<td>${payment.paymentProductName }</td>
						<td>
							${payment.paymentTypeText }&nbsp; 
							<c:if test="${payment.paymentTid ne '0'}">
								<!--  TODO : 전표보기 윈도우 팝업. -->	
								<button class="goBtn" onclick="javascript:showReceiptByTID('${paymentInfo.mid}', '${payment.paymentTid}', '${payment.authData }')">전표보기</button>
							</c:if>
						</td>
						<td>&#8361; <fmt:formatNumber value="${payment.paymentTotalPrice }" /></td>
					</tr>
					</c:forEach>
				</table>
				<div class="paging-area">
					<dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/myClapp/myPayment" pageNavigationEntity="${paymentInfo}" />
				</div>
			</div>
		</div> <!-- .subMyClappContentResultBox End -->
	</div>
	</form>
</div>	
<script>
$(function() {
 	if("${paymentInfo.searchKey}") {
 		var term = "${paymentInfo.searchKey}";
 		SearchUtils.setDataTerm('', term);
 	}
});
</script>