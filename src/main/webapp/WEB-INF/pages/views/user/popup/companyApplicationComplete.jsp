<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body>
  <div id="companyWrap">
    <div class="companyHeaderGraphicContainer">
      <div class="comapanyHeaderGraphicBgBox">
        <div class="companyHeaderGraphicBox">
          <div class="companyHeaderGraphicLogo">
            <span>입사지원 완료</span>
          </div>
          <div class="companyHeaderGraphicClose">
            <a href="#" onClick="window.close();">
              <img src="${contextPath }/resources/images/itr_popup_close.png" alt="close" />
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="companyCompleteContentOneContainer">
      <div class="companyCompleteCOCOnebox01">
        <div class="companyCompleteCOCOnebox01Img">
          <img src="${contextPath }/resources/images/itr_popup_complete.png" alt="clapp complete" />    
        </div>
        <div class="companyCompleteCOCOnebox01Cont">
          <p> 
            클앱에 입사지원이 완료 되었습니다. <br />
            분야별 담당자가 확인 후, 연락드리겠습니다. <br />
            감사합니다.
          </p>      
        </div>
      </div>
    </div>
    <div class="companyContentTwoContainer">
      <div class="companyContentTwobox01">
        <div class="companyContentTwobox01ImgBox">
          <div class="companyContentTwobox01Img">
            <img src="${contextPath }/resources/images/itr_popup_mail.png" alt="mail" />
          </div>
        </div>
        <div class="companyContentTwobox01ContBox">
          <div class="companyContentTwobox01Cont">
            <span>그 외 궁금하신 내용은 이메일로 문의주세요</span>
          </div>
        </div>
        <div class="companyContentTwobox01EmailBox">
          <div class="companyContentTwobox01Email">
            <span><a href="mailto:recruit@clapp.co.kr">recruit@clapp.co.kr</a></span>
          </div>
        </div>
      </div>
    </div>
    <div class="companyCompleteContentThreeContainer">
      <div class="companyCompleteCTCThreebox01">
        <a href="#" onClick="window.close();">
          <div class="companyCompleteCTCThreebox01Btn">
            <img src="${contextPath }/resources/images/itr_popup_btn_close.png" alt="닫기" />
            <span>닫기</span>
          </div>
        </a>
      </div>
    </div>
  </div>
</body>
<script>
 var formCheck = function(){
    if(!$("input[name=userName]").val()){
      $("input[name=userName]").focus();
      alert("이름을 입력해 주세요.");
      return false;
    }
      var u_email = $("input[name=userEmail]").val();
      // 정규식 - 이메일 유효성 검사
      var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      if(!$("input[name=userEmail]").val()) {
          alert('이메일 주소를 입력해 주세요');
          $("input[name=userEmail]").focus();
          return false;
      } else {
          if(!regEmail.test($("input[name=userEmail]").val())) {
              alert('이메일 주소가 유효하지 않습니다');
              $("input[name=userEmail]").focus();
              return false;
          }
      }
    if(!$("input[name=phoneNumber]").val()){
      $("inpu[name=phoneNumber]").focus();
      alert("회신 받을 연락처를 입력해 주세요.");
      return false;
    }
    if($("select[name=applicationField] > option:selected").val() == '0'){
       $("[name=applicationField]").focus();
       alert("지원분야를 선택해 주세요.");
       return false;
    }
    $(".submit").click();
  }; 
  $(function(){
	  $(".submit").click(function(){
	    var userName = $("input[name=userName]").val();
	    var userId = $("input[name=userEmail]").val();
	    var userCellPhoneNumber = $("input[name=phoneNumber]").val();
	    var userJobType = $("select[name=applicationField]").val();
	    
	    $.ajax({
	        url : contextPath +'/introduction/rest/insertCompanyApplication',
	        type : 'post',
	        data : { userName : userName , userId : userId, userCellPhoneNumber : userCellPhoneNumber, userJobType : userJobType},
	        dataType : 'json', 
	        success: function (result) {
	          alert(result.resultMSG);
	          if (result.resultCode == 'success') {
	              location.href = "/user"; 
	              }
	            },
	            fail : function() {
	              alert('error');
	          }
	      });
	  });
  });
</script>