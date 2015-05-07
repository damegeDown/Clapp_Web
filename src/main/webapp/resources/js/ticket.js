

/**
 * 티켓 사용 내역 관리 리스트 함수
 */
$.fn.userTicketUsedList = {
  init : function() {
	this.sortListSize();        //10개,20개,50개,100개씩 보기
  },
  sortListSize : function() {
  $(".sortListSize").change(function() {
    $("form#searchForm").submit();
   }); 
  }
};

/**
 * 티켓 적용 서비스 리스트 함수
 */
$.fn.ticketProductServiceList = {
  init : function() {
	this.sortListSize();        //10개,20개,50개,100개씩 보기
  },
  sortListSize : function() {
  $(".sortListSize").change(function() {
    $("form#searchForm").submit();
   }); 
  }
};

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
		var idIndex = $("input[name=userIdArr]").length;
		var userIdObj = $(".addUser:first");
		var cloneUserIdObj = userIdObj.clone(); //tr Object clone
		var dataId = Number($("input[name=userIdArr]").data("id") +1);
		console.log(dataId);
		cloneUserIdObj
			.append($("<input></input>") // create remove button
						.attr({"type": "button", "class":"btn removeUserIdBtn", "value" : "-"}))
			.find("input[name=userIdArr]").val('') // reset input value
			.attr("data-id", dataId);
		$(".addUser:last").after(cloneUserIdObj);
	  });
	},
	// 회원  ID 삭제
	removeUserId : function() {
	  $("form").delegate(".removeUserIdBtn", "click", function() {
		$(this).closest("div.addUser").remove();
	  });
	},
	// 회원 ID 검색 팝업 열기
	popupOpenSearchUserId : function() {
	  $("form").delegate(".searchUserIdBtn", "click", function(i) {
		  var targetTypeChk = $(this).closest('.trUserId').find('input:radio[name=serviceTargetType]:checked');
		  var targetVal = targetTypeChk.val();
		  if(targetVal < 4 ) {alert('개별 계정을 선택하셔야 검색이 가능 합니다.'); return false;}
		  else {
	    var userIndex = $(this).siblings("input[name=userIdArr]").data("id");
	    $("input[name=dataId]").val(userIndex);
	    disableScreen("#searchUserIdForm");
		  }
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
	      data : {userId : userId },
	      success : function(data) {
	    	$(".resultUserId").html("");
	    	var dataLen = data.dataList.length;
	    	if(dataLen > 0) {
		      for(var i = 0; i < dataLen; i++) {
		       	var userListTrHtml = $("<tr></tr>").addClass("cursor selectUserId");
		       	userListTrHtml.append($("<td></td>").html(data.dataList.length - i));
		       	userListTrHtml.append($("<td></td>").html(data.dataList[i].userName));
		       	userListTrHtml.append($("<td></td>").html(data.dataList[i].userId));
		       	userListTrHtml.append($("<td></td>").html(data.dataList[i].userType));
		       	userListTrHtml.append($("<td style='display: none'></td>").html(data.dataList[i].productName));
		       	userListTrHtml.append($("<td style='display: none'></td>").html(data.dataList[i].ticketStartDate));
		       	userListTrHtml.append($("<td style='display: none'></td>").html(data.dataList[i].ticketEndDate));
//		       	userListTrHtml.append($("<td></td>").html(data.dataList[i].contractMasterKey));
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
	    var userId = _this.eq(2).html();
	    var userType = _this.eq(3).html();
	    var productName = _this.eq(4).html();
	    var ticketStartDate = _this.eq(5).html();
	    var ticketEndDate = _this.eq(6).html();
	    var dataId = $("input[name=dataId]").val();
	    $("input[name=userIdArr][data-id="+dataId+"]").val(userId);
	    $("input[name=serviceProductName]").val(productName);
	    $(".ticketStartDate").val(ticketStartDate);
	    $("input[name=ticketEndExpirationDate]").val(ticketEndDate);
	    enableScreen("#searchUserIdForm");
	  });
	}
};
/**
 * 티켓 적용 서비스 폼 함수
 */
$.fn.ticketProductServiceForm = {
  init : function() {
	this.serviceApplyDateSelect();        
	this.serviceTargetTypeChecked();        
	this.serviceApplyDateNow();        
  },
  serviceApplyDateSelect : function() {
   $(".serviceApplyDateSelect").click(function(){
     $(".datepicker").focus();
    });
  },
  serviceTargetTypeChecked : function() {
   $(".submitBtn").click(function() {
	  if($("input[type=radio][name=serviceTargetType]:checked").length < 1 ){
	     alert('대상 회원 ID 구분을 선택해 주세요.');
	     return false;
     }
   });
  },
  serviceApplyDateNow : function() {
   $(".serviceApplyDateNow").click(function(){
	  var now = new Date();
//	  var nowAll = now.getFullYear() + "/" + (now.getMonth() + 1) + "/" + now.getDate() + " " + now.getHours() + ":" + now.getMinutes() + " ";
	  var nowAll = now.getFullYear() + "/" + (now.getMonth() + 1) + "/" + now.getDate();
	  $("input[name=serviceApplyDate]").val(nowAll);
	})
  }
};