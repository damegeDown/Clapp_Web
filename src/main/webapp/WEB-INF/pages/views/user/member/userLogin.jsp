<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
$(function() {
  $(".loginBtn").click(function() {
    var u_email = $("input[name=userId]").val();
    // 정규식 - 이메일 유효성 검사
    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if(!$("input[name=userId]").val()) {
        alert('이메일 주소를 입력해 주세요');
        $("input[name=userId]").focus();
        return false;
    } else {
        if(!regEmail.test($("input[name=userId]").val())) {
            alert('이메일 주소가 정상적이지 않습니다. 확인 후 다시 한번 입력해 주세요.');
            $("input[name=userId]").focus();
            return false;
        }
    }
   var u_Password = $("input[name=userPassword]").val();
   var regPassword = /^[a-zA-Z0-9]+$/;
   if(!$("input[name=userPassword]").val()) {
       alert('비밀번호를 입력해주세요.');
       $("input[name=userPassword]").focus();
       return false;
   } else {
       if(!regPassword.test($("input[name=userPassword]").val())) {
           alert('비밀번호에는 특수문자 및 한글 입력은 불가능 합니다.\n확인 후 다시 한번 입력해주세요.');
           $("input[name=userPassword]").focus();
           return false;
       }
   }
    var userId = $("input[name=userId]").val();
    var userPassword = $("input[name=userPassword]").val();
    var savedIdFlag = $("input[name=agree_term]:checked").val();
    $.ajax({
      url : '/members/doUserLogin' ,
      data : { userId : userId , userPassword : userPassword }, 
      type : 'post',
      dataType : 'json',
      success: function (result) {
        if (result.resultCode == 'success') { 
	    	if(savedIdFlag == "Y") {
	    		setCookie("savedIdFlag", "Y", 100);
				setCookie("savedId", userId, 100);
	    	} else {
				setCookie("savedIdFlag", "N", -1);
				setCookie("savedId", "", -1);
	    	}
	    	//history.go(-2);
	    	location.href = contextPath + "/";
	    	
        } else {
        	alert(result.resultMSG);
        }
      },
      fail : function() {
          alert('error');
      }
    });
  });
});
 	var LoginUtils = (function(){
 		"user strict"
 		var setSavedId = function() {
 			$(function() {
 				if("${userLoginSession.userMasterKey}") {
 					location.href = contextPath+"/myClapp/myTicket"; 
 				}
	 			var flag = getCookie("savedIdFlag");
	 			var id = getCookie("savedId");
	 			if(flag) {
					$("#idsave").attr("checked", true);
					$("input[name=userId]").val(id);
	 			}
 			});
 		};
 		setSavedId();
 		
 	})($);
 	
 	function Enter_Check(event) {
		if (window.event)
			e = window.event;
		if (event.keyCode == 13) {
			$(".loginBtn").click();
		}
	};
</script>
      <div class="subJoinGnbBottomContainer">
        <div class="subJoinGnbBottomBg">
          <div class="subJoinGnbBottomBox">
            <div class="subJoinGnbBottom">
              <span class="subJoinTitle">로그인</span>
            </div>
            <div class="subStartBox">
              <a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
            </div>
          </div>
        </div>
      </div>
    
    <div class="loginContentTopContainer">
      <div class="loginContentTopBox">
        <div class="loginContentTopLeft">
          <div class="loginTopLeft1">
            <input type="text" class="loginID" name="userId"   placeholder="아이디 (이메일 주소)"  />
          </div>
          <div class="loginTopLeft2">
            <input type="password" class="loginPW" name="userPassword"     placeholder="비밀번호 입력"  onkeydown="Enter_Check(event)" />
          </div>
          <div class="loginTopLeft3">
            <input id="idsave" class="idsave" type="checkbox" name="agree_term" value="Y" />
            <label for="idsave" class="idsaveText">아이디 기억</label> 
          </div>
        </div>
        <div class="loginContentTopRight">
          <div class="loginBtn"  onclick="check(obj)">
            <img class="mloginBtn" src="${contextPath }/resources/images/buttons_login2.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_login2_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_login2.png';" alt="로그인" />
          </div>
        </div>
      </div>
    </div> <!-- .loginContentTopContainer End -->
    <div class="loginContentBottomContainer">
      <div class="loginContentBottomBox">
        <div class="loginContentBottom1">
          <span class="clappJoinforLogin"><a href="${contextPath}/members/memberJoin">클앱 가입</a></span>
          <div class="loginLine"></div>
          <span class="clappJoinforLogin"><a href="${contextPath}/members/idFind">아이디를 분실하셨나요?</a></span>
                    <div class="loginLine"></div>
                    <span class="clappJoinforLogin"><a href="${contextPath}/members/passwordFind">비밀번호를 분실하셨나요?</a></span>
        </div>
      </div>
          <div class="loginContentBottomBox">
            <a href="${contextPath}/members/memberJoin"><img src="${contextPath }/resources/images/event_login.jpg" /></a>
          </div>
    </div> <!-- .loginContentBottomContainer End -->