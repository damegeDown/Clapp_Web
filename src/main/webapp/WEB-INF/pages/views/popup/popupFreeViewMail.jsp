<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
<div id="freeViewMail" style="display:none">
	<h3>
		메일 샘플
		<span class="cancelBtn" onclick="javascript:popupUtils.popupClose('#popupFreeView')">X</span>
	</h3>
	<div style="overflow:auto; height:400px">
		<div id="mailContents"></div>
	</div>
</div>