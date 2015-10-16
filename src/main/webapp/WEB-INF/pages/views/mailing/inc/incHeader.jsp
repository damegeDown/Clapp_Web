<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML>
<HTML><HEAD><TITLE>Testing Anywhere, CLAPP</TITLE>
    <META content="text/html; charset=ks_c_5601-1987" http-equiv=Content-Type>
    <STYLE type=text/css>
        a, td { color: #444444; font-family: "gulim"; font-size: 12px; }
        a:link, a:visited, a:active { color: #444444; text-decoration: none; }
        a:hover { color: #fe8500; text-decoration: underline; }
        img {display: block;}
    </STYLE>
</HEAD>
<BODY>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F5F7">
    <tr>
        <td><img src="$contextPath/resources/images/ecrm_top.png" alt="" width="700" height="80" border="0" usemap="#Map"/></td>
    </tr>
    <tr>
        <td style="padding-top:30px; padding-bottom:30px; text-align:center;">
            <table width="630" align="center" border="0" cellspacing="0" cellpadding="0" style="background:#fff;">
                <tr>
                    <td style="TEXT-ALIGN: left; PADDING-BOTTOM: 20px; LINE-HEIGHT: 21px; PADDING-LEFT: 25px; PADDING-RIGHT: 15px; FONT-FAMILY: gulim,굴림; COLOR: #444; FONT-SIZE: 12px; PADDING-TOP: 20px"><B>
                        <FONT color=#3369d8>
                            <SPAN style="FONT-SIZE: 14px;">$userName </SPAN></FONT>
                        <SPAN style="FONT-SIZE: 14px;">회원님,</SPAN></B><BR><BR>
                        신청하신 유료 서비스의 결제가 정상적으로 완료되어, 서비스 이용이 가능합니다.<BR>
                        상세 내역은 아래와 같습니다.
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="PADDING-BOTTOM: 0px; PADDING-LEFT: 35px; PADDING-RIGHT: 35px; PADDING-TOP: 0px;">

                 