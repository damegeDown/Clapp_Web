<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Strings" uri="/WEB-INF/tlds/Strings.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<div class="sub-content">
	<div>
		 <h3 class="contents-title floatL"> ${CommonCode.navigation } ( 누적 문의건수 : <span class="colorSkyBlue">${inquiryCount.totalCount}</span> 건 /
		 답변건수 : <span class="colorSkyBlue">${inquiryCount.answerCount}</span> 건 / 미답변 건수 : <span class="colorSkyBlue">${inquiryCount.notAnswerCount}</span> 건) </h3> 
		<div style="clear:both;"></div>
		<form id="searchForm" action="">
		<div class="search-box">
			<div class="marT-5">
				<select class="sel-w80" name="searchKey">
		            <option value="1" <c:if test="${serviceInquiryEntity.searchKey eq 1}"> selected</c:if>>문의일</option>
		            <option value="2" <c:if test="${serviceInquiryEntity.searchKey eq 2}"> selected</c:if>>답변일</option>
		         </select>
				 <input type="text" id="from" class="date" name="startDate"  value="${serviceInquiryEntity.startDate}"/> ~ <input type="text" id="to" class="date" name="endDate" value="${serviceInquiryEntity.endDate }"/> /
				 <select class="sel-w107" name="searchKey1">
		            <option value="1" <c:if test="${serviceInquiryEntity.searchKey1 eq 1}"> selected</c:if>>문의자</option>
		            <option value="2" <c:if test="${serviceInquiryEntity.searchKey1 eq 2}"> selected</c:if>>처리자</option>
				 </select>
			 	 <input type="text" class="inp-w235" name="searchValue" value="" placeholder="띄어쓰기 없이 입력"/>
			</div>
			<div class="marT-5">
			<span class="inp-w150" style="padding-left: 15px; padding-right: 8px;">회원 ID</span>
         		<input type="text" class="inp-w301" name="searchValue1" value="" placeholder="sample@clapp.co.kr"/>
			<span class="span-w53" style="padding-left: 15px;">문의 분류</span>
			<select class="sel-w107" name="searchValue2">
	            <option value="">전체</option>
	            <c:forEach items="${inquiryCategoryCode }" var="code">
	            <option value="${code.commonCode }" <c:if test="${serviceInquiryEntity.searchValue2 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
	            </c:forEach>
	         </select>
	         <span class="span-w50" style="padding-left: 10px;">처리 상태</span>
	           <select class="sel-w80" name="searchValue3">
	            <option value="">전체</option>
	            <c:forEach items="${answerInsertYnCode }" var="code">
	            <option value="${code.commonCode }" <c:if test="${serviceInquiryEntity.searchValue3 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
	            </c:forEach>
	          </select>
			  <span class="marL-15 span-w50"></span> 
			  <input type="submit" class="btn" value="검색"/>
			  <input type="reset" class="btn" value="초기화"/>
			</div>
			<div style="clear:both"></div>
		</div>
		<div style="margin:5px; color:red"></div>
		<div style="border-top:2px dotted #999;margin-bottom:30px"></div>
		<div style="clear:both;"></div>
        <div style="width:100%;">
			<h3 class="floatL part-title">> 검색결과 : (문의건수 : 
				<span class="colorSkyBlue">${inquirySearchCount.totalCount}</span> 건 /
     			 답변건수 : <span class="colorSkyBlue">${inquirySearchCount.answerCount}</span> 건 / 
     			 미답변 건수 : <span class="colorSkyBlue">${inquirySearchCount.notAnswerCount}</span> 건)
       	    </h3>
			<div class=" floatR">
				<select class="sel-w100 sortListSize" name="sortListSize">
		            <c:forEach items="${sortListSizeCode }" var="code">
		            <option value="${code.commonCode }" <c:if test="${serviceInquiryEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
		            </c:forEach>
				</select>
			</div>
		</div>
	</form>
	</div>
	<table class="board-list">
		<colgroup>
			<col width="5%"/>
			<col width="10%"/>
			<col width="20%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup> 
		<thead>
			<tr>
				<th>No.</th>
				<th>분류</th>
				<th>제목</th>
				<th>문의자</th>
				<th>문의 일시</th>
				<th>답변 일시</th>
				<th>처리 상태</th>
				<th>처리자</th>
			</tr>
		</thead>
		<tbody>
 		 <c:forEach items="${serviceInquiryEntity.serviceInquiryList }" var="serviceInquiryList" varStatus="i"> 
			<tr>
				<td>${serviceInquiryEntity.dataSize-(ServiceInquiryEntity.pageListSize*(serviceInquiryEntity.currentPage-1))-i.index}</td> 
				<td>${serviceInquiryList.inquiryCategory }</td>
				<td style="cursor:pointer" class="inquiryTitle" data-key="${serviceInquiryList.serviceInquiryKey }">
					${serviceInquiryList.inquiryTitle}
					<Strings:cutTextTag length="40" text="${serviceInquiryList.inquiryContents}" ellipsis=".."/>
				</td> 
				<td>${serviceInquiryList.inquiryName }</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${serviceInquiryList.inquiryInsertDate }" /></td>
				<td>${serviceInquiryList.answerInsertDate }</td>
			  <c:choose>
		      <c:when test='${serviceInquiryList.answerInsertYn == "답변 완료" }'>
		        <td style="color: blue;">${serviceInquiryList.answerInsertYn }</td>
		      </c:when>
		      <c:otherwise>
		        <td style="color: red;">${serviceInquiryList.answerInsertYn }</td>
		      </c:otherwise> 
	      </c:choose>
				<td>${serviceInquiryList.answerInsertName }</td>
			</tr>
		</c:forEach> 
		 <c:if test="${serviceInquiryEntity.serviceInquiryList.size() < 1 }">
			<tr>
			 <td colspan="8">+++조회된 내용이 없습니다.+++</td>
			</tr> 
		</c:if> 
		</tbody>
	</table>
  </div>
	<div class="paging-area">
	   <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/customer/serviceInquiryList" pageNavigationEntity="${serviceInquiryEntity}" />
	</div>
</div>
<script>
  $(function() {
    $.fn.serviceInquiryList.init();
  });
</script>