<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<div class="sub-content">
  <div>
     <h3 class="contents-title floatL"> ${CommonCode.navigation } ( 누적 상담 건수 : <span class="colorSkyBlue">${adviceCount }</span> 건 )</h3> 
    <div style="clear:both;"></div>
    <form id="searchForm" action="">
    <div class="search-box">
        <div class="marT-5">
          <span class="span-w50" style="padding-left: 11px;">문의일</span>
           <input type="text" id="from" class="date" name="startDate"  value="${cabledAdviceEntity.startDate}"/> ~ <input type="text" id="to" class="date" name="endDate" value="${cabledAdviceEntity.endDate }"/>
           <span class="span-w50" style="padding-left: 30px;">문의자</span>
           <input type="text" class="inp-w235" name="searchValue" value="" placeholder="띄어쓰기 없이 입력"/>
           <select class="sel-w107" name="searchKey1">
            <option value="1" <%-- <c:if test="${serviceInquiryEntity.searchKey1 eq 1}"> selected</c:if> --%>>상담자 전체</option>
            <option value="2" <%-- <c:if test="${serviceInquiryEntity.searchKey1 eq 2}"> selected</c:if> --%>>처리자</option>
          </select>
        </div>
        <div class="marT-5">
        <span class="span-w50" style="padding-left: 11px;">회원 ID</span>
          <input type="text" class="inp-w235" name="searchValue1" placeholder="sample@clapp.co.kr"/>
          <span class="marL-15 span-w50" style="padding-left: 10px;">연락처</span>
            <c:set var="phoneNum" value="${fn:split(cabledAdviceEntity.searchValue2,'-')}"/>
            <input type="text" class="inp-w60 phoneNum" value="${phoneNum[0]}" maxlength="4" placeholder="국번"/> - 
            <input type="text" class="inp-w60 phoneNum" value="${phoneNum[1]}" maxlength="4"/> - 
            <input type="text" class="inp-w60 phoneNum" value="${phoneNum[2]}" maxlength="4"/>
            <input type="hidden" class="phoneNumComp" name="searchValue2" value="${cabledAdviceEntity.searchValue2}"/>
          <span class="span-w53" style="padding-left: 30px; padding-right: 7px;">문의 분류</span>
           <select class="sel-w130" name="searchValue3">
            <option value="">전체</option>
             <c:forEach items="${cabledAdviceCode }" var="code">
            <option value="${code.commonCode }" <c:if test="${cabledAdviceEntity.searchValue3 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
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
	        <h3 class="floatL part-title">> 검색결과 : 
				<span class="colorSkyBlue">${cabledAdviceEntity.dataSize }</span> 건
			</h3>
	        <div class=" floatR">
	          <select class="sel-w100 sortListSize" name="sortListSize">
	            <c:forEach items="${sortListSizeCode }" var="code">
	            <option value="${code.commonCode }" <c:if test="${cabledAdviceEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
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
    </colgroup> 
    <thead>
      <tr>
        <th>No.</th>
        <th>분류</th>
        <th>상담 제목</th>
        <th>문의자</th>
        <th>접수 일시</th>
        <th>상담 완료 일시</th>
        <th>상담자</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${cabledAdviceEntity.cabledAdviceList }" var="cabledAdviceList" varStatus="i"> 
      <tr>
        <td>${cabledAdviceEntity.dataSize-(cabledAdviceEntity.pageListSize*(cabledAdviceEntity.currentPage-1))-i.index}</td> 
        <td>${cabledAdviceList.adviceCategory }</td>
        <td style="cursor:pointer" class="adviceTitle" data-key="${cabledAdviceList.cabledAdviceKey }">${cabledAdviceList.adviceTitle}</td>
        <td>${cabledAdviceList.adviceInquiryName }</td>
         <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${cabledAdviceList.adviceAcceptDate }" /></td>
         <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${cabledAdviceList.adviceComleteDate }" /></td>
        <td>${cabledAdviceList.adviceInsertName }</td>
      </tr>
    </c:forEach> 
     <c:if test="${cabledAdviceEntity.cabledAdviceList.size() < 1 }">
      <tr>
       <td colspan="7">+++조회된 내용이 없습니다.+++</td>
      </tr> 
    </c:if> 
    </tbody>
  </table>
  </div>
  <div class="btn-area">
    <a href="${contextPath }/admin/customer/cabledAdviceForm" class="floatR btn-bottom-orenge">상담 등록</a>
  </div>
  <div class="paging-area">
     <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/customer/cabledAdviceList" pageNavigationEntity="${cabledAdviceEntity}" />
  </div>
</div>
<script>
  $(function() {
    $.fn.cabledAdviceList.init();
  });
</script>