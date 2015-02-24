/**
 * 검색
 */
var SearchUtils = (function() {
 	"user strict";
 	 /**
 	  * 기간조회
 	  * param  _this : 클릭된 Obj , term : 기간
 	  */
 	 var setDataTerm = function(_this, term) {
 		 var d = new Date();
 		 var year = d.getFullYear();
 		 var month = d.getMonth() + 1;
 		 var day = d.getDate();
 		 var toDay =  year +"/"+ month +"/"+ day;
 		 $(".smccdtTabLi").removeClass('smccdtTabLiActive');
 		 if(!_this) {
 			 _this = $(".smccdtTabLi").eq(0);
 		 }
 		 $(_this).addClass("smccdtTabLiActive");
 		 if(term == "all") {
 			 $(".dateTerm").val('');
 		 } else if(term == "toDay") {
 			$(".dateTerm").val(toDay);
 		 } else {  
 			 d.setDate(day - 7);
 			 var after7Day =   d.getFullYear() +"/"+ (d.getMonth() + 1) +"/"+ d.getDate();
 			 $("input[name=endDate]").val(toDay);
 			 $("input[name=startDate]").val(after7Day);
 		 }
 	 };
 	 return {
 		 setDataTerm : setDataTerm 
 	 }
})($);

/**
 * 인증번호 발송
 * */
var sendUserCertificationNum = function(userCellPhoneNumber) {
	var oriCellPhoneNum = userCellPhoneNumber;
	var newCellPhoneNum = $("input[name=userCellPhoneNumber]").val();
	if(oriCellPhoneNum == newCellPhoneNum) {
		alert("휴대폰 번호가 동일합니다. 번호가 변경되었을 시에만 다시 인증받기 버튼을 눌러주세요.");
		return false;
	}
	$.ajax({
		url : contextPath + "/members/rest/searchPhoneNum",
		type : "post",
		dataType : "json",
		data : {userCellPhoneNumber : $("input[name=userCellPhoneNumber]").val()},
		success : function(data) {
			if(data.resultCode == 'fail') {
				alert(data.resultMSG);
				return false;
			} else {
				var result = "";
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
		},
		error : function(e) {
			alert("error");
		}
	});
}

var doModifyUser = function(userCellPhoneNumber) {
	var oriCellPhoneNum = userCellPhoneNumber;
	var newCellPhoneNum = $("input[name=userCellPhoneNumber]").val();
	var certificationNumConf = $("input[name=certificationNumConf]").val();
	var certificationNum = $("input[name=certificationNum]").val();
	if(oriCellPhoneNum != newCellPhoneNum) {
		if(!certificationNum) {
			alert("휴대폰 번호가 변경되었습니다. 다시 인증 받기 버튼을 눌러주세요.");
			return false;
		}
		if(!certificationNumConf) {
			alert("휴대폰 번호 인증이 되지 않았습니다.\n인증번호 전송 후, 문자에 수신된 6자리 숫자를 입력해 주세요.");
			return false;
		}
		if(certificationNumConf != certificationNum){
			alert("입력하신 인증번호가 맞지 않습니다.\n문자를 다시 확인해 주세요.");
			return false;
		}
	}
	$(".myInfo .submitBtn").click();
}


/**
 * 회원 탈퇴
 */
var doDropOut = function() {
	var chkFlag = $("input[name=agree_term]").is(":checked");
	if(!chkFlag) {
		alert("위 내용의 동의가 있어야 회원탈퇴가 가능합니다.");
		return false;
	}
	$.ajax({
		url : contextPath + "/myClapp/rest/doDropOut",
		dataType : "json",
		type : "post", 
		success : function(data) {
			if(data.resultCode == "success") {
				location.href = data.resultURL;
			} else {
				alert(data.resultMSG);
			}
		},
		error : function(data) {
			alert(data.resultMSG);
		}
	});
}
/**
 * 1:1 상담 등록
 */
var inquirySubmit = function() {
	var chkFlag = $("[name=agree_term]").is(":checked");
	if(!chkFlag){
		alert("개인정보 수집 및 이용에 동의 하여야 발송 가능합니다.");
		return false;
	} 
	$(".submitBtn").click();
}