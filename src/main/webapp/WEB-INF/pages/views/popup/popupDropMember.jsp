<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
<div id="dropMemberform" class="layerPopup dn" style="display:none;">
  <input type="hidden" name="paymentMasterKey" value="${paymentInfo.paymentMasterKey }"/>
  <input type="hidden" name="dataId" value=""/>
  <h3>
    관리자 권한으로 탈퇴처리 
    <span class="cancelBtn"  onclick="javascript:popupUtils.popupClose('#searchUserIdForm')">X</span>
  </h3>
  <div>
    <h4>
      <span class ="dropOutUserId"></span>/
      <span class ="userName"></span>
      회원을 탈퇴처리 하시겠습니까?
    </h4>
  </div>
  <div  style="overflow:auto; ">
  <h4  style="margin:10px;"><탈퇴 사유 선택></h4>
  <form id="previewFm" > 
    <input type="hidden" name="userMasterKey"/> 
    <input type="hidden" name="dropOutUserId"/>
    <input type="hidden" name="userName" />
    <input type="hidden" name="dropOutPerson" value="${adminLoginSession.adminName}" />
    <c:forEach items="${dropOutReasonCode }" var="code" varStatus="i">
      <ol style="margin-bottom:8px">
        <li>
          <label>
	          <input type="radio" name="dropOutReason" class="dropOutReason" data-code="${code.commonCode}" value="${code.commonName }" style="margin-right:5px">
	          ${code.commonName } 
         </label>
         <c:if test="${i.index == dropOutReasonCode.size() -1 }"><input type="text" id="dropOutReasonInput" style="width: 60%;margin-left:10px"/></c:if>
       </li> 
      </ol> 
    </c:forEach> 
    <div class="btnArea" >
	    <input type="button" class="btn delButton" onclick="enableScreen();" value="탈퇴"/> 
	    <input type="button" class="btn" onclick="enableScreen();" value="취소"/> 
	  </div>
  </form>
  </div>
</div>