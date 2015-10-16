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
<TABLE border="0" cellSpacing="0" cellPadding="0" width="701">
    <TBODY>
    <TR>
        <TD></TD></TR>
    <TR><!-- 상단 로고 & 메뉴 시작 -->
        <TD>
            <TABLE border="0" cellSpacing="0" cellPadding="0" width="701">
                <TBODY>
                <TR>
                    <TD vAlign="bottom"><table width="701" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="425" rowspan="2"><a href="http://www.clapp.co.kr" target="_blank"><img src="$contextPath/resources/images/ecrm_00_kv_logo.png" border="0" alt="클앱 홈으로 이동" width="425" height="80"></a></td>
                            <td colspan="4"><img src="$contextPath/resources/images/ecrm_00_kv_topimg.png" border="0" width="276" height="41" /></td>
                        </tr>
                        <tr>
                            <td width="62"><a href="http://www.clapp.co.kr" target="_blank"><img src="$contextPath/resources/images/ecrm_00_kv_gohome.png" border="0" width="62" height="39" alt="클앱 홈으로 이동"></a></td>
                            <td width="65"><a href="http://www.clapp.co.kr/myClapp/myTicket" target="_blank"><img src="$contextPath/resources/images/ecrm_00_kv_myclapp.png" border="0" width="65" height="39" alt="마이 클앱"></a></td>
                            <td width="62"><a href="http://www.clapp.co.kr/product/productList" target="_blank"><img src="$contextPath/resources/images/ecrm_00_kv_product.png" border="0" width="62" height="39" alt="상품 안내"></a></td>
                            <td width="87"><a href="http://www.clapp.co.kr/introduction/supportCustomerList" target="_blank"><img src="$contextPath/resources/images/ecrm_00_kv_support.png" border="0" width="87" height="39" alt="고객 지원"></a></td>
                        </tr>
                    </table></TD>
                </TR></TBODY></TABLE>
            <!-- 상단 로고 & 메뉴 끝 --></TD></TR>
    <TR><!-- 메일 콘텐츠 시작 -->
        <TD colspan="3">test
            <tiles:insertAttribute name="body" />
        </TD>
    </TR>
    <TR>
        <TD vAlign="bottom" colSpan="3" align="center" style="padding-top:20px;">
            <table width="346" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="173" rowspan="2" scope="col"><a href="http://www.clapp.co.kr/mobileTesting/mobileTestingMain" target="_blank"><img src="$contextPath/resources/images/ecrm_04_pay_card_hp_bt01.png" width="171" height="59" alt=""/></a></th>
                </tr>
                <tr>
                    <td><a href="http://www.clapp.co.kr/clappTesting/autoMain" target="_blank"><img src="$contextPath/resources/images/ecrm_04_pay_card_hp_bt02.png" width="171" height="59" alt=""/></a></td>
                </tr>
            </table>
        </TD>
    </TR>
    <TR>
        <TD height="60">&nbsp;</TD></TR>
    </TBODY>

    <TR>
        <TD vAlign="bottom" colSpan="3" align="center">
            <table width="663" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="334" rowspan="2" scope="col"><a href="http://www.clapp.co.kr/serviceinfo/infoMain" target="_blank"><img src="$contextPath/resources/images/ecrm_00_banner_service.png" width="334" height="94" border="0" alt="서비스 소개"></a></th>
                </tr>
                <tr>
                    <td><a href="http://www.clapp.co.kr/product/productList" target="_blank"><img src="$contextPath/resources/images/ecrm_00_banner_member.png" alt="클앱 멤버십" width="330" height="94" border="0" align="top"></a></td>
                </tr>
            </table></TD>
    </TR>
    <TR>
        <TD height="40"></TD></TR>
    <TR>
</TABLE></TD>
</TR>

<TD colspan="3"><table border="0" cellspacing="0" cellpadding="0">
    <tr>
        <th rowspan="3" scope="col"><a href="http://www.clapp.co.kr" target="_blank"><img src="$contextPath/resources/images/ecrm_00_footer_logo.png" width="165" height="174" border="0" alt="클앱 홈으로 이동"></a></th>
        <th scope="col"><img src="$contextPath/resources/images/ecrm_00_footer_topimg.png" width="536" height="28" border="0"></th>
    </tr>
    <tr>
        <td><a href="http://www.clapp.co.kr/introduction/supportCustomerList" target="_blank"><img src="$contextPath/resources/images/ecrm_00_footer_gosupport.png" width="536" height="51" border="0" alt="클앱 고객지원"></a></td>
    </tr>
    <tr>
        <td><img src="$contextPath/resources/images/ecrm_00_footer_copyrights.png" width="536" height="95" border="0"></td>
    </tr>
</table></TD>
</TR></TBODY></TABLE>
</BODY></HTML>
