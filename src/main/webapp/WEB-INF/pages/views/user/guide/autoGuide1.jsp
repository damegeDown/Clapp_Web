<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<body style="overflow-X:hidden">
		<div>
			<div><img src="${contextPath }/resources/images/clapp_test_auto_guide1_1.png"></div>
			<div><img src="${contextPath }/resources/images/clapp_test_auto_guide1_2.png" style="margin-top: -4px;" ></div>
			<div><img src="${contextPath }/resources/images/clapp_test_auto_guide1_3.png" style="margin-top: -4px;"></div>
			<div><img src="${contextPath }/resources/images/clapp_test_auto_guide1_4.png" style="margin-top: -4px;"></div>
			<div><img src="${contextPath }/resources/images/clapp_test_auto_guide1_5.png" style="margin-top: -4px;"></div>
		</div>
	<div class="mtGuideFloating">
		<a href="#atGuideWrap">
			<img src="${contextPath }/resources/images/popup_guide_floating.png" onMouseOver="this.src='${contextPath }/resources/images/popup_guide_floating_r.png';" onMouseOut="this.src='${contextPath }/resources/images/popup_guide_floating.png';" alt="top" />
		</a>
	</div>
</body>