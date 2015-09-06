<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<TR>
    <TD height="75" vAlign="bottom" align="center"><A
            href="${contextPath}/myClapp/myTicket" target=_blank><IMG border=0
                                                                               alt="마이클앱으로 이동"
                                                                               src="${contextPath}/resource/images/ecrm_06_bt_gomyclapp.png"></A><A
            href="http://www.clapp.co.kr"
            target=_blank><IMG border=0
                               alt="클앱 홈으로 이동"
                               src="http://www.clapp.co.kr"></A></TD></TR>
              <p>&nbsp;</p></TD></TR>
          <!-- 메일 콘텐츠 끝 -->
<TR>
    <TD height="60">&nbsp;</TD></TR>

<TR>
    <TD vAlign="bottom" colSpan="3" align="center">
        <table width="663" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th width="334" rowspan="2" scope="col"><a href="${contextPath}/serviceinfo/infoMain"><img src="${contextPath}/resource/images/ecrm_00_banner_service.png" width="334" height="94" border="0" alt="서비스 소개"></a></th>
            </tr>
            <tr>
                <td><a href="${contextPath}/product/productList"><img src="${contextPath}/resource/images/ecrm_00_banner_member.png" alt="클앱 멤버십" width="330" height="94" border="0" align="top"></a></td>
            </tr>
        </table></TD>
</TR>
<TR>
    <TD height="40"></TD></TR>
<TR>
    </TBODY>
    </TABLE></TD>
</TR>

<TD colspan="3"><table border="0" cellspacing="0" cellpadding="0">
    <tr>
        <th rowspan="3" scope="col"><a href="${contextPath}"><img src="${contextPath}/resource/images/ecrm_00_footer_logo.png" width="165" height="174" border="0" alt="클앱 홈으로 이동"></a></th>
        <th scope="col"><img src="${contextPath}/resource/images/ecrm_00_footer_topimg.png" width="536" height="28" border="0"></th>
    </tr>
    <tr>
        <td><a href="${contextPath}/introduction/supportCustomerList"><img src="${contextPath}/resource/images/ecrm_00_footer_gosupport.png" width="536" height="51" border="0" alt="클앱 고객지원"></a></td>
    </tr>
    <tr>
        <td><img src="${contextPath}/resource/images/ecrm_00_footer_copyrights.png" width="536" height="95" border="0"></td>
    </tr>
</table></TD>
</TR></TBODY></TABLE>
</BODY></HTML>
