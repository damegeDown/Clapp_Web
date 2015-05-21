<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
<div id="popupCompanyJoin" class="layerPopup dn" style="display:none;">
	<body>
		<table class="title">
			<tr>
				<td width="21" border="0" height="44"></td>
				<td width="108" height="44"><img src="${contextPath }/resources/images/popup_logo.png" /></td>
				<td width="14"><img src="${contextPath }/resources/images/popup_logoline.png" /></td>
				<td style="color: #FFFFFF; font-size: 13px;" width="218">기업 / 단체 가입 안내</td>
				<td width="31"><a href="javascript:;"><img src="${contextPath }/resources/images/popup_close.png" width="11" height="12" onclick="javascript:popupUtils.popupClose('#popupCompanyJoin')" border="0"></a></td>
			</tr>
		</table>
		<table class="contents">
			<tr>
				<td>
					<p class="text">기업 · 단체 가입을 원하시는 고객은 고객문의 > 기타로<br>
						문의를 주시거나 1661-7083으로 전화주시기 바랍니다.
						<br>
						<br>담당자가 친절하게 안내해 드리겠습니다.</p>
					<a href="${contextPath}/introduction/supportInquire?inquiryCategory=5">
						<img src="${contextPath }/resources/images/popup_member.png"/>
					</a>
					<a href="javascript:;">
						<img src="${contextPath }/resources/images/popup_cancel.png" onclick="closePopup('#popupCompanyJoin')"/>
					</a>
					</td>
				</tr>
			</table>
		</body>
</div>



