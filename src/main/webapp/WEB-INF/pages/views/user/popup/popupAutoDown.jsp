<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
<div id="popupAutoDown" style="display:none">
<h3>
	팝업 관리 > 팝업 미리보기 
	<span class="cancelBtn" onclick="javascript:popupUtils.popupClose('#popCertification')">X</span>
</h3>
<div class="popUpContents">
	클앱 자동화는 파일 다운로드 후 설치, <br/>사이트에 별도 접속하지 않아도 회원 계정만 있으시면<br/> 언제 어디서든 사용하실 수 있습니다.
</div><br/>
	<input type="button" class="authBtn"  onclick="autoJnlpDownload()" value="다운로드"/>
	<input type="button" class="authBtn"  onclick="closePopup('#popCertification')" value="취소"/>
</div>
