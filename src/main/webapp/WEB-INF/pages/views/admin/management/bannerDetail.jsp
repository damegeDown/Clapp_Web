<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/management.js"></script>

<div class="sub-content">
<form id = "bannerForm">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
  </div>
    <c:if test="${bannerDetail.bannerInquiryKey ne null}">
    <input type="hidden" name="bannerInquiryKey" value="${bannerDetail.bannerInquiryKey }"/>
  </c:if>
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
     <tr>
      <th>배너 제목</th>
      <td>
        <input type="hidden" class="inp-w410 " name="bannerTitle" value="${bannerDetail.bannerTitle}" placeholder="20자 이내 팝업 설명용 (관리차원)"/>
        ${bannerDetail.bannerTitle}
      </td>
     </tr>
     <tr>
       <th>시작 일시</th>
       <td>
         <fmt:formatDate var="startDate" pattern="yyyy/MM/dd HH:mm" value="${bannerDetail.bannerStartDate }" />
         <input type="hidden" class="inp-w160 datetimepicker" name="bannerStartDate" value="${startDate }"/>
         ${startDate }
       </td>
     </tr>
     <tr>
       <th>종료 일시</th>
       <td>
         <fmt:formatDate var="endDate" pattern="yyyy/MM/dd HH:mm" value="${bannerDetail.bannerEndDate }" />
         <input type="hidden" class="inp-w160 datetimepicker" name="bannerEndDate" value="${endDate }"/>
         ${endDate }
       </td>
     </tr>
     <tr>
       <th>배너 이미지 등록</th>
       <td>
         <img id="blah" src="${contextPath}/common/imgView?fileType=${bannerDetail.fileTarget}&fileName=${bannerDetail.fileSavedName}" style="max-width:800px"/>
         <input type="hidden" name="fileName" value="${bannerDetail.fileName }" data-flag="off"/>
         <input type="hidden" name="fileSavedName" value="${bannerDetail.fileSavedName }" data-flag="off"/>
         <div class="marT-5"><span>등록된 이미지 : </span><a href="">${bannerDetail.fileName }</a></div>
       </td>
     </tr>
     <tr>
       <th>상태</th>
       <td>
         <input type="hidden" class="inp-w160" name="bannerStatus" value="${bannerDetail.bannerStatus}" placeholder="Width"/>
         <c:if test="${bannerDetail.bannerStatus eq '1'}">노출</c:if>
         <c:if test="${bannerDetail.bannerStatus eq '0'}">비노출</c:if>
       </td>
     </tr>
     <tr>
        <th>노출순서</th>
        <td>
          <input type="hidden" class="inp-w410 " name="bannerViewSeq" value="${bannerDetail.bannerViewSeq}" placeholder="노출순서"/>
          ${bannerDetail.bannerViewSeq}
        </td>
       </tr>
      <tr> 
        <th>링크 URL</th>
        <td>
          <input type="hidden" class="inp-w160" name="bannerLinkType" value="${bannerDetail.bannerLinkType}" placeholder="Width"/>
          <c:if test="${bannerDetail.bannerLinkType eq '1'}">현재창</c:if>
          <c:if test="${bannerDetail.bannerLinkType eq '0'}">새창</c:if>
          <br/><br/>
          <input type="hidden" class="inp-w160" name="bannerLinkUrl" value="${bannerDetail.bannerLinkUrl}" placeholder="Width"/> 
          ${bannerDetail.bannerLinkUrl}
        </td>
      </tr>

    </tbody> 
  </table>
   <div class="btn-area">
    <a href="${contextPath}/admin/management/bannerList" class="floatL btn-bottom-orenge">목록</a>
    <div class="floatR btn-bottom-orenge goModify" onclick="goModify('${bannerDetail.bannerInquiryKey }')">수정</div>
  </div>
  </form>
</div>
<script>
var goModify = function(id) {
	location.href = "${contextPath }/admin/management/bannerModify?bannerInquiryKey="+id;
}
</script>