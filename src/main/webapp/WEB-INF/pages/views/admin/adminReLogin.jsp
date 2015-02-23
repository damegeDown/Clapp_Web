<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
$(function() {
  $(".id").watermark("아이디", {useNative: false});
  $(".password").watermark("비밀번호", {useNative: false});
  $(".reason").watermark("사유", {useNative: false});
  $(".loginBtn").click(function() {
    var adminId = $("input[name=adminId]").val();
    var adminPassword = $("input[name=adminPassword]").val();
    var logsAccessReason = $("textarea[name=logsAccessReason]").val();
    $.ajax({
      url : '/admin/doLogin' ,
      data : { adminId : adminId , adminPassword : adminPassword, logsAccessReason : logsAccessReason }, 
      type : 'post',
      dataType : 'json',
      success: function (result) {
    	  var referrer = document.referrer;	//이전페이지 주소
    	  //로그인 성공시 이전 페이지 주소가 있을시 이동 
        if (result.resultCode == 'success') {
        	var href = "";
   	    	if("${userMasterKey}" != "") {
   	    		if("${userType}" == 1) {
   	    			href = "${contextPath}/admin/member/memberModify?userMasterKey=${userMasterKey}";
   	    		} else {
   	    			href = "${contextPath}/admin/member/companyModify?userMasterKey=${userMasterKey}";
   	    		}
   			} else if(referrer && referrer.indexOf("login") == -1) {
        		href = referrer;
        	} else {
            	href = "${contextPath}/admin/main";
        	}
   	    	location.href = href;
       		//회원 페이지 접근시 로그인진행. 로그인 성공시 쿠키에 로그인 성공 값을 저장 
       		
        	if("${chkGrant}" == "Y") {
        		setCookie("memberChkGrant", "${adminLoginSession.adminId}", 1);
        	}
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
</script>
<div class="login-area">
  <div class="login-bg">
    <div class="login-box">
      <h1 class="logo"><img src="${contextPath }/resources/images/clapp_logo.png" alt="clapp"/></h1>
      <p class="title">회원정보</p>
      <div class="marT-10">개인정보 보안을 위해 관리자 비밀번호 <br/>재입력 및 열람 사유를 입력해주세요.</div>
      <div class="login-form" style="margin-top:30px !important">
        <form id="loginForm" method="post">
          <div class="marB5">
          		<input type="hidden" class="inp-w240 id watermark" name="adminId" value="${adminLoginSession.adminId}"/>
          		<input type="password" class="inp-w240 password watermark" name="adminPassword" placeholder="비밀번호"/>
          	</div>
          <div><textarea name="logsAccessReason" class="reason" placeholder="사유" style="width:218px"></textarea></div>
          <div class="btn-area"><a href="#" class="login loginBtn">회원정보 열람</a></div>
        </form>
        
      </div>
    </div>
  </div>
</div>
