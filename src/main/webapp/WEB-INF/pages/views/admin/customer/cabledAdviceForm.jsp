<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="sub-content">
<form id="memberForm" enctype="multipart/form-data">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
    <div style="margin:5px; color:red">※ 유선으로 바로 회신이 어려운 상담의 경우, 이메일 주소 또는 연락처 중 1개는 필수정보 입니다. ( 분야별 담당자에게 전달 )</div>
    <div style="margin:5px; color:red">※ 문의자, 이메일 주소, 연락처는 개인정보에 관한 부분으로 상담을 통해 제공동의 함을 안내해 주시기 바랍니다.</div>
    <br>
  </div>
   <c:if test="${cabledAdviceDetail.cabledAdviceKey ne null}">
    <input type="hidden" name="cabledAdviceKey" value="${cabledAdviceDetail.cabledAdviceKey }"/>
  </c:if> 
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>문의 분류</th>
        <td>
        <select name="adviceCategory">
            <option value="">선택</option>
            <c:forEach items="${cabledAdviceCode }" var="code">
            <option value="${code.commonCode }" <c:if test="${cabledAdviceDetail.adviceCategory eq code.commonName }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
          </select>
        </td>
       </tr>
       <tr>
        <th>접수 일시</th>
        <td>
            <c:if test="${cabledAdviceDetail.cabledAdviceKey > 0}">
                <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${cabledAdviceDetail.adviceAcceptDate  }"></fmt:formatDate>
            </c:if>
            <c:if test="${cabledAdviceDetail.cabledAdviceKey <= 0}">
                <input type="text" class="inp-w160 datetimepicker" name="adviceAcceptDate" value="${cabledAdviceDetail.adviceAcceptDate}" />
            </c:if>

        </td>
       </tr>
       <tr>
        <th>문의자</th>
        <td>
        <input type="text" name="adviceInquiryName" value="${cabledAdviceDetail.adviceInquiryName}"/> 문의자 이름 또는 기업, 단체명 입력
       </td>
       </tr> 
       <tr>
        <th>이메일 주소</th>
        <td>
        <input type="text" name="adviceEmail" class="inp-w300" placeholder="연락받을 이메일 주소 : sample@clapp.co.kr" value="${cabledAdviceDetail.adviceEmail}"/>
        </td>
       </tr>
       <tr>
        <th>연락처</th>
        <td>
          <c:set var="phoneNum" value="${fn:split(cabledAdviceDetail.advicePhoneNumber,'-')}"/>
          <input type="text" class="inp-w60 phoneNum" name="phoneNum1" value="${phoneNum[0]}" data-name="연락처" maxlength="4" placeholder="국번"/> -
          <input type="text" class="inp-w60 phoneNum" name="phoneNum2" value="${phoneNum[1]}" data-name="연락처" maxlength="4"/> - 
          <input type="text" class="inp-w60 phoneNum" name="phoneNum3" value="${phoneNum[2]}" data-name="연락처" maxlength="4"/>
          <input type="hidden" class="phoneNumComp" name="advicePhoneNumber" value="${cabledAdviceDetail.advicePhoneNumber}"/>
        </td>
       </tr>
       <tr>
        <th>상담 제목</th>
        <td>
          <input type="text" name="adviceTitle" class="inp-w300" placeholder="상담 내용을 간략하게 함축 (주제만)" value="${cabledAdviceDetail.adviceTitle}"/>
        </td>
       </tr>
       <tr>
        <th>상담 내용</th>
        <td>
         <textarea rows="5" cols="100" name="adviceContents" class="txt-w800 adviceContents" wrap="hard">${cabledAdviceDetail.adviceContents} </textarea>
        </td>
       </tr>
       <tr>
        <th>상담 완료 일시</th>
        <td>
        아래 상담 완료 버튼 클릭시, 자동 입력처리
        </td>
       </tr>
       <tr>
        <th>상담자</th>
        <td>
          <input type="text" name="adviceInsertName" value="${adminLoginSession.adminName}"/>
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/customer/cabledAdviceList" class="floatL btn-bottom-orenge">목록</a>
    <div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
  </div>
  </form>
</div>
<script>
/* $(function(){
$(".adviceContents").val().replace(/\n/g, '<br>');
}); */
/* var adviceContents = $("textarea[name=adviceContents]").val();
adviceContents = adviceContents.replace(/(\r\n|\n|\r)/g,"<br />"); */
</script>