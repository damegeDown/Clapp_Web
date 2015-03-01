<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
$(function() {
	var url = location.href;
	//퀵메뉴  
	if(url.indexOf("mobileTesting") != -1 || url.indexOf("clappTesting") != -1) {
		$(".floating .testing").show();
	} else if(url.indexOf("trandReview") != -1 && url.indexOf("trandReviewMain") == -1) {
		$(".floating .trand").show();
	} else {
		$(".floating .testing").show();
		$(".floating .guide").hide();
		$(".floating .product").removeClass("floatingMenu02").addClass("floatingMenu01");
	}
	
	if(url.indexOf("supportInquire") != -1) {
		
	}
});
function copy_trackback() {
	var url = location.href;
	var IE=(document.all)?true:false;
	if (IE) {
	if(confirm("이 글의 트랙백 주소를 클립보드에 복사하시겠습니까?"))
		window.clipboardData.setData("Text", url);
	} else {
		temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);
	}
}
var goInquiry = function() {
	var url = location.href;
	var category = 1;
	//퀵메뉴 
	if(url.indexOf("mobileTestingMain") != -1) {
		category = 1;
	} else if(url.indexOf("autoMain") != -1){
		category = 1;
	} else if(url.indexOf("consulting") != -1){
		category = 3;
	} else if(url.indexOf("introductionMain") != -1 || url.indexOf("newsArticleList") != -1 || 
			url.indexOf("personRecruit") != -1 || url.indexOf("cooperation") != -1 || url.indexOf("supportCustomerList") != -1){
		category = 5;
	} 
}

var goGuide = function() {
	var url = location.href;
	//퀵메뉴 
	if(url.indexOf("mobileTestingMain") != -1) {
		window.open(contextPath+"/guide/testingGuide1",'이용 가이드','width=910,height=600,scrollbars=yes,resizeable=no,left=150,top=150');
	} else if(url.indexOf("autoMain") != -1){
		window.open(contextPath+"/autoGuide/autoGuide1",'이용 가이드','width=910,height=600,scrollbars=yes,resizeable=no,left=150,top=150');
	} 
}
</script>
<div class="floating" style="display:none;">
	<div class="floatingFrame">
		<div class="testing" style="display:none">
			<div class="floatingMenu01 guide">
				<a href="# return false;" onclick="goGuide()">
				<%-- <a href="${contextPath }/guide/testingGuide1" onClick="mtPopup(this.href);return false;"> --%>
					<span>이용 가이드</span>
				</a>
			</div>
			<div class="floatingMenu02 product">
				<a href="${contextPath}/product/productList">
					<span>상품 안내</span>
				</a>
			</div>
			<div class="floatingMenu02 inquiry">
				<a href="# return false;" onclick="goInquiry()">
					<span>상세 문의</span>
				</a>
			</div>
		</div>
		<div class="trand"  style="display:none">
			<div class="floatingMenu01">
				<a href="#" onclick="copy_trackback();return false;">
					<span>URL 복사</span>
				</a>
			</div>
			<div class="floatingMenu02">
				<a href="https://www.facebook.com/clapp.co.kr" target="_blank">
					<span>페이스북</span>
				</a>
			</div>
			<!-- <div class="floatingMenu02">
				<a href="./support_inquire.html">
					<span>트위터</span>
				</a>
			</div> -->
		</div>
		<div class="floatingMenu03">
			<a href="#subWrap">
				<span>TOP</span>
			</a>
		</div>
	</div>
</div><!-- floating End -->
</div> <!-- #subWrap End -->

