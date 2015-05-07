<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
<div id="popupCompanyJoin" class="layerPopup dn" style="display:none;">
	<h3>기업/단체 가입
		<span class="cancelBtn"  onclick="javascript:popupUtils.popupClose('#popupCompanyJoin')">X</span>
	</h3>
	<div>
		<div class="popupCompanyImg">
			<img src="${contextPath }/resources/images/trr_main_social_list.png" style="width: 100px; height: 100px;"/>
		</div>
		<div class="popupCompanyText">
         <span>
	         기업・단체 가입을 원하시는 고객은 고객문의 > 기타로<br /> 문의를 주시거나 1661-7083로 전화주시기 바랍니다.<br /><br />담당자가 친절하게 안내해 드리겠습니다.<br /><br />
         </span>
		</div>
	</div>
	<div class="btnArea">
		<a href="${contextPath}/introduction/supportInquire?inquiryCategory=5">
			<input type="button" class="authBtn"  value="고객문의"/>
		</a>
		<input type="button" class="authBtn"  onclick="closePopup('#popupCompanyJoin')" value="취소"/>
	</div>
</div>



