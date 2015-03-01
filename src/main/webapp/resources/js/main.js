$(document).ready(function(){
    // timeago 플러그인을 미래 시각으로 동작할 수 있게 설정
    jQuery.timeago.settings.allowFuture = true;
    
    var now = new Date();
    
    $(".timeago").timeago();
    $(".page-opened").text($.timeago(now));
    $("time").timeago();
    popupOpen();
});
    var popupOpen = function() {
    	$.ajax({
    		url : contextPath+"/common/popupList",
    		dataType : "json", 
    		type : "post", 
    		success : function(data) {
		    	// 에디터의 내용이 textarea에 적용된다.
		    	for(var i = 0; i < data.length; i ++ ) {
		    		var popList = data[i];
		    		var openFlag = getCookie("popupCheck" + popList.popupKey);
		    		console.log(openFlag);
		    		if(openFlag == "false") continue;
		    		
					var popWidth = popList.popupSizeWidth+"px";
					var popHeight = popList.popupSizeHeight+"px";
					var popTop = popList.popupPositionTop+"px";
					var popLeft = popList.popupPositionLeft+"px";
					var popContents = popList.popupContents;
					
					/* 팝업창*/
					var htmlWrap = $("<div></div>").attr("id", "popup_"+popList.popupKey).css({"position":"absolute","background": "#fff", "z-index": "10000","border": "1px solid #666"});
					htmlWrap.append($("<div></div>").addClass("contents").css({"height" : "100%"}));
					htmlWrap.append($("<div></div>").addClass("footer").css({"position":"relative","top":"-25px","height" : "20px", "border-top": "1px solid #666"}));
					htmlWrap.find(".contents").html(popContents);
					
					/* 팝업 1주일간 창 열지 않기 체크박스 */ 
					var checkLabel = $("<label></label>").text(" 1주일간 열지 않기");
					var checkBox =  $("<input></input>")
												.css({"margin-top":"5px","margin-left":"3px"})
												.attr({"type": "checkbox" , "name" : "popupCheck" + popList.popupKey})
												.click(function() {
													var name = $(this).attr("name");
													setCookie(name, false, 7);
													$(this).parents("#popup_"+popList.popupKey).hide();
												});
					checkLabel.prepend(checkBox);
					htmlWrap.find(".footer").html(checkLabel);
					/* 팝업 1주일간 창 열지 않기 체크박스 */
					
					/* 팝업 창닫기 버튼*/
					var closeBtn = $("<span></span>")
											.css({"float":"right","padding-right":"5px", "margin-top": "2px" })
											.addClass("cancelBtn")
											.attr("onclick","javascript:$('#popup_"+popList.popupKey+"').hide()")
											.text("X");
					htmlWrap.find(".footer").append(closeBtn);
					/*팝업 창닫기 버튼*/
					
					$("body").append(htmlWrap);
					$("#popup_"+popList.popupKey).draggable().css({ 
						"display": "block", 
						"top" : popTop, 
						"left" : popLeft, 
						"width" : popWidth, 
						"height" : popHeight
					 });
					 $(".cancelBtn").click(function() {
					 	$("#popupFreeView").hide();
					 });
		    	}
    		},
    		error : function() {
    			alert("error");
    		}
    	})
    }
  