<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<h1>${message}</h1><br />
<a href="?locale=ko">Korean</a>
<a href="?locale=en">English</a>

<div>
  <dgPageNav:PageNavigation pageParamName="page" linkUrl="/" pageNavigationEntity="${pageNavigationEntity}" />
</div>
<div>
  <dgPageNav:PageNavigation pageParamName="page" linkScript="pagingTest" pageNavigationEntity="${pageNavigationEntity}" />
</div>

<script>
  function pagingTest(pagingObj) {
    console.log(pagingObj);
  }
</script>