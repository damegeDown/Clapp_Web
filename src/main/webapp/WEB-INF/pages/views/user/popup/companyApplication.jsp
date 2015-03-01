<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body>
  <div id="companyWrap">
  <form:form id="requritForm" method="post"  action="${contextPath }/introduction/sendRequit" commandName="formRecruitInfoEntity" enctype="multipart/form-data" onsubmit="return fileCheck()">
    <div class="companyHeaderGraphicContainer">
      <div class="comapanyHeaderGraphicBgBox">
        <div class="companyHeaderGraphicBox">
          <div class="companyHeaderGraphicLogo"> 
            <span>입사지원 하기</span>
          </div>
          <div class="companyHeaderGraphicClose">
            <a href="#" onClick="window.close();">
              <img src="${contextPath}/resources/images/itr_popup_close.png" alt="close" />
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="companyContentOneContainer">
      <div class="companyContentOnebox01">
        <div class="companyContentOnebox01TopBox"></div>
        
        <div class="companyContentOnebox01RowWrap">
          <div class="companyContentOnebox01RowBox">
            <div class="companyContentOnebox01RowTitBox">
              <span class="companyContentOnebox01RowTit">이름</span>
            </div>
            <div class="companyContentOnebox01RowContBox">
              <div class="companyContentOnebox01RowContGroup">
                <input class="companyContentOnebox01RowContInput" name="name" type="text" value="${formRecruitInfoEntity.name }"/>
                <form:errors path="name" class="font12"/>
              </div>
            </div>
          </div>
        </div>
        <div class="companyContentOnebox01RowWrap">
          <div class="companyContentOnebox01RowBox">
            <div class="companyContentOnebox01RowTitBox">
              <span class="companyContentOnebox01RowTit">이메일</span>
            </div>
            <div class="companyContentOnebox01RowContBox">
              <div class="companyContentOnebox01RowContGroup">
                <input class="companyContentOnebox01RowContInput" name="email" onblur='emailcheck(this)' type="text"  value="${formRecruitInfoEntity.email }"/>
                <form:errors path="email" class="font12"/>
              </div>
            </div>
          </div>
        </div>
        <div class="companyContentOnebox01RowWrap">
          <div class="companyContentOnebox01RowBox">
            <div class="companyContentOnebox01RowTitBox">
              <span class="companyContentOnebox01RowTit">연락처</span>
            </div>
            <div class="companyContentOnebox01RowContBox">
              <div class="companyContentOnebox01RowContGroup">
                <input class="companyContentOnebox01RowContInput" name="tel" type="text"  value="${formRecruitInfoEntity.tel }"/>
                <form:errors path="tel" class="font12"/>
              </div>
            </div>
          </div>
        </div>
        <div class="companyContentOnebox01RowWrap">
          <div class="companyContentOnebox01RowBox">
            <div class="companyContentOnebox01RowTitBox">
              <span class="companyContentOnebox01RowTit">지원분야</span>
            </div>
            <div class="companyContentOnebox01RowContSelectBox">
              <div class="companyContentOnebox01RowContSelectGroup">
                <select class="companyContentOnebox01RowContSelect" name="depart">
                  <option value="">선택</option>
                  <option value="시스템 엔지니어">시스템 엔지니어</option>
                  <option value="마케팅">마케팅</option>
                  <option value="서비스 지원">서비스 지원</option>
                </select>
                <form:errors path="depart" class="font12"/>
              </div>
            </div>
          </div>
        </div> 
        <div class="companyContentOnebox01RowWrap">
          <div class="companyContentOnebox01RowBox">
            <div class="companyContentOnebox01RowTitBox">
              <span class="companyContentOnebox01RowTit">이력서 첨부</span>
            </div>
            <div class="companyContentOnebox01RowContBox">
              <input  type="text" id="fileName" class="companyContentOnebox01RowContInputRO" readonly value="${formRecruitInfoEntity.fileName }"/>
              <input type="button" value="찾아보기" class="companyContentOnebox01RowContBtn" />
              <input type="file" name="file" class="companyContentOnebox01RowContFile" onChange="javascript: document.getElementById('fileName').value = this.value.replace('C:\\fakepath\\', '')" />
            </div> 
          </div>
        </div>
        
        <div class="companyContentOnebox01BottomBox"></div>
      </div>
    </div>
    <div class="companyContentTwoContainer">
      <div class="companyContentTwobox01">
        <div class="companyContentTwobox01ImgBox">
          <div class="companyContentTwobox01Img">
            <img src="${contextPath}/resources/images/itr_popup_mail.png" alt="mail" />
          </div>
        </div>
        <div class="companyContentTwobox01ContBox">
          <div class="companyContentTwobox01Cont">
            <span>그 외 궁금하신 내용은 우측 이메일로 문의주시기 바랍니다.</span>
          </div>
        </div>
        <div class="companyContentTwobox01EmailBox">
          <div class="companyContentTwobox01Email">
            <span><a href="mailto:recruit@clapp.co.kr">recruit@clapp.co.kr</a></span>
          </div>
        </div>
      </div>
    </div>
    <div class="companyContentThreeContainer">
      <div class="companyContentThreebox01">
        <div class="companyContentThreebox01Btn" onclick="formCheck()">
         <%-- <img src="${contextPath}/resources/images/buttons_supply2.png" onMouseOver="this.src='${contextPath}/resources/images/buttons_supply2_r.png';" onMouseOut="this.src='${contextPath}/resources/images/buttons_supply2.png';"  alt="지원하기" /> --%>
         <input type="image" src="${contextPath}/resources/images/buttons_supply2.png" onMouseOver="this.src='${contextPath}/resources/images/buttons_supply2_r.png';" onMouseOut="this.src='${contextPath}/resources/images/buttons_supply2.png';"  alt="지원하기" />
        </div>
         <%-- <div class="submitBtn" data-action="${contextPath }/introduction/rest/test" data-msg="등록" >test</div> --%>
      </div>
    </div>
    </form:form>
  </div>
</body>
<script language="javascript">
<!--

function fileCheck() {   
  var file = $("input[name=file]").val();
  var fileExt = file.substring(file.lastIndexOf('.')+1); //파일의 확장자를 구합니다.
  var bSubmitCheck = true;
   if(file != '' && fileExt.toUpperCase() != "PDF" && fileExt.toUpperCase() != "DOC" && fileExt.toUpperCase() != "DOCX"  && fileExt.toUpperCase() != "ZIP")
   {
                alert("pdf, doc, docx, zip 파일만 첨부 가능합니다.");
                /* $("input[name=fileName]").val('');
                $("input[name=file]").val(''); */
                return false;
   }
   
	return true;
}
//-->
</script>
