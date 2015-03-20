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
        <td>
          ${companyDetail.userId}
        </td>
       </tr>
       <tr>
        <th>기업/단체명</th>
        <td>
          ${companyDetail.userCompanyName}
        </td>
       </tr>
       <tr>
        <th>구분</th>
        <td>
          ${companyDetail.userCompanyGroupTypeText}
        </td>
       </tr>
       <tr>
        <th>담당자명</th>
        <td>
          <input type="text" class="inp-w160 " name="userName" value="${companyDetail.userName}" data-flag="off"/>
        </td>
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
          <input type="text" class="inp-w160 " name="userPassword" value="" data-flag="off"/> (확인 요청 시에만 변경)
        </td>
       </tr>
        <tr>
        <th>휴대폰 번호</th>
        <td>
        	<c:set var="cellPhone" value="${fn:split(companyDetail.userCellPhoneNumber,'-')}"/>
        	<select class="phoneNum" name="cellPhone1">
        		<option value="0">-선택-</option>
						<c:forEach items="${cellPhoneCode }" var="code">
							<option value="${code.commonCode }" <c:if test="${cellPhone[0] eq code.commonCode }">selected</c:if>>${code.commonName }</option>
						</c:forEach>
					</select> -  
          <input type="text" class="inp-w60 phoneNum" name="cellPhone2" value="${cellPhone[1]}" data-name="휴대폰번호" maxlength="4"/> - 
          <input type="text" class="inp-w60 phoneNum" name="cellPhone3" value="${cellPhone[2]}" data-name="휴대폰번호" maxlength="4"/>
          <input type="hidden" class="phoneNumComp" name="userCellPhoneNumber" value="${companyDetail.userCellPhoneNumber}"/>
        </td>
       </tr>
       <tr>
        <th>사업자등록번호</th>
        <td>
        	<c:set var="companyNumber" value="${fn:split(companyDetail.userCompanyNumber,'-')}"/>
          <input type="text" class="inp-w60 phoneNum" name="companyNumbe1" value="${companyNumber[0]}" maxlength="3" data-flag="off"/> - 
          <input type="text" class="inp-w60 phoneNum" name="companyNumber2" value="${companyNumber[1]}" maxlength="2" data-flag="off"/> - 
          <input type="text" class="inp-w60 phoneNum" name="companyNumber3" value="${companyNumber[2]}" maxlength="5" data-flag="off"/>
          <input type="hidden" class="phoneNumComp" name="userCompanyNumber" value="${companyDetail.userCompanyNumber}" data-flag="off"/>
        </td>
       </tr>
       <tr>
        <th>지역 (선택항목)</th> 
        <td>
          <select class="floatL sel-w80" name="userAreaType" data-type="AREA" data-wrap="userArea">
          	<option value="0">-선택-</option>
          	<option value="1" data-val="1">국내</option>
          	<option value="2" data-val="2">해외</option>
          </select>
          <div class="floatL userArea"><!-- 지역 --></div>
          <div class="floatL userAreaDetail"><!-- 상세지역 --></div>
        </td>
       </tr>
       <tr>
        <th>업종 (선택항목)</th>
        <td>
          <%-- <input type="text" class="inp-w160 " name="userCompanyBusinessType" value="${companyDetail.userCompanyBusinessType}" data-flag="off"/> --%>
          <select name="userCompanyBusinessType">
            <option value="">-업종선택-</option>
            <c:forEach items="${userCompanyBusinessTypeCode }" var="code">
              <option value="${code.commonCode }" <c:if test="${companyDetail.userCompanyBusinessType eq code.commonCode }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
          </select>
        </td>
       </tr>
       <tr>
        <th>메일수신여부</th>
        <td>
          <input type="radio" name="userMailReceptionYn" value="Y"<c:if test="${companyDetail.userMailReceptionYn == 'Y'}">checked="checked" </c:if>/>수신&nbsp;&nbsp;
          <input type="radio" name="userMailReceptionYn" value="N"<c:if test="${companyDetail.userMailReceptionYn == 'N'}">checked="checked" </c:if>/>수신거부
        </td>
       </tr>
       <tr>
        <th>최종 로그인 일시</th>
        <td>
            <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${companyDetail.userLastLoginDate}" />
        </td>
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
    <div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
  </div>
  </form>
</div>
<script>
$(function(){
	//지역 저장된 값을 세팅
  var userAreaType = "${companyDetail.userAreaType}";
  var userArea = "${companyDetail.userArea}";
  var userAreaDetail = "${companyDetail.userAreaDetail}";
  $.fn.CompanyDetail.init(userAreaType, userArea, userAreaDetail);
});
</script>