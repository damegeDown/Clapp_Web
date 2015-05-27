<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ contextPath }/resources/js/myClapp.js"></script>
<div class="subJoinGnbBottomContainer">
		<div class="subJoinGnbBottomBg">
			<div class="subJoinGnbBottomBox">
				<div class="subJoinGnbBottom">
					<span class="subJoinTitle">마이 클앱</span>
				</div>
				<div class="subStartBox">
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->
<%@ include file="/WEB-INF/pages/views/user/myClapp/inc/incSubMenu.jsp"%>
<div class="subMyClappTitleContainer">
	<div class="subMyClappTitleBox">
		<div class="subMyClappTitleLine"></div>
		<span class="subMyClappTitle">티켓 적립/차감/반환</span>
		<p class="subMyClappSMessage">
			클앱을 이용하실 수 있는 티켓의 적립/차감/반환 상세 내역을 조회하실 수 있습니다.
		</p>
		<!-- <div class="subMyClappTaxBox">
			<a href="#">
			<span class="subMyClappTaxTitle">계산서 발행요청</span>
			<img clas="taxIcon" src="${contextPath }/resources/images/tax.png" alt="계산서" />
			</a>
		</div> -->
	</div>
</div> <!-- .subMyClappTitleContainer End -->
<div class="subMyClappContentContainerT2">
<form id="historyForm">
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
								<input type="text" name="startDate" class="smccdtDateInput dateTerm" placeholder="시작일" id="from" readonly />
							</div>
							<div class="smccdtDateFrom">~</div>
							<div class="smccdtDateEndBox">
								<input type="text" name="endDate" class="smccdtDateInput dateTerm" placeholder="종료일" id="to" readonly />
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
                    <div class="smccdmSelect1">
                        <select class="smccdmProduct" name="searchValue2" style="width:250px">
                            <option value="">-상품명-</option>
                            <c:forEach items="${productList}" var="product">
                                <option value="${product.productName}">
                                        ${product.productName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
					<div class="smccdmSelect4">
						<select class="smccdmTicket" name="searchValue">
							<option value="">적립/차감/반환 전체</option>
							<option value="적립">적립</option>
							<option value="차감">차감</option>
							<option value="반환">반환</option>
						</select>
					</div>
				</div>
			</div>

            <div class="subMyClappContentDetailsSearchBottomSection">
                <div class="smccdsbBox">
                <input type="submit" class="smccdsbSearch" value="검색" style="color:#fff; font-weight:700;margin:0 auto">
                <%--<input type="button" onclick="SearchUtils.setDataTerm('', 'all')" class="smccdsbReset" value="검색초기화" style="color:#fff; font-weight:700">--%>
                </div>
            </div>
		</div> <!-- .subMyClappContentDetailsSearchBox End -->
		<div class="subMyClappContentResultBox2">
			<div class="subMyClappContentResultTotalSectionBox">
				<div class="sccrtS1">
					<ul class="sccrtSLists">
						<li><span class="sccrtSTitle1">이용가능 티켓수 :&nbsp;</span><span class="sccrtSNo1">${ticketHistoryInfo.ticketAvilableAmount }</span><span class="sccrtSQty1"> 티켓</span></li>
						<li class="sccrtSListsLine"></li>
						<li><span class="sccrtSTitle2"><!--${ticketHistoryInfo.productName}--> 잔여일수 : &nbsp;</span><span class="sccrtSNo2">${ticketHistoryInfo.expirationDate }</span><span class="sccrtSQty2"> 일</span></li>
					</ul>
				</div>
				<div class="sccrtS2">
					<select class="searchL sccrtS2Select" name="searchListSize" onchange="submit();"> 
						<option value="10" <c:if test="${ticketHistoryInfo.searchListSize == 10}">selected</c:if>>10개씩 보기</option>
						<option value="30" <c:if test="${ticketHistoryInfo.searchListSize == 30}">selected</c:if>>30개씩 보기</option>
						<option value="50" <c:if test="${ticketHistoryInfo.searchListSize == 50}">selected</c:if>>50개씩 보기</option>
					</select>
				</div>
			</div>
			<div class="subMyClappPaidProductBox">
				<table class="subMyClappPaidProductList3">
                    <colgroup>
                        <col width="5%"/>
                        <col width="10%"/>
                        <col width="15%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="15%"/>
                        <col width="*"/>
                    </colgroup>
					<tr>
						<th>No</th>
						<th>상품명</th>
						<th>예약(시작)시간</th>
						<th>상태</th>
						<th>티켓</th>
						<th>유효기간</th>
						<th>적용사유</th>
					</tr>
					<c:if test="${ticketHistoryInfo.dataSize < 1}">
						<tr>
							<td colspan="7">++조회내용이 없습니다.++</td>
						</tr> 
					</c:if>
					<c:forEach items="${ticketHistoryInfo.historyList }" var="history" varStatus="i">
					<tr>
						<td>${ticketHistoryInfo.dataSize-(ticketHistoryInfo.pageListSize*(ticketHistoryInfo.currentPage-1))-i.index}</td>
                        <td>
                            ${history.productName}
                        </td>
						<td><fmt:formatDate value="${history.ticketStartExpirationDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${history.statusText}</td>
						<td>${history.historyUsedTicketAmountText }</td>
						<td>
							<%--${history.expirationDate }--%>
							 <fmt:formatDate value="${history.ticketStartExpirationDate}" pattern="yyyy-MM-dd HH:mm"/>
							<br/> ~ <fmt:formatDate value="${history.ticketEndExpirationDate}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
						    ${history.serviceApplyReason }
                            <c:if test="${history.serviceApplyReasonDetail ne null and history.serviceApplyReasonDetail ne ''}">
                                <br/>(${history.serviceApplyReasonDetail })
                            </c:if>
                        </td>
					</tr>
					</c:forEach>
				</table>
				<div class="paging-area">
					<dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/myClapp/myHistory" pageNavigationEntity="${ticketHistoryInfo}" />
				</div>
			</div>
		</div> <!-- .subMyClappContentResultBox End -->
	</div>
</form>
</div>	
<script>
$(function() {
 	if("${ticketHistoryInfo.searchKey}") {
 		var term = "${ticketHistoryInfo.searchKey}";
        if(term != "all")
 		//SearchUtils.setDataTerm('', term);
 	}
});
</script>
