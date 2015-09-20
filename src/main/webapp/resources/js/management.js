$(function() {
  $.fn.Common.init();
});
/**
 * 공통 함수
 */
$.fn.Common = {
  init : function() {
    this.searchForm(); 
  },
  searchForm : function() {
    $("select[name=searchValue]").change(function() {
      $("form#searchForm").submit();
    });	  
  }
};
/**
 * 관리자 상세
 */
$.fn.AdminDetail = {
  init : function() {
    this.setAdminGrant();
  },
  setAdminGrant : function() {
    $("dt input[type=checkbox]").click(function() {
	  var _this = $(this);
	  var flag = _this.is(":checked");
	  var grant = "";
	  if(_this.hasClass("master")) {
	    $("input[type=checkbox]").each(function() {
		  this.checked = flag;
	    });
	    if(flag) {
		  grant = $(this).data("grant");
	    }
	  } else {
		if($(".master").is(":checked") && !flag){
	     return false;
		}
		$("input[type=checkbox]:checked").each(function(index) {
		  if(index > 0) grant += ", ";
		  grant += $(this).data("grant");
		});
	  }
	  $("input[name=adminGrant]").val(grant);
    });	  
  }
};
/**
 * 관리자 리스트
 */
$.fn.AdminList = {
  init : function() {
    this.openDetail();   //상세 페이지 이동
  },
  openDetail : function() {
    $(".board-list tr").click(function() {
	  var adminKey = $(this).data("key");
	  location.href = "/admin/management/adminDetail?adminMasterKey="+adminKey;
	});	  
  } 
};
/**
 * 팝업리스트
 */
$.fn.PopupList = {
  init : function() {
    this.openDetail();   //상세페이지 이동 
    this.endPopup();		 //팝업 종료
  },
  openDetail : function() {
    $(".popupTitle").click(function() {
	  var popupKey = $(this).data("key");
	  location.href = "/admin/management/popupDetail?popupKey="+popupKey; 
	});
  },
  endPopup : function() {
    $(".endPopup").click(function(){
	  if(!confirm('진행 중인 팝업을 강제 종료 시키겠습니까?')) {
        return false;
      }
	  var popupKey = $(this).data("key");
	  $.ajax ({
		type: 'POST',
		dataType : 'json',
		data : {popupKey : popupKey},
		url : '/admin/management/rest/endPopup' ,
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
$.fn.PopupDetail = {
  init : function() {
	this.showPopUpFreeView();
  },
  showPopUpFreeView : function() { 
    $(".freeViewBtn").click(function() {
    	// 에디터의 내용이 textarea에 적용된다.
    	EditorUtils.oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	  var popWidth = $("input[name=popupSizeWidth]").val()+"px";
	  var popHeight = $("input[name=popupSizeHeight]").val()+"px";
	  var popTop = $("input[name=popupPositionTop]").val()+"px";
	  var popLeft = $("input[name=popupPositionLeft]").val()+"px";
	  var popContents = $("textarea[name=popupContents]").val(); 
	  if(popContents != null && popContents.length > 0) {
		  popContents = popContents.replace(/(\r\n|\n|\r)/g,"<br />");
		  }
	  $("#popupFreeView").draggable().css({ 
		"display": "block", 
		"top" : popTop, 
		"left" : popLeft, 
		"width" : popWidth, 
		"height" : popHeight
	  }).find(".popUpContents").html(popContents);
    });
    $(".cancelBtn").click(function() {
	  $("#popupFreeView").hide();
    });
  }
  
};

// Banner Add Start

/**
 * 배너 리스트
 */
$.fn.BannerList = {
  init : function() {
    this.openDetail();   		//상세페이지 이동 
    this.endPopup();		 	//배너 종료
    this.bannerViewOn();     	// 배너 노출
    this.bannerViewOff();     	// 배너 비노출
	this.bannerViewUp();		// 배너 노출순위 업
	this.bannerViewDown();	    // 배너 노출순위 다운
  },
  openDetail : function() {
    $(".bannerTitle").click(function() {
	  var bannerInquiryKey = $(this).data("key");
	  location.href = "/admin/management/bannerDetail?bannerInquiryKey="+bannerInquiryKey; 
	});
  },
  // 해당 건을 비노출 하도록 변경하는 기능.
  endPopup : function() {
    $(".endPopup").click(function(){
	  if(!confirm('진행 중인 팝업을 강제 종료 시키겠습니까?')) {
        return false;
      }
	  var bannerInquiryKey = $(this).data("key");
	  $.ajax ({
		type: 'POST',
		dataType : 'json',
		data : {bannerInquiryKey : bannerInquiryKey},
		url : '/admin/management/rest/endPopup' ,
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
	bannerViewOff : function() {
		$(".bannerViewOff").click(function(){

			var bannerKeyList = [];
			var errorCount = 0;

			$("input[type=checkbox][name=bannerListKeyArr]:checked").each(function() {
				var bannerKeyArr = $(this).val().split('_');

				if("비노출" == (bannerKeyArr[1])) {
					errorCount++;
				}

				bannerKeyList.push(bannerKeyArr[0]);
			});

			if (bannerKeyList.length == 0) {
				alert('비노출 대상을 선택하여 주십시오.');
				return false;
			}

			if (errorCount > 0) {
				alert('선택 항목 중 이미 비노출 된 항목이 존재합니다.');
				return false;
			}

			var bannerEntity = { bannerKeyList: bannerKeyList.toString()};

			$.ajax ({
				type : 'POST',
				contentType: 'application/json',
				dataType : 'json',
				data: JSON.stringify(bannerEntity),
				url : '/admin/management/rest/bannerViewOff' ,
				success : function(result) {
					alert(result.resultMSG);
					if(result.resultCode == "success"){
						location.href = "/admin/management/bannerList";
					}
				},
				error : function (e) {
					alert('오류가 발생했습니다.');
				}
			});
			return false;
		});

	},
	bannerViewOn : function() {
		$(".bannerViewOn").click(function(){

			var bannerKeyList = [];
			var errorCount = 0;

			$("input[type=checkbox][name=bannerListKeyArr]:checked").each(function() {
				var bannerKeyArr = $(this).val().split('_');

				if("노출" == (bannerKeyArr[1])) {
					errorCount++;
				}

				bannerKeyList.push(bannerKeyArr[0]);
			});

			if (bannerKeyList.length == 0) {
				alert('노출 대상을 선택하여 주십시오.');
				return false;
			}

			if(errorCount > 0) {
				alert('선택 항목 중 이미 노출 된 항목이 존재합니다.');
				return false;
			}

			var bannerEntity = { bannerKeyList: bannerKeyList.toString()};

			$.ajax ({
				type : 'POST',
				contentType: 'application/json',
				dataType : 'json',
				data: JSON.stringify(bannerEntity),
				url : '/admin/management/rest/bannerViewOn' ,
				success : function(result) {
					alert(result.resultMSG);
					if(result.resultCode == "success"){
						location.href = "/admin/management/bannerList";
					}
				},
				error : function (e) {
					alert('오류가 발생했습니다.');
				}
			});
			return false;
		});

	},
	bannerViewUp : function() {
		$(".bannerViewUp").click(function() {

			var bannerKeyList = [];
			var bannerKeyArr = $(this).data("key").split('_');

			if (bannerKeyArr[1] == 1) {
				alert('노출 순위는 1보다 우선일 수 없습니다.');
				return false;
			}
			bannerKeyList.push(bannerKeyArr[0]);

			var bannerEntity = { bannerKeyList: bannerKeyList.toString()};

			$.ajax ({
				type : 'POST',
				contentType: 'application/json',
				dataType : 'json',
				data: JSON.stringify(bannerEntity),
				url : '/admin/management/rest/bannerViewUp' ,
				success : function(result) {
					alert(result.resultMSG);
					if(result.resultCode == "success"){
						location.href = "/admin/management/bannerList";
					}
				},
				error : function (e) {
					alert('오류가 발생했습니다.');
				}
			});
			return false;
		});
	},
	bannerViewDown : function() {
		$(".bannerViewDown").click(function() {

			var bannerKeyList = [];
			var bannerKeyArr = $(this).data("key").split('_');

			bannerKeyList.push(bannerKeyArr[0]);

			var bannerEntity = { bannerKeyList: bannerKeyList.toString()};

			$.ajax ({
				type : 'POST',
				contentType: 'application/json',
				dataType : 'json',
				data: JSON.stringify(bannerEntity),
				url : '/admin/management/rest/bannerViewDown' ,
				success : function(result) {
					alert(result.resultMSG);
					if(result.resultCode == "success"){
						location.href = "/admin/management/bannerList";
					}
				},
				error : function (e) {
					alert('오류가 발생했습니다.');
				}
			});
			return false;
		});
	}
	// Banner Add End
};
