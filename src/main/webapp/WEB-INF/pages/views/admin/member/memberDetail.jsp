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
    <c:if test="${memberDetail.userMasterKey ne null}">
    <input type="hidden" name="userMasterKey" value="${memberDetail.userMasterKey }"/>
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
          ${memberDetail.userId}
        </td>
       </tr>
       <tr>
        <th>이름</th>
        <td class="userName">
          ${memberDetail.userName}
        </td>
       </tr>
       <tr>
        <th>가입 일시</th>
        <td>
          <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${memberDetail.userJoinDate }" />
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
        <td>
          ${memberDetail.userCellPhoneNumber}
        </td>
       </tr>
       <tr>
        <th>연령대 (선택항목)</th>
        <td>${memberDetail.userAgeGroup}</td>
       </tr>
       <tr>
        <th>지역 (선택항목)</th>
        <td>${memberDetail.userAreaDetail}</td>
       </tr>
       <tr>
        <th>직종 (선택항목)</th>
        <td>${memberDetail.userJobType } </td>
       </tr>
       <tr>
        <th>메일수신여부</th>
        <td>${memberDetail.userMailReceptionYn}</td>
       </tr>
       <tr>
        <th>최종 로그인 일시</th>
        <td>${memberDetail.userLastLoginDate}</td>
       </tr>
       <tr>
        <th>보유 티켓수</th>
        <td>
          ${memberDetail.usedTicketAmount}티켓
          <a href="${contextPath}/admin/ticket/userTicketUsedList" class="btn-bottom-orenge" >티켓관리 바로가기</a>
        </td>
       </tr>
       <tr>
        <th>유료 상품 이용현황</th>
           <td>
               <c:choose>
                   <c:when test='${memberDetail.productName ne "Free"}'>
                       유료 상품 이용중
                   </c:when>
                   <c:when test='${memberDetail.productName eq "Free"}'>
                       무료 상품 이용중
                   </c:when>
                   <c:when test='${memberDetail.productName eq null}'>
                       -
                   </c:when>
               </c:choose>
               ( ${memberDetail.productName}, 상품 적용기간
               <fmt:formatDate pattern="yyyy/MM/dd" value="${memberDetail.ticketStartExpirationDate }" /> ~
               <fmt:formatDate pattern="yyyy/MM/dd" value="${memberDetail.ticketEndExpirationDate }" /> )
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/member/memberList" class="floatL btn-bottom-orenge">목록</a>
    <div class="btn-bottom-orenge " onclick="javascript:location.href='/admin/member/memberModify?userMasterKey=${memberDetail.userMasterKey  }'">수정</div>
    <div class="btn-bottom-orenge " onclick="goAdminLogin()">관리자로 로그인</div>
    <div class="btn-bottom-orenge floatR removeMember" data-key="${memberDetail.userMasterKey  }">탈퇴</div>
  </div>
  </form>
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupDropMember.jsp"%>
<script>
$(function(){
  //지역 저장된 값을 세팅
  var userAreaType = "${memberDetail.userAreaType}";
  var userArea = "${memberDetail.userArea}";
  var userAreaDetail = "${memberDetail.userAreaDetail}";
  $.fn.MemberDetail.init(userAreaType, userArea, userAreaDetail);
});
var goAdminLogin = function() {
	alert("사용자의 동의 하에 관리자 권한으로 \n로그인하며, 본 접속기록은 저장됩니다. \n사용자 화면으로 이동 합니다.");
	location.href = '/admin/reLogin?userMasterKey=${memberDetail.userMasterKey  }&userType=1';
}
</script>