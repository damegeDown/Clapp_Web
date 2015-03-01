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
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->

<%@ include file="/WEB-INF/pages/views/user/myClapp/inc/incSubMenu.jsp"%>
<div class="subMyClappTitleContainer">
	<div class="subMyClappTitleBox">
		<div class="subMyClappTitleLine"></div>
		<span class="subMyClappTitle">이용 현황</span>
		<p class="subMyClappSMessage">
			클앱의 전체 이용 현황 및 상품에 대한 상세 내역을 조회하실 수 있습니다.
		</p>
	</div>
</div> <!-- .subMyClappTitleContainer End -->
<div class="subMyClappContentContainer">
	<div class="subMyClappContentBox">
		<div class="subMyClappTitleSmallLine"></div>
		<span class="subMyClappSmallTitle">유료 상품</span>
		<div class="subMyClappPaidProductBox">
			<table class="subMyClappPaidProductList">
				<tr>
					<th>상품명</th>
					<th>상품적용기간</th>
					<th>잔여일수</th>
					<th>총 티켓</th>
					<!-- <th>사용 티켓</th>
					<th>잔여 티켓</th> -->
					<th>티켓내역보기</th>
				</tr>
				<%-- <tr>
					<td>${ticketInfo.productName }</td>
					<td>
						<fmt:formatDate value="${ticketInfo.ticketStartExpirationDate }" pattern="yyyy-MM-dd"/> 
						~ <fmt:formatDate value="${ticketInfo.ticketEndExpirationDate }" pattern="yyyy-MM-dd"/>	
					</td>
					<td>${ticketInfo.expirationDate }일</td>
					<td>${ticketInfo.ticketAmount }티켓</td>
					<td>${ticketInfo.ticketAmount - ticketInfo.ticketAvilableAmount}티켓</td>
					<td>${ticketInfo.ticketAvilableAmount }티켓</td>
					<td><button class="goBtn" onclick="javascript:location.href='${contextPath }/myClapp/myHistory'">바로가기</button></td>
				</tr> --%>
				<c:forEach var="history" items="${ticketInfo.ticketHistoryList }" varStatus="i">
				<tr>
					<td>${history.productName }</td>
					<td>
						<fmt:formatDate value="${history.ticketStartExpirationDate }" pattern="yyyy-MM-dd"/> 
						~ <fmt:formatDate value="${history.ticketEndExpirationDate }" pattern="yyyy-MM-dd"/>	
					</td>
					<td>${history.expirationDate }일</td>
					<td>${history.ticketAvilableAmount }티켓</td>
					<%-- <td>${history.ticketAmount - ticketInfo.ticketAvilableAmount}티켓</td>
					<td>${history.ticketAvilableAmount }티켓</td> --%>
					<td><button class="goBtn" onclick="javascript:location.href='${contextPath }/myClapp/myHistory'">바로가기</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<div class="subMyClappContentDetailsContainer">
	<form id="reservationForm">
	<input type="hidden" name="searchKey" value="all"/>
	<div class="subMyClappContentDetailsBox">
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
								<input type="text" name="startDate" class="smccdtDateInput dateTerm" value="${ticketHistoryInfo.startDate}" placeholder="시작일" id="from" readonly />
							</div>
							<div class="smccdtDateFrom">~</div>
							<div class="smccdtDateEndBox">
								<input type="text" name="endDate" class="smccdtDateInput dateTerm" value="${ticketHistoryInfo.endDate}" placeholder="종료일" id="to" readonly />
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
						<select class="smccdmCorp" name="searchValue">
							<option value="">-제조사별-</option>
							<c:forEach items="${makerList }" var="code">
				              <option value="${code.manufacturer }" <c:if test="${ticketHistoryInfo.searchValue eq code.manufacturer }">selected</c:if>>${code.manufacturer }</option>
				            </c:forEach>
						</select>
					</div>
					<div class="smccdmSelect2">
						<select class="smccdmDevice" name="searchValue1">
							<option value="">-디바이스별-</option>
							<c:forEach items="${deviceList }" var="code">
				              <option value="${code.prodName }" <c:if test="${ticketHistoryInfo.searchValue1 eq code.prodName }">selected</c:if>>${code.prodName }</option>
				            </c:forEach>
						</select>
					</div>
					<div class="smccdmSelect3">
						<select class="smccdmStatus" name="searchValue2">
							<option value="">-상태별-</option>
							<option value="wait" <c:if test="${ticketHistoryInfo.searchValue2 eq 'wait'}">selected</c:if>>예약대기</option>
				            <option value="finish" <c:if test="${ticketHistoryInfo.searchValue2 eq 'finish' }">selected</c:if>>사용종료</option>
						</select>
					</div>
				</div>
			</div>
			<div class="subMyClappContentDetailsSearchBottomSection">
				<div class="smccdsbBox">
					<input type="submit" class="smccdsbSearch" value="검색" style="color:#fff; font-weight:700">
					<input type="button" onclick="SearchUtils.setDataTerm('', 'all')" class="smccdsbReset" value="검색초기화" style="color:#fff; font-weight:700">
				</div>
			</div>
		</div>
	</div> <!-- .subMyClappContentDetailsBox End -->
	<div class="subMyClappContentResultBox1">
		<div class="subMyClappContentResultTotalSectionBox">
			<div class="sccrtS1">
				<ul class="sccrtSLists">
					<li><span class="sccrtSTitle1">총 이용건수 :&nbsp;</span><span class="sccrtSNo1">${ticketHistoryInfo.dataSize}</span><span class="sccrtSQty1"> 건</span></li>
					<li class="sccrtSListsLine"></li>
					<li><span class="sccrtSTitle2">예약대기 :&nbsp;</span><span class="sccrtSNo2">${ticketHistoryInfo.reservationWaitCount}</span><span class="sccrtSQty2"> 건</span></li>
					<li class="sccrtSListsLine"></li>
					<li><span class="sccrtSTitle3">사용종료 :&nbsp;</span><span class="sccrtSNo3">${ticketHistoryInfo.reservationFinishCount}</span><span class="sccrtSQty3"> 건</span></li>
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
			<table class="subMyClappPaidProductList2">
				<colgroup>
					<col width="5%"/>
					<col width="13%"/>
					<col width="13%"/>
					<col width="7%"/>
					<col width="15%"/>
					<col width="10%"/>
					<col width="13%"/>
					<col width="7%"/>
					<col width="17%"/>
				</colgroup>
				<tr>
					<th>No</th>
					<th>예약시간</th>
					<th>사용시간</th>
					<th>제조사</th>
					<th>디바이스명</th>
					<th>OS</th>
					<th>해상도</th>
					<th>차감티켓</th>
					<th>현재상태</th>
				</tr>
				<c:if test="${ticketHistoryInfo.dataSize < 1}">
					<tr>
						<td colspan="9">++조회내용이 없습니다.++</td>
					</tr>
				</c:if>
				<c:forEach items="${ticketHistoryInfo.historyList }" var="history" varStatus="i">
				<tr class="subMyClappPaidProductList2Select">
					<td>${ticketHistoryInfo.dataSize-(ticketHistoryInfo.pageListSize*(ticketHistoryInfo.currentPage-1))-i.index}</td>
					<td>
						<fmt:formatDate value="${history.reserve_time}" pattern="yyyy-MM-dd HH:mm"/><br/>
						 
					</td>
					<td>
						<fmt:formatDate value="${history.startDttm}" pattern="yyyy-MM-dd"/><br/>
						<fmt:formatDate value="${history.startDttm}" pattern="HH:mm"/>
						~ <fmt:formatDate value="${history.endDttm}" pattern="HH:mm"/>	
					</td>
					<td>${history.manufacturer}</td>
					<td>${history.prodName }</td>
					<td>${history.os }<br />${history.osVersion }</td>
					<td>${history.resolution }</td>
					<td>${history.usePoint }</td>
					<td>
						${history.statusText } 
						<c:if test="${history.status == 0 or hisotry.status == 6}">						
						<br />
						<button class="goBtn">바로가기</button>
						</c:if>	
					</td>
				</tr>
				</c:forEach>
			</table>
			<div class="paging-area">
				<dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/myClapp/myTicket" pageNavigationEntity="${ticketHistoryInfo}" />
			</div>
		</div>
	</div> <!-- .subMyClappContentResultBox End -->
</form>
</div>
<script>
$(function() {
 	if("${ticketHistoryInfo.searchKey}") {
 		var term = "${ticketHistoryInfo.searchKey}";
 		SearchUtils.setDataTerm('', term);
 	}
});
</script>