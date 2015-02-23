<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<script type="text/javascript" src="${contextPath }/resources/js/board.js"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="sub-content">
  <form id="memberForm" enctype="multipart/form-data">
    <div> 
      <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
      <div style="clear:both;"></div>
    </div>
    <c:if test="${boardSocialBlogDetail.boardSocialBlogKey ne null}">
    <input type="hidden" name="boardSocialBlogKey" value="${boardSocialBlogDetail.boardSocialBlogKey }"/>
    </c:if> 
    <table class="board-write box-pd">
    <colgroup>
      <col width="200px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>소셜 구분별 링크</th>
        <td>
          Facebook  Twitter Blog
        </td>
      </tr>
      <tr>
        <th>제목</th>
        <td>
          ${boardSocialBlogDetail.socialBlogTitle}
        </td>
      </tr>
      <tr>
        <th>이미지</th>
        <td>
          <img src="${contextPath}/common/imgView?fileType=${boardSocialBlogDetail.fileTarget}&fileName=${boardSocialBlogDetail.fileSavedName}" style="max-width:800px"/>
          <input type="hidden" name="fileName" value="${boardSocialBlogDetail.fileName }" data-flag="off"/>
          <input type="hidden" name="fileSavedName" value="${boardSocialBlogDetail.fileSavedName }" data-flag="off"/>
        </td>
      </tr> 
      <tr>
        <th>썸네일 이미지</th>
        <td>
          <img src="${contextPath}/common/imgView?fileType=${boardSocialBlogDetail.fileTarget}&fileName=thumb_${boardSocialBlogDetail.fileSavedName}" />
        </td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
          ${fn:replace(boardSocialBlogDetail.socialBlogContent, newLineChar, '<br/>')}
        </td>
      </tr>
      <tr>
        <th>작성자</th>
        <td>
         <c:if test="${boardSocialBlogDetail.boardSocialBlogKey eq null }">
           ${adminLoginSession.adminName}
         </c:if>
         <c:if test="${boardSocialBlogDetail.boardSocialBlogKey > 0 }">
           ${boardSocialBlogDetail.socialBlogInsertName }
         </c:if> 
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/board/boardSocialBlogList" class="floatL btn-bottom-orenge">목록</a>
    <c:if test="${boardSocialBlogDetail.boardSocialBlogKey  > 0}">
    <div class="floatR btn-bottom-orenge modify" data-key="${boardSocialBlogDetail.boardSocialBlogKey }">수정</div>
    </c:if> 
   </div>
  </form>
</div>
<script>
$(function() {
  $.fn.boardSocialBlogDetail.init();
});
</script>
