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
<div id="wrapBgContainer">
    <div id="wrapBgTop">
        <div id="wrapTopBgContainer2">
            <div class="topNavBG2">
                <div class="topNav2">
                    <div class="topLogo"></div>
                    <div class="topNavMenu">

                        <ul>
                            <c:if test = "${userLoginSession.userMasterKey ne null}">
                                <li style="color: #000000;">${userLoginSession.userName} 님, 환영합니다!</li>
                                <li class="topMenuLine"></li>
                                <li><a class="topNavMenuLink2" href="${contextPath}/myClapp/myTicket">마이 클앱</a></li>
                                <li class="topMenuLine"></li>
                                <li><a id="doLogout" class="topNavMenuLink2" href="javascript:void(0)">로그아웃</a></li>
                                <%--<li><div id="doLogout" style="cursor:pointer" class="topNavMenuLink btn" data-msg="로그아웃" >로그아웃</div></li>--%>
                            </c:if>
                            <c:if test = "${userLoginSession.userMasterKey eq null}">
                            <li><a class="topNavMenuLink2" href="${contextPath}/members/memberJoin">클앱 가입</a></li>
                            <li class="topMenuLine"></li>
                            <li><a class="topNavMenuLink2" href="${contextPath}/members/login">로그인</a></li>
                            </c:if>
                            <li class="topMenuLine"></li>
                            <li><a class="topNavMenuLink2" href="${contextPath}/product/productList">상품 안내</a></li>
                            <li class="topMenuLine"></li>
                            <li><a class="topNavMenuLink2" href="${contextPath}/introduction/supportCustomerList">고객 지원</a></li>
                        </ul>
                    </div>
                </div>
            </div>