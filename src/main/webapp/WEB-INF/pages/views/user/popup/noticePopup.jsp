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
    .wrapNoticePopup{
        width:400px;
        height:248px;
        margin:0;
        background:#fff;
        border: 1px solid #202020;
    }
    .NoticePopupTop{
        width:400	px;
        height:44px;
        background: #000;
        display: block;
    }
    .NPTopContainer{
        width:400px;
        display: block;
    }
    .NPTopLogo{
        padding-top: 3px;
        padding-left: 10px;
        display: block;
        float: left;
    }
    .NPTopLine {
        width: 2px;
        height: 16px;
        display: block;
        margin-top: 15px;
        margin-left: 10px;
        margin-right: 10px;
        background: url('${contextPath }/resources/images/popup_line.png') no-repeat;
        float: left;
    }
    .NPTopTitle{
        color:#fff;
        font-size:16px;
        padding-top:13px;
        width:200px;
        height:auto;
        float: left;
    }
    .NPTopClose{
        width:auto;
        height:auto;
        float: left;
        padding-top:13px;
        padding-left:18px;
        margin: 0 auto;
    }
    .NPopupContent{
        width:400px;
        height:200px;
        display: block;
    }
    .NPTopText{
        color:#202020;
        font-size:16px;
        padding-top:60px;
        padding-bottom:50px;
        width:400px;
        height:auto;
        display: block;
        margin: 0 auto;
        text-align:center;
    }
    .NPBtnContainer{
        width:400px;
        display: block;
    }
    .NPBtnBox{
        margin: 0 auto;
        width:97px;
        height:37px;
    }
</style>
<body>
<div class="wrapNoticePopup">
    <div class="NoticePopupTop">
        <div class="NPTopContainer">
            <div class="NPTopLogo">
                <img src="${contextPath }/resources/images/popup_logo.png" width="119" height="36" alt=""/>
            </div>
            <div class="NPTopLine">
            </div>
            <div class="NPTopTitle">
                <span>공지사항</span>
            </div>
            <div class="NPTopClose"><a href="#"><img src="${contextPath }/resources/images/popup_close.png" width="14" height="16" id="popup_close" onclick="MM_callJS('window.close();')" border="0"></a>
            </div>
        </div>
    </div>
    <div class="NPopupContent">
        <div class="NPTopText">
            <span>현재 페이지는 준비중 입니다.</span>
        </div>
        <div class="NPBtnContainer">
            <div class="NPBtnBox"><a href="#"><img src="${contextPath }/resources/images/popup_btn.png" width="97" height="37" id="popup_btn" onclick="MM_callJS('window.close();')" border="0"></a>
            </div>
        </div>
    </div>
</div>

</body>