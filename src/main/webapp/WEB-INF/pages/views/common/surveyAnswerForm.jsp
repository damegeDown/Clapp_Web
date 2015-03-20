<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="sub-content" style="padding:10px">
<form id="surveyForm">
  	<h3>	&#60;${ecrmEntity.surveyTitle }&#62;</h3>
	<div style="background:#DCE6F1;padding:10px;margin:5px 0 10px 0">
 		<div>${ecrmEntity.surveyNoti }</div>
 		<div style="margin-top:10px">응답기간 : 
 	  			<fmt:formatDate pattern="yyyy/MM/dd HH:MM:SS" value="${ecrmEntity.surveyStartDate }" /> ~
 	  			<fmt:formatDate pattern="yyyy/MM/dd HH:MM:SS" value="${ecrmEntity.surveyEndDate }" />
		</div>
 	</div>
 	<script>
 	$(function() {
 		$(".answer input[type=radio],.answer textarea").change(function() {
 			var value = $(this).val();
 			$(this).closest(".answer").find("input[name=surveyAnswerArr]").val(value);
 		});
 	})
 	</script>
	<div style="border:1px solid #999;margin-bottom:20px"></div>
	<div>
		<c:forEach var="survey" items="${ecrmEntity.questionList}" varStatus="i">
			<div>${i.index +1}. ${survey.surveyQuestionTitle }</div>
			<div style="margin:10px 0 20px 5px" class="answer">
				<input type="hidden" name="surveyQuestionKeyArr" value="${survey.surveyQuestionKey }"/>
				<input type="hidden" name="surveyPointTypeArr" value="${survey.surveyQuestionType }"/>
				<input type="hidden" name="surveyAnswerArr" value="${survey.surveyStartPoint }"/>
				<c:choose>
					<c:when test="${survey.surveyQuestionType == 1 }">
						<c:forEach begin="${survey.surveyEndPoint }" end="${survey.surveyStartPoint }" step="1" varStatus="j">
						  <label style="margin-right:10px">
						  		<input type="radio" value="${survey.surveyStartPoint - (j.index-1)}" name="surveyAnswerPoint_${i.index }">
						  			<c:choose>
							  			<c:when test="${survey.surveyPointType == 1}">
							  	 			${survey.surveyStartPoint - (j.index-1)}점
							  	 		</c:when>
							  	 		<c:otherwise>
							  	 		  ${textPoint.get(survey.surveyStartPoint - (j.index)).commonName }  
							  	 		</c:otherwise>
						  	 		</c:choose>
						  	</label>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<textarea style="width:100%; height:100px" name="surveyAnswerContentsArr"></textarea>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</div>
	<div class="btnArea">
		<input type="button" class="btn submitBtn" data-action="${contextPath }/insertSurveyAnswer" data-msg="설문발송" value="설문발송"/>
	</div>
</form>
</div> 
