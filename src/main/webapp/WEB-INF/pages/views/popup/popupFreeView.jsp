<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
<div id="popupFreeView" style="display:none">
<h3>
	팝업 관리 > 팝업 미리보기 
	<span class="cancelBtn" onclick="javascript:popupUtils.popupClose('#popupFreeView')">X</span>
</h3>
<div class="popUpContents" style="overflow:auto"></div>
</div>