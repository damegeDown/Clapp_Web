<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
$(function() { 
	var url = location.href;
	//브렌드 클앱 메뉴
	$(".subMyClappMenuBox > ul.subMyClappMenu li.myClappMenuLi").each(function() {
		var thisClass = $(this).attr("class").split(" ")[1];
		if(url.indexOf(thisClass) != -1) {
			$(this).addClass("myClappMenuActive");
		} else {
			$(this).removeClass("myClappMenuActive");
		}
	});
	if(url.indexOf("myInfo") != -1){
		$(".subMyClappMenu").find(".mcmLastRightLine").addClass("myClappMenuActive");
	}
});
</script>
<div class="subMyClappMenuContainer">
	<div class="subMyClappMenuBox">
		<ul class="subMyClappMenu">
			<li class="myClappMenuLi myTicket"><a href="${contextPath }/myClapp/myTicket">이용 현황</a></li>
			<li class="myClappMenuLi myHistory"><a href="${contextPath }/myClapp/myHistory">티켓 적립/차감</a></li>
			<li class="myClappMenuLi myPayment" ><a href="${contextPath }/myClapp/myPayment">결제 내역</a></li>
			<li class="myClappMenuLi myInquiry"><a href="${contextPath }/myClapp/myInquiry?inquiryCategory=3">1:1 문의</a></li>
			<li class="myClappMenuLi passwordConfirm mcmLastRightLine"><a href="${contextPath }/myClapp/passwordConfirm">정보 수정·확인</a></li>
		</ul>
	</div>
</div>
