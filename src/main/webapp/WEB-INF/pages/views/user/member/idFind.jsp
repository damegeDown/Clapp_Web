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
	$(".idFindBtn").click(function(){
     var u_Name = $("input[name=userName]").val();
     var regName = /^[가-힣a-zA-Z]+$/;

     if(!$("input[name=userName]").val()) {
         alert('이름을 입력해 주세요.');
         $("input[name=userName]").focus();
         return false;
     } else {
         if(!regName.test($("input[name=userName]").val())) {
             alert('이름에는 숫자나 특수문자를 사용하실수 없습니다.');
             $("input[name=userName]").focus();
             return false;
         }
     }
	  if($("input[name=userName]").val().length > 21){
	      $("input[name=userName]").focus();
	      alert("이름에는 20자 이상 입력하실 수 없습니다.");
	      return false;
	    }
	  if($("select[name=cellPhone1] > option:selected").val() == '0'){
	      $("input[name=cellPhone1]").focus();
	      alert("휴대폰 앞 3자리를 선택해 주세요.");
	      return false;

	  } else if(!$("input[name=cellPhone2]").val()){
	    $("input[name=cellPhone2]").focus();
	      alert("휴대폰 번호를 입력해 주세요.");
	      return false;

	  } else if(!$("input[name=cellPhone3]").val()){
	      $("input[name=cellPhone3]").focus();
	        alert("휴대폰 번호를 입력해 주세요.");
	        return false;
	  }
		if(!$("input[name=secretword]").val()){
			alert("보안 문자를 입력해주세요.");
			$("input[name=secretword]").focus();
			return false;
		}
		var secretword = $("input[name=secretword]").val();
		var randomfield = $("#randomfield").text();
	  var userName = $("input[name=userName]").val();
	  var userCellPhoneNumber = $("input[name=userCellPhoneNumber]").val();
		if(secretword == randomfield){
     $.ajax({
       url : '/members/rest/userIdFind' ,
       type : 'post',
       data : { userName : userName , userCellPhoneNumber : userCellPhoneNumber},
       dataType : 'json', 
       success: function (result) {
         if (result.resultCode == 'success') {
         	var idFind = result.resultDATA.userId;
         	$("input[name=idFind]").val(idFind);
         	$("input[name=idFind]").slideDown();
         	
         } else if(result.resultCode == 'noResult'){
            	   alert(result.resultMSG);
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
              <span class="subJoinTitle">아이디 찾기</span>
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
            <input type="text" class="PfID" name="userName" placeholder="이름 입력"  />
            <!-- <input type="text" class="PfID" name="userCellPhoneNumber" placeholder="전화 번호 입력"  /> -->
          </div>
          <div class="sjfrTelInputGroup1">
            <select class="sjfrTelSelectMobile phoneNum" style="width: 115px; margin-left: -26px;" name="cellPhone1">
            <option value="0">-선택-</option>
            <c:forEach items="${cellPhoneCode }" var="code">
              <option value="${code.commonCode }" <c:if test="${cellPhone[0] eq code.commonCode }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
            </select>
            <span class="sjfrTelLine1"></span>
            <input type="text" class="sjfrTelInput1 phoneNum" style="width: 100px;" name="cellPhone2" value="${cellPhone[1]}" data-name="휴대폰번호" maxlength="4"/>
             <span class="sjfrTelLine2"></span>
            <input type="text" class="sjfrTelInput2 phoneNum" style="width: 100px;" name="cellPhone3" value="${cellPhone[2]}" data-name="휴대폰번호" maxlength="4"/>
            <input type="hidden" class="phoneNumComp" name="userCellPhoneNumber"/>
          </div>
          <br/>
          <input type="image" class="subMTDeviceSearch" onClick="getCaptcha();" style="left:110px; top:38px; border:1 #bcbcbc solid;" src="${contextPath }/resources/images/refresh.png"/><div class="loginPFTopLeft2"  style="background-image:url(${contextPath }/resources/images/pg_o_c_bg.png)" >
            <div align="center" id="randomfield"></div>
          </div>
          <div class="loginTopLeft3">
            <input type="text" class="loginSecretWord" name="secretword" placeholder="보안문자를 입력해 주세요" />
          </div>
          <div class="loginTopLeft3">
            <input type="text" class="loginSecretWord" name="idFind" style="display: none;" readonly="readonly"/>
          </div>
        </div>
        <div class="loginPFContentTopRight">
          <div class="idFindBtn">
            <img src="${contextPath }/resources/images/buttons_id_find.png" style="padding-top: 30px;" onmouseover="this.src='${contextPath }/resources/images/buttons_id_find_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_id_find.png';" alt="아이디 찾기" />
          <div>
        </div>
       </div>
      </div>
     </div>
    </div> <!-- .loginContentTopContainer End -->
  </body>
