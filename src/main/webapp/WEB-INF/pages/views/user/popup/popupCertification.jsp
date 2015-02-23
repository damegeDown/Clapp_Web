<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/>
 <div id="popCertification" style="display:none">   
 <input type="hidden" name="certificationNum" data-flag="off"/>
	<div style="padding-top:10px;">
			<div>
				<input type="hidden" class="phoneNumComp" name="userCellPhoneNumber" value="${userLoginSession.userCellPhoneNumber}"/>
				<span >- 휴대폰 번호</span> :  <span>${userLoginSession.userCellPhoneNumber}</span>
				<span><input type="button" class="authBtn"  onclick="javascript:sendCertificationNum('${userLoginSession.userCellPhoneNumber}')" value="인증받기"/></span>
			</div>
			<div>
				<span>-접속 인증번호 입력</span>
				<span><input type="text" class="sicPwConf" placeholder="인증번호 6자리 입력" name="certificationNumConf" data-flag="off" maxlength="6"/></span>
			</div>
			<p class="smisCorpMessage" style="margin:10px 0 5px 0;color:blue">3분 이내 입력 ( 남은시간 : <span class="min">3</span>분 : <span class="sec">00</span>초 )</p>
			<input type="button" class="authBtn"  onclick="certificationSubmit()" value="인증 확인"/>
			<input type="button" class="authBtn"  onclick="closePopup('#popCertification')" value="취소"/>
	</div>
</div> 
 
<script>
   
/**
 * 인증번호 발송
 * */ 
var sendCertificationNum = function(userCellPhoneNumber) {
	unblockUI();
	$.ajax({
		url : contextPath + "/common/sendCertificationNum",
		type : "post",
		dataType : "json",
		data : {userCellPhoneNumber : $("input[name=userCellPhoneNumber]").val()},
		success : function(data) {
			$("input[name=certificationNum]").val(data);
			alert("변경하실 휴대폰으로 인증번호를 발송해 드렸습니다. 확인 후, 아래 인증번호 재입력에 6자리 숫자를 입력해 주세요.");
			CountDownUtils.setMinute(3);
		},
		error : function(e) {
			alert("error");
		}
	});
}
var closePopup = function(id) {
	blockUI();
	popupUtils.popupClose(id);
};
var certificationSubmit = function() {
	var certificationNumConf = $("input[name=certificationNumConf]").val();
	var certificationNum = $("input[name=certificationNum]").val();
	if(!certificationNumConf) {
		alert("휴대폰 번호 인증이 되지 않았습니다.\n인증번호 전송 후, 문자에 수신된 6자리 숫자를 입력해 주세요.");
		return false;
	}
	if(certificationNumConf != certificationNum){
		alert("입력하신 인증번호가 맞지 않습니다.\n문자를 다시 확인해 주세요.");
		return false; 
	}
	setCookie("certificationId", "${userLoginSession.userMasterKey}");
	closePopup("#popCertification");
	JnlpUtils.getUserInfo();
	blockUI();
}

</script>