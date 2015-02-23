<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/ticket.js"></script>
<div class="sub-content">
<form id="memberForm" enctype="multipart/form-data">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
  </div>
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr class="trUserId" >
        <th>대상 회원 ID</th>
        <td>
          <p class="serviceTargetRow">
          <label><input type="radio" class="inp-w40 serviceTargetType" name="serviceTargetType" value="1" />전체 (member_all)</label>
          </p>
          <p class="serviceTargetRow">
          <label><input type="radio" class="inp-w40 serviceTargetType" name="serviceTargetType" value="2" />일반 전체 (person_all)</label>
          </p>
          <p>
          <label><input type="radio" class="inp-w40 serviceTargetType" name="serviceTargetType" value="3" />기업/단체 전체 (company_all)</label>
          </p>
          <p>
          <label><input type="radio" class="inp-w40 serviceTargetType" name="serviceTargetType" value="4" />개별 계정 (개별 회원 또는 별도 계약건)</label>
          </p>  
          <div class="addUser">
            <input type="text" style="margin-left: 18px;"class="inp-w301 test" name="userIdArr" value="" placeholder="정확한 이메일주소를 입력해 주세요. 예) aaaaa@aa.co.kr" data-flag="off" data-id="1"/>
            <input type="button" class="btn searchUserIdBtn" value="검색"/><input type="button" class="btn addUserIdBtn" value="+"/>
          </div>
      </tr>
      <tr>
        <th>이름, 기업/단체명</th>
        <td>
          <input type="text" class="inp-w410" name="serviceTargetName" class="userName" data-flag ="off"  placeholder="개별 계정에 부여할 때만 입력 ( 전체, 일반 전체, 기업/단체 전체는 자동 입력됨 )"/>
        </td>
      </tr> 
      <tr>
        <th>적용일시</th>
        <td>
          <label><input type="radio" name="aa" class="serviceApplyDateNow" />&nbsp;바로 적용&nbsp;&nbsp;</label>
          <label><input type="radio" name="aa" class="serviceApplyDateSelect" />&nbsp;특정일시 지정&nbsp;&nbsp;</label>
          <span class="btn-bottom-gray">달력</span>
           <fmt:formatDate var="serviceApplyDate" pattern="yyyy/MM/dd HH:mm" value="${ticketEntity.serviceApplyDate }" />
           <input type="text" class="inp-w160 datetimepicker" name="serviceApplyDate" value="${serviceApplyDate }" data-flag="off"/>  
        </td>
      </tr>
      <tr>
        <th>적용상품명</th>
        <td>
          <select class="sel-w70" name="serviceProductName">
            <option value="">선택</option>
            <c:forEach items="${productTypeCode}" var="code">
               <option value="${code.commonCode }">${code.commonName }</option>
            </c:forEach>
          </select>
          &nbsp;&nbsp;사용자 단에 노출될 상품명 (별도 계약건에 한함) 
        </td>
     </tr>
     <tr>
       <th>계정당 적용 티켓수</th>
        <td>
         <input type="text" class="inp-w160 serviceApplyTicketAmount" name="serviceApplyTicketAmount" placeholder="숫자만 입력"/>&nbsp;&nbsp;개 ( 반드시 1 계정당 발행될 티켓 수를 입력해 주세요 )
       </td>
     </tr>
     <tr>
       <th>적용사유</th>
       <td>
       <select class="sel-w70" name="serviceApplyReason">
         <option value="">선택</option>
         <c:forEach items="${serviceApplyReasonCode}" var="code">
            <option value="${code.commonCode }">${code.commonName }</option>
         </c:forEach>
       </select>
       </td>
     </tr>
     <tr>
       <th>적용 담당자</th>
       <td>
       <input type="text" class="inp-w160 " name="serviceApplyOperatorName" value="${adminLoginSession.adminName} "/>
       </td>
     </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/ticket/ticketProductServiceList" class="floatL btn-bottom-orenge">목록</a>
    <div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
  </div>
  </form>
</div>
<!-- 회원 검색 팝업 -->
<%@ include file="/WEB-INF/pages/views/popup/popupSearchUserId.jsp"%>
<script>
  $(function() {
    var companyName = '${companyNameList}';
    companyName = companyName.replace("[", "").replace("]","").split(",");
    var tagsArr = [];
    for(var i = 0; i < companyName.length; i++) {
      tagsArr.push(companyName[i].trim());
    }
    var availableTags = tagsArr;
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });
  $(function() {
    //회원 아이디 함수
    $.fn.Common.init();
    $.fn.ticketProductServiceForm.init();
  });
</script>