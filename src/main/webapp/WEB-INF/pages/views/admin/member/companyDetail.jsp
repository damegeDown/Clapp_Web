<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/member.js"></script>
<div class="sub-content">
<form id = "memberForm">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
  </div>
    <c:if test="${companyDetail.userMasterKey ne null}">
    <input type="hidden" name="userMasterKey" value="${companyDetail.userMasterKey }"/>
  </c:if>
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>회원 ID</th>
        <td class="userId">
          ${companyDetail.userId}
        </td>
       </tr>
       <tr>
        <th>기업/단체명</th>
        <td class="userName">
          ${companyDetail.userCompanyName}
        </td>
       </tr>
       <tr>
        <th>구분</th>
        <td>
          ${companyDetail.userCompanyGroupType}
        </td>
       </tr>
       <tr>
        <th>담당자명</th>
        <td>${companyDetail.userName}</td>
       </tr>
       <tr>
        <th>가입일시</th>
        <td>
          <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${companyDetail.userJoinDate}" />
        </td>
       </tr>
       <tr>
        <th>비밀 번호</th>
        <td>
           관리자 확인불가 ( 회원 요청시 아래 수정 버튼 클릭 > 변경처리는 가능 )
        </td>
       </tr>
        <tr>
        <th>휴대폰 번호</th>
        <td>${companyDetail.userCellPhoneNumber}</td>
       </tr>
       <tr>
        <th>사업자등록번호</th>
        <td>${companyDetail.userCompanyNumber}</td>
       </tr>
       <tr>
        <th>지역 (선택항목)</th> 
        <td>${companyDetail.userAreaDetail}</td>
       </tr>
       <tr>
        <th>업종 (선택항목)</th>
        <td>${companyDetail.userCompanyBusinessType}</td>
       </tr>
       <tr>
        <th>메일수신여부</th>
        <td>${companyDetail.userMailReceptionYn}</td>
       </tr>
       <tr>
        <th>최종 로그인 일시</th>
        <td>${companyDetail.userLastLoginDate}</td>
       </tr>
       <tr>
        <th>보유 티켓수</th>
        <td>
          ${companyDetail.usedTicketAmount}티켓
          <a href="${contextPath}/admin/ticket/userTicketUsedList" class="btn-bottom-orenge" >티켓관리 바로가기</a>
        </td>
       </tr>
       <tr>
        <th>유료 상품 이용현황</th>
        <td>
        <c:choose>
        	<c:when test='${companyDetail.productName ne "Free"}'>
        		유료 상품 이용중 
        	</c:when>
        	<c:when test='${companyDetail.productName eq "Free"}'>
        		무료 상품 이용중 
        	</c:when>
        	<c:when test='${companyDetail.productName eq null}'>
        		-
        	</c:when>
        </c:choose>
         ( ${companyDetail.productName}, 상품 적용기간 
          <fmt:formatDate pattern="yyyy/MM/dd" value="${companyDetail.ticketStartExpirationDate }" /> ~ 
          <fmt:formatDate pattern="yyyy/MM/dd" value="${companyDetail.ticketEndExpirationDate }" /> )
          <a href="${contextPath}/admin/payment/paymentWebList" class="btn-bottom-orenge">결제내역 바로가기</a>
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/member/companyList" class="floatL btn-bottom-orenge">목록</a>
    <div class="btn-bottom-orenge " onclick="javascript:location.href='/admin/member/companyModify?userMasterKey=${companyDetail.userMasterKey  }'">수정</div>
    <div class="btn-bottom-orenge " onclick="goAdminLogin()">관리자로 로그인</div>
    <div class="btn-bottom-orenge floatR removeMember" data-key="${companyDetail.userMasterKey  }">탈퇴</div>
  </div>
  </form>
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupDropMember.jsp"%>
<script>
$(function(){
	//지역 저장된 값을 세팅
  var userAreaType = "${companyDetail.userAreaType}";
  var userArea = "${companyDetail.userArea}";
  var userAreaDetail = "${companyDetail.userAreaDetail}";
  $.fn.CompanyDetail.init(userAreaType, userArea, userAreaDetail);
});
var goAdminLogin = function() {
	alert("사용자의 동의 하에 관리자 권한으로 \n로그인하며, 본 접속기록은 저장됩니다. \n사용자 화면으로 이동 합니다.");
	location.href = '/admin/reLogin?userMasterKey=${companyDetail.userMasterKey  }&userType=2';
}
</script>