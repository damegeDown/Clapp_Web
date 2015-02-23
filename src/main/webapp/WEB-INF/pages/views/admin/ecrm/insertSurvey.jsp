<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/ecrm.js"></script>
<div class="sub-content">
<form id="surveyForm">
  <input type="hidden" name="userId" value="${adminLoginSession.adminId}"/>
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
  </div>
  <div style="width:100%;">
		<h3 class="floatL" style="margin-top:15px"><설문 제목 및 설명></h3>
		<div style="clear:both;"></div>
	</div>
	<div class="marT-10">
	  <table class="board-write box-pd" >
		  <colgroup> 
				<col width="15%"/>
				<col width="*"/>
			</colgroup>
	 		<tr>
	 			<th>설문제목</th>
	 			<td><input type="text" style="width:90%"  name="surveyTitle" value=""/></td>
			</tr>
	 		<tr>
	 			<th>설명</th>
	 			<td><textarea style="width:90%" name="surveyNoti"></textarea></td>
			</tr>
	 		<tr>
	 			<th>응답기간</th>
	 			<td>
	 				<input type="text" name="surveyStartDate" class="datetimepicker">
	 				~	
	 				<input type="text" name="surveyEndDate" class="datetimepicker">
	 				(설문 발송시에 최하단 발송설정란 이용)
	 			</td>
			</tr>
	  </table> 
	</div>  
	<div style="border-top:2px solid #999;margin-top:20px"></div> 
	<div style="width:100%;">
		<h3 class="floatL" style="margin-top:15px"><질문만들기></h3>
		<div style="clear:both;"></div>
	</div>
	<div class="questionTemp marT-10">
	  <table class="board-write box-pd" >
		  <colgroup> 
				<col width="15%"/>
				<col width="*"/>
			</colgroup>
	 		<tr>
	 			<th>항목 제목</th>
	 			<td><input type="text" style="width:90%"  name="surveyQuestionTitleArr" value=""/></td>
			</tr>
	 		<tr>
	 			<th>유형</th>
	 			<td>
	 				<select name="surveyQuestionTypeArr" onchange="SurveyUtils.changeQuestionType(this)">
	 					<option value="1">선호도형(객관식)</option>
	 					<option value="2">단답형(주관식)</option>
	 				</select>
	 			</td>
			</tr>
	 		<tr class="typePoint">
	 			<th>범위 선택</th>
	 			<td>
	 				<select name="surveyPointTypeArr" onchange="SurveyUtils.changePointType(this)">
	 					<option value="1">점수형</option>
	 					<option value="2">텍스트형</option>
	 				</select>
	 				<span class="point">
		 				<select name="surveyStartPointArr">
		 					<c:forEach begin="1" end="10" step="1" varStatus="i">
		 						<option value="${10 - (i.index - 1) }" <c:if test="${10 - (i.index - 1) == 5 }">selected</c:if>>${10 - (i.index - 1) }점</option>
		 					</c:forEach>
		 				</select>
		 				~	
		 				<select name="surveyEndPointArr">
		 					<c:forEach begin="1" end="10" step="1" varStatus="i">
		 						<option value="${10 - (i.index - 1) }" selected>${10 - (i.index - 1) }점</option>
		 					</c:forEach>
		 				</select>
	 				</span>
	 				<span class="marT-5 text" style="display:none">
		 				<select name="surveyStartTextArr">
		 					<option value="5">매우만족</option>
		 					<option value="4">만족</option>
		 					<option value="3">보통</option>
		 					<option value="2">불만족</option>
		 					<option value="1">매우불만족</option>
		 				</select>
		 				~	
		 				<select name="surveyEndTextArr">
		 					<option value="5">매우만족</option>
		 					<option value="4">만족</option>
		 					<option value="3">보통</option>
		 					<option value="2">불만족</option>
		 					<option value="1">매우불만족</option>
		 				</select>
	 				</span>
	 			</td>
			</tr>
			<tr class="typeText" style="display:none">
				<th>내용입력란<br/>(고객 작성 영역)</th>
				<td><textarea name="surveyAnswerContents" style="width:90%" data-flag="off"></textarea></td>
			</tr>
	  </table>
	  <div class="btn-area floatR">
			<input type="button" class="btn" onclick="SurveyUtils.cloneQuestion(this)" value="질문추가"/>
			<input type="button" class="btn" onclick="SurveyUtils.removeQuestion(this)" value="질문삭제"/>
			<input type="button" class="btn" onclick="SurveyUtils.moveQuestion(this, 'up')" value="위"/>
			<input type="button" class="btn" onclick="SurveyUtils.moveQuestion(this, 'down')" value="아래"/>
		</div> 
		<div style="clear:both"></div>
	</div>  
	<div style="border-top:2px solid #999;border-bottom:2px solid #999;padding:10px">
		<table class="board-write box-pd" >
			<tr>
				<th>대상 회원</th>
				<td>
					<label><input type="radio" name="targetType" value="1" checked> 전체 회원(member_all)</label>&nbsp;&nbsp;
					<label><input type="radio" name="targetType" value="2"> 개인 회원(person_all)</label>&nbsp;&nbsp;
					<label><input type="radio" name="targetType" value="3" > 기업/단체 회원(company_all)</label>
				</td>
			</tr>
		<tr>
			<th>설문 발송일시</th>
			<td>
				<label><input type="radio" name="surveySendType" value="1" checked> 즉시발송</label>&nbsp;&nbsp;
				<label><input type="radio" name="surveySendType" value="2"> 예약발송</label> <input type="text" name="surveySendDate" class="datetimepicker" value="${now }" data-flag="off">
			</td>
		</tr>
		</table>
	</div>
	 <div class="btn-area">
		<input type="button" onclick="SurveyUtils.createSurvey('freeView')" class="btn freeViewBtn" data-type="freeView" value="미리보기"/>
		<!-- <input type="button" class="btn freeViewBtn" data-type="submit" value="설문발송"/> -->
		<input type="button" class="btn submitBtn" data-action="${contextPath }/admin/ecrm/rest/insertSurvey" data-msg="설문발송" value="설문발송"/>
		<input type="button" class="btn" onclick="SurveyUtils.goBack()" value="취소"/>
		<input type="hidden" name="surveyTemp" data-flag="off"/>
	 </div> 
	</form>
	<%@ include file="/WEB-INF/pages/views/popup/popupFreeView.jsp"%>
	<div class="freeView" style="width:500px"></div>
</div> 
