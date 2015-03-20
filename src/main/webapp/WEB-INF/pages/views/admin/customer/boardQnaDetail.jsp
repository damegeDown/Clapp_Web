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
   <c:if test="${boardQnaDetail.boardQnaKey ne null}">
    <input type="hidden" name="boardQnaKey" value="${boardQnaDetail.boardQnaKey }"/>
  </c:if> 
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>분류</th>
        <td>${boardQnaDetail.qnaCategory}</td>
       </tr>
       <tr>
        <th>질문</th>
        <td>${boardQnaDetail.qnaQuestion }</td>
       </tr>
       <tr>
        <th>답변</th>
        <td>${boardQnaDetail.qnaAnswer }</td>
       </tr>
       <tr>
       <th>이미지</th>
       <td>
         <img src="${contextPath}/common/imgView?fileType=${boardQnaDetail.fileTarget}&fileName=${boardQnaDetail.fileSavedName}" style="max-width:800px"/>
         <input type="hidden" name="fileName" value="${boardQnaDetail.fileName }" data-flag="off"/>
         <input type="hidden" name="fileSavedName" value="${boardQnaDetail.fileSavedName }" data-flag="off"/>
       </td>
       </tr>
       <tr>
       <th>등록 일시</th>
        <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardQnaDetail.qnaInsertDate }" /></td>
        </tr>
       <tr>
        <th>TOP 10 노출 여부</th>
        <td>
        	<c:if test="${boardQnaDetail.qnaTop10Open eq 'Y'}">노출 중</c:if>
        	<c:if test="${boardQnaDetail.qnaTop10Open eq 'N'}">비노출</c:if>
        </td>
       </tr>
       <tr>
        <th>등록자</th>
        <td>
        <c:if test="${boardQnaDetail.boardQnaKey > 0}">
          ${boardQnaDetail.qnaInsertName}
        </c:if> 
        <c:if test="${boardQnaDetail.boardQnaKey eq null}">
          ${adminLoginSession.adminName}
        </c:if> 
        </td>
       </tr>
    </tbody> 
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/customer/boardQnaList" class="floatL btn-bottom-orenge">목록</a>
    <div class="floatR btn-bottom-orenge" onclick="javascript:location.href='${contextPath}/admin/customer/boardQnaModify?boardQnaKey=${boardQnaDetail.boardQnaKey}'" >수정</div>
    <div class="floatR btn-bottom-orenge submitBtn" data-action="/admin/customer/rest/removeBoardQna" data-type="ajax" data-id='${boardQnaDetail.boardQnaKey}' data-msg='삭제'>삭제</div>
  </div>
  </form>
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupBoardQna.jsp"%>
<script>
$(function() {
   $.fn.boardQnaDetail.init(); 
});
</script>
