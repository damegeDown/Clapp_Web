/** datepicker */
var datepicker = function () {
	$("#sd, #ed, .datepicker").datepicker ({
			dateFormat: "yy-mm-dd",
			buttonImage : contextPath + "/resources/img/icon-calendar.gif",
			monthNames: ['1월(Jan)','2월(Feb)','3월(Mar)','4월(Apr)','5월(May)','6월(Jun)','7월(Jul)','8월(Aug)','9월(Sep)','10월(Oct)','11월(Nov)','12월(Dec)'], 
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			prevText: '이전 달',
			nextText: '다음 달',
			yearSuffix: '년',
			currentText: 'Today',					// 오늘 날짜로 이동하는 버튼 패널
			showOn : "both",						// 버튼과 텍스트 필드 모두 캘린더를 보여줌
			showMonthAfterYear: true,				// 셀렉트 박스가 년,월 순
			changeYear: true,						// 년 선택 가능
			changeMonth: true,						// 월 선택 가능
			onSelect: function( selectedDate ) {	// 선택가능 날짜 제어
				var option = this.id == 'sd' ? 'minDate' : 'maxDate',
						instance = $( this ).data( "datepicker" ),
						date = $.datepicker.parseDate(
							instance.settings.dateFormat || $.datepicker._defaults.dateFormat,
							selectedDate, instance.settings );
				$("#sd, #ed").not( this ).datepicker( "option", option, date );
			}
	});
};