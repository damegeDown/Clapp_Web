<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div id="wrapBgBottomNav">
    <div class="wrapBottomNavContainer">
        <div class="wbcBox1">
            <div class="wbcBox1Con">
                <div class="wbcBox1BtLogo">
                    <a href="${contextPath}/"><img src="${contextPath }/resources/images/clapp_bt_logo.png" alt="CLAPP" /></a>
                </div>
            </div>
        </div>

        <div class="wbcBox2">
            <div class="wbcBox1BtCompanyInfo">
                <span class="wbcCompanyName">(주)메디오피아테크</span>
            </div>
        </div>
        <div class="wbcBox3">
            <div class="wbcBox3BtCompanyInfo">
                <span class="wbcCompanyName1">대표이사 : 신성균 ㅣ 사업자번호 : 220-87-36025 ㅣ</span><a class="corpConfirm" href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2208736025" target="_blank">사업자정보확인 </a>
                <span class="wbcCompanyinfo">서울 강남구 도곡로 182, 양제벤처빌딩 4층 ㅣ support@clapp.co.kr ㅣ 고객지원 : 1661-7083</span>
                <span class="wbcCompanyinfo2">통신판매업 : 제 강남 - 15728호　특허 출원번호 : 10-2014-0067899　상표출원번호: 제 40-2014-0084564호 외 3건</span>
            </div>
        </div>
    </div>
</div>
<div id="wrapBgFooter">
    <div class="wrapFooterContainer">
        <div class="wrapFooterCopy">
            <span class="copyright">Copyright &copy; MEDIOPIA Tech. All rights reserved.</span>
        </div>

        <div class="wrapFooterMenu">
            <ul>
                <li class="privacy"><a href="${contextPath }/common/privacy" style="font-size:14px;font-weight: 900;">개인정보 처리방침</a></li>
                <li class="ftmLine"></li>
                <li><a href="${contextPath }/common/terms">이용약관</a></li>
                <li class="ftmLine"></li>
                <%--<li><a href="./terms2.html">운영정책</a></li>--%>
                <li class="ftmLine"></li>
                <li><a href="${contextPath}/introduction/supportInquire">고객 지원</a></li>
                <li class="ftmLine"></li>
                <li><a href="${contextPath}/introduction/supportInquire?inquiryCategory=3">상품·제휴 문의</a></li>
            </ul>
        </div>
        <div class="wrapFooterSns">
            <ul>
                <li><a href="http://blog.naver.com/yesclapp" target="_blank"><img src="${contextPath }/resources/images/footer_blog.png" alt="CLAPP BLOG" onMouseOver="this.src='${contextPath }/resources/images/footer_blog_r.png';" onMouseOut="this.src='${contextPath }/resources/images/footer_blog.png';" /></a></li>
                <li><a href="https://www.facebook.com/clapp.co.kr" target="_blank"><img src="${contextPath }/resources/images/footer_facebook.png" onMouseOver="this.src='${contextPath }/resources/images/footer_facebook_r.png';" onMouseOut="this.src='${contextPath }/resources/images/footer_facebook.png';" alt="CLAPP FACEBOOK" /></a>
                </li>
            </ul>
        </div>
    </div> <!-- .wrapFooterContainer End -->
 <%@ include file="/WEB-INF/pages/views/user/popup/popupCertification.jsp"%>
<script src="https://www.java.com/js/deployJava.js"></script>
<script>
var JnlpUtils = (function() {
	var startTest = function() {
		var userMasterKey = '${userLoginSession.userMasterKey}';
		if(!userMasterKey){
			if(confirm("로그인후 이용 가능합니다.이동하시겠습니까?")){
				location.href = contextPath + "/members/login";
			} else {
				return false;
			}
		} else {
            //2015/4/28 김미연 과장 요청으로 테스팅 시작시 인증 삭제
			//if(getCookie("certificationId") == "${userLoginSession.userMasterKey}") {
				getUserInfo();
			//} else {
			//	popupUtils.popupOpen("#popCertification");
			//}
		}
	};
	var getUserInfo = function() {
		var userMasterKey = '${userLoginSession.userMasterKey}';
		$.ajax({
			url : contextPath + "/api/setUserKey",
			dataType : "json",
			data : {userMasterKey : userMasterKey},
			success : function(data) {
				var userKey = data.resultDATA;
				callJnlp(userMasterKey, userKey);
			},
			error : function() {
				alert("error");
			}
		}); 
	};
	
//	var callJnlp = function(userMasterKey , userKey) {
//		var agt = navigator.userAgent.toLowerCase();
//	    $.getJSON("//system.clapp.co.kr/test_base/jnlpDownload.do?id="+userMasterKey+"&userKey="+userKey,
//	    	function(data) {
//	            if(data.result) {
//                    //사파리 브라우저에서는 파일 다운로드
//                    if (agt.indexOf("chrome") == -1 && agt.indexOf("safari") > -1) {
//                         window.location.href = data.url;
//	                     //그외의 브라우저에서는 실행
//                    } else {
//                       //console.log(data.url);
//                       deployJava.launchWebStartApplication(data.url);
//               		}
//	           } else {
//                     console.log("error");
//	           }
//		});
//	};
     var callJnlp = function(userMasterKey , userKey) {
        var agt = navigator.userAgent.toLowerCase();
        var dFlag = 0;
        var pluginInfo = deployJava.getPlugin();

        //사파리 브라우저 및 미지원크롬 은 dFlag =1 처리
        if ( (agt.indexOf("chrome") == -1 && agt.indexOf("safari") > -1) || (agt.indexOf("chrome") > -1 && pluginInfo == null)) {
            dFlag = 1;
        }

        $.getJSON("//system.clapp.co.kr/test_base/jnlpDownload.do?callback=?&id="+userMasterKey+"&userKey="+userKey, function(data) {
            if(data.result) {
                if (dFlag == 1) {
                    //파일다운로드
                    window.location.href = data.url;
                } else {
                    //애플릿 실행
                    deployJava.launchWebStartApplication(data.url);
                }
            } else {
                console.log("error");
            }
        });
    };
	return {
		startTest : startTest,
		getUserInfo : getUserInfo
	}
})();
//테스팅 시작하기  
</script>
