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
	$(".topMainStart .topMainStartButton img").hover(function() {
		$("#wrapTopBgContainer").toggleClass("mainBgOn");
	});
});
</script>
<div id="wrapBgTop">
  <div id="wrapTopBgContainer">
    <div class="topWrap">
      <div class="topNav">
        <div class="topLogo"></div>
        <div class="topNavMenu">
          <ul>
          <c:if test = "${userLoginSession.userMasterKey eq null}"> 
            <li><a class="topNavMenuLink" href="${contextPath}/members/memberJoin">클앱 가입</a></li>
            <li class="topMenuLine"></li>
            <li><a class="topNavMenuLink" href="${contextPath}/members/login">로그인</a></li>
            <li class="topMenuLine"></li>
          </c:if>
          <c:if test = "${userLoginSession.userMasterKey ne null}"> 
           <li>${userLoginSession.userName} 님, 환영합니다!</li>
            <li class="topMenuLine"></li>
            <input type="hidden" name="userId" class="userId" value="${userLoginSession.userId}"/>
            <li><a class="topNavMenuLink" href="${contextPath}/myClapp/myTicket">마이 클앱</a></li>
            <li class="topMenuLine"></li>
            <li><div id="doLogout" style="cursor:pointer" class="topNavMenuLink btn" data-msg="로그아웃" >로그아웃</div></li>
            <li class="topMenuLine"></li> 
          </c:if>
            <li><a class="topNavMenuLink" href="${contextPath}/product/productList">상품 안내</a></li>
            <li class="topMenuLine"></li>
            <li><a class="topNavMenuLink" href="${contextPath}/introduction/supportCustomerList">고객 지원</a></li>
          </ul>
        </div>
      </div> <!-- .topNav End -->
      <div class="topTitle">
        <p class="topTitleText1">클 앱은 클앱으로!</p>
        <p class="topTitleText2">Testing Anywhere, CLAPP</p>
        <!-- <p class="topTitleText3">Testing Anywhere</p> -->
      </div> <!-- .topTitle End -->
      <div class="topMainStart">
        <a class="topMainStartButton" href="#"><img src="${contextPath }/resources/images/main_start.png" onclick="JnlpUtils.startTest()" alt="시작하기" /></a>
      </div> <!-- .topMainStart End -->
    </div> <!-- .topWrap End -->
  </div> <!-- #wrapTopBgContainer End -->
</div> <!-- #wrapBgTop End -->