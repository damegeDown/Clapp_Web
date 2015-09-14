<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ contextPath }/resources/js/myClapp.js"></script>
<%--<script>--%>

    <%--var formCheck = function() {--%>

        <%--$(".submitBtn").click();--%>
    <%--}--%>
<%--</script>--%>

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
<div class="subMyclappTReqContainer">
    <div class="subMyclappTReqBg">
        <div class="subMyclappTReqContBg">
            <div class="subMyclappTReqContTitleBox">
                <div class="subMyclappTReqTitleTxt1"><span>클앱 회원을 위한</span></div>
                <div class="subMyclappTReqContTitleBox2">
                    <div class="subMyclappTReqTitleTxt2">
                        <span>테스트 대행 신청</span>
                    </div>
                </div>
                <div class="subMyclappTReqTitleTxt3">
                                	<span>신청만 하시면 클앱이 가지고 있는 디바이스에서 무료로 <br>
                                    	  앱설치 및 모바일웹 해상도 테스트를 대행해 드립니다.</span>
                </div>
            </div>
        </div>

    </div>

</div>
<form id="memberForm" method="post" enctype="multipart/form-data">
    <div class="subTReqContentThreeContainer">
        <div class="subTReqContentTitlebox">
            <div class="subTReqContentTitle">
                <span>신청서 작성</span>
            </div>
        </div>
        <div class="subTReqContentDesc">
            <div class="subTReqContentDescTitle">
						<span>클앱의 회원이시라면 누구나 무료로 앱 설치 테스트 및 모바일 웹 해상도 테스트 대행 신청을 하실 수 있습니다. <br>
                        	  신청하신 테스트 결과는 신청서에 작성된 이메일 주소로  업무일 기준 2일 이내로 발송됩니다.<br>
                              (무료 회원 – 지정 디바이스 10대 / 유료회원 – 디바이스 약 60대)</span>
            </div>
            <a href="${contextPath }/product/popup/myclappRequestPopup" onClick="itrPopup(this.href,'pop1');return false;">
                <div class="MyclappTReqContBtn">
                    <%--<img src="${contextPath }/resources/images/myclapp_request_btn.png" alt="" />--%>
                    <img src="${contextPath }/resources/images/myclapp_request_btn.png" alt="지정 디바이스 보기" onMouseOver="this.src='${contextPath }/resources/images/myclapp_request_btn_r.png';" onMouseOut="this.src='${contextPath }/resources/images/myclapp_request_btn.png';" />
                </div>
            </a>
        </div>
    </div>



    <div class="subTReqIOCEmailWrap">
        <div class="subTReqVOCEmailBox">
            <div class="subTReqVOCEmailTitBox">
                <div class="subTReqVOCEmailTit">
							<span>
								연락받으실 이메일 주소
							</span>
                </div>
            </div><!-- .subTReqVOCEmailTitBox End-->
            <div class="subTReqVOCEmailContBox">
                <div class="subTReqVOCEmailCont">
                    <c:choose>
                        <c:when test="${userLoginSession.userId ne null }">
                            <c:set var="email" value="${userLoginSession.userId}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="email" value="${formInquireInfoEntity.applyEmail}"/>
                        </c:otherwise>
                    </c:choose>
                    <input class="sicEmail" type="text" name="applyEmail" value="${email}" data-name="이메일주소"/>
                </div>
            </div><!-- .subTReqVOCEmailBox End-->
        </div><!-- .subTReqVOCViewTitleBox End -->
    </div><!-- .subTReqIOCEmailWrap End -->

    <div class="subTReqIOCNameWrap">
        <div class="subTReqVOCNameBox">
            <div class="subTReqVOCNameTitBox">
                <div class="subTReqVOCNameTit">
							<span>
								이름 / 기업명
							</span>
                </div>
            </div><!-- .subTReqVOCNameTitBox End-->
            <div class="subTReqVOCNameContBox">
                <div class="subTReqVOCNameCont">
                    <c:choose>
                        <c:when test="${userLoginSession.userName ne null }">
                            <c:set var="name" value="${userLoginSession.userName}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="name" value="${formInquireInfoEntity.applyName}"/>
                        </c:otherwise>
                    </c:choose>
                    <input class="sicName" type="hidden" name="applyInsertName" value="${name}" data-flag="off"/>
                    <input class="sicName" type="text" name="applyName" data-name="이름/기업명" value="${name}"/>
                    <form:errors path="applyName" class="font12"/>
                </div>
            </div><!-- .subTReqVOCNameContBox End-->
        </div><!-- .subTReqVOCNameBox End -->
    </div><!-- .subTReqIOCNameWrap End -->

    <div class="subTReqIOCTelWrap">
        <div class="subTReqVOCTelBox">
            <div class="subTReqVOCTelTitBox">
                <div class="subTReqVOCTelTit">
							<span>
								연락처
							</span>
                </div>
            </div><!-- .subTReqVOCTelTitBox End-->
            <div class="subTReqVOCTelContBox">
                <div class="subTReqVOCTelCont">
                    <c:choose>
                        <c:when test="${userLoginSession.userCellPhoneNumber ne null }">
                            <c:set var="cellPhone" value="${userLoginSession.userCellPhoneNumber}"/>
                            <c:set var="cellPhoneSplit" value="${fn:split(userLoginSession.userCellPhoneNumber,'-')}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="cellPhone" value="${formInquireInfoEntity.applyPhoneNumber}"/>
                            <c:set var="cellPhoneSplit" value="${fn:split(formInquireInfoEntity.applyPhoneNumber,'-')}"/>
                        </c:otherwise>
                    </c:choose>
                    <%--<select class="phoneNum smccdmProducts" name="cellPhone1">--%>
                    <%--<option value="0">-선택-</option>--%>
                    <%--<c:forEach items="${cellPhoneCode }" var="code">--%>
                    <%--<option value="${code.commonCode }" <c:if test="${cellPhoneSplit[0] eq code.commonCode }">selected</c:if>>${code.commonName }</option>--%>
                    <%--</c:forEach>--%>
                    <%--</select> ---%>
                    <%--<input type="text" class="sicTel2 phoneNum" name="cellPhone2" value="${cellPhoneSplit[1]}" data-name="휴대폰번호" maxlength="4"/> ---%>
                    <%--<input type="text" class="sicTel3 phoneNum" name="cellPhone3" value="${cellPhoneSplit[2]}" data-name="휴대폰번호" maxlength="4"/>--%>
                    <input type="hidden" class="phoneNumComp" name="applyPhoneNumber" value="${cellPhone}" data-name="연락처"/>

                    <input class="MysicTel1" type="text" name="cellPhone1" value ="${cellPhoneSplit[0]}"/>
                    <span class="MysicTelDash"></span>
                    <input class="MysicTel2" type="text" name="cellPhone2" value="${cellPhoneSplit[1]}" />
                    <span class="MysicTelDash"></span>
                    <input class="MysicTel3" type="text" name="cellPhone3" value="${cellPhoneSplit[2]}" />

                    <form:errors path="applyPhoneNumber" class="font12"/>
                </div>
            </div><!-- .subTReqVOCTelContBox End-->
        </div><!-- .subTReqVOCTelBox End -->
    </div><!-- .subTReqIOCTelWrap End -->




    <div class="subTReqIOCContWrap">
        <div class="subTReqVOCContBox">
            <div class="subTReqVOCContTitBox">
                <div class="subTReqVOCContTit">
							<span>
								의뢰 테스트
							</span>
                </div>
            </div><!-- .subTReqVOCContTitBox End-->

            <div class="subTReqVOCFileContBox">
                <div class="subTReqVOCFileCont">
                    <select class="subTReqSelect" name="applyFormSelect">
                        <option value="test1">앱설치 테스트</option>
                        <option value="test2">모바일 웹 해상도 테스트</option>
                    </select>
                </div>
            </div><!-- .subTReqVOCFileContBox End-->
        </div><!-- .subTReqVOCContBox End -->
    </div><!-- .subTReqIOCContWrap End -->


    <div class="subTReqIOCContWrap2">
        <div class="subTReqVOCContBox2">
            <div class="subTReqVOCContTitBox2">
                <div class="subTReqVOCContTit">
                </div>
            </div><!-- .subTReqVOCContTitBox End-->

            <div class="subTReqVOCFileContBox">
                <div class="subTReqVOCFileInput">
                    <input  type="text" id="fileName" name="fileName" class="MysicFileInput2" readonly data-flag="off" />
                    <input type="button" value="찾아보기" class="sicFileBtn2" />
                    <input type="file" name="file" class="sicFile2" data-flag="off" onChange="javascript: document.getElementById('fileName').value = this.value.replace('C:\\fakepath\\', '')" />
                </div>
                <div class="subTReqVOCFileInput2"> <p>(테스트 할 APK 파일을 등록해 주시기 바랍니다.)</p>
                </div>
            </div><!-- .subTReqVOCFileContBox End-->
        </div><!-- .subTReqVOCContBox2 End -->
    </div><!-- .subTReqIOCContWrap2 End -->

    <div class="subTReqIOCContWrap3">
        <div class="subTReqVOCContBox3">
            <div class="subTReqVOCContTitBox3">
                <div class="subTReqVOCContTit3">
                </div>
            </div><!-- .subTReqVOCContTitBox End-->

            <div class="subTReqVOCFileContBox3">
                <div class="subTRFCB1">
                    <div class="subTReqVOCFileInput4_1"><p>http://</p></div>
                </div>
                <div class="subTRFCB2">
                    <div class="subTReqVOCFileInput3"><input  type="text" id="TESTreq3" name="applyUrl" class="MysicFileInput3" />

                    </div>
                </div>
                <div class="subTRFCB3">
                    <div class="subTReqVOCFileInput4_2"> <p>(테스트 할 모바일 웹 주소를 입력해 주세요.)</p>
                    </div>
                </div>
            </div><!-- .subTReqVOCFileContBox End-->
        </div><!-- .subTReqVOCContBox2 End -->
    </div><!-- .subTReqIOCContWrap2 End -->

    <div class="subTReqIOCFileExplainWrap">
        <div class="subTReqVOCFileExplainBox">
            <div class="subTReqVOCFileExplainTitBox">
                <div class="subTReqVOCFileExplainTit">
							<span>
								파일 설명
							</span>
                </div>
            </div><!-- .subTReqVOCFileExplainTitBox End-->
            <div class="subTReqVOCFileExplainContBox">
                <div class="subTReqVOCFileExplainCont">
                    <input class="FileExplain" name="fileMemo" type="text" placeholder="20자 이내로 작성" />
                </div>
            </div><!-- .subTReqVOCFileExplainContBox End-->
        </div><!-- .subTReqVOCFileExplainBox End -->
    </div><!-- .subTReqIOCFileExplainWrap End -->

    <div class="subTReqInquireTwoContainer">
        <div class="subTReqITCOneBox">
            <div class="subTReqITCOneContBox">
                <div class="subTReqITCOneCont01">
                    <span>수집하는 개인정보의 항목 및 수집방법</span>
                    <p>
                        수집하는 개인정보의 항목 : 이메일 주소, 이름/기업명, 연락처,<br /> 개인정보 수집방법: 문의 및 상담하려는 이용자가 자발적으로, 구체적으로 기입할 때만 개인정보를 수집합니다.
                    </p>
                </div>
                <div class="subTReqITCOneCont02">
                    <span>개인정보 수집 및 이용목적 </span>
                    <p>
                        수집된 개인정보를 문의 및 상담 요청에 대하여 회신을 하거나 회신을 위한 서비스 이용기록 조희를 위하여 활용합니다.
                    </p>
                </div>
                <div class="subTReqITCOneCont03">
                    <span>개인정보의 보유 및 이용기간 </span>
                    <p>
                        수집된 이메일 주소, 이름, 연락처는 관련 법령에 달리 명시되어 있지 않는 한, 문의 처리 후 즉시 파기
                    </p>
                </div>
            </div><!-- .subTReqITCOneContBox End-->
        </div><!-- .subTReqITCOneBox End-->

        <div class="subTReqITCTwoBox">
            <div class="subTReqITCTwoContBox">
                <div class="subTReqITCTwoCont">
                    <div class="subInquiryContentAgreeBox">
                        <input id="sjaTermsAgree" class="sjaTermsAgree" type="checkbox" name="agree_term" value="term_agree" data-message="개인정보 수집 및 이용에 동의해 주세요."/>
                        <label for="sjaTermsAgree" class="subJoinAgreeText">개인정보 수집 및 이용에 동의합니다.</label>
                        <div style="margin-top:5px"><form:errors path="agree_term"  class="font14"/></div>
                    </div>
                </div><!-- .subTReqITCTwoCont End-->
            </div><!-- .subTReqITCTwoContBox End-->
        </div><!-- .subTReqITCTwoBox End-->
    </div><!-- .subTReqInquireTwoContainer End -->

    <div class="subTReqInquireThreeContainer">
        <div class="subTReqIHCOneBox">
            <div class="subTReqIHCOneContBox">
                <a href="javascript:void(0);" onclick="applySubmit()">
                    <div class="subTReqIHCOneContBtn">
                        <%--<img src="${contextPath }/resources/images/itr_support_send.png" alt="" />--%>
                        <img src="${contextPath }/resources/images/itr_support_send.png" alt="신청" onMouseOver="this.src='${contextPath }/resources/images/itr_support_send_r.png';" onMouseOut="this.src='${contextPath }/resources/images/itr_support_send.png';" />
                        <span>신청</span>

                    </div>
                </a>
                <div style="display:none" class="submitBtn"   data-action="${contextPath}/myClapp/rest/insertApplyForm" data-msg="등록" ></div>
            </div><!-- .subTReqITCOneContBox End-->
        </div><!-- .subTReqIHCOneBox End-->
    </div><!-- .subTReqInquireThreeContainer End-->
</form>
<script type="text/javascript">

    $(document).ready(function(){
        /*
         select box 의 option 들중 첫 번째 option 선택
         */
        $('.subTReqSelect').children('option')
                .filter(':first-child').attr('selected',true);

        /*
         test1 div 를 표시
         */
        $('.subTReqIOCContWrap2').prop('classList').add('active-div');

        /*
         select box 의 선택 option 이 바뀔때 마다 test1 div 와 test2 div 의 display 변경
         */
        $('.subTReqSelect').on('change',function(){
            var optValue = $(this).children('option').filter(':selected').val();
            if(optValue =='test2'){
                $('.subTReqIOCContWrap3').prop('classList').add('active-div');
                $('.subTReqIOCContWrap2').prop('classList').remove('active-div');
            }else if(optValue =='test1'){
                $('.subTReqIOCContWrap2').prop('classList').add('active-div');
                $('.subTReqIOCContWrap3').prop('classList').remove('active-div');
            }else{
                $('.subTReqIOCContWrap2').prop('classList').remove('active-div');
                $('.subTReqIOCContWrap3').prop('classList').remove('active-div');
            }


        })
    })

    function itrPopup(linkUrl,num){
        console.log(linkUrl);
//        if(num == "pop1"){
//            window.open(linkUrl,  "startpop", "width=720, height=850, scrollbars=no, resizable=no ,status=no ,toolbar=no");
//
//        }
        if(num =="pop1" ) {
            window.open(linkUrl,  "startpop", "width=500, height=500, scrollbars=no, resizable=no ,status=no ,toolbar=no");
        }
    }

    var applySubmit = function() {
        var u_email = $("input[name=applyEmail]").val();
        // 정규식 - 이메일 유효성 검사
        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if(!$("input[name=applyEmail]").val()) {
            alert('아이디 (이메일 주소) 를 입력해 주세요');
            $("input[name=applyEmail]").focus();
            return false;
        } else {
            if(!regEmail.test($("input[name=applyEmail]").val())) {
                alert('이메일 주소가 정상적이지 않습니다.\n확인 후 다시 한번 입력해 주세요.');
                $("input[name=applyEmail]").focus();
                return false;
            }
        }
        var u_Name = $("input[name=applyName]").val();
        var regName = /^[가-힣a-zA-Z]+$/;

        if(!$("input[name=applyName]").val()) {
            alert('이름/기업명을 입력해 주세요.');
            $("input[name=applyName]").focus();
            return false;
        } else {
            if(!regName.test($("input[name=applyName]").val())) {
                alert('이름에는 숫자나 특수문자를 사용하실수 없습니다.');
                $("input[name=applyName]").focus();
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
        if(!$("input[name=fileMemo]").val()) {
            alert('파일 설명을 입력해 주세요.');
            $("input[name=fileMemo]").focus();
            return false;
        }
        // 확장자 체크
        var fileValue = $('.sicFile').val();
        if(fileValue){
            var re = /(?:\.([^.]+))?$/;
            var extension = re.exec(fileValue)[1];
            var extensionArray = ['jpg', 'jpeg', 'gif', 'pdf', 'zip'];
            if (fileValue != null && $.inArray(extension, extensionArray) < 0) {
                alert('jpg, gif, pdf, zip 파일만 첨부 가능합니다.');
                return false;
            }
        }


        var chkFlag = $("[name=agree_term]").is(":checked");
        if(!chkFlag){
            alert("개인정보 수집 및 이용에 동의 하여야 발송 가능합니다.");
            return false;
        }
        if(!$('#TESTreq3').val()){
            $('#TESTreq3').val("NULL")
        }
        $(".submitBtn").click();
    }
</script>