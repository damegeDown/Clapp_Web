<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
$(function() {
  $("#doLogout").click(function() {
    if (!confirm('로그아웃 하시겠습니까?')) return false;
    var userId = $(".userId").val();
    $.ajax({
      url : '/members/doUserLogout' ,
      type : 'post',
      data : { userId : userId},
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

$(function() {
	var url = location.href;
	//브렌드 클앱 메뉴
	var classArr = ["ssiGActive", "smtGActive", "staGActive", "strGActive", "sciGActive"];
	$("div.subGnbTop > ul li").each(function(index) {
		var thisClass = $(this).attr("class").split(" ")[1];
		if(url.indexOf(thisClass) != -1) {
			$(this).addClass(classArr[index]); 
		}  
	});
	 
});

function itrPopup(linkUrl,num){
    console.log(linkUrl);
//        if(num == "pop1"){
//            window.open(linkUrl,  "startpop", "width=720, height=850, scrollbars=no, resizable=no ,status=no ,toolbar=no");
//
//        }
    if(num =="pop2" ) {
        window.open(linkUrl, "startpop", "width=400, height=248, scrollbars=no, resizable=no ,status=no ,toolbar=no");
    }
}


</script>
 <%@ include file="/WEB-INF/pages/layouts/inc/user/qickMenu.jsp"%>
 <div id="subWrap">
    <div id="subMenu">
      <div class="subTopContainer">
        <div class="subTopBox">
          <div class="subLogo">
            <a href="/user"><img src="${contextPath }/resources/images/clapp_logo_sub.png" alt="CLAPP LOGO" /></a>
          </div>
          <div class="subTopMenu">
              <ul>
                  <c:if test = "${userLoginSession.userMasterKey ne null}">
                      <li>${userLoginSession.userName} 님, 환영합니다!</li>
                      <input type="hidden" name="userId" class="userId" value="${userLoginSession.userId}"/>
                      <li class="topMenuLine"></li>
                      <li><a href="${contextPath}/myClapp/myTicket">마이 클앱</a></li>
                      <li class="topMenuLine"></li>
                      <li><div id="doLogout" style="cursor:pointer" class="topNavMenuLink btn" data-msg="로그아웃" >로그아웃</div></li>
                  </c:if>
                  <c:if test = "${userLoginSession.userMasterKey eq null}">

                      <li><a class="topNavMenuLink" href="${contextPath}/members/memberJoin">클앱 가입</a></li>
                      <li class="topMenuLine"></li>
                      <li><a class="topNavMenuLink" href="${contextPath}/members/login">로그인</a></li>
                  </c:if>
                  <li class="topMenuLine"></li>
                  <li><a class="topNavMenuLink" href="${contextPath}/product/productList">상품 안내</a></li>
                  <li class="topMenuLine"></li>
                  <li><a class="topNavMenuLink" href="${contextPath}/introduction/supportCustomerList">고객 지원</a></li>
              </ul>
          </div>
        </div>
      </div> <!-- .subTopContainer End -->


      <div class="subGnbContainer">
        <div class="subGnbTopContainer">
          <div class="subGnbTopBox">
            <div class="subGnbTop">
              <ul>
                <li class="smtGline serviceinfo"><a class="smtGRsi" href="${contextPath}/serviceinfo/infoMain">서비스 소개</a></li>
                <li class="smtGline mobileTesting"><a class="smtGRmt" href="${contextPath}/mobileTesting/mobileTestingMain/">수동 테스트</a></li>
                <li class="smtGline clappTesting"><a class="smtGRTa" href="${contextPath}/clappTesting/autoMain">자동화 테스트</a></li>
                <li class="smtGline trandReview"><a class="smtGRTr" href="${contextPath}/trandReview/trandReviewMain">트렌드 리뷰</a></li>
                <li class="blank introduction"><a class="smtGRCi" href="${contextPath}/introduction/introductionMain">브랜드 클앱</a></li>
              </ul>
            </div>

            <div>
                <div class="subMTStartBox">
                    <a href="#"><img src="${contextPath }/resources/images/gnb_start.png"  onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources//images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources//images/gnb_start.png';" alt="시작하기" /></a>
                </div>
            </div>
      </div>
    </div>
 </div> <!-- .subGnbContainer End -->
</div> <!-- .subMenu End -->

