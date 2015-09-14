<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Testing Anywhere, CLAPP</title>
    <link rel="shotcut icon" href="${contextPath }/resources/images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/clapp.style.css" />
</head>
<script type="text/javascript">
    function MM_openBrWindow(theURL,winName,features) { //v2.0
        window.open(theURL,winName,features);
    }
    function MM_callJS(jsStr) { //v2.0
        return eval(jsStr)
    }
</script>
<style>
    .wrapSamplePopup{
        width:400px;
        height:300px;
        margin:0;
        background:#fff;
        border: 1px solid #202020;
    }
    .SamplePopupTop{
        width:400	px;
        height:44px;
        background: #000;
        display: block;
    }
    .SPTopContainer{
        width:400px;
        display: block;
    }
    .SPTopLogo{
        padding-top: 3px;
        padding-left: 10px;
        display: block;
        float: left;
    }
    .SPTopLine {
        width: 2px;
        height: 16px;
        display: block;
        margin-top: 15px;
        margin-left: 10px;
        margin-right: 10px;
        background: url('${contextPath }/resources/images/popup_line.png') no-repeat;
        float: left;
    }
    .SPTopTitle{
        color:#fff;
        font-size:16px;
        padding-top:13px;
        width:200px;
        height:auto;
        float: left;
    }
    .SPTopClose{
        width:auto;
        height:auto;
        float: left;
        padding-top:13px;
        padding-left:18px;
        margin: 0 auto;
    }
    .SPopupContent{
        width:400px;
        height:252px;
        background: url('${contextPath }/resources/images/popup_sample_content.png') no-repeat;
        display: block;
    }
</style>
<body>
<div class="wrapSamplePopup">
    <div class="SamplePopupTop">
        <div class="SPTopContainer">
            <div class="SPTopLogo">
                <img src="${contextPath }/resources/images/popup_logo.png" width="119" height="36" alt=""/>
            </div>
            <div class="SPTopLine">
            </div>
            <div class="SPTopTitle">
                <span>인증서 샘플</span>
            </div>
            <div class="SPTopClose"><a href="#"><img src="${contextPath }/resources/images/popup_close.png" width="14" height="16" id="popup_close" onclick="MM_callJS('window.close();')" border="0"></a>
            </div>
        </div>
    </div>
    <div class="SPopupContent">
    </div>
</div>

</body>