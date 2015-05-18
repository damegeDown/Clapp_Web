<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/member.js"></script>
<div class="sub-content">
  <div>
    <h3 class="contents-title floatL">${CommonCode.navigation }  (누적 : <span class="colorSkyBlue">${dropOutCount}</span> 명)</h3>
    <div style="clear:both;"></div>
	    <form id="searchForm" action="">
		    <div class="search-box">
		      <span style="margin:right:20px">검색</span>
		      <span style="margin:right:20px">탈퇴계정</span>
		      <input type="text" name="searchValue" value="${dropOutUserEntity.searchValue }" placeholder="sample@clapp.co.kr"/>
		      <span style="margin:right:20px">탈퇴일</span>
	        <input type="text" id="from" class="date" name="startDate" value="${dropOutUserEntity.startDate }"/> ~ <input type="text" id="to" class="date" name="endDate" value="${dropOutUserEntity.endDate }"/>
		      <input type="submit" class="btn" value="검색"/>
	     </div>
	     <div style="margin:5px; color:red">※ 이용자의 동의 하에 탈퇴한 계정은 이메일 주소, 탈퇴 일시와 탈퇴 사유 외에는 그 어떤 정보도 남기지 않습니다.</div>
	     <div style="margin:5px; color:red">※ 가입 구분도 일반, 기업, 소셜 계정 회원이었는지 알 수 없으니 응대 시 참고 바랍니다.</div>
	     <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
	     <div style="clear:both;"></div>
	     <div style="width:100%;">
 			<h3 class="floatL part-title">> 검색결과 <span class="colorSkyBlue">${dropOutUserEntity.dataSize }</span> 건</h3>
	        <div class=" floatR">
			    <select class="sel-w230 searchValue" name="searchValue1">
		        <option value="">탈퇴사유 전체</option>
		        <c:forEach items="${dropOutReasonCode}" var="code">
		          <option value="${code.commonCode }" <c:if test="${dropOutUserEntity.searchValue1 eq code.commonCode }">selected</c:if>>${code.commonName }</option>
		        </c:forEach>
		      </select>
		      <select class="sel-w100 searchValue" name="searchValue2">
		        <option value="0"<c:if test="${dropOutUserEntity.searchValue2 eq 0}"> selected</c:if>>처리자 전체</option>
		        <option value="1"<c:if test="${dropOutUserEntity.searchValue2 eq 1}"> selected</c:if>>관리자</option>
		        <option value="2"<c:if test="${dropOutUserEntity.searchValue2 eq 2}"> selected</c:if>>본인</option>
		      </select>
	       </div>
		 </div>
	    </form>
	  </div>
	  <table class="board-list">
     <colgroup>
      <col width="10%"/>
      <col width="40%"/>
      <col width="10%"/>
      <col width="20%"/>
      <col width="10%"/>
    </colgroup>
    <thead>
      <tr>
        <th>No.</th> 
        <th>탈퇴 계정</th>
        <th>탈퇴 일시</th>
        <th>탈퇴 사유</th>
        <th>탈퇴 처리자</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${dropOutUserEntity.dropOutUserList }" var="dropOutUserList" varStatus="i"> 
      <tr>
      <td>${dropOutUserEntity.dataSize-(dropOutUserEntity.pageListSize*(dropOutUserEntity.currentPage-1))-i.index}</td>
      <td>${dropOutUserList.dropOutUserId }</td>
      <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${dropOutUserList.dropOutDate }" /></td>
      <td>${dropOutUserList.dropOutReason }</td>
      <td>${dropOutUserList.dropOutPerson }</td>
      </tr>
     </c:forEach> 
     <c:if test="${dropOutUserEntity.dropOutUserList.size() < 1 }">
        <tr>
          <td colspan="5">+++조회된 내용이 없습니다.+++</td>
        </tr> 
        </c:if>
    </tbody>
  </table>
   <div class="paging-area">
    <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/member/dropOutUserList" pageNavigationEntity="${dropOutUserEntity}" />
   </div>  
</div>
<script>
$(function() {
	$.fn.DropOutList.init('${adminLoginSession.adminId}');
}); 
</script>