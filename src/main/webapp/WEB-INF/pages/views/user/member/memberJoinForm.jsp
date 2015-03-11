<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/member.js"></script>
<script>
$(function(){
    $("input[name=userMailReceptionYn]").on('click', function(){
    	 if(!$('input:checkbox[name=userMailReceptionYn]').is(":checked")){
		    if (!confirm('수신 설정 해지시에는 CLAPP에서 제공하는 \n긴급 공지 및 이벤트, 알림 정보를 받아보실 수 없습니다. \n그래도 해지하시겠습니까?')) 
		    return false;
    	 }
    }); 
    $("[name=userJobType]").change(function(){
      var radioChk = $(this, "[name=userJobType]").val();
      var valChk = "기타";
      if(radioChk == valChk){
        $(".sjfrJobsInputEtc").slideDown("slow");
      } else {
        $(".sjfrJobsInputEtc").slideUp("slow");
      }
    });
    $(".cancel").click(function(){
    if (!confirm("클앱 가입을 취소하시겠습니까?")) 
        return false;
      location.href= contextPath +'/user';
    });
    
    $(".emailChk").click(function(){
        var u_email = $(".userEmailComp").val();
        // 정규식 - 이메일 유효성 검사
        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if(!$(".userEmailComp").val()) {
            alert('아이디 (이메일 주소) 를 입력해 주세요');
            $("input[name=userEmail1]").focus();
            return false;
        } else {
            if(!regEmail.test($(".userEmailComp").val())) {
                alert('이메일 주소가 정상적이지 않습니다.\n확인 후 다시 한번 입력해 주세요.');
                $("input[name=userEmail1]").focus();
                return false;
            }
        }
      var userId = $(".userEmailComp").val();

      $.ajax({
      url : '/members/rest/searchId' ,
      type : 'post',
      data : {userId : userId},
      dataType : 'json',
      success :function(result) {
	      if (result.resultCode == 'success') {
	         alert("사용하실 수 없는 계정입니다.\n다른 이메일 주소로 가입해주세요. ");
	         $(".userEmail").val('');
	      } else {
	         alert("사용 가능한 이메일 주소입니다.");
	         $('.emailChk').data('check', true);
        }
      },
      fail : function() {
         alert('error');
      }
    })
 });
      $("input[name=userEmail1], input[name=userEmail2]").change(function(){
    	  $('.emailChk').data('check', false);
      })
   $(".comparison").click(function(){
	   var resultNum = $(".resultNum").val();
	   var inputCompare = $(".inputCompare").val();
	   if(!$(".inputCompare").val()){
		   alert("인증번호를 입력해주세요.");
		   $(".inputCompare").focus();
		   return false;
	   }
	   else if(resultNum != inputCompare){
	   alert("입력하신 인증번호가 맞지 않습니다. \n문자를 다시 확인해주세요.")
	   return false;
	   } else {
		   $('.comparison').data('check', true);
		   $('#countdown').hide();
		   alert("인증되었습니다.");
	   }
   });
   $(".send ").click(function(){
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
       var dest_phone = $("input[name=userCellPhoneNumber]").val();
       $.ajax({
         url : '/members/rest/authentication' ,
         type : 'post',
         data : { dest_phone : dest_phone , userCellPhoneNumber : dest_phone},
         dataType : 'json',
         success :function(result) {
           if (result.resultCode == 'success') {
                 			 alert("이미 클앱에 가입되어있는 휴대폰 번호 입니다. \n혹시 접속계정을 잊어버리셨다면, 로그인 페이지의 \n계정 찾기 기능을 이용해 주세요..");
                   } else {
						           var resultNum = result.resultDATA;
						           $('.resultNum').val(resultNum);
			                 alert("입력하신 휴대폰 번호로 인증번호가 발송되었습니다");
			                 $("#countdown").show();
			                 CountDownUtils.setMinute(3);
                   }
          },
          fail : function() {
          alert('error');
       }
     })
     });
   
});
var CountDownUtils = (function() {
	  $(".resultNum").val('');
	  var setMinute = function(min) {
	    var mmVal = min;
	    var ssVal = 0;
	    var cFlag = "Y";
	      setTimeOn(mmVal, ssVal, cFlag);
	  };
	  var setTimeOn = function(mmVal, ssVal, cFlag) {
	    if(cFlag == "Y"){
	          if( ssVal == 0){
	              ssVal = 59;
	              if(mmVal == 0){
	                  mmVal = 0;
	              }else{
	                  mmVal = mmVal - 1;
	              }
	          }else{ 
	              ssVal = ssVal - 1;
	          }
	          if (mmVal < 10 ) $(".min").text("0"+mmVal);
	          else $(".min").text(mmVal);
	          if (ssVal < 10 ) $(".sec").text("0"+ssVal);
	          else $(".sec").text(ssVal);
	      }
	     
	      if( cFlag=="N" || (mmVal==0 && ssVal==0) ){
	          mmVal = 0;
	          ssVal = 0;
	          $(".min").val("00");
	          $(".sec").val("00");
	          stopTime ();
	      }else{
	          setTimeout(function() {setTimeOn(mmVal, ssVal, cFlag);}, 1000);//최대 1000초
	      }    
	  };
	  stopTime = function(){
	      cFlag = "N";
	      $(".resultNum").val('');
	  };
	  return {
	    setMinute : setMinute
	  }
	})($); 

   var formCheck = function() {
	   
   var u_email = $(".userEmailComp").val();
   // 정규식 - 이메일 유효성 검사
   var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
   if(!$(".userEmailComp").val()) {
       alert('아이디 (이메일 주소) 를 입력해 주세요');
       $("input[name=userEmail1]").focus();
       return false;
   } else {
       if(!regEmail.test($(".userEmailComp").val())) {
           alert('이메일 주소가 정상적이지 않습니다.\n확인 후 다시 한번 입력해 주세요.');
           $("input[name=userEmail1]").focus();
           return false;
       }
   }
   if(!$('.emailChk').data('check')) {
       alert('아이디 (이메일 주소) 를 중복 확인 해주세요.');
       return false;
     }
  if(!$("input[name=userPassword]").val()) {
      $("input[name=userPassword]").focus();
      alert("비밀번호를 입력해 주세요.");
      return false;
    } else if($("input[name=userPassword]").val().length < 6){
      $("input[name=userPassword]").focus();
      alert("비밀번호는 6자리 이상으로 입력해 주세요.");
      return false;
    }

  if(!$("input[name=passconfirm]").val()) {
      $("input[name=passconfirm]").focus();
      alert("비밀번호 확인이 되지 않았습니다. 비밀번호를 입력해 주세요.");
      return false;
  }

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
  if(!$('.comparison').data('check')) {
      alert('휴대폰 번호를 인증 받아 주세요.');
      return false;
    }
  if(!$("[name=userAgeGroup]").is(":checked")){
      $("[name=userAgeGroup]").focus();
      alert("연령대를 선택해 주세요. (가입 통계로 이용)");
      return false;
  }

  if($("select[name=userAreaType] > option:selected").val() == '0'){
      $("[name=userAreaType]").focus();
      alert("지역을 선택해 주세요. (가입 통계로 이용)");
      return false;

  } else if($("select[name=userArea] > option:selected").val() == '0'){
      $("[name=userArea]").focus();
      alert("지역을 선택해 주세요. (가입 통계로 이용)");
      return false;

  } else if($("select[name=userAreaDetail] > option:selected").val() == '0'){
      $("[name=userAreaDetail]").focus();
      alert("상세지역을 선택해 주세요. (가입 통계로 이용)");
      return false;
  }
  if(!$("[name=userJobType]").is(":checked")){
      $("[name=userJobType]").focus();
      alert("직종을 선택해 주세요. (가입 통계로 이용)");
      return false;
  }

  var resultNum = $(".resultNum").val();
  var inputCompare = $(".inputCompare").val();

  if(resultNum != inputCompare){
  alert("입력하신 인증번호가 맞지 않습니다. \n문자를 다시 확인해주세요.")
  return false;
  }
  
/*    var test = $("input[name=inputCompare]").data("id");
   alert(test); */
  
  $(".submitBtn").click();
}

var PasswordUtils = (function() {
  var checkPassword = function(){
    var userPassword = $("input[name=userPassword]").val();
    var passconfirm = $("input[name=passconfirm]").val();
    if(userPassword != passconfirm) {
      $("input[name=passconfirm]").val('');
      alert("입력하신 비밀번호가 일치하지 않습니다. \n확인 후 다시 한번 입력해 주세요.");
      return false;
    }
  };
  return  {
    checkPassword : checkPassword
  }
})();

var SelectUtils = (function() {
    var selectInput = function(){
    $(".sjfrIdInput2").attr("readonly", false);
      if($(".sjfrIdDomainSelect").val()){
      $(".sjfrIdInput2").attr("readonly", true);
      $(".sjfrIdInput2").val($(".sjfrIdDomainSelect").val()).change();
      }else{
    	  $(".sjfrIdInput2").attr("readonly", false).val('').focus();
      }
    };
    return  {
      selectInput : selectInput
    }
  })();
</script>
<div class= "sub-container">
  <form id="memberForm">
  <div>
    <div class="subJoinGnbBottomContainer">
      <div class="subJoinGnbBottomBg">
        <div class="subJoinGnbBottomBox">
          <div class="subJoinGnbBottom">
            <span class="subJoinTitle">클앱 가입</span>
          </div>
          <div class="subStartBox">
            <a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
          </div>
        </div>
      </div>
    </div>
  </div> <!-- .subGnbContainer End -->
  <div class="subJoinFlowContainer">
    <div class="subJoinFlowBox3">
      <div class="subJoinFlowStepBox">
        <span class="subJoinStep1">가입 유형</span>
        <span class="subJoinStep2">약관 동의</span>
        <span class="subJoinStep3 sjsActive3">정보 입력</span>
        <span class="subJoinStep4">가입 완료</span>
      </div>
    </div>
  </div> <!-- .subJoinFlowContainer End -->
  <div class="subJoinFormIndividual">
    <div class="subJoinFormRequiredSection">
      <div class="subJoinFormRequiredTitleBox">
        <div class="subJoinFormRequiredTitleLine"></div>
        <h3 class="subJoinFormRequiredTitle">필수 항목 </h3>
      </div>
      <div class="subJoinFormRequiredIdField">
        <div class="sjfrIdLabelBox">
          <span class="sjfrIdLabel">아이디 (이메일 형식)</span>
        </div>
        <div class="sjfrIdInputbox">
          <div class="sjfrIdInputGroup">
            <input class="sjfrIdInput1 userEmail" type="text" name="userEmail1" data-name="아이디 (이메일 주소)" data-format="email_pre" value="${userEmail[0]}"/>
             <span class="sjfrIdAt">@</span>
             <input class="sjfrIdInput2 userEmail" type="text" name="userEmail2" data-name="이메일" data-format="email_end" value="${userEmail[1]}"/>
             <input type="hidden" class="userEmailComp" name="userId" data-flag="off"/>
             <input type="hidden" name="userType" value="1"/>
          </div>
        </div>
        <div class="sjfrIdLine"></div>
        <div class="sjfrIdDomainSelectBox">
            <select class="sjfrIdDomainSelect" onchange="SelectUtils.selectInput()" data-flag="off">
            <option value="">직접 입력</option>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="outlook.com">outlook.com</option>
            <option value="me.com">me.com</option>
            <option value="icloud.com">icloud.com</option>
            <option value="yahoo.com">yahoo.com</option>
          </select>
        </div>
        <input type="button" style="float:left; width: -10px" class="authenticationBtn2 emailChk" value="중복확인" data-check="false">
      </div>
      <div class="subJoinFormRequiredPassField">
        <div class="sjfrPassLabelBox">
          <span class="sjfrPassLabel">비밀번호</span>
        </div>
        <div class="sjfrPassInputbox">
          <div class="sjfrPassInputGroup">
            <input class="sjfrPassInput" type="password" name="userPassword" placeholder="영문, 숫자 또는 영/숫자 조합 6자 이상" data-name="비밀번호" data-format="engnum" data-minlength="6"/>
          </div>
        </div>
      </div>
       <div class="subJoinFormRequiredPassConfirmField">
        <div class="sjfrPassLabelBox">
          <span class="sjfrPassLabel">비밀번호 확인</span>
        </div>
        <div class="sjfrPassInputbox">
          <div class="sjfrPassInputGroup">
            <input class="sjfrPassInput" type="password" name="passconfirm" data-name="비밀번호 확인이 되지 않았습니다. 비밀번호" onchange="PasswordUtils.checkPassword()" />
          </div>
        </div>
      </div>
      <div class="subJoinFormRequiredNameField">
        <div class="sjfrNameLabelBox">
          <span class="sjfrNameLabel">이름</span>
        </div>
        <div class="sjfrNameInputbox">
          <div class="sjfrNameInputGroup">
            <input class="sjfrNameInput" type="text" name="userName" data-name="이름" data-format="han"/>
          </div>
        </div>
      </div>
      <div class="subJoinFormRequiredTelField">
        <div class="sjfrTelLabelBox">
          <span class="sjfrTelLabel">연락처 (휴대폰 필수)</span>
        </div>
        <div class="sjfrTelInputBox1">
          <div class="sjfrTelInputGroup1">
            <select class="sjfrTelSelectMobile phoneNum" name="cellPhone1">
            <option value="0">-선택-</option>
            <c:forEach items="${cellPhoneCode }" var="code">
              <option value="${code.commonCode }" <c:if test="${cellPhone[0] eq code.commonCode }">selected</c:if>>${code.commonName }</option>
            </c:forEach>
            </select>
            <span class="sjfrTelLine1"></span>
            <input type="text" class="sjfrTelInput1 phoneNum" name="cellPhone2" value="${cellPhone[1]}" data-name="휴대폰번호" maxlength="4"/>
             <span class="sjfrTelLine2"></span>
            <input type="text" class="sjfrTelInput2 phoneNum" name="cellPhone3" value="${cellPhone[2]}" data-name="휴대폰번호" maxlength="4"/>
            <input type="hidden" class="phoneNumComp" name="userCellPhoneNumber"/>
            <!-- <div class="authBtn authentication">인증받기</div> -->
             <p class="smisCorpMessage" style="width: 700px; line-height:1.3em; margin-top: -3px;">
                ※ 테스팅 서비스를 이용하실 때, 계정별 비정상적인 접근을 방지하기 위한 인증수단으로 이용 됩니다.<br/>
                  ( 해외 거주자의 경우, 클앱 고객지원 1661-7083 으로 문의 )
             </p>
          </div>
        </div>
        <div class="sjfrIdLine"></div>
        <input type="button" class="authenticationBtn send" value="인증번호 전송" data-check="false"/>
      </div>
      <div class="subJoinFormRequiredNameField">
        <div class="sjfrNameLabelBox">
          <span class="sjfrNameLabel">인증번호 입력</span>
          <input type="hidden" class="resultNum" data-flag="off"/>
        </div>
        <div class="sjfrNameInputbox">
          <div class="sjfrNameInputGroup">
            <input class="sjfrNameInput inputCompare" type="text" name="inputCompare"/>
              <p class="smisCorpMessage" id="countdown" style="width: 700px; line-height:1.3em; margin-top: -3px; color: blue">3분 이내 입력 ( 남은시간 : <span class="min">3</span>분 : <span class="sec">00</span>초 )</p>
          </div>
        </div>
        <input type="button" class="authenticationBtn comparison" value="인증받기" data-check="false"/>
      </div>
    </div> <!-- .subJoinRequiredSection End -->
    <div class="clear"></div>
     <div class="subJoinFormOptionSection">
      <div class="subJoinFormOptionTitleBox">
        <div class="subJoinFormOptionTitleLine"></div>
        <h3 class="subJoinFormOptionTitle">선택 항목</h3>
      </div>
      <div class="subJoinFormOptionAgeField">
        <div class="sjfrAgeLabelBox">
          <span class="sjfrAgeLabel">연령대</span>
        </div>
        <div class="sjfrAgeInputBox1">
          <div class="sjfrAgeInputGroup1">
            <input id="a10" class="sjfrAgeRadio" type="radio" name="userAgeGroup" value="1">
            <label class="ageLable" for="a10">10대(~19세)</label>
            <input id="a20" class="sjfrAgeRadio" type="radio" name="userAgeGroup" value="2">
            <label class="ageLable" for="a20">20대(20~29세)</label>
            <input id="a30" class="sjfrAgeRadio" type="radio" name="userAgeGroup" value="3">
            <label class="ageLable" for="a30">30대(30~39세)</label>
          </div>
          <div class="sjfrAgeInputGroup2">
            <input id="a40" class="sjfrAgeRadio" type="radio" name="userAgeGroup" value="4">
            <label class="ageLable" for="a40">40대(40~49세)</label>
            <input id="a50" class="sjfrAgeRadio" type="radio" name="userAgeGroup" value="5">
            <label class="ageLable" for="a50">50대(50세~)</label>
          </div>
        </div>
      </div>
      <div class="subJoinFormOptionLocalField">
        <div class="sjfrLocalLabelBox">
          <span class="sjfrLocalLabel">지역</span>
        </div>
        <div class="sjfrLocalInputBox1">
          <div class="floatL marR-5 marL-25">
          <select class="sjfrLocalSelect width-100" name="userAreaType" data-type="AREA" data-wrap="userArea">
            <option value="0">-선택-</option>
            <option value="1" data-val="1">국내</option>
            <option value="2" data-val="2">해외</option>
          </select>
          </div> 
          <div class="floatL marR-5 userArea"></div>
          <div class="floatL marR-5 userAreaDetail"></div>
        </div>
      </div>
      <div class="subJoinFormOptionJobsField">
        <div class="sjfrJobsLabelBox">
          <span class="sjfrJobsLabel">직종</span>
        </div>
        <div class="sjfrJobsInputBox1">
          <div class="sjfrJobsInputGroup1">
            <input id="a" class="sjfrJobsRadio" type="radio" name="userJobType" value="QA•테스터•검증" >
            <label class="jobsLable" for="a">QA•테스터•검증</label>
            <input id="b" class="sjfrJobsRadio" type="radio" name="userJobType" value="웹/모바일 기획•마케팅•PM">
            <label class="jobsLable" for="b">웹/모바일 기획•마케팅•PM</label>
            <input id="c" class="sjfrJobsRadio" type="radio" name="userJobType" value="웹/모바일 개발">
            <label class="jobsLable" for="c">웹/모바일 개발</label>
          </div>
          <div class="sjfrJobsInputGroup2">
            <input id="d" class="sjfrJobsRadio" type="radio" name="userJobType" value="응용/시스템 개발">
            <label class="jobsLable" for="d">응용/시스템 개발</label>
            <input id="e" class="sjfrJobsRadio" type="radio" name="userJobType" value="웹/모바일 디자인•퍼블리싱">
            <label class="jobsLable" for="e">웹/모바일 디자인•퍼블리싱</label>
            <input id="f" class="sjfrJobsRadio" type="radio" name="userJobType" value="기타">
            <label class="jobsLable" for="f">기타</label>
          </div>
          <div class="sjfrJobsInputGroup3">
            <input class="sjfrJobsInputEtc" type="text" name="userJobText" placeholder="기타 직종 입력" data-flag="off"  style="display:none;"/>
          </div>
        </div>
      </div>
      <div class="subJoinFormOptionNoticeField">
        <div class="sjfrNoticeLabelBox">
          <input id="sjfrnotice" class="sjfrnotice userMailReceptionYn" type="checkbox" name="userMailReceptionYn" value="Y" checked />
          <label for="sjfrnotice" class="sjfrNoticeLabel">공지/이벤트/알림 메일 수신</label>
        </div>
      </div>
    </div>
  </div> <!-- .subJoinFormIndividual End -->
  <div class="subJoinTermsPrivacyNextContainer">
    <div class="subJoinTermsPrivacyNextButtonBox2">
      <img class="onSubmitBtn" onclick="formCheck()" src="${contextPath }/resources/images/buttons_join.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_join_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_join.png';" alt="가입하기" />
      <div style="display:none" class="submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="가입" data-id="false"></div>
      <div class="cancel" style="cursor: pointer;">
        <img src="${contextPath }/resources/images/buttons_cancel.png" onMouseOver="this.src='${contextPath }/resources/images/buttons_cancel_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_cancel.png';" alt="취소하기" />
      </div>
    </div>
  </div>
  </form>
 </div>

