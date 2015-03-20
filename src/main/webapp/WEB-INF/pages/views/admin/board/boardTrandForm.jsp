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
  </div>
  <c:if test="${boardTrandDetail.boardTrandKey ne null}">
    <input type="hidden" name="boardTrandKey" value="${boardTrandDetail.boardTrandKey }"/>
  </c:if> 
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>게시판 구분</th>
        <td>
        <select name="TrandCategory">
            <option value="">선택</option>
            <c:forEach items="${TrandCategoryCode }" var="code">
            <option value="${code.commonCode }" <c:if test="${boardTrandDetail.trandCategory eq code.commonName }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
          </select>
        </td>
       </tr>
       <tr>
        <th>제목</th>
        <td>
          <input type="text" class="inp-w810" name="trandTitle" placeholder="40자 이내" value="${boardTrandDetail.trandTitle}"/>
        </td>
       </tr>
       <tr>
        <th>이미지</th>
        <td>
          <img src="${contextPath}/common/imgView?fileType=${boardTrandDetail.fileTarget}&fileName=${boardTrandDetail.fileSavedName}" style="max-width:800px"/>
          <input type="hidden" name="fileName" value="${boardTrandDetail.fileName }" data-flag="off"/>
          <input type="hidden" name="fileSavedName" value="${boardTrandDetail.fileSavedName }" data-flag="off"/>
          <div class="marT-5"><span>등록된 이미지 : </span><a href="">${boardTrandDetail.fileName }</a></div>
          <div class="marT-5"><input type="file" name="file" data-flag="off"/></div>
       </td>
       </tr> 
       <tr>
        <th>썸네일 이미지</th>
        <td>
          <img src="${contextPath}/common/imgView?fileType=${boardTrandDetail.fileTarget}&fileName=thumb_${boardTrandDetail.fileSavedName}" />
        </td>
       </tr>
       <tr>
        <th>내용</th>
        <td>
         <textarea rows="10" cols="200" name="trandContents" >${boardTrandDetail.trandContents}</textarea>
        </td>
       </tr>
       <tr>
        <th>출처 / 링크</th>
        <td>
          <input type="text" name="trandOrigin" placeholder="출처" value="${boardTrandDetail.trandOrigin}"/> / 링크 : http:// 
          <input type="text" class="inp-w600" name="trandOriginLink" placeholder="40자 이내" value="${boardTrandDetail.trandOriginLink}"/>
        </td>
       </tr>
       <tr>
        <th>작성자</th>
        <td>
         <c:if test="${boardTrandDetail.boardTrandKey eq null }">
           <input type="text" class="inp-w160 " name="trandInsertName" value="${adminLoginSession.adminName}" readonly="readonly" data-flag="off"/>
         </c:if>
         <c:if test="${boardTrandDetail.boardTrandKey > 0 }">
          <input type="text" class="inp-w160 " name="trandInsertName" value="${boardTrandDetail.trandInsertName}" readonly="readonly" data-flag="off"/>
         </c:if> 
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/board/boardTrandList" class="floatL btn-bottom-orenge">목록</a>
    <c:if test="${boardTrandDetail.boardTrandKey  > 0}">
      <div class="floatR btn-bottom-orenge submitBtn" data-action="/admin/board/rest/removeBoardTrand" data-type="ajax" data-id='${boardTrandDetail.boardTrandKey}' data-msg='삭제'>삭제</div>
    </c:if> 
    <div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
  </div>
  </form>
</div>
