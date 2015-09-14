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
    .wrappopup{
        width:700px;
        height:850px;
        margin:0;
        background:#fff;
        border: 1px solid #202020;
        list-style:none;
        font-family: 	'Nanum Gothic' !important;
    }
    .FreePopupTop{
        width:700px;
        height:44px;
        background: #000;
        display: block;
    }
    .FPTopContainer{
        width:700px;
        display: block;
    }
    .FPTopLogo{
        padding-top: 3px;
        padding-left: 10px;
        display: block;
        float: left;
    }
    .FPTopLine {
        width: 2px;
        height: 16px;
        display: block;
        margin-top: 15px;
        margin-left: 10px;
        margin-right: 10px;
        background: url('${contextPath }/resources/images/popup_line.png') no-repeat;
        float: left;
    }
    .FPTopTitle{
        color:#fff;
        font-size:16px;
        padding-top:13px;
        width:500px;
        height:auto;
        float: left;
    }
    .FPTopClose{
        width:auto;
        height:auto;
        float: left;
        padding-top:13px;
        padding-left:18px;
        margin: 0 auto;
    }
    .FreePopupContent{
        width:700px;
        height:758px;
        background: url('${contextPath }/resources/images/popup_content.png') no-repeat;
        display: block;
    }
    .FPBtnContainer{
        width:700px;
        display: block;
    }
    .FPBtnBox{
        margin: 0 auto;
        width:97px;
        height:37px;
    }
</style>
<body>
<div class="wrappopup">
    <div class="FreePopupTop">
        <div class="FPTopContainer">
            <div class="FPTopLogo">
                <img src="${contextPath }/resources/images/popup_logo.png" width="119" height="36" alt=""/>
            </div>
            <div class="FPTopLine">
            </div>
            <div class="FPTopTitle">
                <span>무료 체험권</span>
            </div>
            <div class="FPTopClose"><a href="#"><img src="${contextPath }/resources/images/popup_close.png" width="14" height="16" id="popup_close" onclick="MM_callJS('window.close();')" border="0"></a>
            </div>
        </div>
    </div>
    <div class="FreePopupContent">
    </div>
    <div class="FPBtnContainer">
        <div class="FPBtnBox"><a href="#"><img src="${contextPath }/resources/images/popup_btn.png" width="97" height="37" id="popup_btn" onclick="MM_callJS('window.close();')" border="0"></a>
        </div>
    </div>
</div>

</body>