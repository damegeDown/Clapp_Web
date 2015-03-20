<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/customer.js"></script>
<jsp:useBean id="today" class="java.util.Date" />
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
        <td>
          <input type="text" class="inp-w600" name="noticeTitle" value="${boardNoticeDetail.noticeTitle }"/>
       </tr>
        <tr>
        <th>내용</th>
        <td>
          <textarea class="w780" cols="150" rows="20" id="ir1" name="noticeContents">${boardNoticeDetail.noticeContents }</textarea>
        </td>
       </tr>
       <tr>
        <th>이미지</th>
        <td>
        	<img src="${contextPath}/common/imgView?fileType=${boardNoticeDetail.fileTarget}&fileName=${boardNoticeDetail.fileSavedName}"  class="boardNoticeImage" style="max-width:800px"/>
					<input type="hidden" name="fileName" value="${boardNoticeDetail.fileName }" data-flag="off"/>
					<input type="hidden" name="fileSavedName" value="${boardNoticeDetail.fileSavedName }" data-flag="off"/>
          <div class="marT-5"><span>등록된 이미지 : </span><a href="">${boardNoticeDetail.fileName }</a></div>
          <div class="marT-5"><input type="file" name="file" data-flag="off"/></div>
        </td>
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
        <td>
					<label><input type="radio" name="noticeOpenYn" class="noticeOpenDateNow" <c:if test="${boardNoticeDetail.noticeOpenDate <= today}">checked="checked" </c:if>/>&nbsp;바로 적용&nbsp;&nbsp;</label>
					<label><input type="radio" name="noticeOpenYn" class="noticeOpenDateSelect" <c:if test="${boardNoticeDetail.noticeOpenDate > today}">checked="checked" </c:if>/>&nbsp;특정일시 지정 (대기 상태로 표기됨)&nbsp;&nbsp;</label>
          <span class="btn-bottom-gray">달력</span>
           <fmt:formatDate var="noticeOpenDate" pattern="yyyy/MM/dd HH:mm" value="${boardNoticeDetail.noticeOpenDate  }" />
           <input type="text" class="inp-w160 datetimepicker" name="noticeOpenDate" value="${noticeOpenDate }" data-flag="off"/>
           <!-- <input type="hidden" name="noticeOpen" value="Y" data-flag="off" />  -->  
        </td>
       </tr>
       <tr>
        <th>등록자</th>
        <td>
        <c:if test="${boardNoticeDetail.boardNoticeKey > 0}">
          <input type="text" class="inp-w160 " name="noticeInsertName" value="${boardNoticeDetail.noticeInsertName}" readonly="readonly"/>
        </c:if> 
        <c:if test="${boardNoticeDetail.boardNoticeKey == 0}">
          <input type="text" class="inp-w160 " name="noticeInsertName" value="${adminLoginSession.adminName}" readonly="readonly"/>
        </c:if> 
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/customer/boardNoticeList" class="floatL btn-bottom-orenge">목록</a>
    <div type="button" class="floatL btn-bottom-orenge PreviewBtn">미리보기</div>
    <div class="floatR btn-bottom-orenge onsubmitBtn" >${CommonCode.submitType }</div>
    <c:if test="${boardNoticeDetail.boardNoticeKey  > 0}">
      <div class="floatR btn-bottom-orenge delSubmitBtn" data-action="/admin/customer/rest/removeBoardNotice" data-type="ajax" data-id='${boardNoticeDetail.boardNoticeKey}' data-msg='삭제'>삭제</div>
    </c:if> 
    <div class="floatR btn-bottom-orenge submitBtn" style="display:none" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
  </div>
  </form>
</div>
<%@ include file="/WEB-INF/pages/views/popup/popupBoardNotice.jsp"%>
<script>
$(function() {
   $.fn.boardNoticeDetail.init();
   //스마트 에디터
   EditorUtils.smartEditor('ir1', 'ajax');
});
</script>
