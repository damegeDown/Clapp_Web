/**
 * 발송용 메일 
 */
var MailUtils = (function() {
	"use strict";
	
	var openMailFreeView = function(_this) {
		var id = $(_this).data("id");
		unblockUI(); //검색 완료후 창이 닫기는 문제해결을 위한 처리.
		$.ajax({
			url : "/admin/ecrm/rest/getMailTemp",
			type : "post",
			dataType : "json",
			data : {"id" : id},
			success : function(data) {
				$("#mailContents").html(data.code);
				disableScreen("#freeViewMail");
			},
			error : function() {
				alert("error");
			}
		});
	};
	var openTargetMailFreeView = function(_this) {
		var content = $(this).closest("tr").find("input[name=mailContent]").val();
		$("#mailContents").html(content);
		disableScreen("#freeViewMail");
	};
	var sortTable = function() {
		$("#sortForm").submit();
	};
	return {
		openMailFreeView : openMailFreeView,
		openTargetMailFreeView : openTargetMailFreeView,
		sortTable : sortTable
	}
})();

var SurveyUtils = (function() {
	"use strict";
	
	//설문 페이지 생성
	var createSurvey = function(type) {
	  var userId = $("input[name=userId]").val();
		//질문 문항 
	  var questionHtml = $("<div></div>");
	  $("[name=surveyQuestionTitleArr]").each(function(index){
		  var questionType = $("[name=surveyQuestionTypeArr]:eq("+index+")").val();
		  var pointType = $("[name=surveyPointTypeArr]:eq("+index+")").val();
		  questionHtml
		  		.append( //질문
				  $("<div></div>").text(index+1+"."+$(this).val())
				 )
			  .append(function() {	 //답변
				  var startPoint = 0;
			  	  var endPoint = 0;
			  	  var pointArea = $("<div></div>").css({"margin":"10px"});
			  	  // 유형 선택. 1:선호도형(객관식), 2:단답형(주관식)
			  	  if(questionType == 2){
			  		  pointArea
			  		  		.append($("<textarea></textarea>").css({"width" : "95%"}).attr({"name" : "surveyAnswerContentsArr"}));
			  	  } else {
			  		  //범위 타입. 1:점수형, 2:텍스트형
					  if(pointType == 1) {
						  startPoint = Number($("[name=surveyStartPointArr]:eq("+index+")").val());
						  endPoint = Number($("[name=surveyEndPointArr]:eq("+index+")").val());
						  for(var i = startPoint; i >= endPoint; i--){
							  var checkFlag = false;
							  if(i == startPoint) checkFlag = true;
							  pointArea
							  	.append(
							  	  $("<label></label>").css({"margin-right":"10px"})
							  	  		.append(
											$("<input></input>").css({"margin-right":"5px"})
												.attr({"type" : "radio", "name" : "surveyAnswerPoint_"+index, "value" : i, "checked": checkFlag})
							  			)
							  			.append(
							  			  i+"점"
							  			)
							  	);	  
						  }
					  } else {
						  startPoint = Number($("[name=surveyStartTextArr]:eq("+index+")").val());
						  endPoint = Number($("[name=surveyEndTextArr]:eq("+index+")").val());
						  var pointTerm = ["매우불만족", "불만족", "보통", "만족", "매우만족"];
						  for(var i = startPoint; i >= endPoint; i--){
							  var checkFlag = false;
							  if(i == startPoint) checkFlag = true;
							  pointArea
								  	.append(
								  	  $("<label></label>").css({"margin-right":"10px"})
								  	  	  	.append(
												$("<input></input>").css({"margin-right":"5px"})
													.attr({"type" : "radio", "name" : "surveyAnswerPoint_"+index, "value" : i, "checked" : checkFlag})
								  			)
								  			.append(
								  			  pointTerm[i-1]
								  			)
								  	);	  
						  }
				  		}
			  	  }
				  return	 $("<div></div>").html(pointArea);
			  })
		});
		var freeViewWrap = 
			$("<div></div>").attr({"id":"freeViewForm", "action" : "$contextPath/admin/ecrm/insertSurvey"}).css({"text-align":"left", "width" : "500px" , "margin" : "10px 10px 20px 10px"})
				.append($("<input></input").attr({"type" : "hidden", "name" : "userId", "value" : userId}))
				/*제목 및 설명*/
				.append($("<h3></h3>").text("<"+$("[name=surveyTitle]").val()+">"))		//제목 
				.append(		//설명 및 응답기간
					$("<div></div>").css({"background":"#DCE6F1", "padding" : "10px", "margin-top":"5px"})
					  .append($("<div></div>").html($("[name=surveyNoti]").val()))	//설명
						.append($("<div></div>")	//응답기간
						  .css({"margin-top": "10px"})
							.text(
							  "응답기간 :" + $("[name=surveyStartDate]").val() + " ~ " + $("[name=surveyEndDate]").val()		
							)
						)
				)
				.append($("<div></div>").css({"border":"1px solid #999", "margin" : "10px 0"}))		//라인
				.append(questionHtml)  //질문
				.append($("<div></div>").addClass("btnArea")
					.append($("<input></input>").attr({"type" : "submit"}).addClass("btn"))
				)
				;
		$("#popupFreeView .popUpContents").html(freeViewWrap);
		$("[name=surveyTemp]").val($("#popupFreeView .popUpContents").html());
		if(type == "freeView") {
			disableScreen("#popupFreeView");
		} else {
			$(".submitBtn").click();
		}
  	};
	
	var changeQuestionType = function(_this) {
		var type = $(_this).val();
		var thisTable = $(_this).closest("table"); 
		if(type == 1) {
			thisTable.find(".typePoint").show();
			thisTable.find(".typeText").hide();
		} else {
			thisTable.find(".typePoint").hide();
			thisTable.find(".typeText").show();
		}
	}
	var changePointType = function(_this) {
		var type = $(_this).val();
		if(type == 1) {
			$(_this).siblings(".point").show();
			$(_this).siblings(".text").hide();
		} else {
			$(_this).siblings(".point").hide();
			$(_this).siblings(".text").show();
		}
	};
	//질문 추가
	var cloneQuestion = function(_this) {
		var _temp = $(_this).closest(".questionTemp");
		var questionClone = _temp.clone();
		$(".questionTemp:last").after(questionClone);
	};
	//질문 삭제
	var removeQuestion = function(_this) {
		var _temp = $(_this).closest(".questionTemp");
		var tempLen = $(".questionTemp").length;
		if(tempLen > 1) _temp.remove();
		else alert("더이상 삭제할수 없습니다.");
	};
	var moveQuestion = function(_this, _type) {
		var _temp = $(_this).closest(".questionTemp");
		var questionClone = _temp.clone();
		var target;
		if(_type == "up") { 
			target = _temp.prev(".questionTemp");
			if(target.length < 1) {
				dontMoveQuestion();
				return;
			}
			target.before(questionClone);
				
		} else if(_type == "down") {
			target = _temp.next(".questionTemp");
			if(target.length < 1){
				dontMoveQuestion();
				return;
			}
			target.after(questionClone);
		}
		_temp.remove();
	};
	var dontMoveQuestion = function() {
		alert("더이상 이동이 불가합니다."); 
	};
	var goBack = function() {
		history.back(-1);
	};
	var goDetail = function(_this) {
	    var surveyMasterKey = $(_this).data("key");
	    location.href = "/admin/ecrm/surveyDetail?surveyMasterKey="+surveyMasterKey;
	}
	return {
		createSurvey : createSurvey,
		changeQuestionType : changeQuestionType,
		changePointType : changePointType,
		cloneQuestion : cloneQuestion,
		removeQuestion : removeQuestion,
		moveQuestion : moveQuestion,
		goBack : goBack,
		goDetail : goDetail
	}
})();