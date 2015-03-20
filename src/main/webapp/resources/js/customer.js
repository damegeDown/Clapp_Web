/**
 * 이메일 문의 리스트 함수
 */
$.fn.serviceInquiryList = {
  init : function() {
	this.openDetail();          //상세페이지 이동
	this.sortListSize();        //10개,20개,50개,100개씩 보기
  },
  openDetail : function() {
  $(".inquiryTitle").click(function() {
      var serviceInquiryKey = $(this).data("key");
      location.href = "/admin/customer/serviceInquiryDetail?serviceInquiryKey="+serviceInquiryKey; 
    });
  },
  sortListSize : function() {
  $(".sortListSize").change(function() {
    $("form#searchForm").submit();
   }); 
  }
};
/**
 * 유선 상담 리스트 함수
 */
$.fn.cabledAdviceList = {
  init : function() {
	this.openDetail();         	 //상세페이지 이동
	this.sortListSize();       	 //10개,20개,50개,100개씩 보기
  },
  openDetail : function() {
  $(".adviceTitle").click(function() {
      var cabledAdviceKey = $(this).data("key");
      location.href = "/admin/customer/cabledAdviceDetail?cabledAdviceKey="+cabledAdviceKey; 
    });
  },
  sortListSize : function() {
  $(".sortListSize").change(function() {
    $("form#searchForm").submit();
   }); 
  }
};
/**
 * 유선 상담 상세 함수
 */
$.fn.cabledAdviceDetail = {
  init : function() {
	this.modify();         	 //수정페이지 이동
  },
  modify : function() {
  $(".modify").click(function() {
	  var cabledAdviceKey = $(this).data("key");
      location.href = "/admin/customer/cabledAdviceForm?cabledAdviceKey="+cabledAdviceKey; 
    });
  }
};
/**
 * 공지사항 리스트 함수
 */
$.fn.boardNoticeList = {
  init : function() {
	this.openDetail();         	 //상세페이지 이동
	this.sortListSize();       	 //10개,20개,50개,100개씩 보기
	this.removeNotice();		 //게시물 삭제
  },
  openDetail : function() {
  $(".noticeTitle").click(function() {
      var boardNoticeKey = $(this).data("key");
      location.href = "/admin/customer/boardNoticeDetail?boardNoticeKey="+boardNoticeKey; 
    });
  },
  sortListSize : function() {
  $(".sortListSize").change(function() {
    $("form#searchForm").submit();
   }); 
  },
  removeNotice : function() {
  $(".removeNotice").click(function(){
	if(!confirm('해당 게시물을 삭제하시겠습니까?')) {
      return false;
    }
	var boardNoticeKey = $(this).data("id");
	$.ajax ({
	  type: 'POST',
	  dataType : 'json',
	  data : {id : boardNoticeKey},
	  url : '/admin/customer/rest/removeBoardNotice' ,
	  success : function(result){
	    alert(result.resultMSG);
	    if(result.resultCode == "success"){  
	      location.reload();
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
 * 공지사항 상세 함수
 */
$.fn.boardNoticeDetail = {
  init : function() {
	this.noticeOpenDateSelect();         //datetimepicker 포커스
	this.noticeOpenDateNow();         	 //datetimepicker 공백
	this.showPopUpPreview();
  },
  noticeOpenDateSelect : function() {
  $(".noticeOpenDateSelect").click(function(){
    $(".datetimepicker").focus();
  	});
  },
  noticeOpenDateNow : function() {
  $(".noticeOpenDateNow").click(function(){
	  var now = new Date();
	  var nowAll = now.getFullYear() + "/" + (now.getMonth() + 1) + "/" + now.getDate() + " " + now.getHours() + ":" + now.getMinutes() + " ";
	  $("input[name=noticeOpenDate]").val(nowAll);
	});
  },
  showPopUpPreview : function() { 
    $(".PreviewBtn").click(function() {
    	disableScreen("#popupBoardNotice");
    	EditorUtils.oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	  var noticeTitle = $("input[name=noticeTitle]").val();
	  var noticeContents = $("textarea[name=noticeContents]").val();
	  var noticeImage = $(".boardNoticeImage");
	  var noticeInsertDate = $("input[name=noticeInsertDate]").val();
	  if(noticeContents != null && noticeContents.length > 0) {
		  noticeContents = noticeContents.replace(/(\r\n|\n|\r)/g,"<br />");
	  }
	  
	  $("#popupBoardNotice").find(".noticeTitle").html(noticeTitle);
	  $("#popupBoardNotice").find(".noticeContents").html(noticeContents);
	  $("#popupBoardNotice").find(".noticeContents").append(noticeImage);
	  $("#popupBoardNotice").find(".noticeInsertDate").html(noticeInsertDate);
    });
  }
};
/**
 * 도움말 리스트 함수
 */
$.fn.boardQnaList = {
  init : function() {
	this.openDetail();         	 //상세페이지 이동
	this.sortListSize();       	 //10개,20개,50개,100개씩 보기
	this.removeQna();       	 //삭제
	this.setTop10QnaOpen();       	 //삭제
	this.setTop10QnaClose();       	 //삭제
	this.removeUnitQna();       	 //삭제
  },
  openDetail : function() {
  $(".qnaQuestion").click(function() {
      var boardQnaKey = $(this).data("key");
      location.href = "/admin/customer/boardQnaDetail?boardQnaKey="+boardQnaKey; 
    });
  },
  sortListSize : function() {
  $(".sortListSize").change(function() {
    $("form#searchForm").submit();
   }); 
  },
  removeQna : function() {
  $(".removeQna").click(function(){
	if(!confirm('해당 게시물을 삭제하시겠습니까?')) {
      return false;
    }
	var boardQnaKey = $(this).data("id");
	$.ajax ({
	  type: 'POST',
	  dataType : 'json',
	  data : {id : boardQnaKey},
	  url : '/admin/customer/rest/removeBoardQna' ,
	  success : function(result){
	    alert(result.resultMSG);
	    if(result.resultCode == "success"){  
	      location.reload();
	    }  
	  },
	  error : function (e) {
        alert('오류가 발생했습니다.');
	   }
     });
     return false; 
   });
  },
  setTop10QnaOpen : function() {
    $("#qnaTop10Open").click(function(){
	  //대표 도움말 카운트
      var topQnaCount = $(".topQnaCount").val();
	  var selectQnaCount =  0;
	  var sumQnaCount = 0;
	  if(!confirm('도움말을 노출 하시겠습니까?')) {
	    return false;
	  }
	  var boardQnaKeyList = [];
	  $("input[type=checkbox][name=boardQnaKeyArr]:checked").each(function(i) {
		boardQnaKeyList.push($(this).val());
		//선택된 도움말 카운트
		selectQnaCount ++;
	  });
	  // 선택된 도움말와 대표 도움말 합 
	  sumQnaCount = Number(topQnaCount) + Number(selectQnaCount);
  	  //합이 10개 이상일경우 return false
	  if( sumQnaCount > 10) {
		alert("대표 도움말은 10개 까지 등록 가능합니다.");
		return false; 
	  } 
	  var boardQnaEntity = { boardQnaKeyList: boardQnaKeyList.toString()};
	  
	  $.ajax ({
		type : 'POST',
		contentType: 'application/json',
		dataType : 'json',
		data: JSON.stringify(boardQnaEntity),
		url : '/admin/customer/rest/qnaTop10Open' ,
		success : function(result) {
	      alert(result.resultMSG);
		  if(result.resultCode == "success"){  
		    location.href = "/admin/customer/boardQnaList";
		  } 
		},
		error : function (e) {
		  alert('오류가 발생했습니다.');
		} 
	  });
	  return false; 
	});
  },
  removeUnitQna : function() {
    $(".removeUnitQna").click(function() {
	  //클린된 위치의 체크박스
	  var _this = $(this).parents("tr").find("input[name=boardQnaKeyArr]");
	  $("input[name=boardQnaKeyArr]").each(function() {
		//클릭된 위치의 체크박스 값과 루프 도는 체크 박스의 값을 비교
		if($(this).val() == _this.val()) {
		  this.checked = true;  
		} else {   
		  this.checked = false;
		}
	  });
	  $("#qnaTop10Close").click();
	});  
  },
  setTop10QnaClose : function() {
    $("#qnaTop10Close").click(function(){
	  if(!confirm('도움말을 노출 해제 하시겠습니까?')) {
	    return false;
	  }
	  var boardQnaKeyList = [];
	  $("input[type=checkbox][name=boardQnaKeyArr]:checked").each(function(i) {
		boardQnaKeyList.push($(this).val());
	  });
	  var boardQnaEntity = { boardQnaKeyList: boardQnaKeyList.toString()};
	  $.ajax ({
	    type : 'POST',
	    contentType: 'application/json',
	    dataType : 'json',
	    data: JSON.stringify(boardQnaEntity),
	    url : '/admin/customer/rest/qnaTop10Close' ,
	    success : function(result) {
		  alert(result.resultMSG);
		  if(result.resultCode == "success"){  
		    location.href = "/admin/customer/boardQnaList";
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
 * 도움말 상세 함수
 */
$.fn.boardQnaDetail = {
  init : function() {
    this.setTop10BoardQna();
	this.showPopUpPreview();
  },
  // 상위 노출 도움말 10
  setTop10BoardQna : function() {
    $("input[name=qnaTop10Open]").change(function() {
	  var flag = $(this).val();
	  var boardQnaTop = Number($(".boardQnaTop10").text());
	  if(flag == 'Y') {
	    if(boardQnaTop <= 0) {
	      alert("대표 디바이스는 10개 까지 등록 가능합니다.");
	      $("input[name=qnaTop10Open][value='N']").attr("checekd",true);
	      return false;
	    }
	    boardQnaTop--;
	  } else {
		boardQnaTop++;
	  }
	    $(".boardQnaTop10").text(boardQnaTop);
	});  
  },
  showPopUpPreview : function() { 
    $(".PreviewBtn").click(function() {
    	disableScreen("#popupBoardQna");
    	EditorUtils.oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	  var qnaCategory = $("#qnaCategory option:selected").text();
	  var qnaQuestion = $("input[name=qnaQuestion]").val();
	  var qnaAnswer = $("textarea[name=qnaAnswer]").val();
	  var qnaImage = $(".boardQnaImage");
	  if(qnaAnswer != null && qnaAnswer.length > 0) {
		qnaAnswer = qnaAnswer.replace(/(\r\n|\n|\r)/g,"<br />");
	  }
	  console.log(qnaImage);
	  $("#popupBoardQna").find(".qnaCategory").html(qnaCategory);
	  $("#popupBoardQna").find(".qnaQuestion").html(qnaQuestion);
	  $("#popupBoardQna").find(".qnaAnswer").html(qnaAnswer);
	  $("#popupBoardQna").find(".qnaAnswer").append(qnaImage);
    });
  }
};