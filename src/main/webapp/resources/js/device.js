/**
 * 디바이스 상세 함수
 */
$.fn.DeviceDetail = {
  init : function() {
    this.setTop10Device();
  },
  // 상위 노출 디바이스 10
  setTop10Device : function() {
    $("input[name=deviceTop10Open]").change(function() {
	  var flag = $(this).val();
	  var deviceTop = Number($(".deviceTop10").text());
	  if(flag == 'Y') {
	    if(deviceTop <= 0) {
	      alert("대표 디바이스는 11개 까지 등록 가능합니다.");
	      $("input[name=deviceTop10Open][value='N']").attr("checekd",true);
	      return false;
	    }
		deviceTop--;
	  } else {
	    deviceTop++;
	  }
	    $(".deviceTop10").text(deviceTop);
	});  
  }
};
/**
 * 디바이스 리스트 함수
 */
$.fn.DeviceList = {
  init : function() {
	this.openDetail();          //상세페이지 이동
	this.removeDevice();        //디바이스 삭제
	this.setTop10Device();      //상위 10 노출 디바이스 세팅
	this.removeUnitDevice();    //디바이스 유닛 삭제
	this.setTop10DeviceClose(); //상위 10 노출 디바이스 취소
	this.sortDevice();		    //디바이스 쇼팅
	this.deviceTop10Save();
	this.btnChangeSeq();
	
  },
  openDetail : function() {
    $(".deviceModelEname").click(function() {
		var deviceKey = $(this).data("key");
		location.href = "/admin/device/deviceDetail?deviceKey="+deviceKey; 
	});
  },
  removeDevice : function() {
    $(".removeDevice").click(function(){
	  if(!confirm('디바이스 정보를 삭제합니다. 삭제 하시겠습니까?')) {
	    return false;
	  }  
	  var deviceKey = $(this).data("id");
	  $.ajax ({
	  	type: 'POST',
	  	dataType : 'json',
	  	data : {id : deviceKey},
	  	url : '/admin/device/rest/removeDevice' ,
	  	success : function(result){
	  	 alert(result.resultMSG);
	  	 if(result.resultCode == "success"){  
	  		  location.href = "/admin/device/deviceList";
	  	 }
	  	},
	  	error : function (e) {
	  	 alert('오류가 발생했습니다.');
	  	}
	  });
	    return false; 
	});
  },
  setTop10Device : function() {
    $("#deviceTop10Open").click(function(){
	  //대표 디바이스 카운트
      var topDeviceCount = $(".topDeviceCount").val();
	  var selectDeviceCount =  0;
	  var sumDeviceCount = 0;
	  if(!confirm('디바이스를 노출 하시겠습니까?')) {
	    return false;
	  }
	  var deviceKeyList = [];
	  $("input[type=checkbox][name=deviceKeyArr]:checked").each(function(i) {
		deviceKeyList.push($(this).val());
		//선택된 디바이스 카운트
		selectDeviceCount ++;
	  });
	  // 선택된 디바이스와 대표 디바이스 합 
	  sumDeviceCount = Number(topDeviceCount) + Number(selectDeviceCount);
  	  //합이 10개 이상일경우 return false
	  if( sumDeviceCount > 11) {
		alert("대표 디바이스는 11개 까지 등록 가능합니다.");
		return false; 
	  } 
	  var deviceEntity = { deviceKeyList: deviceKeyList.toString()};
	  
	  $.ajax ({
		type : 'POST',
		contentType: 'application/json',
		dataType : 'json',
		data: JSON.stringify(deviceEntity),
		url : '/admin/device/rest/deviceTopOpen' ,
		success : function(result) {
	      alert(result.resultMSG);
		  if(result.resultCode == "success"){  
		    location.href = "/admin/device/deviceList";
		  } 
		},
		error : function (e) {
		  alert('오류가 발생했습니다.');
		} 
	  });
	  return false; 
	});
  },
  removeUnitDevice : function() {
    $(".removeUnitDevice").click(function() {
	  //클린된 위치의 체크박스
	  var _this = $(this).parents("tr").find("input[name=deviceKeyArr]");
	  $("input[name=deviceKeyArr]").each(function() {
		//클릭된 위치의 체크박스 값과 루프 도는 체크 박스의 값을 비교
		if($(this).val() == _this.val()) {
		  this.checked = true;  
		} else {   
		  this.checked = false;
		}
	  });
	  $("#deviceTop10Close").click();
	});  
  },
  setTop10DeviceClose : function() {
    $("#deviceTop10Close").click(function(){
	  if(!confirm('디바이스를 노출 해제 하시겠습니까?')) {
	    return false;
	  }
	  var deviceKeyList = [];
	  $("input[type=checkbox][name=deviceKeyArr]:checked").each(function(i) {
	    deviceKeyList.push($(this).val());
	  });
	  var deviceEntity = { deviceKeyList: deviceKeyList.toString()};
	  $.ajax ({
	    type : 'POST',
	    contentType: 'application/json',
	    dataType : 'json',
	    data: JSON.stringify(deviceEntity),
	    url : '/admin/device/rest/deviceTopClose' ,
	    success : function(result) {
		  alert(result.resultMSG);
		  if(result.resultCode == "success"){  
		    location.href = "/admin/device/deviceList";
		  } 
	    },
	    error : function (e) {
	      alert('오류가 발생했습니다.');
	    }
	  });
	  return false; 
    });
  },
  sortDevice : function() {
    $(".sortListSize").change(function() {
	  $("form#searchForm").submit();
    });
    $(".deviceSort").change(function() {
  	  $("form#searchForm").submit();
      }); 
  },
  deviceTop10Save : function(){
	$('#deviceTop10Save').click(function() {
	  if(!confirm('저장하시겠습니까?')) {
	        return false;
    }
	var deviceSelectedList = [];
	$('.deviceKey').each(function(index) {
		var device = {};
		var that = $(this);
		device.deviceKey = that.val();
		device.deviceTop10Number = index + 1;
		deviceSelectedList.push(device);
	});
	var deviceEntity = {};
	deviceEntity.deviceSelectedList = deviceSelectedList;
	console.log(deviceEntity);
	$.ajax({
		type: 'post',
		dataType: 'json',
		contentType: 'application/json',
		data: JSON.stringify(deviceEntity),
		url : '/admin/device/rest/deviceTopChangeSeq' ,
			success : function(result) {
			alert(result.resultMSG);
			if(result.resultCode == "success"){
				location.href = "/admin/device/deviceList";
			}
		  }
		});
	});
  },
  btnChangeSeq : function(){
	$('.btnChangeSeq').click(function() {
		var that = $(this);
		var row = that.closest('tr');
		var type = that.data('seq');
		if (type == 'down') {
			row.next().after(row);
		} else {
			row.prev().before(row);
		}
		return false;
	});
  }
};

