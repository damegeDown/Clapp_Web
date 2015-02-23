<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
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
        <tr>
          <th>문의 분류</th>
          <td>
           ${cabledAdviceDetail.adviceCategory }
          </td>
        </tr>
         <tr>
          <th>접수 일시</th>
          <td>
           <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${cabledAdviceDetail.adviceAcceptDate}" /> 
          </td>
         </tr>
         <tr>
          <th>문의자</th>
          <td>
          ${cabledAdviceDetail.adviceInquiryName}
          </td>
         </tr> 
         <tr>
          <th>이메일 주소</th>
          <td>
          ${cabledAdviceDetail.adviceEmail}
          </td>
         </tr>
         <tr>
          <th>연락처</th>
          <td>
           ${cabledAdviceDetail.advicePhoneNumber}
          </td>
         </tr>
         <tr>
          <th>상담 제목</th>
          <td>
          ${cabledAdviceDetail.adviceTitle}
          </td>
         </tr>
         <tr>
          <th>상담 내용</th>
          <td>
           ${fn:replace(cabledAdviceDetail.adviceContents , newLineChar, '<br/>')}
          </td>
         </tr>
         <tr>
          <th>상담 완료 일시</th>
          <td>
          <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${cabledAdviceDetail.adviceComleteDate}" />
         
          </td>
         </tr>
         <tr>
          <th>상담자</th>
          <td>
          ${cabledAdviceDetail.adviceInsertName}
          </td>
         </tr>
      </tbody>
    </table>
    <div class="btn-area">
      <a href="${contextPath}/admin/customer/cabledAdviceList" class="floatL btn-bottom-orenge">목록</a>
      <c:if test="${cabledAdviceDetail.cabledAdviceKey  > 0}">
      <div class="floatR btn-bottom-orenge modify" data-key="${cabledAdviceDetail.cabledAdviceKey }"> 상담입력</div>
      <div class="floatR btn-bottom-orenge modify" data-key="${cabledAdviceDetail.cabledAdviceKey }"> 상담추가</div>
      </c:if> 
    </div> 
  </form>
</div>
<script>
 $(function() {
   $.fn.cabledAdviceDetail.init();
});
</script>
