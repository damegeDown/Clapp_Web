<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/ecrm.js"></script>
<style>
.point div {margin-bottom:3px}
</style>
<div class="sub-content">
  <div> 
    <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
    <div style="clear:both;"></div>
  </div>
  <table class="board-list">
    <thead>
  	  <tr>
	  	  	<th>설문 제목</th>
	  	  	<th>${ecrmEntity.surveyTitle }</th>
  	  </tr>
  	  </thead>
  	  <tbody>
  	  <tr>
  	  		<td>설명</td>
  	  		<td>${ecrmEntity.surveyNoti }</td>
  	  </tr>
  	  <tr>
  	  		<td>응답기간${CommonCode.ZERO }</td>
  	  		<td>
  	  			<fmt:formatDate pattern="yyyy/MM/dd HH:MM" value="${ecrmEntity.surveyStartDate }" /> ~
  	  			<fmt:formatDate pattern="yyyy/MM/dd HH:MM" value="${ecrmEntity.surveyEndDate }" />
  	  </tr>
  	  </tbody> 
  </table> 
  <div style="margin-top:30px;">
  		<h3 class="contents-title floatL"><span style="color:blue">${ecrmEntity.answerCount}</span>명 응답</h3>
  		<div style="clear:both"></div>
  	</div> 
	<div style="border:2px solid #999;margin-bottom:20px"></div>
	<div>
		<c:forEach var="questionList" items="${ecrmEntity.questionList}" varStatus="i">
		<dl style="margin-bottom:10px">
			<dt style="margin-bottom:5px"><h3>${i.index + 1}. ${questionList.surveyQuestionTitle }</h3></dt>
			<dd>
				<c:forEach var="answerList" items="${ecrmEntity.answerList }" varStatus="j">
					<c:if test="${answerList.surveyQuestionKey == questionList.surveyQuestionKey}">
						<c:choose>
							<c:when test="${questionList.surveyQuestionType == 1 }">
								<div style="margin:5px 10px" class="point">
									<c:choose>
										<c:when test="${questionList.surveyPointType == 1 }">
											<div> 
												<div>
													<span style="display:inline-block;width:200px">1 점</span>
													<span style="display:inline-block;width:50px">${answerList.surveyAnswer1Point }</span>
													<span><fmt:formatNumber value="${answerList.surveyAnswer1Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
												</div>
												<div>
													<span style="display:inline-block;width:200px">2 점</span>
													<span style="display:inline-block;width:50px">${answerList.surveyAnswer2Point}</span>
													<span><fmt:formatNumber value="${answerList.surveyAnswer2Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
												</div>
												<div>
													<span style="display:inline-block;width:200px">3 점</span>
													<span style="display:inline-block;width:50px">${answerList.surveyAnswer3Point }</span>
													<span><fmt:formatNumber value="${answerList.surveyAnswer3Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
												</div>
												<div>
													<span style="display:inline-block;width:200px">4 점</span>
													<span style="display:inline-block;width:50px">${answerList.surveyAnswer4Point }</span>
													<span><fmt:formatNumber value="${answerList.surveyAnswer4Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
												</div>
												<div>
													<span style="display:inline-block;width:200px">5 점</span>
													<span style="display:inline-block;width:50px">${answerList.surveyAnswer5Point }</span>
													<span><fmt:formatNumber value="${answerList.surveyAnswer5Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
												</div>
						 						<%-- <span style="display:inline-block;width:200px">${answerList.surveyAnswerPoint }점</span>
						 						<span>${answerList.answerCount }</span> --%>
						 					</div>
						 				</c:when>
						 				<c:otherwise> 
						 					<div>
					 							<span style="display:inline-block;width:200px">매우만족</span>
					 							<span style="display:inline-block;width:50px">${answerList.surveyAnswer5Point }</span>
					 							<span><fmt:formatNumber value="${answerList.surveyAnswer1Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
					 						</div>
					 						<div>
												<span style="display:inline-block;width:200px">만족</span>
												<span style="display:inline-block;width:50px">${answerList.surveyAnswer4Point}</span>
												<span><fmt:formatNumber value="${answerList.surveyAnswer2Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
											</div>
											<div>
												<span style="display:inline-block;width:200px">보통</span>
												<span style="display:inline-block;width:50px">${answerList.surveyAnswer3Point }</span>
												<span><fmt:formatNumber value="${answerList.surveyAnswer3Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
											</div>
											<div>
												<span style="display:inline-block;width:200px">불만족</span>
												<span style="display:inline-block;width:50px">${answerList.surveyAnswer2Point }</span>
												<span><fmt:formatNumber value="${answerList.surveyAnswer4Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
											</div>
											<div>
												<span style="display:inline-block;width:200px">매우불만족</span>
												<span style="display:inline-block;width:50px">${answerList.surveyAnswer1Point }</span>
												<span><fmt:formatNumber value="${answerList.surveyAnswer5Point / answerList.answerCount * 100}" pattern="##.##" />%</span>
											</div>
						 					<%-- <span style="display:inline-block;width:200px">${textPoint.get(answerList.surveyAnswerPoint - 1).commonName }</span>
						 					<span>${answerList.answerCount } </span> --%>
						 				</c:otherwise>
						 			</c:choose>
					 			</div>
						 	</c:when>
						 	<c:otherwise>
						 		<div style="border:1px solid #666;margin:5px 10px;padding:5px">
						 			<div style="margin-bottom:5px">&#60;${answerList.userId }&#62;</div>
					 				<div>${answerList.surveyAnswerContents }</div>
					 			</div>  	
						 	</c:otherwise>
					 	</c:choose>
				 	</c:if>
				</c:forEach>
				</dd>
		</dl>
		</c:forEach>
	</div>
</div> 
