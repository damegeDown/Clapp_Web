<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ contextPath }/resources/js/myClapp.js"></script>
<div class="subJoinGnbBottomContainer">
		<div class="subJoinGnbBottomBg">
			<div class="subJoinGnbBottomBox">
				<div class="subJoinGnbBottom">
					<span class="subJoinTitle">마이 클앱</span>
				</div>
				<div class="subStartBox">
					<a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
				</div>
			</div>
		</div>
	</div>
</div> <!-- .subGnbContainer End -->
<%@ include file="/WEB-INF/pages/views/user/myClapp/inc/incSubMenu.jsp"%>
<div class="subMyClappTitleContainer">
	<div class="subMyClappTitleBox">
		<div class="subMyClappTitleLine"></div>
		<span class="subMyClappTitle">1:1 문의</span>
		<p class="subMyClappSMessage">
			클앱 서비스 이용 중, 궁금하신 사항에 대해 문의하실 수 있습니다. 
		</p>
		<p class="subMyClappSubMessage">
			* 계산서 발행은 가상계좌로 입금처리 된 부분에 한해 가능합니다. (아래 내용란에 입금일, 입금자명, 금액을 반드시 적어주시기 바랍니다.) 
		</p>
	</div>
</div> <!-- .subMyClappTitleContainer End -->
<%-- <form:form id="memberForm" method="post" onsubmit="return inquirySubmit()" action="${contextPath }/introduction/insertSupportInquire" commandName="formInquireInfoEntity" enctype="multipart/form-data"> --%>
<form id="memberForm" method="post" enctype="multipart/form-data">
<input class="sicEmail" type="hidden" name="inquiryTitle"  data-name="제목" value="(회원)"/>
<div class="subInquiryContentContainer">
  <div class="subInquiryContentBox"> 
    <div class="subInquiryContent1">
      <div class="subInquiryContentLeft">
        <span class="subInquiryContentLeftTitle">문의 분류 선택</span>
      </div>
      <div class="subInquiryContentRight">
        <input id="tech" class="sicRadio" type="radio" name="inquiryCategory" value="1" checked <c:if test="${inquiryInfo.inquiryCategory == 1}" >checked</c:if>>
        <label class="sicLable" for="tech">기술</label>
        <input id="tech2" class="sicRadio" type="radio" name="inquiryCategory" value="2" <c:if test="${inquiryInfo.inquiryCategory == 2}">checked</c:if>>
        <label class="sicLable" for="tech2">디바이스 추가</label>
        <input id="site" class="sicRadio" type="radio" name="inquiryCategory" value="3" <c:if test="${inquiryInfo.inquiryCategory == 3}">checked</c:if>>
        <label class="sicLable" for="site">계약 · 제휴</label>
        <input id="ad" class="sicRadio" type="radio" name="inquiryCategory" value="4" <c:if test="${inquiryInfo.inquiryCategory == 4}">checked</c:if>>
        <label class="sicLable" for="ad">계산서 발행</label>
        <input id="etc" class="sicRadio" type="radio" name="inquiryCategory" value="5" <c:if test="${inquiryInfo.inquiryCategory == 5}">checked</c:if>>
        <label class="sicLable" for="etc">기타</label>
      </div>  
    </div>
    <div class="subInquiryContent2">
      <div class="subInquiryContentLeft">
        <span class="subInquiryContentLeftTitle">답변받으실 이메일 주소</span>
      </div>
      <div class="subInquiryContentRight">
      	 <c:choose>
			<c:when test="${userLoginSession.userId ne null }"> 
	        	<c:set var="email" value="${userLoginSession.userId}"/>
	        </c:when>
	        <c:otherwise> 
	        	<c:set var="email" value="${formInquireInfoEntity.inquiryEmail}"/>
	        </c:otherwise>
	     </c:choose>
        <input class="sicEmail" type="text" name="inquiryEmail" value="${email}" data-name="이메일주소"/>
        <div style="margin-top:-25px"><form:errors path="inquiryEmail" class="font12"/></div>
      </div>
    </div>
    <div class="subInquiryContent3">
      <div class="subInquiryContentLeft">
        <span class="subInquiryContentLeftTitle">이름 / 기업명</span>
      </div>
      <div class="subInquiryContentRight">
     	 <c:choose>
			<c:when test="${userLoginSession.userName ne null }">
	        	<c:set var="name" value="${userLoginSession.userName}"/>
	        </c:when>
	        <c:otherwise>
	        	<c:set var="name" value="${formInquireInfoEntity.inquiryName}"/>
	        </c:otherwise>
	     </c:choose>
        <input class="sicName" type="hidden" name="inquiryInsertName" value="${name}" data-flag="off"/>
        <input class="sicName" type="text" name="inquiryName" data-name="이름/기업명" value="${name}"/>
        <form:errors path="inquiryName" class="font12"/>
      </div>
    </div>
    <div class="subInquiryContent4">
      <div class="subInquiryContentLeft">
        <span class="subInquiryContentLeftTitle">연락처</span>
      </div>
      <div class="subInquiryContentRight"> 
      	<c:choose>
			<c:when test="${userLoginSession.userCellPhoneNumber ne null }">
	        	<c:set var="cellPhone" value="${userLoginSession.userCellPhoneNumber}"/>
	        	<c:set var="cellPhoneSplit" value="${fn:split(userLoginSession.userCellPhoneNumber,'-')}"/>
	        </c:when>
	        <c:otherwise>
	        	<c:set var="cellPhone" value="${formInquireInfoEntity.inquiryPhoneNumber}"/>
	        	<c:set var="cellPhoneSplit" value="${fn:split(formInquireInfoEntity.inquiryPhoneNumber,'-')}"/>
	        </c:otherwise>
	     </c:choose>
         <select class="phoneNum smccdmProducts" name="cellPhone1">
           <option value="0">-선택-</option> 
           <c:forEach items="${cellPhoneCode }" var="code">
             <option value="${code.commonCode }" <c:if test="${cellPhoneSplit[0] eq code.commonCode }">selected</c:if>>${code.commonName }</option>
           </c:forEach>
         </select> -  
         <input type="text" class="sicTel2 phoneNum" name="cellPhone2" value="${cellPhoneSplit[1]}" data-name="휴대폰번호" maxlength="4"/> - 
         <input type="text" class="sicTel3 phoneNum" name="cellPhone3" value="${cellPhoneSplit[2]}" data-name="휴대폰번호" maxlength="4"/>
         <input type="hidden" class="phoneNumComp" name="inquiryPhoneNumber" value="${cellPhone}" data-name="연락처"/>
         <form:errors path="inquiryPhoneNumber" class="font12"/>
    </div>
    </div>
    <div class="subInquiryContent5">
      <div class="subInquiryContentLeft">
        <span class="subInquiryContentLeftTitle">문의하실 내용</span>
      </div>
      <div class="subInquiryContentRight">
        <textarea class="sicTextArea" name="inquiryContents" data-name="문의하실 내용">${formInquireInfoEntity.inquiryContents }</textarea>
        <form:errors path="inquiryContents"  class="font12"/>
      </div>
    </div>
    <div class="subInquiryContent6">
      <div class="subInquiryContentLeft">
        <span class="subInquiryContentLeftTitle" style="margin-top:-14px;">파일 첨부</span>
        <span class="subInquiryContentLeftSub">(jpg/gif, zip, pdf 최대 1M)</span>
      </div>
      <div class="subInquiryContentRight">
        <input  type="text" id="fileName" class="sicFileInput" readonly  data-flag="off"/>
        <input type="button" value="찾아보기" class="sicFileBtn" />
        <input type="file" class="sicFile" name="file" data-flag="off" accept="image/*, .pdf, .zip"  onChange="javascript: document.getElementById('fileName').value = this.value.replace('C:\\fakepath\\', '')" />
      </div>
    </div>
  </div>
</div> <!-- .subInquiryContentContainer End -->
<br/>
<div class="subInquiryContentSubContainer">
  <div class="subInquiryContentSubBox">
    <p class="subInqP1">  
      수집하는 개인정보의 항목 및 수집방법
    </p>
    <p class="subInqPSub1">
      수집하는 개인정보의 항목 : 이메일 주소, 이름/기업명, 연락처,<br /> 
      개인정보 수집방법: 문의 및 상담하려는 이용자가 자발적으로, 구체적으로 기입할 때만 개인정보를 수집합니다.
    </p>
    <p class="subInqP1">
      개인정보 수집 및 이용목적 
    </p>
    <p class="subInqPSub1">
      수집된 개인정보를 문의 및 상담 요청에 대하여 회신을 하거나 회신을 위한 서비스 이용기록 조회를 위하여 활용합니다.
    </p>
    <p class="subInqP1">
      개인정보의 보유 및 이용기간
    </p>
    <p class="subInqPSub1">
      수집된 이메일 주소, 이름, 연락처는 관련 법령에 달리 명시되어 있지 않는 한, 문의 처리 후 즉시 파기합니다.
    </p>
  </div>
</div>
<div class="subInquiryContentAgreeContainer">
  <div class="subInquiryContentAgreeBox">
    <input id="sjaTermsAgree" class="sjaTermsAgree" type="checkbox" name="agree_term" value="term_agree" data-message="개인정보 수집 및 이용에 동의해 주세요."/>
    <label for="sjaTermsAgree" class="subJoinAgreeText">개인정보 수집 및 이용에 동의합니다.</label>
    <div style="margin-top:5px"><form:errors path="agree_term"  class="font14"/></div>
  </div>
</div>
<div class="subInquiryContentSendContainer">
  <div class="subInquiryContentSendBox"><!-- ./inquiry_complete.html -->
    <img src="${contextPath }/resources/images/buttons_send.png" onclick="inquirySubmit()"  onmouseover="this.src='${contextPath }/resources/images/buttons_send_r.png';" onMouseOut="this.src='${contextPath }/resources/images/buttons_send.png';" alt="보내기" /></a>
    <%-- <input type="image" src="${contextPath }/resources/images/buttons_send.png"data-flag="off"/> --%>
  </div>
  <div class="submitBtn"  data-action="${contextPath }/introduction/rest/insertSupportInquire/myInquiry" data-msg="등록" style="display:none"></div> 
  
</div>
</form>
<%-- </form:form>  --%>
<script>
var inquirySubmit = function() {
   var u_email = $("input[name=inquiryEmail]").val();
   // 정규식 - 이메일 유효성 검사
   var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
   if(!$("input[name=inquiryEmail]").val()) {
       alert('아이디 (이메일 주소) 를 입력해 주세요');
       $("input[name=inquiryEmail]").focus();
       return false;
   } else {
       if(!regEmail.test($("input[name=inquiryEmail]").val())) {
           alert('이메일 주소가 정상적이지 않습니다.\n확인 후 다시 한번 입력해 주세요.');
           $("input[name=inquiryEmail]").focus();
           return false;
       }
   }
     var u_Name = $("input[name=inquiryName]").val();
     var regName = /^[가-힣a-zA-Z]+$/;

     if(!$("input[name=inquiryName]").val()) {
         alert('이름/기업명을 입력해 주세요.');
         $("input[name=inquiryName]").focus();
         return false;
     } else {
         if(!regName.test($("input[name=inquiryName]").val())) {
             alert('이름에는 숫자나 특수문자를 사용하실수 없습니다.');
             $("input[name=inquiryName]").focus();
             return false;
         }
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
     if(!$("textarea[name=inquiryContents]").val()) {
         alert('문의하실 내용을 입력해 주세요.');
         $("textarea[name=inquiryContents]").focus();
         return false;
     }
 	  var chkFlag = $("[name=agree_term]").is(":checked");
	  if(!chkFlag){
	    alert("개인정보 수집 및 이용에 동의 하여야 발송 가능합니다.");
	    return false;
	  }  
	  $(".submitBtn").click();
	} 
</script>
