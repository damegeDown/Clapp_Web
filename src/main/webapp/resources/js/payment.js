/**
 * Payment JS 
 */

// contractDetail 회원 아이디 함수
$.fn.Common = {
	init : function() {
	  this.addUserId();					//회원 ID 입력란 추가
	  this.removeUserId();				//회원 ID 추가란 삭제
	  this.popupOpenSearchUserId();		//회원 ID 검색 팝업창 열기
	  this.popupCloseSearchUserId(); 	//회원 ID 검색 팝업창 닫기
	  this.doSearchUserId();				//회원 ID 검색
	  this.selectUserId(); 				//검색 회원 선택
	},
	// 회원 ID 추가
	addUserId : function() { 
	  $("form").delegate(".addUserIdBtn", "click", function() {
		var idIndex = $("input[name=contractUserIdArr]").length;
		var userIdObj = $(".trUserId:first");
		var cloneUserIdObj = userIdObj.clone(); //tr Object clone
		var dataId = Number($("input[name=contractUserIdArr]:last").data("id") + 1);
		console.log(dataId);
		cloneUserIdObj
			.find("td")
			.append($("<input></input>") // create remove button
						.attr({"type": "button", "class":"btn removeUserIdBtn", "value" : "-"}))
			.find("input[name=contractUserIdArr]").val('') // reset input value
			.attr("data-id", dataId);
		$(".trUserId:last").after(cloneUserIdObj);
	  });
	},
	// 회원  ID 삭제
	removeUserId : function() {
	  $("form").delegate(".removeUserIdBtn", "click", function() {
		$(this).closest("tr").remove();
	  });
	},
	// 회원 ID 검색 팝업 열기
	popupOpenSearchUserId : function() {
	  $("form").delegate(".searchUserIdBtn", "click", function(i) {
	    var userIndex = $(this).siblings("input[name=contractUserIdArr]").data("id");
	    $("input[name=dataId]").val(userIndex);
	    disableScreen("#searchUserIdForm");
	  });
	},
	// 회원 ID 검색 팝업 닫기
	popupCloseSearchUserId : function() {
	  $("#searchUserIdForm").delegate(".cancelBtn", "click", function() {
		enableScreen("#searchUserIdForm");
	  });
	},
	// 회원 ID 검색
	doSearchUserId : function() {
	  $("#searchUserIdForm").delegate(".searchBtn", "click", function() {
	    var userId = $(this).siblings("input").val();
	    unblockUI(); //검색 완료후 창이 닫기는 문제해결을 위한 처리.
	    $.ajax({
	      url : "/admin/member/rest/searchUserId",
	      type : "post",
	      dataType : "json",
	      data : {userId : userId},
	      success : function(data) {
	    	$(".resultUserId").html("");
	    	var dataLen = data.dataList.length;
	    	if(dataLen > 0) {
		      for(var i = 0; i < dataLen; i++) {
		       	var userListTrHtml = $("<tr></tr>").addClass("cursor selectUserId");
		       	userListTrHtml.append($("<td></td>").html(data.dataList.length - i));
		       	userListTrHtml.append($("<td></td>").html(data.dataList[i].userName));
		       	userListTrHtml.append(
		       				$("<td></td>").html(data.dataList[i].userId).append(
		       						$("<input></input>").attr({"name" : "userKey","type":"hidden"}).val(data.dataList[i].userMasterKey)));
		       	userListTrHtml.append($("<td></td>").html(data.dataList[i].userType));
		       	$(".resultUserId").append(userListTrHtml);
		      }
	    	} else {
	    	  var userListTrHtml = $("<tr></tr>");
		      userListTrHtml.append($("<td></td>").attr("colspan", "4").html("+++조회된 내용이 없습니다.+++"));
		      $(".resultUserId").append(userListTrHtml);
	    	}
	      },
	      error : function(data) {
	    	alert("error");
	      }
	    }); 
	  });
	},
	// 검색 회원 선택시
	selectUserId : function() {
	  $("#searchUserIdForm").delegate(".selectUserId", "click", function() {
		var _this = $(this).find("td");
	    var userName = _this.eq(1).html();
	    var userId = _this.eq(2).text();
	    var userKey = _this.eq(2).find("input[name=userKey]").val();
	    var userType = _this.eq(3).html();
	    var dataId = $("input[name=dataId]").val();
	    $("input[name=contractUserIdArr][data-id="+dataId+"]").val(userId);
	    $("input[name=userMasterKeyArr][data-id="+dataId+"]").val(userKey);
	    enableScreen("#searchUserIdForm");
	  });
	}
};
$(function() {
	$(".goListBtn").click(function() {
		location.href = "/admin/payment/paymentContractList";
	});
	$(".goInputBtn").click(function() {
		location.href = "/admin/payment/paymentContractEdit";
	});
	$(".searchCompanyBtn").click(function() {
	  var companyName = $(this).siblings("input[name=contractCompanyName]").val();
	  $.ajax({
	    url : "/common/searchCompanyNumber",
	    type : "post",
	    dataType : "json",
	    data : {companyName : companyName},
	    success : function(data) {
	    	 if(data.data) {
	    	  var companyNumber = data.data;
	    	  var companyNumberArr = companyNumber.split("-");
	    	  for(var i = 0; i < companyNumberArr.length; i++){
	    	    $(".phoneNum:eq("+i+")").val(companyNumberArr[i]);
	    	  }
	    	  $("input[name=contractCompanyNumber]").val(companyNumber);
	    	 } else {
	    		 alert("검색 결과가 없습니다. 수동으로 입력해 주세요.");
	    	 }
	    },
	    error : function() {
	    	  alert("error");
	    }
	  });
	});
	
});