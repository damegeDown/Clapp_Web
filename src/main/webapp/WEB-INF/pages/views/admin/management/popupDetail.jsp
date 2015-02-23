<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/management.js"></script>

<div class="sub-content">
<form id = "popupForm">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
  </div>
    <c:if test="${popupDetail.popupKey ne null}">
    <input type="hidden" name="popupKey" value="${popupDetail.popupKey }"/>
  </c:if>
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>팝업 제목</th>
        <td>
          <input type="hidden" class="inp-w410 " name="popupTitle" value="${popupDetail.popupTitle}" placeholder="20자 이내 팝업 설명용 (관리차원)"/>
          ${popupDetail.popupTitle}
        </td>
       </tr>
         <tr>
        <th>시작 일시</th>
        <td>
          <fmt:formatDate var="startDate" pattern="yyyy/MM/dd HH:mm" value="${popupDetail.popupStartDate }" />
          <input type="hidden" class="inp-w160 datetimepicker" name="popupStartDate" value="${startDate }"/>
          ${startDate }
        </td>
      </tr>
      <tr>
        <th>종료 일시</th>
        <td>
          <fmt:formatDate var="endDate" pattern="yyyy/MM/dd HH:mm" value="${popupDetail.popupEndDate }" />
          <input type="hidden" class="inp-w160 datetimepicker" name="popupEndDate" value="${endDate }"/>
          ${endDate }
        </td>
      </tr>   
      <tr> 
        <th>팝업 사이즈</th>
        <td>
          <input type="hidden" class="inp-w160" name="popupSizeWidth" value="${popupDetail.popupSizeWidth}" placeholder="Width"/> 
          ${popupDetail.popupSizeWidth}
          <span style="margin:0 10px;font-size:16px; font-weight:bold">x</span> 
          <input type="hidden" class="inp-w160" name="popupSizeHeight" value="${popupDetail.popupSizeHeight}" placeholder="Height"/> 
          ${popupDetail.popupSizeHeight}(숫자만 입력)
        </td>
      </tr>
      <tr>
        <th>팝업 위치</th>
        <td>Top
        <input type="hidden" class="inp-w160" name="popupPositionTop" value="${popupDetail.popupPositionTop}" placeholder="100"/> 
        ${popupDetail.popupPositionTop}
        <span style="margin:0 10px;font-size:16px; font-weight:bold">/</span>Left
        <input type="hidden" class="inp-w160" name="popupPositionLeft" value="${popupDetail.popupPositionLeft}" placeholder="100"/> 
        ${popupDetail.popupPositionLeft}(숫자만 입력)
        </td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
        <div style="display:none">
        <textarea rows="15" cols="130" id="ir1" name="popupContents" >${popupDetail.popupContents}</textarea>
        </div>
        ${popupDetail.popupContents}
        </td>
      </tr>
    </tbody> 
  </table>
   <div class="btn-area">
    <a href="${contextPath}/admin/management/popupList" class="floatL btn-bottom-orenge">목록</a>
    <div class="floatL btn-bottom-orenge freeViewBtn" >미리보기</div>
    <div class="floatR btn-bottom-orenge goModify" onclick="goModify('${popupDetail.popupKey }')">수정</div>
  </div>
  </form>
</div>
<!-- 팝업 미리보기 -->
<%@ include file="/WEB-INF/pages/views/popup/popupFreeView.jsp"%>
<script>
$(function(){
	$.fn.PopupDetail.init();
	//스마트 에디터
	EditorUtils.smartEditor('ir1', 'ajax');
})
var goModify = function(id) {
	location.href = "${contextPath }/admin/management/popupModify?popupKey="+id;
}
</script>