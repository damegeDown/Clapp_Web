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
		$("."+select).addClass("mtGuideTabSelect");
	});
	</script>
</head>
<body>
	<div id="mtGuideWrap">
		<div class="mtGuideGraphicContainer">
			<div class="mtGuideHeaderGraphicBgBox">
				<div class="mtGuideHeaderGraphicBox">
					<div class="mtGuideHeaderGraphicTxt">
						<span>클앱 테스팅 이용 가이드</span>
					</div>
					<div class="mtGuideHeaderGraphicClose">
						<a href="#" onClick="window.close();"><img src="${contextPath }/resources/images/mt_cmt_compare_o.png" alt="close" /></a>
					</div>
				</div>
			</div>
		</div><!-- .mtGuideGraphicContainer End -->
		
		<div class="mtGuideTabContainer">
			<div class="mtGuideTabBox">
				<div class="mtGuideTab">
					<a href="${contextPath }/guide/testingGuide1" class="mtGuideTab01">
						<div class="testingGuide1">
							<span>테스트 시작</span>
						</div><!-- .mtGuideTab01 End -->
					</a>
					<a href="${contextPath }/guide/testingGuide2" class="mtGuideTab02">
						<div class="testingGuide2">
							<span>예약 기능</span>
						</div><!-- .mtGuideTab02 End -->
					</a>
					<a href="${contextPath }/guide/testingGuide3" class="mtGuideTab03">
						<div class="testingGuide3">
							<span>디바이스 이용현황</span>
						</div><!-- .mtGuideTab03 End -->
					</a>
					<a href="${contextPath }/guide/testingGuide4" class="mtGuideTab04">
						<div class="testingGuide4">
							<span>테스트 디바이스 화면</span>
						</div><!-- .mtGuideTab04 End -->
					</a>
					<a href="${contextPath }/guide/testingGuide5" class="mtGuideTab05">
						<div class="testingGuide5">
							<span>디바이스 및 환경제어 기능</span>
						</div><!-- .mtGuideTab05 End -->
					</a>
				</div><!-- .mtGuideTab End -->
			</div><!-- .mtGuideTabBox -->
		</div><!-- .mtGuideTabContainer End -->
		<tiles:insertAttribute name="body"/>
</body>
</html>
