/**
 *  선택 공통 함수
 */
$.fn.SelectCommon = {
  reLogin : function(adminId) {
    if(getCookie("memberChkGrant") != adminId || getCookie("memberChkGrant") == '') {
	  location.href = "/admin/reLogin?chkGrant=Y";
	} else {
		//setCookie("memberChkGrant", "");
	}
  },
  setArea : function(userAreaType,userArea,userAreaDetail) {
    if(userAreaType > 0) {
	  $("[name=userAreaType]").val(userAreaType).change();
	  setTimeout(function() {
		  $("[name=userArea]").val(userArea).change();  
	  }, 100);
	  setTimeout(function() {
		  $("[name=userAreaDetail]").val(userAreaDetail);  
	  }, 300);
    }
  },
  openDropPopup : function() {
    $(".removeMember").click(function(){
	  disableScreen("#dropMemberform");
	  var userMasterKey = $(this).data("key");
	  var dropOutReason = $("#dropMemberform select[name=dropOutReason]").val();
	  var userName = $(this).parents("tr").find("td:eq(2)").text(); //회원 이름
	  var dropOutUserId = $(this).parents("tr").find("td:eq(1)").text(); //회원 아이디
	  $("#dropMemberform input[name=userMasterKey]").val(userMasterKey);
	  $("#dropMemberform input[name=userName]").val(userName);
	  $("#dropMemberform input[name=dropOutUserId]").val(dropOutUserId);
	  $("#dropMemberform").find(".userName").html(userName);	
	  $("#dropMemberform").find(".dropOutUserId").html(dropOutUserId);	
    });  
  },
  dropMember : function(type) {
    $(".delButton").click(function() {
    	if(!confirm("탈퇴 하시겠습니까?")) return false;
		if($("input[type=radio][name=dropOutReason]:checked").length < 1 ){
		      alert('한개이상 선택이 되어야 합니다.');
		      return false;
		    }
	  var dropOutUserId = $("#dropMemberform input[name=dropOutUserId]").val();
//	  var dropOutPerson = $("#dropMemberform input[name=dropOutPerson]").val();
	  var dropOutPerson = "관리자";
	  var dropOutReasonCode = $("#dropMemberform .dropOutReason:checked").data('code');
	  var dropOutReason = $("#dropMemberform input[name=dropOutReason]").val();
	  var userMasterKey = $("#dropMemberform input[name=userMasterKey]").val();
	  var userName = $("#dropMemberform input[name=userName]").val();
	  var dropOutReason = $("#dropOutReasonInput").val();
	  $.ajax ({
		type: 'POST',
		dataType : 'json',
		data : {dropOutUserId : dropOutUserId, dropOutPerson : dropOutPerson, dropOutReason : dropOutReason , userMasterKey : userMasterKey, dropOutReasonCode : dropOutReasonCode, userName : userName},
		url : '/admin/member/rest/insertDropOut?userType='+type ,
		success : function(result){
		  alert(result.resultMSG);
		  if(result.resultCode == "success"){  
			location.href = result.resultURL;
		    enableScreen();
		  }
		},
		error : function (e) {
		  alert('오류가 발생했습니다.');
		}
	  });
	  return false;
    });
  }
};
/**
 * 기업회원 상세
 */  
$.fn.CompanyDetail = {
  init : function(userAreaType,userArea,userAreaDetail) {
	$.fn.SelectCommon.setArea(userAreaType,userArea,userAreaDetail);
	this.openDropPopup();
	$.fn.SelectCommon.dropMember(2);		//회원 탈퇴
  },
  openDropPopup : function() {
	    $(".removeMember").click(function(){
	  	  disableScreen("#dropMemberform");
	  	  var userMasterKey = $(this).data("key");
	  	  var dropOutReason = $("#dropMemberform select[name=dropOutReason]").val();
	  	  var userName = $(".userName").text(); //회원 이름
	  	  var dropOutUserId = $(".userId").text(); //회원 아이디
	  	  $("#dropMemberform input[name=userMasterKey]").val(userMasterKey);
	  	  $("#dropMemberform input[name=userName]").val(userName);
	  	  $("#dropMemberform input[name=dropOutUserId]").val(dropOutUserId);
	  	  $("#dropMemberform").find(".userName").html(userName);	
	  	  $("#dropMemberform").find(".dropOutUserId").html(dropOutUserId);	
	      });  
	    },
};
/**
 * 기업회원 리스트
 */
$.fn.CompanyList = {
  setArea : function(userAreaType,userArea,userAreaDetail) {
	$.fn.SelectCommon.setArea(userAreaType,userArea,userAreaDetail);
  },
  init : function(adminId) {
	$.fn.SelectCommon.reLogin(adminId);
	$.fn.SelectCommon.openDropPopup(); //회원 탈퇴팝업
	$.fn.SelectCommon.dropMember(2);		//회원 탈퇴
	this.openDetail();		//상세페이지 이동
  },
  openDetail : function() {
    $(".userId").click(function() {
	  var userMasterKey = $(this).data("key");
	  location.href = "/admin/member/companyDetail?userMasterKey="+userMasterKey; 
	}); 
  }
};
$.fn.DropOutList = {
  init : function(adminId) {
	$.fn.SelectCommon.reLogin(adminId);
    this.searchForm(); 
  },
  searchForm : function() {
	$("select[name=searchValue1]").change(function() {
	  $("form#searchForm").submit();
	});
	$(".searchValue").change(function() {
	  $("#searchForm").submit();
	});
  }
};
/**
 * 일반회원 상세
 */
$.fn.MemberDetail = {
  init : function(userAreaType,userArea,userAreaDetail) {
	$.fn.SelectCommon.setArea(userAreaType,userArea,userAreaDetail);
	this.openDropPopup();
	$.fn.SelectCommon.dropMember(1);		//회원 탈퇴
  },
  openDropPopup : function() {
    $(".removeMember").click(function(){
	  disableScreen("#dropMemberform");
	  var userMasterKey = $(this).data("key");
	  var dropOutReason = $("#dropMemberform select[name=dropOutReason]").val();
	  var userName = $(".userName").text(); //회원 이름
	  var dropOutUserId = $(".userId").text(); //회원 아이디
	  $("#dropMemberform input[name=userMasterKey]").val(userMasterKey);
	  $("#dropMemberform input[name=userName]").val(userName);
	  $("#dropMemberform input[name=dropOutUserId]").val(dropOutUserId);
	  $("#dropMemberform").find(".userName").html(userName);	
	  $("#dropMemberform").find(".dropOutUserId").html(dropOutUserId);	
    });  
  },
}; 
/**
 * 일반회원 리스트
 */
$.fn.MemberList = {
  setArea : function(userAreaType,userArea,userAreaDetail) {
	$.fn.SelectCommon.setArea(userAreaType,userArea,userAreaDetail);
  },
  init : function(adminId) {
	$.fn.SelectCommon.reLogin(adminId);
	$.fn.SelectCommon.openDropPopup(); //회원 탈퇴팝업
	$.fn.SelectCommon.dropMember(1);		//회원 탈퇴
    this.openDetail(); 
  },
  openDetail : function() {
    $(".userId").click(function() {
	  var userMasterKey = $(this).data("key");
	  location.href = "/admin/member/memberDetail?userMasterKey="+userMasterKey; 
	});
  }
}