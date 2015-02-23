<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<div class="sub-content">
<form id="memberForm" enctype="multipart/form-data">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
  </div>
   <c:if test="${boardNoticeDetail.boardNoticeKey ne null}">
    <input type="hidden" name="boardNoticeKey" value="${boardNoticeDetail.boardNoticeKey }"/>
  </c:if> 
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>제목</th>
        <td>${boardNoticeDetail.noticeTitle }</td>
      </tr>
        <tr>
        <th>내용</th>
        <td>${boardNoticeDetail.noticeContents }</td>
       </tr>
       <c:if test="${boardNoticeDetail.boardNoticeKey > 0}">
       <tr>
       <th>등록 일시</th>
       <td>
         <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardNoticeDetail.noticeInsertDate }" />
       </td>
        </tr>
        </c:if>
       <tr>
        <th>노출 일시</th>
        <td> <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardNoticeDetail.noticeOpenDate }" /></td>
       </tr>
       <tr>
        <th>등록자</th>
        <td>
        <c:if test="${boardNoticeDetail.boardNoticeKey > 0}">
          ${boardNoticeDetail.noticeInsertName}
        </c:if> 
        <c:if test="${boardNoticeDetail.boardNoticeKey == 0}">
          ${adminLoginSession.adminName}
        </c:if> 
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/customer/boardNoticeList" class="floatL btn-bottom-orenge">목록</a>
    <div class="btn-bottom-orenge" onclick="javascript:location.href='${contextPath}/admin/customer/boardNoticeModify?boardNoticeKey=${boardNoticeDetail.boardNoticeKey }'">수정</div>
    <div class=" btn-bottom-orenge delSubmitBtn" data-action="${contextPath}/admin/customer/rest/removeBoardNotice" data-type="ajax" data-id='${boardNoticeDetail.boardNoticeKey}' data-msg='삭제'>삭제</div>
  </div>
  </form>
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupBoardNotice.jsp"%>
<script>
$(function() {
   $.fn.boardNoticeDetail.init();
   //스마트 에디터
   //EditorUtils.smartEditor('ir1', 'ajax');
});
</script>
