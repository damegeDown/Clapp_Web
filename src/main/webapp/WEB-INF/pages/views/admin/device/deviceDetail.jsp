<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/device.js"></script>
<div class="sub-content">
<form id="memberForm" enctype="multipart/form-data">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation } </h3>
    <div style="clear:both;"></div>
  </div>
  <c:if test="${deviceDetail.deviceKey ne null}">
    <input type="hidden" name="deviceKey" value="${deviceDetail.deviceKey }"/>
  </c:if>
  <table class="board-write box-pd">
    <colgroup>
      <col width="150px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <tr>
        <th>모델명 (영문명)</th>
        <td>
          <input type="text" class="inp-w160" name="deviceModelEname" value="${deviceDetail.deviceModelEname }"/>&nbsp;&nbsp;영문명 규칙 : 제조사 모델시리즈1 2 버전 (첫 글자 대문자, 버전은 로마자 또는 숫자)
        </td>
       </tr>
       <tr>
        <th>모델명 (한글명)</th>
        <td>
          <input type="text" class="inp-w160" name="deviceModelKname" value="${deviceDetail.deviceModelKname }"/>&nbsp;&nbsp;한글명 규칙 : 제조사 모델시리즈1 2 버전
        </td>
       </tr>
       <tr>
        <th>제조사</th>
        <td>
        <select name="deviceMakerCode">
         <option value="">선택</option>
            <c:forEach items="${deviceMakerCodeNum }" var="code">
            <option value="${code.commonCode }" <c:if test="${deviceDetail.deviceMakerCode eq code.commonCode }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
          </select>
          <%-- <input type="text" class="inp-w160" name="deviceMakerCode" value="${deviceDetail.deviceMakerCode }"/> --%>
        </td>
       </tr>
       <tr>
        <th>OS</th>
        <td>
        <select name="deviceOsCode">
            <option value="">선택</option>
            <c:forEach items="${deviceOsCodeNum }" var="code">
            <option value="${code.commonCode }" <c:if test="${deviceDetail.deviceOsCode eq code.commonCode }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
          </select>
         <%--  <input type="text" class="inp-w160 " name="deviceOsCode" value="${deviceDetail.deviceOsCode }"/> --%>
        </td>
       </tr>
       <tr>
        <th>버전</th>
        <td>
          <input type="text" class="inp-w160 " name="deviceVersion" value="${deviceDetail.deviceVersion }"/>&nbsp;&nbsp;버전 입력 규칙 : 숫자.숫자.숫자 (정확히 입력, 공백없이)
        </td>
       </tr>
       <tr>
        <th>이미지</th>
        <td>
        	<img src="${contextPath}/common/imgView?fileType=${deviceDetail.fileTarget}&fileName=${deviceDetail.fileSavedName}" style="max-width:800px"/>
					<input type="hidden" name="fileName" value="${deviceDetail.fileName }" data-flag="off"/>
					<input type="hidden" name="fileSavedName" value="${deviceDetail.fileSavedName }" data-flag="off"/>
          <div class="marT-5"><span>등록된 이미지 : </span><a href="">${deviceDetail.fileName }</a></div>
          <div class="marT-5"><input type="file" name="file" data-flag="off"/></div>
        </td>
       </tr> 
       <tr>
        <th>썸네일 이미지</th>
        <td>
          <img src="${contextPath}/common/imgView?fileType=${deviceDetail.fileTarget}&fileName=thumb_${deviceDetail.fileSavedName}" />
        </td>
       </tr>
       <tr>
        <th>대표 디바이스 노출</th>
        <td>
          <label><input type="radio" name="deviceTop10Open" value="Y"<c:if test="${deviceDetail.deviceTop10Open eq 'Y'}">checked="checked" </c:if>/>&nbsp;&nbsp;YES (노출가능 개수 : <span class="deviceTop10">${11 - countExposedDevice }</span>개)&nbsp;&nbsp;&nbsp;</label>
          <label><input type="radio" name="deviceTop10Open" value="N"<c:if test="${deviceDetail.deviceTop10Open ne 'Y'}">checked="checked" </c:if>/>&nbsp;&nbsp;NO</label>
        </td>
       </tr>
       <tr>
        <th>등록일시</th>
        <td>
          <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${deviceDetail.deviceInsertDate }" />
        </td>
       </tr>
       <tr>
        <th>최종 수정일시</th>
        <td>
        <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${deviceDetail.deviceModifyDate }" />
        </td>
       </tr>
       <tr>
        <th>등록자</th>
        <td>
        <c:if test="${deviceDetail.deviceKey eq null }">
   <input type="text" class="inp-w160 " name="deviceInsertName" value="${adminLoginSession.adminName} " data-flag="off"/>
   </c:if>
   <c:if test="${deviceDetail.deviceKey > 0 }">
  <input type="text" class="inp-w160 " name="deviceInsertName" value="${deviceDetail.deviceInsertName }" data-flag="off"/>
   </c:if>
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/device/deviceList" class="floatL btn-bottom-orenge">목록</a>
    <c:if test="${deviceDetail.deviceKey  > 0}">
      <div class="floatR btn-bottom-orenge submitBtn" data-action="/admin/device/rest/removeDevice" data-type="ajax" data-id='${deviceDetail.deviceKey}' data-msg='삭제'>삭제</div>
    </c:if>
    <div class="floatR btn-bottom-orenge submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }">${CommonCode.submitType }</div>
  </div>
  </form>
</div>
<script>
$(function() {
	$.fn.DeviceDetail.init();
});
</script>
