<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
$(function() {
	$("#doLogout").click(function() {
		if (!confirm('로그아웃 하시겠습니까?')) return false;
		$.ajax({
			url : '/admin/doLogout' ,
			type : 'post',
			dataType : 'json', 
			success: function (result) {
				alert(result.resultMSG);
				if (result.resultCode == 'success') {
						location.href = "${contextPath}/admin/login"; 
						}
				  },
				  fail : function() {
					  alert('error');
				}
		});
	});
});
</script>
<span><span class="bold color-o">${adminLoginSession.adminName} (${adminLoginSession.adminId})</span> 님, 좋은 하루 보내십시오!</span> <a href="#" id="doLogout" class="btn" data-msg="로그아웃" ><span>로그아웃</span></a>
