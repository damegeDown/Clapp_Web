$(function() {
  $.fn.CommonMail.init();
});
/**
 * 공통 사용
 */
$.fn.CommonMail = {
  init : function() {
    this.excelDown();
  },
  searchForm : function() {
    $(".searchBtn").click(function() {
		$("#searchForm").attr("action", "").submit();
	});
  },
  limitMonth : function() {
	var startDate = $("input[name=startDate]").val();
	var endDate = $("input[name=endDate]").val();
	var dayTerm = fn_calcDayMonthCount(startDate, endDate, "D");
	if(dayTerm > 31) {
		alert("일별 통계는 최대 한달(31일)까지 가능합니다.");
		return false;
	} 
  },
  excelDown : function() {
    $(".excelDownBtn").click(function() {
    	  var url = $("input[name=actionUrl]").val();
	  $("#searchForm").attr("action", url).submit();
	}); 
  }
}
$.fn.Form = {
  searchForm : function(option) {
    $(".searchBtn").click(function() {
    	  if(option == 'month') $.fn.Form.limitMonth();
	  $("#searchForm").attr("action", "").submit();
	});
  },
  limitMonth : function() {
	var startDate = $("input[name=startDate]").val();
	var endDate = $("input[name=endDate]").val();
	var dayTerm = fn_calcDayMonthCount(startDate, endDate, "D");
	if(dayTerm > 31) {
		alert("일별 통계는 최대 한달(31일)까지 가능합니다.");
		return false;
	} 
	return true;
  }
}