jQuery(document).ready(function($) { 
	//consoleChk
	consoleChk();
	
	//$blockUI
	blockUI();
	
	//datePicker
	DateHandler.init();
	
	//AjaxHandler
	AjaxHandler.init();
	
	//prototype
	Prototype.init();
	
});

/**
 * 관리자 회원 정보 관리에서 벗어났을시에 케시 삭제
 */

$(function() {
	var url = location.href;
	if(url.indexOf("/admin/member/") != -1) {
		//console.log("insert");
	}  else {
		setCookie("memberChkGrant", "");
	}
});
/**
 * 에디터 유틸
 * param = id : 입력란 아이디, type : ajax -> submitBtn공통 사용시, form -> 일반 폼 전송 사용시 
 */
var EditorUtils =(function() {
	var oEditors = []; 
	var smartEditor = function(id, type){
	  nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: id,
	        sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	  });
	  if(type == 'ajax') ajaxSubmit(oEditors, id);
	  if(type == 'form') formSubmit(oEditors, id);
	  
	};
	var ajaxSubmit = function(oEditors, id) {
	  //전송버튼 클릭이벤트
	  $(".onsubmitBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
		  oEditors.getById[id].exec("UPDATE_CONTENTS_FIELD", []);
        // 이부분에 에디터 validation 검증
        //폼 submit
        $(".submitBtn").click();
	  });  
	}
	var formSubmit = function(editor_object, id) {
	  //전송버튼 클릭이벤트
	  $(".formBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById[id].exec("UPDATE_CONTENTS_FIELD", []);
        // 이부분에 에디터 validation 검증
        //폼 submit
        $("form").submit();
	  });  
	}
	 
	return {
	  smartEditor : smartEditor,
	  oEditors : oEditors
	}
})($);
var popupUtils = (function() {
	var popupClose = function(id) {
		enableScreen(id);
	};
	var popupOpen = function(id) {
		disableScreen(id)
	};
	return {
		popupClose   : popupClose,
		popupOpen    : popupOpen
	}
})();

/**
 * console.log를 지원하지 않는 브라우저에서 동작하도록해줌.
 * alertFallback 변수로 얼럿으로 대채할것인지 설정
 * 2014/3/25 wsw
 */
var consoleChk = function() {
	var alertFallback = false;  
	if (typeof console === "undefined" || typeof console.log === "undefined") {    
		console = {};    
		if (alertFallback) {        
			console.log = function(msg) {             
				alert(msg);        
			};    
		} else {        
			console.log = function() {};    
		}  
	}
};
/**
 * Ajax 실행시 blockUI 를 실행하고 종료시 unblockUI 를 실행한다.
 * 2014/3/25 wsw
 */
var blockUI = function() {
	$(document).bind("ajaxSend", function() {
		$.blockUI();
	})
	.bind("ajaxStop", function() {
		$.unblockUI();
	});
};
var unblockUI = function() {
	$(document).unbind("ajaxSend")
	.unbind("ajaxStop");
};

/**
 * DatePicker 이벤트
 */
$(function() { 
	$( "#from" ).datepicker({
		defaultDate: "+1w",
		changeMonth: true,
		numberOfMonths: 1,
		dateFormat : 'yy/mm/dd',
		onClose: function( selectedDate ) {
			$( "#to" ).datepicker( "option", "minDate", selectedDate);
		}
	});
	$( "#to" ).datepicker({
		defaultDate: "+1w",
		changeMonth: true,
		numberOfMonths: 1,
		dateFormat : 'yy/mm/dd',
		onClose: function( selectedDate ) {
			$( "#from" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
}); 
 
DateHandler = {
     init : function () {
    	 this.datePicker();
    	 this.monthPicker();
    	 this.dateTimePicker();
     },
     datePicker : function() {
	     /* DatePicker 설정*/ 
	     $(".datepicker").datepicker ({
		     dateFormat: "yy/mm/dd",
		     showOn : "both", 
		     showAnim: "slide",
		     buttonImage : "/resources/img/icon-calendar.gif",
		     showMonthAfterYear: true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다.
		     monthNames: ['1월(January)','2월(February)','3월(March)','4월(April)','5월(May)','6월(June)',
		                 '7월(July)','8월(August)','9월(September)','10월(October)','11월(November)','12월(December)'],
		     dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     prevText: '이전 달',
		     nextText: '다음 달'
	     }); 
    },
    monthPicker : function() {
    	var d = new Date();
    	options = {
    		    pattern: 'yyyy/mm', // Default is 'mm/yyyy' and separator char is not mandatory
    		    selectedYear: d.getFullYear(),
    		    startYear: d.getFullYear() - 5, 
    		    finalYear: d.getFullYear() + 5,
    				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
    		};
    	$('.monthpicker').monthpicker(options);
    },
    dateTimePicker : function() {
    	$('.datetimepicker').datetimepicker({
    		format:'Y/m/d H:i',
    		defaultTime:'10:00',
    		step : 5,
    		timepickerScrollbar:false
    	});
    }
};

/**
* datepicker 초기화
* 동적생성 Elements에 사용가능.
* date format 설정기능 추가 (data-format="%Y%m%d")
*/
$(document).find(".datepickers").removeClass('hasDatepicker').datepicker({
	onClose : function(selectedDate) {
		var selDate = new Date(selectedDate);
		if(typeof $(this).data("format") == "undefined"){
			$(this).val(selDate.toLocaleFormat("%Y%m%d"));
		} else if(typeof $(this).data("format") != "undefined") {
			$(this).val(selDate.toLocaleFormat( $(this).data("format")));
		}
	} 
	 
}).val();

AjaxHandler = {
	init : function() {
		this.clickEvent();
	},
	clickEvent : function() {
		$("form").delegate(".submitBtn", "click", function(event) {
			var formNm = $(this).parents("form").attr("id");
			var url_sync = $(this).data("action");
			var type = $(this).data("type");
			var msg = $(this).data("msg");
			var message = $(this).data("message");
			var url = url_sync; 
			if(message != undefined) {
			  if(message != "" && !confirm(message)) return false;
			} else if(msg == null) {
				
			} else {
			  if(msg != "" && !confirm(msg+'하시겠습니까?')) return false;
			}
			var options = AjaxHandler.setOption(url);

			if (type == "ajax") {
				var id = $(this).data("id");
				options.data = {"id" : id};
				AjaxHandler.ajaxEvent(formNm, options);
			}
			else {
				if(!AjaxHandler.validateForm(formNm)) return false;
				AjaxHandler.ajaxSubmitEvent(formNm, options);
			}
		});
	},
	setOption : function (url) {
		var options = {
			url : url,
			type : "post",
			dataType : "json",/* xml, html, script, json */
			success : AjaxHandler.responseSuccess,
			error : AjaxHandler.responseError
		};
		return options;
	},
	ajaxSubmitEvent : function (formNm, options) {
		$("#"+formNm).ajaxSubmit(options);
	},
	ajaxEvent : function(formNm, options) {
		$.ajax(options);
	},
	responseSuccess : function(resultMap, status) {
		if(resultMap.hasOwnProperty("resultMSG") && resultMap.resultMSG != null) {
			alert(resultMap.resultMSG);
		}
		if(resultMap.hasOwnProperty("resultURL") && resultMap.resultURL != null){
			//location.href = contextPath + resultMap.resultURL;
			location.href = resultMap.resultURL;
		}
		if(resultMap.hasOwnProperty("resultACT")){
			eval(resultMap.resultACT);
		}
	},
	responseErro : function(resultMap, ststus) {
		alert("전송 실패.");
	},
	validateForm : function (formNm) {
		var checkFlag = false;
		$("#" + formNm).find("input,textarea,select").each(function(event) { // 체크할 인풋박스 수대로 반복문을 돈다.
			var name = $(this).data("name");
	    	if(typeof name === "undefined") {
	    		name = $(this).data("message");
		    	if(typeof name === "undefined")
		    		name = $(this).parents("tr").find("th").text()+"에 값을 입력해 주세요.";
	    	} else {
	    		name += "에 값을 입력해 주세요.";
	    	}
	    	
            if($(this).data("flag") == "off"){
				checkFlag = true;
				return true;
			} else {
			    if($(this).val() == '' || $(this).val() == "00") { //값 체크
			        alert(name);
			        //console.log($(this).attr("name"));
	                $(this).focus();
	                checkFlag = false;
	                return false;
				} else if($(this).data('format')) { //형식 체크
	                var maxLength = 0; //형식 체크시 글자 길이 체크를 위한 값
	                var minLength = 0;
	                if($(this).data("minlength")){ //minLength 설정할 값을 가지고 온다.
	                	minLength = $(this).data("minlength");
	                }
	                if($(this).data('maxlength')){ //maxLength 설정할 값을 가지고 온다.
	                	maxLength = $(this).data('maxlength');
	                }
	                //common.js 에서 값체크를 한다.
	                if(!checkValidate($(this), $(this).data('format'), name+'의 입력 형식을 확인해 주세요.', minLength, maxLength)) {
	            	    $(this).focus();
	                    checkFlag = false;
                        return false;
	                }
	                checkFlag = true;
		        } else {
	                checkFlag = true;
		        }
            }
        });
		return checkFlag;
	}
};



/** checkValidate
 * obj=JQUERYOBJECT(IMPORTANT!)
 * type=valuecase(DEFAULT:all)
 * msg=popalertmessagestring(DEFAULT:none)
 * minLength=valueminlength(DEFAULT:none)
 * maxLength=valuemaxlength(DEFAULT:none)
 * ex)checkValidate('hp_num', 'num', '숫자 아님', 3, 4); //최소 3글자, 최대 4글자의 숫자 타입인지 확인.
**/
var checkValidate = function (obj, type, msg, minLength, maxLength) {
     var validate = 1;
     var reason = '';
     var value = obj.val();
     var filter = "";
     // length calc
     if (minLength > 0 && value.length < minLength) { validate = 0; reason += ' minLength'; }
     if (maxLength > 0 && value.length > maxLength) { validate = 0; reason += ' maxLength'; }
     // type case
     switch (type) {
          case ("email") :
               filter = /^[_a-zA-Z0-9]+([-+.][_a-zA-Z0-9]+)*@[_a-zA-Z0-9]+([-.][_a-zA-Z0-9]+)*\.[_a-zA-Z0-9]+([-.][_a-zA-Z0-9]+)*$/;
               break;
          case ("email_pre") :
               filter = /^[_a-zA-Z0-9]+([-+.][_a-zA-Z0-9]+)*$/;
               break;
          case ("email_end") :
               filter = /^[_a-zA-Z0-9]+([-.][_a-zA-Z0-9]+)*\.[_a-zA-Z0-9]+([-.][_a-zA-Z0-9]+)*$/;
               break;
          case ("han") :
               filter = /^[가-힣]+$/;
               break;
          case ("notBlank") :
               filter = /^\S{0,}$/;
               break;
          case ("engnum") :
               filter = /^\w{0,}$/;
               break;
          case ("num") :
               filter = /^\d{0,}$/;
               break;
          case ("all") :
               filter = /^.*$/;
               break;
          default :
               filter = /^.*$/;
     }

     // filter apply
     if (filter.test(value) && validate == 1) {
          return true;
     } else {
          reason += ' filter';
          validate = 0;
     }

     // debug
     //if (1) {//console.log(' : ' + msg  + ' : ' + type + ' : ' + value + ' : ' + reason); }

     if (msg.length > 0) { alert(msg); }
     obj.focus();
     return false;
};
/**
 * 숫자 타입 핸들
 */
$.fn.NumberFormatHandler = {
	//지정자리 반올림 (값, 자릿수)
	Round : function(n, pos) {
		var digits = Math.pow(10, pos);
		
		var sign = 1;
		if (n < 0) {
			sign = -1;
		}
		
		// 음수이면 양수처리후 반올림 한 후 다시 음수처리
		n = n * sign;
		var num = Math.round(n * digits) / digits;
		num = num * sign;
		
		return num.toFixed(pos);
	},
	// 지정자리 버림 (값, 자릿수)
	Floor : function(n, pos) {
		var digits = Math.pow(10, pos);
		
		var num = Math.floor(n * digits) / digits;
		
		return num.toFixed(pos);
	},
	// 지정자리 올림 (값, 자릿수)
	Ceiling : function(n, pos) {
		var digits = Math.pow(10, pos);
		var num = Math.ceil(n / digits) * digits;
		return num;
		//return num.toFixed(pos,0);
	},
	//엑셀 스타일의 반올림 함수 정의
	RoundXL : function(n, digits) {
	  if (digits >= 0) return parseFloat(n.toFixed(digits)); // 소수부 반올림
	
	  digits = Math.pow(10, digits); // 정수부 반올림
	  var t = Math.round(n * digits) / digits;
	
	  return parseFloat(t.toFixed(0));
	},
	//숫자 콤마 찍기
	AddCommas : function(nStr){
		nStr += '';
		x = nStr.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		return x1 + x2;
	}
};
/**
 * 우체국 배송조회 팝업
 <form name="searchPost" id="searchPost" method="get" >
<input type="hidden" name="target_command" value="kpl.tts.tt.epost.cmd.RetrieveOrderConvEpostPoCMD" />
<input type="hidden" name="JspURI" value="/xtts/tt/epost/trace/Trace_list.jsp" />
 <input type="hidden" id="sid1" name="sid1" size="13" maxlength="13" value="${order.send_no }" />
 <a href="#;" onClick="schpostnum()"><span class="point-txt">${order.send_no }</span></a>
</form>   
 */
var schpostnum = function(){
	var dnumber = document.getElementById("searchPost").sid1.value;
	var addr = "http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=";
	document.getElementById("searchPost").submit();
	var trcWin1 = window.open(addr+dnumber,"openWin1","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=120,top=130,width=520,height=630");
   //document.getElementById("searchForm1").target = "openWin1";
};
/////////////////////////////PROTOTYPE////////////////////////////
Prototype = {
	init : function() {
		this.numComm();
		this.strCut();
		this.strByte();
		this.strTrim();
        this.dateFormat();
	},
	numComm : function() {
		/**
		* 숫자에 콤마
		*/
		Number.prototype.format = function(){
		  if(this==0) return 0;
		  var reg = /(^[+-]?\d+)(\d{3})/;
		  var n = (this + '');
		  while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		  return n;
		};

		/**
		* 문자타입도 사용가능
		* @returns
		*/
		String.prototype.format = function(){
		  var num = parseFloat(this);
		  if( isNaN(num) ) return "0";
		  return num.format();
		};
	},
	strCut : function() {
		/**
		* stringString::cut(intlen)
		* 글자를앞에서부터원하는바이트만큼잘라리턴합니다.
		* 한글의경우2바이트로계산하며,글자중간에서잘리지않습니다.
		*/
		String.prototype.cut = function(len) {
		  var str = this;
		  var l = 0;
		  for (var i=0; i<str.length; i++) {
		      l += (str.charCodeAt(i) > 128) ? 2 : 1;
		      if (l > len) return str.substring(0,i) + "...";
		  }
		  return str;
		};
	},
	strByte : function() {
		/**
		* boolString::bytes(void)
		* 해당스트링의바이트단위길이를리턴합니다.(기존의length속성은2바이트문자를한글자로간주합니다)
		*/
		String.prototype.bytes = function() {
		    var str = this;
		    var l = 0;
		    for (var i=0; i<str.length; i++) l += (str.charCodeAt(i) > 128) ? 2 : 1;
		    return l;
		};
	},
	strTrim : function() {
		/**
		* 트림함수(공백제거)
		* @returns
		*/
		String.prototype.trim = function() {
			return this.replace(/(^\s*)|(\s*$)/gi, "");
		};
	},
    dateFormat : function() {
        Date.prototype.format = function(f) {
            if (!this.valueOf()) return " ";

            var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
            var d = this;

            return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
                switch ($1) {
                    case "yyyy": return d.getFullYear();
                    case "yy": return (d.getFullYear() % 1000).zf(2);
                    case "MM": return (d.getMonth() + 1).zf(2);
                    case "dd": return d.getDate().zf(2);
                    case "E": return weekName[d.getDay()];
                    case "HH": return d.getHours().zf(2);
                    case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
                    case "mm": return d.getMinutes().zf(2);
                    case "ss": return d.getSeconds().zf(2);
                    case "a/p": return d.getHours() < 12 ? "오전" : "오후";
                    default: return $1;
                }
            });
        };

        String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
        String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
        Number.prototype.zf = function(len){return this.toString().zf(len);};
    }
};

// 쿠키 생성 cName =쿠키이름, cValue = 쿠키값, cDay = 쿠키 유지일
function setCookie(cName, cValue, cDay){
     var expire = new Date();
     expire.setDate(expire.getDate() + cDay); 
     cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
     if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
     document.cookie = cookies;
}

// 쿠키 가져오기
function getCookie(cName) {
     cName = cName + '=';
     var cookieData = document.cookie;
     var start = cookieData.indexOf(cName);
     var cValue = '';
     if(start != -1){
          start += cName.length;
          var end = cookieData.indexOf(';', start);
          if(end == -1)end = cookieData.length;
          cValue = cookieData.substring(start, end);
     }
     return unescape(cValue);
}
/*****************************************************/
/*테이블 동일 값 열/행 병합 처리를 위한 함수         */
/*****************************************************/
/*
*
* 같은 값이 있는 열을 병합함
*
* 사용법 : $('#테이블 ID').rowspan(0);
*
*/   
$.fn.rowspan = function(colIdx, isStats) {      
    return this.each(function(){     
        var that;   
        $('tr', this).each(function(row) {     
            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
               
                if ($(this).html() == $(that).html()
                    && (!isStats
                            || isStats && $(this).prev().html() == $(that).prev().html()
                            )
                    ) {           
                    rowspan = $(that).attr("rowspan") || 1;
                    rowspan = Number(rowspan)+1;

                    $(that).attr("rowspan",rowspan);
                   
                    // do your action for the colspan cell here           
                    $(this).hide();
                   
                    //$(this).remove();
                    // do your action for the old cell here
                   
                } else {           
                    that = this;        
                }         
               
                // set the that if not already set
                that = (that == null) ? this : that;     
            });    
        });   
    }); 
};

/*
*
* 같은 값이 있는 열을 병합하면서 그 열을 기준으로 다른 열도 병합함.
*
* 사용법 : $('#테이블 ID').rowspan(기준열, 동반병합열);
*
*/   
$.fn.rowspan_2 = function(colIdx, colIdx1, isStats) {      
    return this.each(function(){     
        var that;
        var this1;//추가     
        var that1;//추가     

        $('tr', this).each(function(row) {
        //현재 기준 라인 정보 수집
        this1 = this;//추가     
               
            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
               
                if ($(this).html() == $(that).html()
                    && ( !isStats || isStats && $(this).prev().html() == $(that).prev().html() )
                    ) {           
                    rowspan = $(that).attr("rowspan") || 1;
                    rowspan = Number(rowspan)+1;

                    $(that).attr("rowspan",rowspan);

                    //동반 변경처리 열 rowspan 추가
                    var temp = $(that1).find("td:eq(" + colIdx1 + ")");//추가     
                    temp.attr("rowspan",rowspan);//추가     
                   
                    // do your action for the colspan cell here           
                    $(this).hide();
                   
                  //동반 변경처리 열 숨김
                    $(this1).find("td:eq(" + colIdx1 + ")").hide();//추가     
                   
                } else {           
                    that = this;
                    that1 = this1; //추가
                }         
               
                // set the that if not already set
                that = (that == null) ? this : that;                      
                that1 = (that1 == null) ? this1 : that1;//추가     
            });    
        });   
    }); 
}


/*
*
* 같은 값이 있는 행을 병합함
*
* 사용법 : $('#테이블 ID').colspan (0);
*
*/ 
$.fn.colspan = function(rowIdx) {
    return this.each(function(){
       
        var that;
        $('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
            $(this).find('th').filter(':visible').each(function(col) {
                if ($(this).html() == $(that).html()) {
                    colspan = $(that).attr("colSpan") || 1;
                    colspan = Number(colspan)+1;
                   
                    $(that).attr("colSpan",colspan);
                    $(this).hide(); // .remove();
                } else {
                    that = this;
                }
               
                // set the that if not already set
                that = (that == null) ? this : that;
               
            });
        });
    });
}


/* 
* 
* 팝업창 
* 
* 사용법 : disableScreen("#previewform");
* 
*/ 

function disableScreen(msg) {
	var blockObject= {
		message: '<img src="/img/ajax-loader.gif" align="absmiddle" style="margin-bottom:3px;" /> ' + msg,
		css: {
		'border': 'solid 2px #e3e3e3',
		'padding': '10px',
		'opacity': '.9'
		}
	};
	
	if('#' == msg.substring(0, 1)) {
		$(msg).css({'margin':'none'});
		blockObject.message= $(msg);
		
		blockObject.css.border= "none";
		blockObject.css.background= "#fff";
		blockObject.css.padding= "none";
		blockObject.css.margin= "0 0 0 0";
		blockObject.css.height= $(msg).height() + "px";
		blockObject.css.width= $(msg).width() + "px";
		blockObject.css.left= ($(window).width() - $(msg).width()) / 2 + 'px';
		blockObject.css.top= ($(window).height() - $(msg).height()) / 2 + 'px';
	}

	$.blockUI(blockObject);
}

function enableScreen() {
	$.unblockUI();
}
/****************************************************************************************************/


//param : pStartDate - 시작일  
//param : pEndDate  - 마지막일  
//param : pType       - 'D':일수, 'M':개월수  
// Update. 2014.11.07. 변수명 변경 : strGapDT->strTermCnt  
// Update. 2014.11.07. 개월수 계산 시 년도가 다른 경우 부정확성 보완 : floor->round AND 365.25->365  
function fn_calcDayMonthCount(pStartDate, pEndDate, pType) {
	var sYear = "";
	var sMonth = "";
	var sDay = "";
	var eYear = "";
	var eMonth = "";
	var eDay = "";
	if(pStartDate.length == 8) {
		sYear = pStartDate.substring(0,4);
		sMonth = pStartDate.substring(4,6)-1;
		sDay = pStartDate.substring(6,8);
	} else {
		var sDate = pStartDate.split("-");
		sYear = sDate[0];
		sMonth = sDate[1];
		sDay = sDate[2];
	}
	if(pEndDate.length == 8) {
		eYear = pEndDate.substring(0,4);
		eMonth = pEndDate.substring(4,6)-1;
		eDay = pEndDate.substring(6,8);
	} else {
		var eDate = pEndDate.split("-");
		eYear = eDate[0];
		eMonth = eDate[1];
		eDay = eDate[2];
	}
    var strSDT = new Date(sYear, sMonth, sDay);  
    var strEDT = new Date(eYear,eMonth,eDay);  
    var strTermCnt = 0;  
       
    if(pType == 'D') {  //일수 차이  
        strTermCnt = (strEDT.getTime()-strSDT.getTime())/(1000*60*60*24);  
    } else {            //개월수 차이  
        //년도가 같으면 단순히 월을 마이너스 한다.  
        // => 20090301-20090201 의 경우(윤달이 있는 경우) 아래 else의 로직으로는 정상적인 1이 리턴되지 않는다.  
        if(pEndDate.substring(0,4) == pStartDate.substring(0,4)) {  
            strTermCnt = pEndDate.substring(4,6) * 1 - pStartDate.substring(4,6) * 1;  
        } else {  
            //strTermCnt = Math.floor((strEDT.getTime()-strSDT.getTime())/(1000*60*60*24*365.25/12));  
            strTermCnt = Math.round((strEDT.getTime()-strSDT.getTime())/(1000*60*60*24*365/12));  
        }  
    }  
      
    return strTermCnt;  
}  

/**
 * 공통코드 지역 선택 스크립트
 */
/* 
  <select class="floatL sel-w80" name="userAreaType" data-type="AREA" data-wrap="userArea">
  	<option value="0">-선택-</option>
  	<option value="1" data-val="1">국내</option>
  	<option value="2" data-val="2">해외</option>
  </select>
  <div class="floatL userArea"><!-- 지역 --></div>
  <div class="floatL userAreaDetail"><!-- 상세지역 --></div>
*/
 
$(function() {
	$("form").delegate("select[name=userAreaType], select[name=userArea]", "change", function() {
		var wrap = $(this).data("wrap");							           //선택된 이름
		var codeMasterCode = $(this).data("type");							   //공통코드 마스터 코드
		var commonCodeReferense = $(this).find("option:selected").data("val"); //공통 코드 참조값
		//선택된 지역(국내, 해외)가 아닐시에 로직을 정지한다.
		if($(this).attr("name") == "userAreaType"){
			$("div.userArea,div.userAreaDetail").html("");
			if($(this).val() < 1) return false;
            if($(this).val() == 2) return false;
		}
		
		$.ajax({
			url : "/common/commonCodeList",
			dataType : "json",
			type : "post",
			data : {codeMasterCode: codeMasterCode, commonCodeReferense :commonCodeReferense},
			success : function(data) {
				 var html = "";
				 //셀렉트 박스 생성
				 var objSelect = $("<select class='sjfrLocalSelect'></select>")
				 		.addClass("floatL")
				 		.attr("name", wrap)
				 		.data({"type": "AREA_DETAIL", "wrap": "userAreaDetail"});
				 var objOption = $("<option></option>").val(0).text("-지역선택-");
				 objSelect.append(objOption);
				 //옵션생성
				 for(var i = 0; i < data.length; i++) {
					 objOption = $("<option></option>")
		 							.val(data[i].commonName)
		 							.text(data[i].commonName)
		 							.data("val", data[i].commonCode);
					 objSelect.append(objOption);
				 }
				 $("."+wrap).html(objSelect);
			},
			error : function(e) {
				alert("실패");
			}
		});
	});
});

/**
 * 전화 번호 합치기
 
<c:set var="telePhone" value="${fn:split(*디비에서 불러온값,'-')}"/>
<select class="phoneNum" name="telePhone1">
	<option value="0">-선택-</option>
	<c:forEach items="${telePhoneCode }" var="code">
		<option value="${code.commonCode }" <c:if test="${telePhone[0] eq code.commonCode }">selected</c:if>>${code.commonName }</option>
	</c:forEach>
</select> - 
<input type="text" class="inp-w60 phoneNum" name="telePhone2" value="${telePhone[1]}" data-name="전화번호" maxlength="4"/> - 
<input type="text" class="inp-w60 phoneNum" name="telePhone3" value="${telePhone[2]}" data-name="전화번호" maxlength="4"/>
<input type="hidden" class="phoneNumComp" name="userTelePhoneNumber" value="${*디비에서 불러온값}"/>
*/
$(function() {
  $(".phoneNum").change(function() {
   var _parent = $(this).parent(); 
   var phoneNumArr = [];
   // 지역번호를 미선택으로 변경시 초기화 시켜준다.
	 if($(this).val() == 0){
		 $(_parent).find(".phoneNum").not($(this)).val("");
		 $(_parent).find(".phoneNumComp").val("");
	 } else {
		 // 변경된 필드의 형제 필드의 값을 합친다.
	   $(_parent).find(".phoneNum").each(function(i) {
		   phoneNumArr.push($(this).val());
	    });
	   $(_parent).find(".phoneNumComp").val(phoneNumArr.join("-"));
	 }
  });
  $(".notHangul").keyup(function(event){
      if (!(event.keyCode >=37 && event.keyCode<=40)) {
          var inputVal = $(this).val();
          $(this).val(inputVal.replace(/[^a-z0-9.]/gi,''));
      }
  });
});

$(function() {
	  $(".userEmail").change(function() {
	   var _parent = $(this).parent(); 
	   var userEmailArr = [];
	   // 미선택으로 변경시 초기화 시켜준다.
		 if($(this).val() == 0){
			 $(_parent).find(".userEmail").not($(this)).val("");
			 $(_parent).find(".userEmailComp").val("");
		 } else {
			 // 변경된 필드의 형제 필드의 값을 합친다.
		   $(_parent).find(".userEmail").each(function(i) {
			   userEmailArr.push($(this).val());
		    });
		   $(_parent).find(".userEmailComp").val(userEmailArr.join("@"));
		   console.log(userEmailArr);
		 }
	  });
	});
