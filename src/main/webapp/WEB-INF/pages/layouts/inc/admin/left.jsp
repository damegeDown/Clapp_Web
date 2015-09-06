<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="logo"><a href="${contextPath }/admin/main"><img src="${contextPath }/resources/images/clapp_logo.png" alt="clapp"/></a></div>
<script>
$(function() {
	//권한 함수
	$.fn.Menu.init();
});
/**
 * 권한 함수
 */
$.fn.Menu = {
		init : function() {
			this.openGrantMenu();
			this.selectMenu();
			this.mouseOverMenu();
		},
		// 관리자 권한에 따른 메뉴 노출
		openGrantMenu : function() {
			MenuUtils.showGrantMenu();
		},
		// 좌측 메뉴 선택 스크립트
		selectMenu : function() {
			MenuUtils.selectMenu();
		},
		mouseOverMenu : function() {
			$(".left-bar ul li ").not(".on").hover(function() {
				$(this).find("> ul").show("slow");
			}, function() {
				$(this).find("> ul").hide();
			});
		}
	};
	var MenuUtils = (function(){
		var selectMenu = function(){
			var mainMenu = '${CommonCode.mainMenu}';
			var subMenu = '${CommonCode.subMenu}';
			var subMenu2 = "no";
			if('${CommonCode.subMenu2}' != ""){
				subMenu2 = '${CommonCode.subMenu2}';
			}
			if(mainMenu && subMenu)
				$("#"+mainMenu+",."+subMenu+",."+subMenu2).addClass("on").find("> ul").show();
            console.log("subMenu"+subMenu);
            console.log("mainMenu"+mainMenu);
		};
		var showGrantMenu = function(){
			var permissionMaster = '${adminLoginSession.permissionMaster}';
            <%--var permissionMain = '${adminLoginSession.permissionMain}';--%>
			var permissionUser = '${adminLoginSession.permissionUser}';
			var permissionPayment = '${adminLoginSession.permissionPayment}';
			var permissionProduct = '${adminLoginSession.permissionProduct}';
			var permissionDevice = '${adminLoginSession.permissionDevice}';
			var permissionTrend = '${adminLoginSession.permissionTrend}';
			var permissionEcrm = '${adminLoginSession.permissionEcrm}';
			var permissionCustomer = '${adminLoginSession.permissionCustomer}';
			var permissionObj = {"permissionMaster" : permissionMaster, "permissionUser" : permissionUser, "permissionPayment" : permissionPayment,
										"permissionProduct" : permissionProduct, "permissionDevice" : permissionDevice, "permissionTrend" : permissionTrend,
										"permissionEcrm" : permissionEcrm, "permissionCustomer" : permissionCustomer};
			$(".left-bar > ul > li").filter(function(index) {
				if(permissionObj['permissionMaster'] == "Y") {
			  	return $(this);
			  } else if(permissionObj[$(this).attr("id")] == "Y") {
					return $(this);
				}
			}).show();
		}
		return{
			selectMenu : selectMenu,
			showGrantMenu : showGrantMenu
		}
	})();
</script>
<style>
  .left-bar > ul > li {display:none} 
</style>
<div class="left-bar">
	<ul>
		<li id="permissionMaster">
			<a href="${contextPath }/admin/management/adminList">관리 마스터</a>
			<ul style="display:none">
				<li class="admin"><a href="${contextPath }/admin/management/adminList">관리자 설정</a></li> 
				<%--<li class="popup"><a href="${contextPath }/admin/management/popupList">메인 팝업 관리</a></li>--%>
				<li class="statistics">
					<a href="${contextPath }/admin/statistics/naverAnalytics">분석 / 통계</a>
					<ul style="display:none">
						<li class="naverAnalytics"><a href="${contextPath }/admin/statistics/naverAnalytics">- 네이버 애널리틱스</a></li>
						<li class="siteReport"><a href="${contextPath }/admin/statistics/siteReport">- 사이트 현황</a></li>
						<li class="joinMemberReport"><a href="${contextPath }/admin/statistics/joinMemberReport">- 회원가입</a></li>
						<li class="loginCountReport"><a href="${contextPath }/admin/statistics/loginCountReport">- 로그인수</a></li>
						<li class="dropOutMemberReport"><a href="${contextPath }/admin/statistics/dropOutMemberReport">- 탈퇴회원</a></li>
						<li class="mailReport"><a href="${contextPath }/admin/statistics/mailReport">- 수시 발송용/타켓메일</a></li>
						<li class="surveyReport"><a href="${contextPath }/admin/ecrm/surveyList">- 설문</a></li> 
						<li class="usedTicketReport"><a href="${contextPath }/admin/statistics/usedTicketReport">- 티켓사용내역</a></li>
						<li class="ticketProductReport"><a href="${contextPath }/admin/statistics/ticketProductReport">- 상품관리</a></li>
						<li class="mailInquiryReport"><a href="${contextPath }/admin/statistics/mailInquiryReport">- 이메일 문의/답변</a></li>
						<li class="cableAdviceReprot"><a href="${contextPath }/admin/statistics/cableAdviceReprot">- 유선상담 내역</a></li>
					</ul>	
				</li>
					
			</ul>
		</li>
        <li id="permissionMain">
            <a href="${contextPath }/admin/management/popupList">메인 관리</a>
            <ul style="display:none">
                <li class="popup"><a href="${contextPath }/admin/management/popupList">팝업 관리</a></li>
                <li class="popup"><a href="${contextPath }/admin/management/popupList">베너 관리</a></li>
            </ul>
        </li>
		<li id="permissionUser">
			<a href="${contextPath }/admin/member/memberList">회원 정보</a>
			<ul style="display:none">
				<li class="member"><a href="${contextPath }/admin/member/memberList">일반회원 관리</a></li> 
				<li class="company"><a href="${contextPath }/admin/member/companyList">기업/단체회원 관리</a></li>
				<li class="dropOutUser"><a href="${contextPath }/admin/member/dropOutUserList">탈퇴계정 관리</a></li>
			</ul>
		</li>

		<li id="permissionPayment">
			<a href="${contextPath }/admin/payment/paymentWebList">결제 내역</a>
			<ul style="display:none">
				<li class="paymentWeb"><a href="${contextPath }/admin/payment/paymentWebList">웹 결제 관리</a></li>
				<li class="paymentWebReport"><a href="${contextPath }/admin/payment/paymentWebReport">웹 결제 통계</a></li>
				<li class="paymentContract"><a href="${contextPath }/admin/payment/paymentContractList">개별 계약 관리</a></li>
				<li class="paymentContractReport"><a href="${contextPath }/admin/payment/paymentContractReport">개별 계약 통계</a></li>
			</ul>
		</li>
		<li id="permissionProduct">
			<a href="${contextPath }/admin/ticket/userTicketUsedList">상품 ･ 티켓관리</a>
			<ul style="display:none">
				<!-- <li><a href="#">상품 관리(예정)</a></li> -->
				<li class="userTicketUsed"><a href="${contextPath }/admin/ticket/userTicketUsedList">티켓 사용내역 관리</a></li>
				<li class="ticketProductService"><a href="${contextPath }/admin/ticket/ticketProductServiceList">티켓/상품 적용 서비스</a></li>
			</ul>
		</li>
		<li id="permissionDevice">
		<a href="${contextPath }/admin/device/deviceList"> 제공 디바이스</a>
		  <ul style="display:none">
			 <li class="device"><a href="${contextPath }/admin/device/deviceList">제공 디바이스</a></li>
		  </ul>
		</li>
		<li id="permissionTrend">
			<a href="${contextPath }/admin/board/boardTrandList">트렌드 리뷰 관리</a>
		  <ul style="display:none">
		    <li class="trandBoard"><a href="${contextPath }/admin/board/boardTrandList">업계 동향/리뷰·전망/케이스 스터디 관리</a></li>
		    <li class="socialBlogBoard"><a href="${contextPath }/admin/board/boardSocialBlogList">소셜·블로그 관리</a></li>
		  </ul>
		</li>
		<li id="ecrm">
			<a href="${contextPath }/admin/ecrm/mailReport">eCRM</a>
			<ul style="display:none">
				<li class="anyMailReport"><a href="${contextPath }/admin/ecrm/mailReport">수시 발송용 메일</a></li>
				<li class="targetMailReport"><a href="${contextPath }/admin/ecrm/targetMailReport">타켓 메일</a></li>
				<li class="survey"><a href="${contextPath }/admin/ecrm/surveyList">설문 관리(수시)</a></li>
			</ul>
		</li>
		<li id="permissionCustomer"> 
			<a href="${contextPath }/admin/customer/serviceInquiryList">고객 지원</a>
			<ul style="display:none">
				<li class="serviceInquiry"><a href="${contextPath }/admin/customer/serviceInquiryList">이메일 문의/답변</a></li>
				<li class="cabledAdvice"><a href="${contextPath }/admin/customer/cabledAdviceList">유선 상담내역</a></li>
				<li class="boardNotice"><a href="${contextPath }/admin/customer/boardNoticeList">공지사항</a></li>
				<li class="boardQna"><a href="${contextPath }/admin/customer/boardQnaList">도움말</a></li>
			</ul>
		</li>
	</ul>
	<div style="clear:both"></div>
</div>