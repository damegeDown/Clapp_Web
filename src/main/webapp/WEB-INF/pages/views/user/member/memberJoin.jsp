<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<div class="subJoinGnbBottomContainer">
			<div class="subJoinGnbBottomBg">
				<div class="subJoinGnbBottomBox">
					<div class="subJoinGnbBottom">
						<span class="subJoinTitle">클앱 가입</span>
					</div>
					<div class="subStartBox">
						<a href="#"><img src="${contextPath }/resources/images/gnb_start.png" onclick="JnlpUtils.startTest()" onmouseover="this.src='${contextPath }/resources/images/gnb_start_r.png';" onMouseOut="this.src='${contextPath }/resources/images/gnb_start.png';" alt="시작하기" /></a>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- .subGnbContainer End -->
   <div class="subJoinFlowContainer">
     <div class="subJoinFlowBox">
       <div class="subJoinFlowStepBox">
         <span class="subJoinStep1 sjsActive">가입 유형</span>
         <span class="subJoinStep2">약관 동의</span>
         <span class="subJoinStep3">정보 입력</span>
         <span class="subJoinStep4">가입 완료</span>
       </div>
     </div>
   </div>
   <div class="subJoinMembershipContainer">
     <div class="subJoinMembershipBox">
       <div class="subJoinMemberSelectBox">
					<img src="${contextPath }/resources/images/clapp_join.jpg" style="margin-top: -35px; margin-left: 10px;" />
         <div class="subJoinMemberSelectBox2">
           <div class="subJoinIndividual">
             <a href="${contextPath }/members/memberJoinTerms?userType=1"><img src="${contextPath }/resources/images/join_step01_person.png"onmouseover="this.src='${contextPath }/resources/images/join_step01_person_r.png';" onMouseOut="this.src='${contextPath }/resources/images/join_step01_person.png';" alt="일반 가입" /></a>
           </div>
           <div class="subJoinCompany">
             <%--<a href="${contextPath }/members/memberJoinTerms?userType=2">--%>
             <a onclick="notJoin()">
                 <img src="${contextPath }/resources/images/join_step01_company.png" onMouseOver="this.src='${contextPath }/resources/images/join_step01_company_r.png';" onMouseOut="this.src='${contextPath }/resources/images/join_step01_company.png';" alt="기업/단체 가입" />
             </a>
           </div>
         </div>
       </div>
     </div>
   </div> <!-- .subJoinMembershipContainer End -->
<script>

    var notJoin = function() {
        alert("기업 / 단체 회원으로 가입하실수 없습니다.");
    }
</script>