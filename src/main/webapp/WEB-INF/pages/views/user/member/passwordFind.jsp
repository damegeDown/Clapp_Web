<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
function getCaptcha() {
    var chars = "0Aa1Bb2Cc3Dd4Ee5Ff6Gg7Hh8Ii9Jj0Kk1Ll2Mm3Nn4Oo5Pp6Qq7Rr8Ss9Tt0Uu1Vv2Ww3Xx4Yy5Zz";
    var string_length = 7;
    var captchastring = '';
    for (var i=0; i<string_length; i++) {
        var rnum = Math.floor(Math.random() * chars.length);
        captchastring += chars.substring(rnum,rnum+1);
    }
       var test = captchastring; 
    document.getElementById("randomfield").innerHTML = captchastring;
    
}
$(function() {
	$(".PasswordFindBtn").click(function(){
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
	    if(!$("input[name=secretword]").val()){
	        $("input[name=secretword]").focus();
	        alert("화면에 보이는 보안문자 7자리를 입력해 주세요.");
	        return false;
	    }
		var secretword = $("input[name=secretword]").val();
		var test = $("#randomfield").text();
		console.log(secretword);
	  var userId = $("input[name=userId]").val();
		console.log(userId);
		if(secretword == test){
	            $.ajax({
	              url : '/members/rest/passwordFind' ,
	              type : 'post',
	              data : { userId : userId},
	              dataType : 'json', 
	              success: function (result) {
	                alert(result.resultMSG);
	                if (result.resultCode == 'success') {
	                    location.href = "/members/passwordFindComplete"; 
	                    }
	                  },
	                  fail : function() {
	                    alert('error');
	                }
	            });
		}else{
			alert("입력하신 보안문자가 맞지 않습니다. 확인후 다시한번 입력해 주세요");
		}
	});
});
</script>
   <body onload="getCaptcha();"> 
      <div class="subJoinGnbBottomContainer">
        <div class="subJoinGnbBottomBg">
          <div class="subJoinGnbBottomBox">
            <div class="subJoinGnbBottom">
              <span class="subJoinTitle">비밀번호 찾기</span>
            </div>
            <div class="subStartBox">
              <a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
            </div>
          </div>
        </div>
    </div> <!-- .subGnbContainer End -->
    <div class="loginPFContentTopContainer">
      <div class="loginContentTopBox">
        <div class="loginContentTopLeft2">
          <div class="loginTopLeft1">
            <input type="text" class="PfID" name="userId" placeholder="아이디 (이메일 주소) 입력"  />
          </div>
          <input type="image" class="subMTDeviceSearch" onClick="getCaptcha();" style="left:110px; top:38px; border:1 #bcbcbc solid;" src="${contextPath }/resources/images/refresh.png"/><div class="loginPFTopLeft2"  style="background-image:url(${contextPath }/resources/images/pg_o_c_bg.png)" >
            <div align="center" id="randomfield"></div>
          </div>
          <div class="loginTopLeft3">
            <input type="text" class="loginSecretWord" name="secretword" placeholder="보안문자를 입력해 주세요" />
          </div>
        </div>
        <div class="loginPFContentTopRight">
          <div class="PasswordFindBtn">
            <img src="${contextPath }/resources/images/buttons_pw_find.png"  onmouseover="this.src='${contextPath }/resources/images/buttons_pw_find_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_pw_find.png';" alt="비밀번호 찾기" />
          <div>
        </div>
       </div>
      </div>
     </div>
    </div> <!-- .loginContentTopContainer End -->
  </body>
