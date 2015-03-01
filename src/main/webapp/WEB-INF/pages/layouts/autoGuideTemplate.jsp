<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="ko">
<head>
  	<meta charset="UTF-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript">
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Testing Anywhere, CLAPP</title>
	<link rel="shotcut icon" href="${contextPath }/resources/images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/clapp.style.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/clapp.style_psy.css" /> 
	<link rel="stylesheet" href="${contextPath }/resources/css/jquery/jquery-ui.min-1.11.2.css">
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/jquery/jquery-ui.min-1.11.2.js"></script>
	<script>
	$(function() {
		var select = '${topMenu}';
		$("."+select).addClass("atGuideTabSelect");
	});
	</script>
</head>
<body>
	<div id=atGuideWrap>
		<div class="atGuideGraphicContainer">
			<div class="atGuideHeaderGraphicBgBox">
				<div class="atGuideHeaderGraphicBox">
					<div class="atGuideHeaderGraphicTxt">
						<span>클앱 자동화 이용 가이드</span>
					</div>
					<div class="atGuideHeaderGraphicClose">
						<a href="#" onClick="window.close();"><img src="${contextPath }/resources/images/mt_cmt_compare_o.png" alt="close" /></a>
					</div>
				</div>
			</div>
		</div><!-- .mtGuideGraphicContainerAuto End -->

		<div class="atGuideTabContainer">
			<div class="atGuideTabBox">
				<div class="atGuideTab">
					<a href="${contextPath}/autoGuide/autoGuide1" class="atGuideTab01">
						<div class="autoGuide1">
							<span>Over View</span>
						</div><!-- .mtGuideTab01Auto End -->
					</a>
					<a href="${contextPath}/autoGuide/autoGuide2" class="atGuideTab02">
						<div class="autoGuide2">
							<span>프로그램 시작하기</span>
						</div><!-- .mtGuideTab02Auto End -->
					</a>
					<a href="${contextPath}/autoGuide/autoGuide3" class="atGuideTab03">
						<div class="autoGuide3">
							<span>주요 기능</span>
						</div><!-- .mtGuideTab03Auto End -->
					</a>
					<a href="${contextPath}/autoGuide/autoGuide4" class="atGuideTab04">
						<div class="autoGuide4">
							<span>Memory Leak Test</span>
						</div><!-- .mtGuideTab04Auto End -->
					</a>
					<a href="${contextPath}/autoGuide/autoGuide5" class="atGuideTab05">
						<div class="autoGuide5">
							<span>Script Test</span>
						</div><!-- .mtGuideTab05Auto End -->
					</a>
				</div><!-- .mtGuideTaAutob End -->
			</div><!-- .mtGuideTabBoxAuto -->
		</div><!-- .mtGuideTabContainerAuto End -->
		<tiles:insertAttribute name="body"/>
</body>
</html>
