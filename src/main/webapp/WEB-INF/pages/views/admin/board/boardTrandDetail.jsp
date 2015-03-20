<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/board.js"></script>
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
	         ${boardTrandDetail.trandCategory }
	        </td>
	      </tr>
	       <tr>
	        <th>제목</th>
	        <td>
	         ${boardTrandDetail.trandTitle}
	        </td>
	       </tr>
	       <tr>
	        <th>이미지</th>
	        <td>
	          <img src="${contextPath}/common/imgView?fileType=${boardTrandDetail.fileTarget}&fileName=${boardTrandDetail.fileSavedName}" style="max-width:800px"/>
	          <input type="hidden" name="fileName" value="${boardTrandDetail.fileName }" data-flag="off"/>
	          <input type="hidden" name="fileSavedName" value="${boardTrandDetail.fileSavedName }" data-flag="off"/>
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
	        <td id="trandContents">
	         ${fn:replace(boardTrandDetail.trandContents, newLineChar, '<br/>')}
	        </td>
	       </tr>
	       <tr>
	        <th>출처 / 링크</th>
	        <td>
	         ${boardTrandDetail.trandOrigin} / 링크 : <a href = "http://${boardTrandDetail.trandOriginLink}" target="new" style="color:blue;">http://${boardTrandDetail.trandOriginLink}</a>
	        </td>
	       </tr>
	       <tr>
	        <th>작성자</th>
	        <td>
	         <c:if test="${boardTrandDetail.boardTrandKey eq null }">
	         ${adminLoginSession.adminName}
	         </c:if>
				   <c:if test="${boardTrandDetail.boardTrandKey > 0 }">
				    ${boardTrandDetail.trandInsertName }
	         </c:if> 
	        </td>
	       </tr>
	    </tbody>
	  </table>
	  <div class="btn-area">
	    <a href="${contextPath}/admin/board/boardTrandList" class="floatL btn-bottom-orenge">목록</a>
	    <c:if test="${boardTrandDetail.boardTrandKey  > 0}">
	    <div class="floatR btn-bottom-orenge modify" data-key="${boardTrandDetail.boardTrandKey }">수정</div>
	    </c:if> 
	  </div>
  </form>
</div>
<script>
$(function() {
  $.fn.boardTrandDetail.init();
});
function autolink(id) {
    var container = document.getElementById(id);
    var doc = container.innerHTML;
    var regURL = new RegExp("(http|https|ftp|telnet|news|irc)://([-/.a-zA-Z0-9_~#%$?&=:200-377()]+)","gi");
    container.innerHTML = doc.replace(regURL,"<a href='$1://$2' target='_blank'>$1://$2</a>");
}
autolink("trandContents");
</script>
